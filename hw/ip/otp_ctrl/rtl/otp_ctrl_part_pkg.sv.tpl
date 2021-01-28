// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Package partition metadata.
//
// DO NOT EDIT THIS FILE DIRECTLY.
// It has been generated with
// $ ./util/design/gen-otp-mmap.py --seed ${otp_mmap.config['seed']}
//
<%
  def _to_pascal_case(inp):
    # Split by underscore. For each word, use str.capitalize if the word is all
    # one case. For words in mixed case, ensure the first character is
    # capitalized and leave them be otherwise.
    words = []
    for p in inp.split('_'):
        if not p:
            # Ignore leading and trailing underscores
            continue

        if p == p.lower() or p == p.upper():
            words.append(p.capitalize())
        else:
            words.append(p[0].upper() + p[1:])

    return ''.join(words)

%>
package otp_ctrl_part_pkg;

  import prim_util_pkg::vbits;
  import otp_ctrl_reg_pkg::*;
  import otp_ctrl_pkg::*;

  ////////////////////////////////////
  // Scrambling Constants and Types //
  ////////////////////////////////////

  parameter int NumScrmblKeys = ${len(otp_mmap.config["scrambling"]["keys"])};
  parameter int NumDigestSets = ${len(otp_mmap.config["scrambling"]["digests"])};
  parameter int ConstSelWidth = (NumScrmblKeys > NumDigestSets) ?
                                vbits(NumScrmblKeys) :
                                vbits(NumDigestSets);

  typedef enum logic [ConstSelWidth-1:0] {
    StandardMode,
    ChainedMode
  } digest_mode_e;

  typedef logic [NumScrmblKeys-1:0][ScrmblKeyWidth-1:0] key_array_t;
  typedef logic [NumDigestSets-1:0][ScrmblKeyWidth-1:0] digest_const_array_t;
  typedef logic [NumDigestSets-1:0][ScrmblBlockWidth-1:0] digest_iv_array_t;

  typedef enum logic [ConstSelWidth-1:0] {
% for key in otp_mmap.config["scrambling"]["keys"]:
    ${_to_pascal_case(key["name"])}${"" if loop.last else ","}
% endfor
  } key_sel_e;

  typedef enum logic [ConstSelWidth-1:0] {
% for dig in otp_mmap.config["scrambling"]["digests"]:
    ${_to_pascal_case(dig["name"])}${"" if loop.last else ","}
% endfor
  } digest_sel_e;

  parameter key_array_t RndCnstKey = {
% for key in otp_mmap.config["scrambling"]["keys"][::-1]:
    ${"{0:}'h{1:0X}".format(otp_mmap.config["scrambling"]["key_size"] * 8, key["value"])}${"" if loop.last else ","}
% endfor
  };

  // Note: digest set 0 is used for computing the partition digests. Constants at
  // higher indices are used to compute the scrambling keys.
  parameter digest_const_array_t RndCnstDigestConst = {
% for dig in otp_mmap.config["scrambling"]["digests"][::-1]:
    ${"{0:}'h{1:0X}".format(otp_mmap.config["scrambling"]["cnst_size"] * 8, dig["cnst_value"])}${"" if loop.last else ","}
% endfor
  };

  parameter digest_iv_array_t RndCnstDigestIV = {
% for dig in otp_mmap.config["scrambling"]["digests"][::-1]:
    ${"{0:}'h{1:0X}".format(otp_mmap.config["scrambling"]["iv_size"] * 8, dig["iv_value"])}${"" if loop.last else ","}
% endfor
  };


  /////////////////////////////////////
  // Typedefs for Partition Metadata //
  /////////////////////////////////////

  typedef enum logic [1:0] {
    Unbuffered,
    Buffered,
    LifeCycle
  } part_variant_e;

  typedef struct packed {
    part_variant_e variant;
    // Offset and size within the OTP array, in Bytes.
    logic [OtpByteAddrWidth-1:0] offset;
    logic [OtpByteAddrWidth-1:0] size;
    // Key index to use for scrambling.
    key_sel_e key_sel;
    // Attributes
    logic secret;     // Whether the partition is secret (and hence scrambled)
    logic hw_digest;  // Whether the partition has a hardware digest
    logic write_lock; // Whether the partition is write lockable (via digest)
    logic read_lock;  // Whether the partition is read lockable (via digest)
  } part_info_t;

  ////////////////////////
  // Partition Metadata //
  ////////////////////////

  localparam part_info_t PartInfo [NumPart] = '{
% for part in otp_mmap.config["partitions"]:
    // ${part["name"]}
    '{
      variant:    ${part["variant"]},
      offset:     ${otp_mmap.config["otp"]["byte_addr_width"]}'d${part["offset"]},
      size:       ${part["size"]},
      key_sel:    ${part["key_sel"] if part["key_sel"] != "NoKey" else "key_sel_e'('0)"},
      secret:     1'b${"1" if part["secret"] else "0"},
      hw_digest:  1'b${"1" if part["hw_digest"] else "0"},
      write_lock: 1'b${"1" if part["write_lock"].lower() == "digest" else "0"},
      read_lock:  1'b${"1" if part["read_lock"].lower() == "digest" else "0"}
    }${"" if loop.last else ","}
% endfor
  };

  typedef enum {
% for part in otp_mmap.config["partitions"]:
    ${_to_pascal_case(part["name"])}Idx,
% endfor
    // These are not "real partitions", but in terms of implementation it is convenient to
    // add these at the end of certain arrays.
    DaiIdx,
    LciIdx,
    KdiIdx,
    // Number of agents is the last idx+1.
    NumAgentsIdx
  } part_idx_e;

  parameter int NumAgents = int'(NumAgentsIdx);

  // Breakout types for easier access of individual items.
% for part in otp_mmap.config["partitions"]:
  % if part["bkout_type"]:
  typedef struct packed {
    % for item in part["items"][::-1]:
      logic [${int(item["size"])*8-1}:0] ${item["name"].lower()};
    % endfor
  } otp_${part["name"].lower()}_data_t;
  typedef struct packed {
    // This reuses the same encoding as the life cycle signals for indicating valid status.
    lc_ctrl_pkg::lc_tx_t valid;
    otp_${part["name"].lower()}_data_t data;
  } otp_${part["name"].lower()}_t;
  % endif
% endfor

  // OTP invalid partition default for buffered partitions.
  parameter logic [${int(otp_mmap.config["otp"]["depth"])*int(otp_mmap.config["otp"]["width"])*8-1}:0] PartInvDefault = ${int(otp_mmap.config["otp"]["depth"])*int(otp_mmap.config["otp"]["width"])*8}'({
  % for k, part in enumerate(otp_mmap.config["partitions"][::-1]):
    ${int(part["size"])*8}'({
    % for item in part["items"][::-1]:
      ${"{}'h{:0X}".format(item["size"] * 8, item["inv_default"])}${("\n    })," if k < len(otp_mmap.config["partitions"])-1 else "\n    })});") if loop.last else ","}
    % endfor
  % endfor

endpackage : otp_ctrl_part_pkg
