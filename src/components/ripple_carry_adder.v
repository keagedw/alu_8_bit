module ripple_carry_adder #(
    parameter WIDTH = 8
)(
    input  [WIDTH - 1:0] a,
    input  [WIDTH - 1:0] b,
    input                carry_in,
    output [WIDTH - 1:0] result,
    output               carry_out
);
wire [WIDTH:0] carry;
assign carry[0] = carry_in;

genvar i;
generate
    for (i = 0; i < WIDTH; i = i + 1) begin
        full_adder full_adder (
            .a(a[i]),
            .b(b[i]),
            .carry_in(carry[i]),
            .result(result[i]),
            .carry_out(carry[i + 1])
        );
    end
endgenerate

assign carry_out = carry[WIDTH];

endmodule