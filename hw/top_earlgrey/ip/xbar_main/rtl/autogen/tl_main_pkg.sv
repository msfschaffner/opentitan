// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// tl_main package generated by `tlgen.py` tool

package tl_main_pkg;

  localparam logic [31:0] ADDR_SPACE_RV_DM__REGS       = 32'h 41200000;
  localparam logic [31:0] ADDR_SPACE_RV_DM__ROM        = 32'h 00010000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL__ROM     = 32'h 00008000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL__REGS    = 32'h 411e0000;
  localparam logic [31:0] ADDR_SPACE_RAM_MAIN          = 32'h 10000000;
  localparam logic [31:0] ADDR_SPACE_EFLASH            = 32'h 20000000;
  localparam logic [0:0][31:0] ADDR_SPACE_PERI              = {
    32'h 40000000
  };
  localparam logic [31:0] ADDR_SPACE_FLASH_CTRL__CORE  = 32'h 41000000;
  localparam logic [31:0] ADDR_SPACE_FLASH_CTRL__PRIM  = 32'h 41008000;
  localparam logic [31:0] ADDR_SPACE_HMAC              = 32'h 41110000;
  localparam logic [31:0] ADDR_SPACE_KMAC              = 32'h 41120000;
  localparam logic [31:0] ADDR_SPACE_AES               = 32'h 41100000;
  localparam logic [31:0] ADDR_SPACE_ENTROPY_SRC       = 32'h 41160000;
  localparam logic [31:0] ADDR_SPACE_CSRNG             = 32'h 41150000;
  localparam logic [31:0] ADDR_SPACE_EDN0              = 32'h 41170000;
  localparam logic [31:0] ADDR_SPACE_EDN1              = 32'h 41180000;
  localparam logic [31:0] ADDR_SPACE_RV_PLIC           = 32'h 41010000;
  localparam logic [31:0] ADDR_SPACE_OTBN              = 32'h 411d0000;
  localparam logic [31:0] ADDR_SPACE_KEYMGR            = 32'h 41130000;
  localparam logic [31:0] ADDR_SPACE_RV_CORE_IBEX_PERI = 32'h 411f0000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_MAIN    = 32'h 411c0000;

  localparam logic [31:0] ADDR_MASK_RV_DM__REGS       = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_RV_DM__ROM        = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL__ROM     = 32'h 00003fff;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL__REGS    = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_RAM_MAIN          = 32'h 0001ffff;
  localparam logic [31:0] ADDR_MASK_EFLASH            = 32'h 000fffff;
  localparam logic [0:0][31:0] ADDR_MASK_PERI              = {
    32'h 007fffff
  };
  localparam logic [31:0] ADDR_MASK_FLASH_CTRL__CORE  = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_FLASH_CTRL__PRIM  = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_HMAC              = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_KMAC              = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_AES               = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_ENTROPY_SRC       = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_CSRNG             = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_EDN0              = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_EDN1              = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_RV_PLIC           = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_OTBN              = 32'h 0000ffff;
  localparam logic [31:0] ADDR_MASK_KEYMGR            = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_RV_CORE_IBEX_PERI = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_MAIN    = 32'h 00000fff;

  localparam int N_HOST   = 3;
  localparam int N_DEVICE = 21;

  typedef enum int {
    TlRvDmRegs = 0,
    TlRvDmRom = 1,
    TlRomCtrlRom = 2,
    TlRomCtrlRegs = 3,
    TlRamMain = 4,
    TlEflash = 5,
    TlPeri = 6,
    TlFlashCtrlCore = 7,
    TlFlashCtrlPrim = 8,
    TlHmac = 9,
    TlKmac = 10,
    TlAes = 11,
    TlEntropySrc = 12,
    TlCsrng = 13,
    TlEdn0 = 14,
    TlEdn1 = 15,
    TlRvPlic = 16,
    TlOtbn = 17,
    TlKeymgr = 18,
    TlRvCoreIbexPeri = 19,
    TlSramCtrlMain = 20
  } tl_device_e;

  typedef enum int {
    TlCorei = 0,
    TlCored = 1,
    TlRvDmSba = 2
  } tl_host_e;

endpackage
