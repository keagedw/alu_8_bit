module carry_lookahead(
    input  [7:0] a,
    input  [7:0] b,
    output [7:0] result,
    output       carry_out
);
wire [7:0] carry, propogate;

assign carry     = a & b;
assign propogate = a ^ b;

assign result[0] = propogate[0];

assign result[1] = propogate[1] ^ carry[0];

assign result[2] = propogate[2] ^ (carry[1] | 
                   (propogate[1] & carry[0]));

assign result[3] = propogate[3] ^ (carry[2] | 
                    (propogate[2] & (carry[1] | 
                     (propogate[1] & carry[0]))));

assign result[4] = propogate[4] ^ (carry[3] | 
                    (propogate[3] & (carry[2] | 
                     (propogate[2] & (carry[1] | 
                      (propogate[1] & carry[0]))))));

assign result[5] = propogate[5] ^ (carry[4] | 
                    (propogate[4] & (carry[3] | 
                     (propogate[3] & (carry[2] | 
                      (propogate[2] & (carry[1] | 
                       (propogate[1] & carry[0]))))))));

assign result[6] = propogate[6] ^ (carry[5] | 
                    (propogate[5] & (carry[4] | 
                     (propogate[4] & (carry[3] | 
                      (propogate[3] & (carry[2] | 
                       (propogate[2] & (carry[1] | 
                        (propogate[1] & carry[0]))))))))));

assign result[7] = propogate[7] ^ (carry[6] | 
                    (propogate[6] & (carry[5] | 
                     (propogate[5] & (carry[4] | 
                      (propogate[4] & (carry[3] | 
                       (propogate[3] & (carry[2] | 
                        (propogate[2] & (carry[1] | 
                         (propogate[1] & carry[0]))))))))))));
 
assign carry_out = carry[7] | 
                    (propogate[7] & (carry[6] | 
                     (propogate[6] & (carry[5] | 
                      (propogate[5] & (carry[4] | 
                       (propogate[4] & (carry[3] | 
                        (propogate[3] & (carry[2] | 
                         (propogate[2] & (carry[1] | 
                          (propogate[1] & carry[0])))))))))))));

endmodule