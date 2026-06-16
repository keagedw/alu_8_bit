module alu (
    input      [7:0] a,
    input      [7:0] b,
    input      [2:0] op,
    output reg [7:0] result,
    output reg       carry,
    output           zero
);

localparam ADD = 3'b000;
localparam SUB = 3'b001;
localparam AND = 3'b010;
localparam OR  = 3'b011;
localparam XOR = 3'b100;

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

assign zero = (result == 8'h00);

always @(*) begin
    carry  = 1'b0;

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
            carry    = ~carry_adder;
        end

        AND: result = a & b;

        OR:  result = a | b;

        XOR: result = a ^ b;

        default: begin
            carry  = 1'b0;
            result = 8'd0;
        end
    endcase
end

endmodule