# FPGA Calculator

## Overview

This project presents a modular FPGA-based calculator designed using SystemVerilog.

The design focuses on clean architecture, proper data handling, and scalability.

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

### Storage Module

Stores operands using an array-based memory structure.

- Supports indexed write
- Provides parallel output access

### Top-Level Module

Integrates all components and manages data flow.

- Handles sequential operand loading
- Connects storage and ALU
- Registers final output

---

## Key Features

- Modular design for easy extension
- Array-based operand storage
- Clear separation of combinational and sequential logic
- Parameterized design (`WIDTH`, `DEPTH`)
- Division-by-zero error handling

---

## Verification

The design was verified using a SystemVerilog testbench and Verilator.

### Simulation Summary

- `10 + 5 = 15`
- `10 - 5 = 5`
- `10 * 5 = 50`
- `10 / 5 = 2`
- `10 / 0 -> final_result = 0, error = 1`

---

## Documentation

Full design plan:

`docs/design.md`

---

## Source Files

SystemVerilog source files are included in the `src` folder:

- `src/alu.sv`
- `src/storage.sv`
- `src/fpga_calculator.sv`
- `src/tb_fpga_calculator.sv`

---

## Project Structure

```text
.
├── README.md
├── docs/
│   └── design.md
├── src/
│   ├── alu.sv
│   ├── storage.sv
│   ├── fpga_calculator.sv
│   └── tb_fpga_calculator.sv
```

---

## Tools

- SystemVerilog
- Verilator
- Intel Quartus Prime 25.1std
- VS Code
