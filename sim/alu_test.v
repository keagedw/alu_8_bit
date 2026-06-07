`timescale 1ns/1ps

module alu_test;

reg  [7:0] a;
reg  [7:0] b;
reg        op;
wire [7:0] result;
wire       carry;

alu test(
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .carry(carry)
);

initial begin
    // test ADD
    a = 8'd5; b = 8'd3; op = 1'b0; #10;

    // test SUB
    a = 8'd10; b = 8'd3; op = 1'b1; #10;
end

endmodule