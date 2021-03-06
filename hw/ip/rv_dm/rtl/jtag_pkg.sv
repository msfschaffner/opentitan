// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//

package jtag_pkg;

  typedef struct packed {
    logic tck;
    logic tms;
    logic trst_n;
    logic tdi;
  } jtag_req_t;

  parameter jtag_req_t JTAG_REQ_DEFAULT = '{
    tck: 1'b0,
    tms: 1'b0,
    trst_n: 1'b1,
    tdi: 1'b0
  };

  typedef struct packed {
    logic tdo;
    logic tdo_oe;
  } jtag_rsp_t;

  parameter jtag_rsp_t JTAG_RSP_DEFAULT = '{
    tdo: 1'b0,
    tdo_oe: 1'b0
  };

endpackage : jtag_pkg
