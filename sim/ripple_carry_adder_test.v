`timescale 1ns/1ps

module ripple_carry_adder_test;

reg  [7:0] a;
reg  [7:0] b;
reg        carry_in;
wire [7:0] result;
wire       carry_out;

ripple_carry_adder test(
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .result(result),
    .carry_out(carry_out)
);

initial begin
    // test ADD
    a = 8'd5; b = 8'd3; carry_in = 1'b0; #1;
    // test with 0
    a = 8'd4; b = 8'd0; carry_in = 1'b0; #1;
    // test with carry_in
    a = 8'd4; b = 8'd0; carry_in = 1'b1; #1;
    // test carry_out
    a = 8'd255; b = 8'd0; carry_in = 1'b0; #1;
    a = 8'd255; b = 8'd1; carry_in = 1'b0; #1;
    // test carry out with carry in
    a = 8'd200; b = 8'd55; carry_in = 1'b0; #1;
    a = 8'd200; b = 8'd55; carry_in = 1'b1; #1;
    // test overflow
    a = 8'd200; b = 8'd200; carry_in = 1'b1; #1;
end

endmodule