`timescale 100ps/1ps

module carry_lookahead_test;

reg  [7:0] a;
reg  [7:0] b;
wire [7:0] result;
wire       carry_out;

carry_lookahead test(
    .a(a),
    .b(b),
    .result(result),
    .carry_out(carry_out)
);

initial begin
    // test ADD
    a = 8'd170; b = 8'd76; #3;
    a = 8'd56; b = 8'd105; #3;
    // test with 0
    a = 8'd0; b = 8'd0; #3;
    a = 8'd29; b = 8'd0; #3;
    a = 8'd56; b = 8'd93; #3;
    // test carry_out
    a = 8'd255; b = 8'd0; #3;
    a = 8'd255; b = 8'd1; #3;
    // test overflow
    a = 8'd200; b = 8'd200; #3;
end

endmodule