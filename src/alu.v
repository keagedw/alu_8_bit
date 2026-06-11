module alu (
    input      [7:0] a,
    input      [7:0] b,
    input            op,
    output reg [7:0] result,
    output reg       carry
);

localparam ADD = 1'b0;
localparam SUB = 1'b1;

reg        carry_in;
reg  [7:0] arg_a, arg_b;
wire       carry_adder;
wire [7:0] result_adder;

carry_lookahead adder(
    .a(arg_a),
    .b(arg_b),
    .carry_in(carry_in),
    .result(result_adder),
    .carry_out(carry_adder)
);

always @(*) begin
    case (op)
        ADD: begin
            arg_a    = a;
            arg_b    = b;
            carry_in = 1'b0;
            result   = result_adder;
            carry    = carry_adder;
        end

        SUB: begin
            arg_a    = a;
            arg_b    = ~b;
            carry_in = 1'b1;
            result   = result_adder;
            carry    = carry_adder;
        end

        default: begin
            carry  = 1'b0;
            result = 8'd0;
        end
    endcase
end

endmodule