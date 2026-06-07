`timescale 1ns/1ps

module full_adder_test;

reg  a;
reg  b;
reg  carry_in;
wire result;
wire carry;

full_adder test(
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .result(result),
    .carry_out(carry_out)
);

initial begin
    // zero test
    a = 1'b0; b = 1'b0; carry_in = 1'b0; #2;
    // no carry_out test
    a = 1'b1; b = 1'b0; carry_in = 1'b0; #2;
    a = 1'b0; b = 1'b1; carry_in = 1'b0; #2;
    // carry_out test
    a = 1'b1; b = 1'b1; carry_in = 1'b0; #2;
    // carry_in test
    a = 1'b0; b = 1'b0; carry_in = 1'b1; #2;
    a = 1'b1; b = 1'b0; carry_in = 1'b1; #2;
    a = 1'b0; b = 1'b1; carry_in = 1'b1; #2;
    a = 1'b1; b = 1'b1; carry_in = 1'b1; #2;
end

endmodule