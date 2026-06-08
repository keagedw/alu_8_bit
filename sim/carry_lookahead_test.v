`timescale 1ns/1ps

module carry_lookahead_test;

reg  [3:0] a;
reg  [3:0] b;
reg        carry_in;
wire [3:0] result;
wire       carry_out;

carry_lookahead test(
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .result(result),
    .carry_out(carry_out)
);

initial begin
    // zero test
    a = 4'd0; b = 4'd0; carry_in = 1'b0; #2;
    // no carry_out test
    a = 4'd3; b = 4'd4; carry_in = 1'b0; #2;
    a = 4'd1; b = 4'd14; carry_in = 1'b0; #2;
    // carry_out test
    a = 4'd13; b = 4'd8; carry_in = 1'b0; #2;
    // carry_in test
    a = 4'd0; b = 4'd0; carry_in = 1'b1; #2;
    a = 4'd4; b = 4'd5; carry_in = 1'b1; #2;
end

endmodule