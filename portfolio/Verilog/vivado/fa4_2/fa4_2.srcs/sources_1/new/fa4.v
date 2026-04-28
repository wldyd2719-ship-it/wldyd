`timescale 1ns / 1ps

module fa4(
   input [3:0] a,
   input [3:0] b,
   input  cin,
   output [3:0] sum,
   output carry
    );
 wire w_carry0, w_carry1,w_carry2;
fa fa_0(
    .a(a[0]),    .b(b[0]),    .cin(cin),    .sum(sum[0]),   
     .carry(w_carry0)
    );
fa fa_1(
    .a(a[1]),    .b(b[1]),    .cin(w_carry0),    .sum(sum[1]), 
       .carry(w_carry1)
    );
fa fa_2(
    .a(a[2]),    .b(b[2]),    .cin(w_carry1),    .sum(sum[2]),
    .carry(w_carry2)
    );  
   
fa fa_3(
    .a(a[3]),
    .b(b[3]),
    .cin(w_carry2),
    .sum(sum[3]),
    .carry(carry)
    );                  
        
endmodule
