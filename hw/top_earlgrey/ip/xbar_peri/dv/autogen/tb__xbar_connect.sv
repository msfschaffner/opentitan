// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// tb__xbar_connect generated by `tlgen.py` tool

xbar_peri dut();

`DRIVE_CLK(clk_peri_i)

initial force dut.clk_peri_i = clk_peri_i;

// TODO, all resets tie together
initial force dut.rst_peri_ni = rst_n;

// Host TileLink interface connections
`CONNECT_TL_HOST_IF(main, dut, clk_peri_i, rst_n)

// Device TileLink interface connections
`CONNECT_TL_DEVICE_IF(uart0, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(uart1, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(uart2, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(uart3, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(i2c0, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(i2c1, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(i2c2, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(pattgen, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(gpio, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(spi_device, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(rv_timer, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(usbdev, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(pwrmgr_aon, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(rstmgr_aon, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(clkmgr_aon, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(pinmux_aon, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(ram_ret_aon, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(otp_ctrl, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(lc_ctrl, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(sensor_ctrl_aon, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(alert_handler, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(sram_ctrl_ret_aon, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(nmi_gen, dut, clk_peri_i, rst_n)
`CONNECT_TL_DEVICE_IF(ast_wrapper, dut, clk_peri_i, rst_n)
