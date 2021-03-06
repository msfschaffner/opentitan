// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "otbn_memutil.h"
#include "scrambled_ecc32_mem_area.h"

#include <cassert>
#include <cstring>
#include <gelf.h>
#include <iostream>
#include <libelf.h>
#include <limits>
#include <sstream>
#include <stdexcept>

#include "sv_scoped.h"

OtbnMemUtil::OtbnMemUtil(const std::string &top_scope)
    : imem_(SVScoped::join_sv_scopes(top_scope, "u_imem"), 4096 / 4, 4 / 4),
      dmem_(SVScoped::join_sv_scopes(top_scope, "u_dmem"), 4096 / 32, 32 / 4),
      expected_end_addr_(-1) {
  RegisterMemoryArea("imem", 0x4000, &imem_);
  RegisterMemoryArea("dmem", 0x8000, &dmem_);
}

void OtbnMemUtil::LoadElf(const std::string &elf_path) {
  LoadElfToMemories(false, elf_path);
}

const StagedMem::SegMap &OtbnMemUtil::GetSegs(bool is_imem) const {
  return GetMemoryData(is_imem ? "imem" : "dmem").GetSegs();
}

void OtbnMemUtil::OnElfLoaded(Elf *elf_file) {
  assert(elf_file);

  // Look through the symbol table of elf_file for a symbol called
  // "_expected_end_addr". If found, use it to set the expected_end_addr_
  // field.
  expected_end_addr_ = -1;
  Elf_Scn *scn = nullptr;
  while ((scn = elf_nextscn(elf_file, scn))) {
    Elf32_Shdr *shdr = elf32_getshdr(scn);
    assert(shdr);
    if (shdr->sh_type != SHT_SYMTAB)
      continue;

    Elf_Data *sec_data = elf_getdata(scn, nullptr);
    assert(sec_data);

    int num_syms = shdr->sh_size / shdr->sh_entsize;
    for (int i = 0; i < num_syms; ++i) {
      GElf_Sym sym;
      gelf_getsym(sec_data, i, &sym);

      const char *sym_name = elf_strptr(elf_file, shdr->sh_link, sym.st_name);
      if (!sym_name)
        continue;

      if (0 == strcmp(sym_name, "_expected_end_addr")) {
        // Ahah! We've found the magic symbol!
        expected_end_addr_ = sym.st_value;
        break;
      }
    }
    break;
  }
}

extern "C" OtbnMemUtil *OtbnMemUtilMake(const char *top_scope) {
  try {
    return new OtbnMemUtil(top_scope);
  } catch (const std::exception &err) {
    std::cerr << "Failed to create OtbnMemUtil: " << err.what() << "\n";
    return nullptr;
  }
}

extern "C" void OtbnMemUtilFree(OtbnMemUtil *mem_util) { delete mem_util; }

extern "C" svBit OtbnMemUtilLoadElf(OtbnMemUtil *mem_util,
                                    const char *elf_path) {
  assert(mem_util);
  assert(elf_path);
  try {
    mem_util->LoadElf(elf_path);
    return sv_1;
  } catch (const std::exception &err) {
    std::cerr << "Failed to load ELF file from `" << elf_path
              << "': " << err.what() << "\n";
    return sv_0;
  }
}

extern "C" svBit OtbnMemUtilStageElf(OtbnMemUtil *mem_util,
                                     const char *elf_path) {
  assert(mem_util);
  assert(elf_path);
  try {
    mem_util->StageElf(false, elf_path);
    return sv_1;
  } catch (const std::exception &err) {
    std::cerr << "Failed to load ELF file from `" << elf_path
              << "': " << err.what() << "\n";
    return sv_0;
  }
}

