`timescale 100ps/1ps

module carry_lookahead_test;

reg  [7:0] a;
reg  [7:0] b;
reg        carry_in;
wire [7:0] result;
wire       carry_out;

carry_lookahead test(
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .result(result),
    .carry_out(carry_out)
);

initial begin
    // test ADD
    a = 8'd170; b = 8'd76; carry_in = 1'b0; #3;
    a = 8'd56; b = 8'd105; carry_in = 1'b0; #3;
    // test with 0
    a = 8'd0; b = 8'd0; carry_in = 1'b0; #3;
    a = 8'd29; b = 8'd0; carry_in = 1'b0; #3;
    // test carry_in
    a = 8'd56; b = 8'd0; carry_in = 1'b1; #3;
    // test carry_out
    a = 8'd255; b = 8'd0; carry_in = 1'b0; #3;
    a = 8'd255; b = 8'd0; carry_in = 1'b1; #3;
    a = 8'd255; b = 8'd1; carry_in = 1'b0; #3;
    // test overflow
    a = 8'd200; b = 8'd200; carry_in = 1'b0; #3;
end

endmodule