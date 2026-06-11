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
    a = 8'd107; b = 8'd32; op = 1'b0; #10;
    a = 8'd212; b = 8'd78; op = 1'b0; #10;

    // test SUB
    a = 8'd179; b = 8'd94; op = 1'b1; #10;
    a = 8'd10; b = 8'd53; op = 1'b1; #10;
end

endmodule