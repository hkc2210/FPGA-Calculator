# Design Plan

## 1. Module Design Plan

This design includes three modules: `fpga_calculator`, `alu`, and `storage`.

The top-level module `fpga_calculator` is responsible for connecting the storage and arithmetic blocks and updating the final output.

The `alu` module performs four basic operations: addition, subtraction, multiplication, and division.

The `storage` module stores operands in an array-based structure so that input data can be reused during calculation.

---

## 2. Data Type Plan

The design uses `logic` for control signals such as `clk`, `reset`, `load_en`, and `opcode`.

Arithmetic data is represented by `logic [WIDTH-1:0]`, which makes the bit-width easy to scale through parameters.

The storage array is defined with `logic [WIDTH-1:0] mem [DEPTH]` to keep multiple operands.

In this project, `WIDTH = 16` is a reasonable choice for a basic calculator design.

---

## 3. Array and Loop Plan

An array is used in the storage module to hold input operands.

This structure makes the design more scalable if more operands are added later.

Loops are not heavily used in the current code, but they can be applied for initialization or repeated processing in future extensions.

Depending on the design purpose, these loops may be placed in either `always_comb` or `always_ff`.

---

## 4. Integration Plan

First, an input value is written into the storage module when `load_en` is enabled.

An internal write address is used to load operands sequentially into the storage block.

Next, the stored operands are sent to the `alu`.

The `alu` uses `op_select` to choose the required arithmetic operation.

The calculation result is then registered into `final_result` on the clock edge.

The `reset` signal clears the output when needed.

---

## 5. Source Files

The SystemVerilog source files for this design are included in the `src` folder:

- `src/alu.sv`
- `src/storage.sv`
- `src/fpga_calculator.sv`
- `src/tb_fpga_calculator.sv`

---

## 6. Simulation Results

The design was verified using a SystemVerilog testbench and Verilator.

The simulation results are summarized below:

- Addition: `10 + 5 = 15`
- Subtraction: `10 - 5 = 5`
- Multiplication: `10 * 5 = 50`
- Division: `10 / 5 = 2`
- Division by zero: `final_result = 0`, `error = 1`

These results show that the calculator performs the four basic arithmetic operations correctly.

For the division-by-zero case, the ALU keeps the result at `0` and raises the error flag, which matches the intended design behavior.
