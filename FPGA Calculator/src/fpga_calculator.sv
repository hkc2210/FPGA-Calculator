module fpga_calculator #(parameter WIDTH = 16, DEPTH = 2) (
    input  logic clk,
    input  logic reset,
    input  logic [WIDTH-1:0] input_val,
    input  logic [1:0] op_select,
    input  logic load_en,
    output logic [WIDTH-1:0] final_result
);

logic [WIDTH-1:0] operands [DEPTH];
logic [WIDTH-1:0] calc_res;
logic div_error;

storage #(
    .WIDTH(WIDTH),
    .DEPTH(DEPTH)
) input_buffer (
    .clk(clk),
    .we(load_en),
    .addr(0),
    .data_in(input_val),
    .data_out(operands)
);

alu #(
    .WIDTH(WIDTH)
) core_alu (
    .a(operands[0]),
    .b(operands[1]),
    .opcode(op_select),
    .result(calc_res),
    .error(div_error)
);

always_ff @(posedge clk or posedge reset) begin
    if (reset)
        final_result <= '0;
    else
        final_result <= calc_res;
end

endmodule