extern "C" int OtbnMemUtilGetSegCount(OtbnMemUtil *mem_util, svBit is_imem) {
  assert(mem_util);
  const StagedMem::SegMap &segs = mem_util->GetSegs(is_imem);
  size_t num_segs = segs.size();

  // Since the segments are disjoint and 32-bit aligned, there are at most 2^30
  // of them (this, admittedly, would mean an ELF file with a billion segments,
  // but it's theoretically possible). Fortunately, that number is still
  // representable with a signed 32-bit integer, so this assertion shouldn't
  // ever fire.
  assert(num_segs < std::numeric_limits<int>::max());

  return num_segs;
}

extern "C" svBit OtbnMemUtilGetSegInfo(OtbnMemUtil *mem_util, svBit is_imem,
                                       int seg_idx, svBitVecVal *seg_off,
                                       svBitVecVal *seg_size) {
  assert(mem_util);
  assert(seg_off);
  assert(seg_size);

  const StagedMem::SegMap &segs = mem_util->GetSegs(is_imem);

  // Make sure there is such an index.
  if ((seg_idx < 0) || ((unsigned)seg_idx > segs.size())) {
    std::cerr << "Invalid segment index: " << seg_idx << ". "
              << (is_imem ? 'I' : 'D') << "MEM has " << segs.size()
              << " segments.\n";
    return sv_0;
  }

  // Walk to the desired segment (which we know is safe because we just checked
  // the index was valid).
  auto it = std::next(segs.begin(), seg_idx);

  uint32_t seg_addr = it->first.lo;

  // We know that seg_addr must be 32 bit aligned because DpiMemUtil checks its
  // segments are aligned to the memory word size (which is 32 or 256 bits for
  // imem/dmem, respectively).
  assert(seg_addr % 4 == 0);

  uint32_t word_seg_addr = seg_addr / 4;

  size_t size_bytes = it->second.size();

  // We know the size can't be too enormous, because the segment fits in a
  // 32-bit address space.
  assert(size_bytes < std::numeric_limits<uint32_t>::max());

  // Divide by 4 to get the number of 32 bit words. Round up: we'll pad out the
  // data with zeros if there's a ragged edge. (We know this is valid because
  // any next range is also 32 bit aligned).
  uint32_t size_words = ((uint64_t)size_bytes + 3) / 4;

  memcpy(seg_off, &word_seg_addr, sizeof(uint32_t));
  memcpy(seg_size, &size_words, sizeof(uint32_t));

  return sv_1;
}

extern "C" svBit OtbnMemUtilGetSegData(
    OtbnMemUtil *mem_util, svBit is_imem, int word_off,
    /* output bit[31:0] */ svBitVecVal *data_value) {
  assert(mem_util);
  assert(data_value);

  if ((word_off < 0) ||
      ((unsigned)word_off > std::numeric_limits<uint32_t>::max() / 4)) {
    std::cerr << "Invalid word offset: " << word_off << ".\n";
    return sv_0;
  }

  uint32_t byte_addr = (unsigned)word_off * 4;

  const StagedMem::SegMap &segs = mem_util->GetSegs(is_imem);

  auto it = segs.find(byte_addr);
  if (it == segs.end()) {
    return sv_0;
  }

  uint32_t seg_addr = it->first.lo;
  assert(seg_addr <= byte_addr);

  // The offset within the segment
  uint32_t seg_off = byte_addr - seg_addr;
  assert(seg_off < it->second.size());

  // How many bytes are available in the segment, starting at seg_off? We know
  // this will be positive (because RangeMap::find finds us a range that
  // includes seg_addr and then DpiMemUtil makes sure that the value at that
  // range is the right length).
  size_t avail = it->second.size() - seg_off;
  size_t to_copy = std::min(avail, (size_t)4);

  // Copy data from the segment into a uint32_t. Zero-initialize it, in case
  // to_copy < 4.
  uint32_t data = 0;
  memcpy(&data, &it->second[seg_off], to_copy);

  // Now copy that uint32_t into data_value and return success.
  memcpy(data_value, &data, 4);
  return sv_1;
}

int OtbnMemUtilGetExpEndAddr(OtbnMemUtil *mem_util) {
  assert(mem_util);
  return mem_util->GetExpEndAddr();
}
