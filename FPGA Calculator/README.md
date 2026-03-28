# FPGA Calculator

## Overview

This project presents a modular FPGA-based calculator designed using SystemVerilog.

The design focuses on clean architecture, proper data handling, and scalability, following industry-style hardware design practices.

---

## Architecture

The system is composed of three main modules:

- Top-level module (`fpga_calculator`)
- Arithmetic module (`alu`)
- Storage module (`storage`)

---

## Module Summary

### ALU (Arithmetic Logic Unit)

Performs basic arithmetic operations:

- Addition
- Subtraction
- Multiplication
- Division (with division-by-zero protection)

```systemverilog
module alu #(parameter WIDTH = 16) (
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    input  logic [1:0] opcode,
    output logic [WIDTH-1:0] result,
    output logic error
);
```
### Storage Module

Stores operands using an arrey-based memory structure.
- Supports indexed write
- Provides parallel outputs access

```systemverilog
logic [WIDTH-1:0] mem [DEPTH];
```
## Top-Level Module
Integrates all components and manages data flow.
- Handles input loading
- Connects storage and ALU
- Registers final output

```systemverilog
always_ff @(posedge clk or posedge reset) begin
    if (reset)
        final_result <= '0;
    else
        final_result <= calc_res;
end
```

## Key Features
- Modular design for easy extension
- Array-based operand storage
- Clear separation of combinational and sequential logic
- Parameterized design (WIDTH, DEPTH)
- Division-by-zero error handling

## Documentation
Full design report is available here:

docs/design.md

## Project Structure
```text
.
├── README.md
├── docs/
│   └── design.md
├── src/
│   ├── alu.sv
│   ├── storage.sv
│   └── fpga_calculator.sv
```

## Tools
- SystemVerilog
- Intel Quartus Prime 25.1std
