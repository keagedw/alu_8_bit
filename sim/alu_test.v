`timescale 1ns/1ps

module alu_test;

reg  [7:0] a;
reg  [7:0] b;
reg  [3:0] op;
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
    a = 8'd107; b = 8'd32; op = 3'b000; #10;
    a = 8'd212; b = 8'd78; op = 3'b000; #10;

    // test SUB
    a = 8'd179; b = 8'd94; op = 3'b001; #10;
    a = 8'd10; b = 8'd53; op = 3'b001; #10;

    // test AND
    a = 8'b11001100; b = 8'b10101010; op = 3'b010; #10;
    a = 8'b11110000; b = 8'b00001111; op = 3'b010; #10;
     
    // test OR
    a = 8'b11001100; b = 8'b10101010; op = 3'b011; #10;
    a = 8'b11110000; b = 8'b00001111; op = 3'b011; #10;

    // test XOR
    a = 8'b11001100; b = 8'b10101010; op = 3'b100; #10;
    a = 8'b01110001; b = 8'b00001111; op = 3'b100; #10;
end

endmodule