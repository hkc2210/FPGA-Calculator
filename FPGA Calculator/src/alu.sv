module alu #(parameter WIDTH = 16) (
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    input  logic [1:0] opcode,
    output logic [WIDTH-1:0] result,
    output logic error
);

always_comb begin
    result = '0;
    error  = 1'b0;

    case (opcode)
        2'b00: result = a + b;
        2'b01: result = a - b;
        2'b10: result = a * b;
        2'b11: begin
            if (b != 0)
                result = a / b;
            else
                error = 1'b1;
        end
        default: result = '0;
    endcase
end

endmodule