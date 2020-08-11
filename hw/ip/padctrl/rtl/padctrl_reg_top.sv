// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`

`include "prim_assert.sv"

module padctrl_reg_top (
    input clk_i,
    input rst_ni,

    // Below Regster interface can be changed
    input  tlul_pkg::tl_h2d_t                tl_i,
    output tlul_pkg::tl_d2h_t                tl_o,
    // To HW
    output padctrl_reg_pkg::padctrl_reg2hw_t reg2hw,  // Write
    input  padctrl_reg_pkg::padctrl_hw2reg_t hw2reg,  // Read

    // Config
    input devmode_i  // If 1, explicit error return for unmapped register access
);

  import padctrl_reg_pkg::*;

  localparam int AW = 6;
  localparam int DW = 32;
  localparam int DBW = DW / 8;  // Byte Width

  // register signals
  logic reg_we;
  logic reg_re;
  logic [AW-1:0] reg_addr;
  logic [DW-1:0] reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0] reg_rdata;
  logic reg_error;

  logic addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  tlul_pkg::tl_h2d_t tl_reg_h2d;
  tlul_pkg::tl_d2h_t tl_reg_d2h;

  assign tl_reg_h2d = tl_i;
  assign tl_o = tl_reg_d2h;

  tlul_adapter_reg #(
      .RegAw(AW),
      .RegDw(DW)
  ) u_reg_if (
      .clk_i,
      .rst_ni,

      .tl_i(tl_reg_h2d),
      .tl_o(tl_reg_d2h),

      .we_o   (reg_we),
      .re_o   (reg_re),
      .addr_o (reg_addr),
      .wdata_o(reg_wdata),
      .be_o   (reg_be),
      .rdata_i(reg_rdata),
      .error_i(reg_error)
  );

  assign reg_rdata = reg_rdata_next;
  assign reg_error = (devmode_i & addrmiss) | wr_err;

  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic regen_qs;
  logic regen_wd;
  logic regen_we;
  logic [9:0] dio_pads_0_attr_0_qs;
  logic [9:0] dio_pads_0_attr_0_wd;
  logic dio_pads_0_attr_0_we;
  logic dio_pads_0_attr_0_re;
  logic [9:0] dio_pads_0_attr_1_qs;
  logic [9:0] dio_pads_0_attr_1_wd;
  logic dio_pads_0_attr_1_we;
  logic dio_pads_0_attr_1_re;
  logic [9:0] dio_pads_0_attr_2_qs;
  logic [9:0] dio_pads_0_attr_2_wd;
  logic dio_pads_0_attr_2_we;
  logic dio_pads_0_attr_2_re;
  logic [9:0] dio_pads_1_qs;
  logic [9:0] dio_pads_1_wd;
  logic dio_pads_1_we;
  logic dio_pads_1_re;
  logic [9:0] mio_pads_0_attr_0_qs;
  logic [9:0] mio_pads_0_attr_0_wd;
  logic mio_pads_0_attr_0_we;
  logic mio_pads_0_attr_0_re;
  logic [9:0] mio_pads_0_attr_1_qs;
  logic [9:0] mio_pads_0_attr_1_wd;
  logic mio_pads_0_attr_1_we;
  logic mio_pads_0_attr_1_re;
  logic [9:0] mio_pads_0_attr_2_qs;
  logic [9:0] mio_pads_0_attr_2_wd;
  logic mio_pads_0_attr_2_we;
  logic mio_pads_0_attr_2_re;
  logic [9:0] mio_pads_1_attr_3_qs;
  logic [9:0] mio_pads_1_attr_3_wd;
  logic mio_pads_1_attr_3_we;
  logic mio_pads_1_attr_3_re;
  logic [9:0] mio_pads_1_attr_4_qs;
  logic [9:0] mio_pads_1_attr_4_wd;
  logic mio_pads_1_attr_4_we;
  logic mio_pads_1_attr_4_re;
  logic [9:0] mio_pads_1_attr_5_qs;
  logic [9:0] mio_pads_1_attr_5_wd;
  logic mio_pads_1_attr_5_we;
  logic mio_pads_1_attr_5_re;
  logic [9:0] mio_pads_2_attr_6_qs;
  logic [9:0] mio_pads_2_attr_6_wd;
  logic mio_pads_2_attr_6_we;
  logic mio_pads_2_attr_6_re;
  logic [9:0] mio_pads_2_attr_7_qs;
  logic [9:0] mio_pads_2_attr_7_wd;
  logic mio_pads_2_attr_7_we;
  logic mio_pads_2_attr_7_re;
  logic [9:0] mio_pads_2_attr_8_qs;
  logic [9:0] mio_pads_2_attr_8_wd;
  logic mio_pads_2_attr_8_we;
  logic mio_pads_2_attr_8_re;
  logic [9:0] mio_pads_3_attr_9_qs;
  logic [9:0] mio_pads_3_attr_9_wd;
  logic mio_pads_3_attr_9_we;
  logic mio_pads_3_attr_9_re;
  logic [9:0] mio_pads_3_attr_10_qs;
  logic [9:0] mio_pads_3_attr_10_wd;
  logic mio_pads_3_attr_10_we;
  logic mio_pads_3_attr_10_re;
  logic [9:0] mio_pads_3_attr_11_qs;
  logic [9:0] mio_pads_3_attr_11_wd;
  logic mio_pads_3_attr_11_we;
  logic mio_pads_3_attr_11_re;
  logic [9:0] mio_pads_4_attr_12_qs;
  logic [9:0] mio_pads_4_attr_12_wd;
  logic mio_pads_4_attr_12_we;
  logic mio_pads_4_attr_12_re;
  logic [9:0] mio_pads_4_attr_13_qs;
  logic [9:0] mio_pads_4_attr_13_wd;
  logic mio_pads_4_attr_13_we;
  logic mio_pads_4_attr_13_re;
  logic [9:0] mio_pads_4_attr_14_qs;
  logic [9:0] mio_pads_4_attr_14_wd;
  logic mio_pads_4_attr_14_we;
  logic mio_pads_4_attr_14_re;
  logic [9:0] mio_pads_5_qs;
  logic [9:0] mio_pads_5_wd;
  logic mio_pads_5_we;
  logic mio_pads_5_re;

  // Register instances
  // R[regen]: V(False)

  prim_subreg #(
      .DW(1),
      .SWACCESS("W0C"),
      .RESVAL(1'h1)
  ) u_regen (
      .clk_i (clk_i),
      .rst_ni(rst_ni),

      // from register interface
      .we(regen_we),
      .wd(regen_wd),

      // from internal hardware
      .de(1'b0),
      .d ('0),

      // to internal hardware
      .qe(),
      .q (),

      // to register interface (read)
      .qs(regen_qs)
  );



  // Subregister 0 of Multireg dio_pads
  // R[dio_pads_0]: V(True)

  // F[attr_0]: 9:0
  prim_subreg_ext #(
      .DW(10)
  ) u_dio_pads_0_attr_0 (
      .re (dio_pads_0_attr_0_re),
      // qualified with register enable
      .we (dio_pads_0_attr_0_we & regen_qs),
      .wd (dio_pads_0_attr_0_wd),
      .d  (hw2reg.dio_pads[0].d),
      .qre(),
      .qe (reg2hw.dio_pads[0].qe),
      .q  (reg2hw.dio_pads[0].q),
      .qs (dio_pads_0_attr_0_qs)
  );


  // F[attr_1]: 19:10
  prim_subreg_ext #(
      .DW(10)
  ) u_dio_pads_0_attr_1 (
      .re (dio_pads_0_attr_1_re),
      // qualified with register enable
      .we (dio_pads_0_attr_1_we & regen_qs),
      .wd (dio_pads_0_attr_1_wd),
      .d  (hw2reg.dio_pads[1].d),
      .qre(),
      .qe (reg2hw.dio_pads[1].qe),
      .q  (reg2hw.dio_pads[1].q),
      .qs (dio_pads_0_attr_1_qs)
  );


  // F[attr_2]: 29:20
  prim_subreg_ext #(
      .DW(10)
  ) u_dio_pads_0_attr_2 (
      .re (dio_pads_0_attr_2_re),
      // qualified with register enable
      .we (dio_pads_0_attr_2_we & regen_qs),
      .wd (dio_pads_0_attr_2_wd),
      .d  (hw2reg.dio_pads[2].d),
      .qre(),
      .qe (reg2hw.dio_pads[2].qe),
      .q  (reg2hw.dio_pads[2].q),
      .qs (dio_pads_0_attr_2_qs)
  );


  // Subregister 3 of Multireg dio_pads
  // R[dio_pads_1]: V(True)

  prim_subreg_ext #(
      .DW(10)
  ) u_dio_pads_1 (
      .re (dio_pads_1_re),
      // qualified with register enable
      .we (dio_pads_1_we & regen_qs),
      .wd (dio_pads_1_wd),
      .d  (hw2reg.dio_pads[3].d),
      .qre(),
      .qe (reg2hw.dio_pads[3].qe),
      .q  (reg2hw.dio_pads[3].q),
      .qs (dio_pads_1_qs)
  );



  // Subregister 0 of Multireg mio_pads
  // R[mio_pads_0]: V(True)

  // F[attr_0]: 9:0
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_0_attr_0 (
      .re (mio_pads_0_attr_0_re),
      // qualified with register enable
      .we (mio_pads_0_attr_0_we & regen_qs),
      .wd (mio_pads_0_attr_0_wd),
      .d  (hw2reg.mio_pads[0].d),
      .qre(),
      .qe (reg2hw.mio_pads[0].qe),
      .q  (reg2hw.mio_pads[0].q),
      .qs (mio_pads_0_attr_0_qs)
  );


  // F[attr_1]: 19:10
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_0_attr_1 (
      .re (mio_pads_0_attr_1_re),
      // qualified with register enable
      .we (mio_pads_0_attr_1_we & regen_qs),
      .wd (mio_pads_0_attr_1_wd),
      .d  (hw2reg.mio_pads[1].d),
      .qre(),
      .qe (reg2hw.mio_pads[1].qe),
      .q  (reg2hw.mio_pads[1].q),
      .qs (mio_pads_0_attr_1_qs)
  );


  // F[attr_2]: 29:20
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_0_attr_2 (
      .re (mio_pads_0_attr_2_re),
      // qualified with register enable
      .we (mio_pads_0_attr_2_we & regen_qs),
      .wd (mio_pads_0_attr_2_wd),
      .d  (hw2reg.mio_pads[2].d),
      .qre(),
      .qe (reg2hw.mio_pads[2].qe),
      .q  (reg2hw.mio_pads[2].q),
      .qs (mio_pads_0_attr_2_qs)
  );


  // Subregister 3 of Multireg mio_pads
  // R[mio_pads_1]: V(True)

  // F[attr_3]: 9:0
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_1_attr_3 (
      .re (mio_pads_1_attr_3_re),
      // qualified with register enable
      .we (mio_pads_1_attr_3_we & regen_qs),
      .wd (mio_pads_1_attr_3_wd),
      .d  (hw2reg.mio_pads[3].d),
      .qre(),
      .qe (reg2hw.mio_pads[3].qe),
      .q  (reg2hw.mio_pads[3].q),
      .qs (mio_pads_1_attr_3_qs)
  );


  // F[attr_4]: 19:10
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_1_attr_4 (
      .re (mio_pads_1_attr_4_re),
      // qualified with register enable
      .we (mio_pads_1_attr_4_we & regen_qs),
      .wd (mio_pads_1_attr_4_wd),
      .d  (hw2reg.mio_pads[4].d),
      .qre(),
      .qe (reg2hw.mio_pads[4].qe),
      .q  (reg2hw.mio_pads[4].q),
      .qs (mio_pads_1_attr_4_qs)
  );


  // F[attr_5]: 29:20
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_1_attr_5 (
      .re (mio_pads_1_attr_5_re),
      // qualified with register enable
      .we (mio_pads_1_attr_5_we & regen_qs),
      .wd (mio_pads_1_attr_5_wd),
      .d  (hw2reg.mio_pads[5].d),
      .qre(),
      .qe (reg2hw.mio_pads[5].qe),
      .q  (reg2hw.mio_pads[5].q),
      .qs (mio_pads_1_attr_5_qs)
  );


  // Subregister 6 of Multireg mio_pads
  // R[mio_pads_2]: V(True)

  // F[attr_6]: 9:0
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_2_attr_6 (
      .re (mio_pads_2_attr_6_re),
      // qualified with register enable
      .we (mio_pads_2_attr_6_we & regen_qs),
      .wd (mio_pads_2_attr_6_wd),
      .d  (hw2reg.mio_pads[6].d),
      .qre(),
      .qe (reg2hw.mio_pads[6].qe),
      .q  (reg2hw.mio_pads[6].q),
      .qs (mio_pads_2_attr_6_qs)
  );


  // F[attr_7]: 19:10
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_2_attr_7 (
      .re (mio_pads_2_attr_7_re),
      // qualified with register enable
      .we (mio_pads_2_attr_7_we & regen_qs),
      .wd (mio_pads_2_attr_7_wd),
      .d  (hw2reg.mio_pads[7].d),
      .qre(),
      .qe (reg2hw.mio_pads[7].qe),
      .q  (reg2hw.mio_pads[7].q),
      .qs (mio_pads_2_attr_7_qs)
  );


  // F[attr_8]: 29:20
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_2_attr_8 (
      .re (mio_pads_2_attr_8_re),
      // qualified with register enable
      .we (mio_pads_2_attr_8_we & regen_qs),
      .wd (mio_pads_2_attr_8_wd),
      .d  (hw2reg.mio_pads[8].d),
      .qre(),
      .qe (reg2hw.mio_pads[8].qe),
      .q  (reg2hw.mio_pads[8].q),
      .qs (mio_pads_2_attr_8_qs)
  );


  // Subregister 9 of Multireg mio_pads
  // R[mio_pads_3]: V(True)

  // F[attr_9]: 9:0
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_3_attr_9 (
      .re (mio_pads_3_attr_9_re),
      // qualified with register enable
      .we (mio_pads_3_attr_9_we & regen_qs),
      .wd (mio_pads_3_attr_9_wd),
      .d  (hw2reg.mio_pads[9].d),
      .qre(),
      .qe (reg2hw.mio_pads[9].qe),
      .q  (reg2hw.mio_pads[9].q),
      .qs (mio_pads_3_attr_9_qs)
  );


  // F[attr_10]: 19:10
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_3_attr_10 (
      .re (mio_pads_3_attr_10_re),
      // qualified with register enable
      .we (mio_pads_3_attr_10_we & regen_qs),
      .wd (mio_pads_3_attr_10_wd),
      .d  (hw2reg.mio_pads[10].d),
      .qre(),
      .qe (reg2hw.mio_pads[10].qe),
      .q  (reg2hw.mio_pads[10].q),
      .qs (mio_pads_3_attr_10_qs)
  );


  // F[attr_11]: 29:20
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_3_attr_11 (
      .re (mio_pads_3_attr_11_re),
      // qualified with register enable
      .we (mio_pads_3_attr_11_we & regen_qs),
      .wd (mio_pads_3_attr_11_wd),
      .d  (hw2reg.mio_pads[11].d),
      .qre(),
      .qe (reg2hw.mio_pads[11].qe),
      .q  (reg2hw.mio_pads[11].q),
      .qs (mio_pads_3_attr_11_qs)
  );


  // Subregister 12 of Multireg mio_pads
  // R[mio_pads_4]: V(True)

  // F[attr_12]: 9:0
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_4_attr_12 (
      .re (mio_pads_4_attr_12_re),
      // qualified with register enable
      .we (mio_pads_4_attr_12_we & regen_qs),
      .wd (mio_pads_4_attr_12_wd),
      .d  (hw2reg.mio_pads[12].d),
      .qre(),
      .qe (reg2hw.mio_pads[12].qe),
      .q  (reg2hw.mio_pads[12].q),
      .qs (mio_pads_4_attr_12_qs)
  );


  // F[attr_13]: 19:10
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_4_attr_13 (
      .re (mio_pads_4_attr_13_re),
      // qualified with register enable
      .we (mio_pads_4_attr_13_we & regen_qs),
      .wd (mio_pads_4_attr_13_wd),
      .d  (hw2reg.mio_pads[13].d),
      .qre(),
      .qe (reg2hw.mio_pads[13].qe),
      .q  (reg2hw.mio_pads[13].q),
      .qs (mio_pads_4_attr_13_qs)
  );


  // F[attr_14]: 29:20
  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_4_attr_14 (
      .re (mio_pads_4_attr_14_re),
      // qualified with register enable
      .we (mio_pads_4_attr_14_we & regen_qs),
      .wd (mio_pads_4_attr_14_wd),
      .d  (hw2reg.mio_pads[14].d),
      .qre(),
      .qe (reg2hw.mio_pads[14].qe),
      .q  (reg2hw.mio_pads[14].q),
      .qs (mio_pads_4_attr_14_qs)
  );


  // Subregister 15 of Multireg mio_pads
  // R[mio_pads_5]: V(True)

  prim_subreg_ext #(
      .DW(10)
  ) u_mio_pads_5 (
      .re (mio_pads_5_re),
      // qualified with register enable
      .we (mio_pads_5_we & regen_qs),
      .wd (mio_pads_5_wd),
      .d  (hw2reg.mio_pads[15].d),
      .qre(),
      .qe (reg2hw.mio_pads[15].qe),
      .q  (reg2hw.mio_pads[15].q),
      .qs (mio_pads_5_qs)
  );




  logic [8:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[0] = (reg_addr == PADCTRL_REGEN_OFFSET);
    addr_hit[1] = (reg_addr == PADCTRL_DIO_PADS_0_OFFSET);
    addr_hit[2] = (reg_addr == PADCTRL_DIO_PADS_1_OFFSET);
    addr_hit[3] = (reg_addr == PADCTRL_MIO_PADS_0_OFFSET);
    addr_hit[4] = (reg_addr == PADCTRL_MIO_PADS_1_OFFSET);
    addr_hit[5] = (reg_addr == PADCTRL_MIO_PADS_2_OFFSET);
    addr_hit[6] = (reg_addr == PADCTRL_MIO_PADS_3_OFFSET);
    addr_hit[7] = (reg_addr == PADCTRL_MIO_PADS_4_OFFSET);
    addr_hit[8] = (reg_addr == PADCTRL_MIO_PADS_5_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = 1'b0;
    if (addr_hit[0] && reg_we && (PADCTRL_PERMIT[0] != (PADCTRL_PERMIT[0] & reg_be))) wr_err = 1'b1;
    if (addr_hit[1] && reg_we && (PADCTRL_PERMIT[1] != (PADCTRL_PERMIT[1] & reg_be))) wr_err = 1'b1;
    if (addr_hit[2] && reg_we && (PADCTRL_PERMIT[2] != (PADCTRL_PERMIT[2] & reg_be))) wr_err = 1'b1;
    if (addr_hit[3] && reg_we && (PADCTRL_PERMIT[3] != (PADCTRL_PERMIT[3] & reg_be))) wr_err = 1'b1;
    if (addr_hit[4] && reg_we && (PADCTRL_PERMIT[4] != (PADCTRL_PERMIT[4] & reg_be))) wr_err = 1'b1;
    if (addr_hit[5] && reg_we && (PADCTRL_PERMIT[5] != (PADCTRL_PERMIT[5] & reg_be))) wr_err = 1'b1;
    if (addr_hit[6] && reg_we && (PADCTRL_PERMIT[6] != (PADCTRL_PERMIT[6] & reg_be))) wr_err = 1'b1;
    if (addr_hit[7] && reg_we && (PADCTRL_PERMIT[7] != (PADCTRL_PERMIT[7] & reg_be))) wr_err = 1'b1;
    if (addr_hit[8] && reg_we && (PADCTRL_PERMIT[8] != (PADCTRL_PERMIT[8] & reg_be))) wr_err = 1'b1;
  end

  assign regen_we = addr_hit[0] & reg_we & ~wr_err;
  assign regen_wd = reg_wdata[0];

  assign dio_pads_0_attr_0_we = addr_hit[1] & reg_we & ~wr_err;
  assign dio_pads_0_attr_0_wd = reg_wdata[9:0];
  assign dio_pads_0_attr_0_re = addr_hit[1] && reg_re;

  assign dio_pads_0_attr_1_we = addr_hit[1] & reg_we & ~wr_err;
  assign dio_pads_0_attr_1_wd = reg_wdata[19:10];
  assign dio_pads_0_attr_1_re = addr_hit[1] && reg_re;

  assign dio_pads_0_attr_2_we = addr_hit[1] & reg_we & ~wr_err;
  assign dio_pads_0_attr_2_wd = reg_wdata[29:20];
  assign dio_pads_0_attr_2_re = addr_hit[1] && reg_re;

  assign dio_pads_1_we = addr_hit[2] & reg_we & ~wr_err;
  assign dio_pads_1_wd = reg_wdata[9:0];
  assign dio_pads_1_re = addr_hit[2] && reg_re;

  assign mio_pads_0_attr_0_we = addr_hit[3] & reg_we & ~wr_err;
  assign mio_pads_0_attr_0_wd = reg_wdata[9:0];
  assign mio_pads_0_attr_0_re = addr_hit[3] && reg_re;

  assign mio_pads_0_attr_1_we = addr_hit[3] & reg_we & ~wr_err;
  assign mio_pads_0_attr_1_wd = reg_wdata[19:10];
  assign mio_pads_0_attr_1_re = addr_hit[3] && reg_re;

  assign mio_pads_0_attr_2_we = addr_hit[3] & reg_we & ~wr_err;
  assign mio_pads_0_attr_2_wd = reg_wdata[29:20];
  assign mio_pads_0_attr_2_re = addr_hit[3] && reg_re;

  assign mio_pads_1_attr_3_we = addr_hit[4] & reg_we & ~wr_err;
  assign mio_pads_1_attr_3_wd = reg_wdata[9:0];
  assign mio_pads_1_attr_3_re = addr_hit[4] && reg_re;

  assign mio_pads_1_attr_4_we = addr_hit[4] & reg_we & ~wr_err;
  assign mio_pads_1_attr_4_wd = reg_wdata[19:10];
  assign mio_pads_1_attr_4_re = addr_hit[4] && reg_re;

  assign mio_pads_1_attr_5_we = addr_hit[4] & reg_we & ~wr_err;
  assign mio_pads_1_attr_5_wd = reg_wdata[29:20];
  assign mio_pads_1_attr_5_re = addr_hit[4] && reg_re;

  assign mio_pads_2_attr_6_we = addr_hit[5] & reg_we & ~wr_err;
  assign mio_pads_2_attr_6_wd = reg_wdata[9:0];
  assign mio_pads_2_attr_6_re = addr_hit[5] && reg_re;

  assign mio_pads_2_attr_7_we = addr_hit[5] & reg_we & ~wr_err;
  assign mio_pads_2_attr_7_wd = reg_wdata[19:10];
  assign mio_pads_2_attr_7_re = addr_hit[5] && reg_re;

  assign mio_pads_2_attr_8_we = addr_hit[5] & reg_we & ~wr_err;
  assign mio_pads_2_attr_8_wd = reg_wdata[29:20];
  assign mio_pads_2_attr_8_re = addr_hit[5] && reg_re;

  assign mio_pads_3_attr_9_we = addr_hit[6] & reg_we & ~wr_err;
  assign mio_pads_3_attr_9_wd = reg_wdata[9:0];
  assign mio_pads_3_attr_9_re = addr_hit[6] && reg_re;

  assign mio_pads_3_attr_10_we = addr_hit[6] & reg_we & ~wr_err;
  assign mio_pads_3_attr_10_wd = reg_wdata[19:10];
  assign mio_pads_3_attr_10_re = addr_hit[6] && reg_re;

  assign mio_pads_3_attr_11_we = addr_hit[6] & reg_we & ~wr_err;
  assign mio_pads_3_attr_11_wd = reg_wdata[29:20];
  assign mio_pads_3_attr_11_re = addr_hit[6] && reg_re;

  assign mio_pads_4_attr_12_we = addr_hit[7] & reg_we & ~wr_err;
  assign mio_pads_4_attr_12_wd = reg_wdata[9:0];
  assign mio_pads_4_attr_12_re = addr_hit[7] && reg_re;

  assign mio_pads_4_attr_13_we = addr_hit[7] & reg_we & ~wr_err;
  assign mio_pads_4_attr_13_wd = reg_wdata[19:10];
  assign mio_pads_4_attr_13_re = addr_hit[7] && reg_re;

  assign mio_pads_4_attr_14_we = addr_hit[7] & reg_we & ~wr_err;
  assign mio_pads_4_attr_14_wd = reg_wdata[29:20];
  assign mio_pads_4_attr_14_re = addr_hit[7] && reg_re;

  assign mio_pads_5_we = addr_hit[8] & reg_we & ~wr_err;
  assign mio_pads_5_wd = reg_wdata[9:0];
  assign mio_pads_5_re = addr_hit[8] && reg_re;

  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[0] = regen_qs;
      end

      addr_hit[1]: begin
        reg_rdata_next[9:0] = dio_pads_0_attr_0_qs;
        reg_rdata_next[19:10] = dio_pads_0_attr_1_qs;
        reg_rdata_next[29:20] = dio_pads_0_attr_2_qs;
      end

      addr_hit[2]: begin
        reg_rdata_next[9:0] = dio_pads_1_qs;
      end

      addr_hit[3]: begin
        reg_rdata_next[9:0] = mio_pads_0_attr_0_qs;
        reg_rdata_next[19:10] = mio_pads_0_attr_1_qs;
        reg_rdata_next[29:20] = mio_pads_0_attr_2_qs;
      end

      addr_hit[4]: begin
        reg_rdata_next[9:0] = mio_pads_1_attr_3_qs;
        reg_rdata_next[19:10] = mio_pads_1_attr_4_qs;
        reg_rdata_next[29:20] = mio_pads_1_attr_5_qs;
      end

      addr_hit[5]: begin
        reg_rdata_next[9:0] = mio_pads_2_attr_6_qs;
        reg_rdata_next[19:10] = mio_pads_2_attr_7_qs;
        reg_rdata_next[29:20] = mio_pads_2_attr_8_qs;
      end

      addr_hit[6]: begin
        reg_rdata_next[9:0] = mio_pads_3_attr_9_qs;
        reg_rdata_next[19:10] = mio_pads_3_attr_10_qs;
        reg_rdata_next[29:20] = mio_pads_3_attr_11_qs;
      end

      addr_hit[7]: begin
        reg_rdata_next[9:0] = mio_pads_4_attr_12_qs;
        reg_rdata_next[19:10] = mio_pads_4_attr_13_qs;
        reg_rdata_next[29:20] = mio_pads_4_attr_14_qs;
      end

      addr_hit[8]: begin
        reg_rdata_next[9:0] = mio_pads_5_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Assertions for Register Interface
  `ASSERT_PULSE(wePulse, reg_we)
  `ASSERT_PULSE(rePulse, reg_re)

  `ASSERT(reAfterRv, $rose(reg_re || reg_we) |=> tl_o.d_valid)

  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit))

  // this is formulated as an assumption such that the FPV testbenches do disprove this
  // property by mistake
  `ASSUME(reqParity, tl_reg_h2d.a_valid |-> tl_reg_h2d.a_user.parity_en == 1'b0)

endmodule
