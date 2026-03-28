module tb_fpga_calculator;

localparam WIDTH = 16;
localparam DEPTH = 2;

logic clk;
logic reset;
logic [WIDTH-1:0] input_val;
logic [1:0] op_select;
logic load_en;
logic [WIDTH-1:0] final_result;

fpga_calculator #(
    .WIDTH(WIDTH),
    .DEPTH(DEPTH)
) dut (
    .clk(clk),
    .reset(reset),
    .input_val(input_val),
    .op_select(op_select),
    .load_en(load_en),
    .final_result(final_result)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    input_val = '0;
    op_select = 2'b00;
    load_en = 0;

    #12;
    reset = 0;

    // load operand 0 = 10
    input_val = 16'd10;
    load_en = 1;
    #10;
    load_en = 0;
    #10;

    // load operand 1 = 5
    input_val = 16'd5;
    load_en = 1;
    #10;
    load_en = 0;
    #10;

    // test addition
    op_select = 2'b00;
    #10;
    $display("ADD: final_result = %0d", final_result);

    // test subtraction
    op_select = 2'b01;
    #10;
    $display("SUB: final_result = %0d", final_result);

    // test multiplication
    op_select = 2'b10;
    #10;
    $display("MUL: final_result = %0d", final_result);

    // test division
    op_select = 2'b11;
    #10;
    $display("DIV: final_result = %0d", final_result);

    // load operand 0 = 10
    input_val = 16'd10;
    load_en = 1;
    #10;
    load_en = 0;
    #10;

    // load operand 1 = 0
    input_val = 16'd0;
    load_en = 1;
    #10;
    load_en = 0;
    #10;

    // test division by zero
    op_select = 2'b11;
    #10;
    $display("DIV by zero: final_result = %0d, error = %0b", final_result, dut.div_error);

    #20;
    $finish;
end

endmodule