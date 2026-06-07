module alu(
    input      [7:0] a,
    input      [7:0] b,
    input            op,
    output reg [7:0] result,
    output reg       carry
);

localparam ADD = 1'b0;
localparam SUB = 1'b1;

always @(*) begin
    carry = 1'b0;

    case (op)
        ADD:     {carry, result} = a + b;
        SUB:     {carry, result} = a - b;
        default: result          = 8'b0;
    endcase
end

endmodule