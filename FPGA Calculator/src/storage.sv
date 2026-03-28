module storage #(parameter WIDTH = 16, DEPTH = 4) (
    input  logic clk,
    input  logic we,
    input  logic [$clog2(DEPTH)-1:0] addr,
    input  logic [WIDTH-1:0] data_in,
    output logic [WIDTH-1:0] data_out [DEPTH]
);

logic [WIDTH-1:0] mem [DEPTH];

always_ff @(posedge clk) begin
    if (we)
        mem[addr] <= data_in;
end

assign data_out = mem;

endmodule