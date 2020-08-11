// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// UVM Registers auto-generated by `reggen` containing data structure
// Do Not Edit directly

// Block: nmi_gen
`ifndef NMI_GEN_REG_BLOCK__SV
`define NMI_GEN_REG_BLOCK__SV

// Forward declare all register/memory/block classes
typedef class nmi_gen_reg_intr_state;
typedef class nmi_gen_reg_intr_enable;
typedef class nmi_gen_reg_intr_test;
typedef class nmi_gen_reg_block;

// Class: nmi_gen_reg_intr_state
class nmi_gen_reg_intr_state extends dv_base_reg;
  // fields
  rand dv_base_reg_field esc0;
  rand dv_base_reg_field esc1;
  rand dv_base_reg_field esc2;
  rand dv_base_reg_field esc3;

  `uvm_object_utils(nmi_gen_reg_intr_state)

  function new(string name = "nmi_gen_reg_intr_state", int unsigned n_bits = 32,
               int has_coverage = UVM_NO_COVERAGE);
    super.new(name, n_bits, has_coverage);
  endfunction : new

  virtual function void build();
    // create fields
    esc0 = dv_base_reg_field::type_id::create("esc0");
    esc0.configure(
    .parent(this),
    .size(1),
    .lsb_pos(0),
    .access("W1C"),
    .volatile(1),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
    esc1 = dv_base_reg_field::type_id::create("esc1");
    esc1.configure(
    .parent(this),
    .size(1),
    .lsb_pos(1),
    .access("W1C"),
    .volatile(1),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
    esc2 = dv_base_reg_field::type_id::create("esc2");
    esc2.configure(
    .parent(this),
    .size(1),
    .lsb_pos(2),
    .access("W1C"),
    .volatile(1),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
    esc3 = dv_base_reg_field::type_id::create("esc3");
    esc3.configure(
    .parent(this),
    .size(1),
    .lsb_pos(3),
    .access("W1C"),
    .volatile(1),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
  endfunction : build

endclass : nmi_gen_reg_intr_state

// Class: nmi_gen_reg_intr_enable
class nmi_gen_reg_intr_enable extends dv_base_reg;
  // fields
  rand dv_base_reg_field esc0;
  rand dv_base_reg_field esc1;
  rand dv_base_reg_field esc2;
  rand dv_base_reg_field esc3;

  `uvm_object_utils(nmi_gen_reg_intr_enable)

  function new(string name = "nmi_gen_reg_intr_enable", int unsigned n_bits = 32,
               int has_coverage = UVM_NO_COVERAGE);
    super.new(name, n_bits, has_coverage);
  endfunction : new

  virtual function void build();
    // create fields
    esc0 = dv_base_reg_field::type_id::create("esc0");
    esc0.configure(
    .parent(this),
    .size(1),
    .lsb_pos(0),
    .access("RW"),
    .volatile(0),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
    esc1 = dv_base_reg_field::type_id::create("esc1");
    esc1.configure(
    .parent(this),
    .size(1),
    .lsb_pos(1),
    .access("RW"),
    .volatile(0),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
    esc2 = dv_base_reg_field::type_id::create("esc2");
    esc2.configure(
    .parent(this),
    .size(1),
    .lsb_pos(2),
    .access("RW"),
    .volatile(0),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
    esc3 = dv_base_reg_field::type_id::create("esc3");
    esc3.configure(
    .parent(this),
    .size(1),
    .lsb_pos(3),
    .access("RW"),
    .volatile(0),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
  endfunction : build

endclass : nmi_gen_reg_intr_enable

// Class: nmi_gen_reg_intr_test
class nmi_gen_reg_intr_test extends dv_base_reg;
  // fields
  rand dv_base_reg_field esc0;
  rand dv_base_reg_field esc1;
  rand dv_base_reg_field esc2;
  rand dv_base_reg_field esc3;

  `uvm_object_utils(nmi_gen_reg_intr_test)

  function new(string name = "nmi_gen_reg_intr_test", int unsigned n_bits = 32,
               int has_coverage = UVM_NO_COVERAGE);
    super.new(name, n_bits, has_coverage);
  endfunction : new

  virtual function void build();
    // create fields
    esc0 = dv_base_reg_field::type_id::create("esc0");
    esc0.configure(
    .parent(this),
    .size(1),
    .lsb_pos(0),
    .access("WO"),
    .volatile(0),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
    esc1 = dv_base_reg_field::type_id::create("esc1");
    esc1.configure(
    .parent(this),
    .size(1),
    .lsb_pos(1),
    .access("WO"),
    .volatile(0),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
    esc2 = dv_base_reg_field::type_id::create("esc2");
    esc2.configure(
    .parent(this),
    .size(1),
    .lsb_pos(2),
    .access("WO"),
    .volatile(0),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
    esc3 = dv_base_reg_field::type_id::create("esc3");
    esc3.configure(
    .parent(this),
    .size(1),
    .lsb_pos(3),
    .access("WO"),
    .volatile(0),
    .reset(32'h0),
    .has_reset(1),
    .is_rand(1),
    .individually_accessible(1)
    );
  endfunction : build

endclass : nmi_gen_reg_intr_test

// Class: nmi_gen_reg_block
class nmi_gen_reg_block extends dv_base_reg_block;
  // registers
  rand nmi_gen_reg_intr_state intr_state;
  rand nmi_gen_reg_intr_enable intr_enable;
  rand nmi_gen_reg_intr_test intr_test;

  `uvm_object_utils(nmi_gen_reg_block)

  function new(string name = "nmi_gen_reg_block", int has_coverage = UVM_NO_COVERAGE);
    super.new(name, has_coverage);
  endfunction : new

  virtual function void build(uvm_reg_addr_t base_addr);
    // create default map
    this.default_map = create_map(
    .name("default_map"),
    .base_addr(base_addr),
    .n_bytes(4),
    .endian(UVM_LITTLE_ENDIAN)
    );

    // create registers
    intr_state = nmi_gen_reg_intr_state::type_id::create("intr_state");
    intr_state.configure(.blk_parent(this));
    intr_state.build();
    default_map.add_reg(.rg(intr_state), .offset(32'h0), .rights("RW"));
    intr_enable = nmi_gen_reg_intr_enable::type_id::create("intr_enable");
    intr_enable.configure(.blk_parent(this));
    intr_enable.build();
    default_map.add_reg(.rg(intr_enable), .offset(32'h4), .rights("RW"));
    intr_test = nmi_gen_reg_intr_test::type_id::create("intr_test");
    intr_test.configure(.blk_parent(this));
    intr_test.build();
    default_map.add_reg(.rg(intr_test), .offset(32'h8), .rights("WO"));
  endfunction : build

endclass : nmi_gen_reg_block

`endif
