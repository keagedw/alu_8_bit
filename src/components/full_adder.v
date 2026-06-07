module full_adder(
    input  a,
    input  b,
    input  carry_in,
    output result,
    output carry_out
);

assign result    = a ^ b ^ carry_in;
assign carry_out = (a & b) | (a & carry_in) | (b & carry_in);

endmodule