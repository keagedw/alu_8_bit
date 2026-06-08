module carry_lookahead(
    input  [3:0] a,
    input  [3:0] b,
    input        carry_in,
    output [3:0] result,
    output       carry_out
);
wire [3:0] carry, propogate;

assign carry     = a & b;
assign propogate = a ^ b;

assign result[0] = propogate[0] ^ carry_in;

assign result[1] = propogate[1] ^ 
                   (carry[0] | (propogate[0] & carry_in));

assign result[2] = propogate[2] ^
                   (carry[1] | (propogate[1] & 
                     (carry[0] | propogate[0] & carry_in)));

assign result[3] = propogate[3] ^
                   (carry[2] | (propogate[2] & 
                    (carry[1] | (propogate[1] & 
                     (carry[0] | propogate[0] & carry_in)))));

assign carry_out = carry[3] | (propogate[3] & 
                    (carry[2] | (propogate[2] & 
                     (carry[1] | (propogate[1] & 
                      (carry[0] | propogate[0] & carry_in))))));
endmodule