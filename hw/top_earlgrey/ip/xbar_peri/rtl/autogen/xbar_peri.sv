// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_peri module generated by `tlgen.py` tool
// all reset signals should be generated from one reset signal to not make any deadlock
//
// Interconnect
// main
//   -> s1n_25
//     -> uart0
//     -> uart1
//     -> uart2
//     -> uart3
//     -> i2c0
//     -> i2c1
//     -> i2c2
//     -> pattgen
//     -> gpio
//     -> spi_device
//     -> rv_timer
//     -> usbdev
//     -> pwrmgr_aon
//     -> rstmgr_aon
//     -> clkmgr_aon
//     -> pinmux_aon
//     -> ram_ret_aon
//     -> otp_ctrl
//     -> lc_ctrl
//     -> sensor_ctrl_aon
//     -> alert_handler
//     -> nmi_gen
//     -> ast_wrapper
//     -> sram_ctrl_ret_aon

module xbar_peri (
  input clk_peri_i,
  input rst_peri_ni,

  // Host interfaces
  input  tlul_pkg::tl_h2d_t tl_main_i,
  output tlul_pkg::tl_d2h_t tl_main_o,

  // Device interfaces
  output tlul_pkg::tl_h2d_t tl_uart0_o,
  input  tlul_pkg::tl_d2h_t tl_uart0_i,
  output tlul_pkg::tl_h2d_t tl_uart1_o,
  input  tlul_pkg::tl_d2h_t tl_uart1_i,
  output tlul_pkg::tl_h2d_t tl_uart2_o,
  input  tlul_pkg::tl_d2h_t tl_uart2_i,
  output tlul_pkg::tl_h2d_t tl_uart3_o,
  input  tlul_pkg::tl_d2h_t tl_uart3_i,
  output tlul_pkg::tl_h2d_t tl_i2c0_o,
  input  tlul_pkg::tl_d2h_t tl_i2c0_i,
  output tlul_pkg::tl_h2d_t tl_i2c1_o,
  input  tlul_pkg::tl_d2h_t tl_i2c1_i,
  output tlul_pkg::tl_h2d_t tl_i2c2_o,
  input  tlul_pkg::tl_d2h_t tl_i2c2_i,
  output tlul_pkg::tl_h2d_t tl_pattgen_o,
  input  tlul_pkg::tl_d2h_t tl_pattgen_i,
  output tlul_pkg::tl_h2d_t tl_gpio_o,
  input  tlul_pkg::tl_d2h_t tl_gpio_i,
  output tlul_pkg::tl_h2d_t tl_spi_device_o,
  input  tlul_pkg::tl_d2h_t tl_spi_device_i,
  output tlul_pkg::tl_h2d_t tl_rv_timer_o,
  input  tlul_pkg::tl_d2h_t tl_rv_timer_i,
  output tlul_pkg::tl_h2d_t tl_usbdev_o,
  input  tlul_pkg::tl_d2h_t tl_usbdev_i,
  output tlul_pkg::tl_h2d_t tl_pwrmgr_aon_o,
  input  tlul_pkg::tl_d2h_t tl_pwrmgr_aon_i,
  output tlul_pkg::tl_h2d_t tl_rstmgr_aon_o,
  input  tlul_pkg::tl_d2h_t tl_rstmgr_aon_i,
  output tlul_pkg::tl_h2d_t tl_clkmgr_aon_o,
  input  tlul_pkg::tl_d2h_t tl_clkmgr_aon_i,
  output tlul_pkg::tl_h2d_t tl_pinmux_aon_o,
  input  tlul_pkg::tl_d2h_t tl_pinmux_aon_i,
  output tlul_pkg::tl_h2d_t tl_ram_ret_aon_o,
  input  tlul_pkg::tl_d2h_t tl_ram_ret_aon_i,
  output tlul_pkg::tl_h2d_t tl_otp_ctrl_o,
  input  tlul_pkg::tl_d2h_t tl_otp_ctrl_i,
  output tlul_pkg::tl_h2d_t tl_lc_ctrl_o,
  input  tlul_pkg::tl_d2h_t tl_lc_ctrl_i,
  output tlul_pkg::tl_h2d_t tl_sensor_ctrl_aon_o,
  input  tlul_pkg::tl_d2h_t tl_sensor_ctrl_aon_i,
  output tlul_pkg::tl_h2d_t tl_alert_handler_o,
  input  tlul_pkg::tl_d2h_t tl_alert_handler_i,
  output tlul_pkg::tl_h2d_t tl_sram_ctrl_ret_aon_o,
  input  tlul_pkg::tl_d2h_t tl_sram_ctrl_ret_aon_i,
  output tlul_pkg::tl_h2d_t tl_nmi_gen_o,
  input  tlul_pkg::tl_d2h_t tl_nmi_gen_i,
  output tlul_pkg::tl_h2d_t tl_ast_wrapper_o,
  input  tlul_pkg::tl_d2h_t tl_ast_wrapper_i,

  input scanmode_i
);

  import tlul_pkg::*;
  import tl_peri_pkg::*;

  // scanmode_i is currently not used, but provisioned for future use
  // this assignment prevents lint warnings
  logic unused_scanmode;
  assign unused_scanmode = scanmode_i;

  tl_h2d_t tl_s1n_25_us_h2d ;
  tl_d2h_t tl_s1n_25_us_d2h ;


  tl_h2d_t tl_s1n_25_ds_h2d [24];
  tl_d2h_t tl_s1n_25_ds_d2h [24];

  // Create steering signal
  logic [4:0] dev_sel_s1n_25;



  assign tl_uart0_o = tl_s1n_25_ds_h2d[0];
  assign tl_s1n_25_ds_d2h[0] = tl_uart0_i;

  assign tl_uart1_o = tl_s1n_25_ds_h2d[1];
  assign tl_s1n_25_ds_d2h[1] = tl_uart1_i;

  assign tl_uart2_o = tl_s1n_25_ds_h2d[2];
  assign tl_s1n_25_ds_d2h[2] = tl_uart2_i;

  assign tl_uart3_o = tl_s1n_25_ds_h2d[3];
  assign tl_s1n_25_ds_d2h[3] = tl_uart3_i;

  assign tl_i2c0_o = tl_s1n_25_ds_h2d[4];
  assign tl_s1n_25_ds_d2h[4] = tl_i2c0_i;

  assign tl_i2c1_o = tl_s1n_25_ds_h2d[5];
  assign tl_s1n_25_ds_d2h[5] = tl_i2c1_i;

  assign tl_i2c2_o = tl_s1n_25_ds_h2d[6];
  assign tl_s1n_25_ds_d2h[6] = tl_i2c2_i;

  assign tl_pattgen_o = tl_s1n_25_ds_h2d[7];
  assign tl_s1n_25_ds_d2h[7] = tl_pattgen_i;

  assign tl_gpio_o = tl_s1n_25_ds_h2d[8];
  assign tl_s1n_25_ds_d2h[8] = tl_gpio_i;

  assign tl_spi_device_o = tl_s1n_25_ds_h2d[9];
  assign tl_s1n_25_ds_d2h[9] = tl_spi_device_i;

  assign tl_rv_timer_o = tl_s1n_25_ds_h2d[10];
  assign tl_s1n_25_ds_d2h[10] = tl_rv_timer_i;

  assign tl_usbdev_o = tl_s1n_25_ds_h2d[11];
  assign tl_s1n_25_ds_d2h[11] = tl_usbdev_i;

  assign tl_pwrmgr_aon_o = tl_s1n_25_ds_h2d[12];
  assign tl_s1n_25_ds_d2h[12] = tl_pwrmgr_aon_i;

  assign tl_rstmgr_aon_o = tl_s1n_25_ds_h2d[13];
  assign tl_s1n_25_ds_d2h[13] = tl_rstmgr_aon_i;

  assign tl_clkmgr_aon_o = tl_s1n_25_ds_h2d[14];
  assign tl_s1n_25_ds_d2h[14] = tl_clkmgr_aon_i;

  assign tl_pinmux_aon_o = tl_s1n_25_ds_h2d[15];
  assign tl_s1n_25_ds_d2h[15] = tl_pinmux_aon_i;

  assign tl_ram_ret_aon_o = tl_s1n_25_ds_h2d[16];
  assign tl_s1n_25_ds_d2h[16] = tl_ram_ret_aon_i;

  assign tl_otp_ctrl_o = tl_s1n_25_ds_h2d[17];
  assign tl_s1n_25_ds_d2h[17] = tl_otp_ctrl_i;

  assign tl_lc_ctrl_o = tl_s1n_25_ds_h2d[18];
  assign tl_s1n_25_ds_d2h[18] = tl_lc_ctrl_i;

  assign tl_sensor_ctrl_aon_o = tl_s1n_25_ds_h2d[19];
  assign tl_s1n_25_ds_d2h[19] = tl_sensor_ctrl_aon_i;

  assign tl_alert_handler_o = tl_s1n_25_ds_h2d[20];
  assign tl_s1n_25_ds_d2h[20] = tl_alert_handler_i;

  assign tl_nmi_gen_o = tl_s1n_25_ds_h2d[21];
  assign tl_s1n_25_ds_d2h[21] = tl_nmi_gen_i;

  assign tl_ast_wrapper_o = tl_s1n_25_ds_h2d[22];
  assign tl_s1n_25_ds_d2h[22] = tl_ast_wrapper_i;

  assign tl_sram_ctrl_ret_aon_o = tl_s1n_25_ds_h2d[23];
  assign tl_s1n_25_ds_d2h[23] = tl_sram_ctrl_ret_aon_i;

  assign tl_s1n_25_us_h2d = tl_main_i;
  assign tl_main_o = tl_s1n_25_us_d2h;

  always_comb begin
    // default steering to generate error response if address is not within the range
    dev_sel_s1n_25 = 5'd24;
    if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_UART0)) == ADDR_SPACE_UART0) begin
      dev_sel_s1n_25 = 5'd0;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_UART1)) == ADDR_SPACE_UART1) begin
      dev_sel_s1n_25 = 5'd1;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_UART2)) == ADDR_SPACE_UART2) begin
      dev_sel_s1n_25 = 5'd2;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_UART3)) == ADDR_SPACE_UART3) begin
      dev_sel_s1n_25 = 5'd3;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_I2C0)) == ADDR_SPACE_I2C0) begin
      dev_sel_s1n_25 = 5'd4;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_I2C1)) == ADDR_SPACE_I2C1) begin
      dev_sel_s1n_25 = 5'd5;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_I2C2)) == ADDR_SPACE_I2C2) begin
      dev_sel_s1n_25 = 5'd6;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_PATTGEN)) == ADDR_SPACE_PATTGEN) begin
      dev_sel_s1n_25 = 5'd7;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_GPIO)) == ADDR_SPACE_GPIO) begin
      dev_sel_s1n_25 = 5'd8;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_SPI_DEVICE)) == ADDR_SPACE_SPI_DEVICE) begin
      dev_sel_s1n_25 = 5'd9;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_RV_TIMER)) == ADDR_SPACE_RV_TIMER) begin
      dev_sel_s1n_25 = 5'd10;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_USBDEV)) == ADDR_SPACE_USBDEV) begin
      dev_sel_s1n_25 = 5'd11;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_PWRMGR_AON)) == ADDR_SPACE_PWRMGR_AON) begin
      dev_sel_s1n_25 = 5'd12;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_RSTMGR_AON)) == ADDR_SPACE_RSTMGR_AON) begin
      dev_sel_s1n_25 = 5'd13;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_CLKMGR_AON)) == ADDR_SPACE_CLKMGR_AON) begin
      dev_sel_s1n_25 = 5'd14;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_PINMUX_AON)) == ADDR_SPACE_PINMUX_AON) begin
      dev_sel_s1n_25 = 5'd15;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_RAM_RET_AON)) == ADDR_SPACE_RAM_RET_AON) begin
      dev_sel_s1n_25 = 5'd16;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_OTP_CTRL)) == ADDR_SPACE_OTP_CTRL) begin
      dev_sel_s1n_25 = 5'd17;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_LC_CTRL)) == ADDR_SPACE_LC_CTRL) begin
      dev_sel_s1n_25 = 5'd18;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_SENSOR_CTRL_AON)) == ADDR_SPACE_SENSOR_CTRL_AON) begin
      dev_sel_s1n_25 = 5'd19;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_ALERT_HANDLER)) == ADDR_SPACE_ALERT_HANDLER) begin
      dev_sel_s1n_25 = 5'd20;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_NMI_GEN)) == ADDR_SPACE_NMI_GEN) begin
      dev_sel_s1n_25 = 5'd21;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_AST_WRAPPER)) == ADDR_SPACE_AST_WRAPPER) begin
      dev_sel_s1n_25 = 5'd22;

    end else if ((tl_s1n_25_us_h2d.a_address & ~(ADDR_MASK_SRAM_CTRL_RET_AON)) == ADDR_SPACE_SRAM_CTRL_RET_AON) begin
      dev_sel_s1n_25 = 5'd23;
end
  end


  // Instantiation phase
  tlul_socket_1n #(
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqDepth (96'h0),
    .DRspDepth (96'h0),
    .N         (24)
  ) u_s1n_25 (
    .clk_i        (clk_peri_i),
    .rst_ni       (rst_peri_ni),
    .tl_h_i       (tl_s1n_25_us_h2d),
    .tl_h_o       (tl_s1n_25_us_d2h),
    .tl_d_o       (tl_s1n_25_ds_h2d),
    .tl_d_i       (tl_s1n_25_ds_d2h),
    .dev_select_i (dev_sel_s1n_25)
  );

endmodule
