module carry_lookahead(
    input  [3:0] a,
    input  [3:0] b,
    input        carry_in,
    output [3:0] result,
    output       carry_out
);

assign result[0] = a[0] ^ b[0] ^ carry_in;

assign result[1] = a[1] ^ b[1] ^ 
                   ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in));

assign result[2] = a[2] ^ b[2] ^
                   ((a[1] & b[1]) | 
                    (a[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))) |
                    (b[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))));

assign result[3] = a[3] ^ b[3] ^
                   ((a[2] & b[2]) |
                    (a[2] & ((a[1] & b[1]) | 
                    (a[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))) |
                    (b[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))))) |
                    (b[2] & ((a[1] & b[1]) | 
                    (a[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))) |
                    (b[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))))));

assign carry_out = (a[3] & b[3]) |
                   (a[3] & ((a[2] & b[2]) |
                    (a[2] & ((a[1] & b[1]) | 
                    (a[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))) |
                    (b[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))))) |
                    (b[2] & ((a[1] & b[1]) | 
                    (a[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))) |
                    (b[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))))))) | 
                   (b[3] & ((a[2] & b[2]) |
                    (a[2] & ((a[1] & b[1]) | 
                    (a[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))) |
                    (b[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))))) |
                    (b[2] & ((a[1] & b[1]) | 
                    (a[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in))) |
                    (b[1] & ((a[0] & b[0]) | (a[0] & carry_in) | (b[0] & carry_in)))))));
endmodule