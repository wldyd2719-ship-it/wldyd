`timescale 1ns / 1ps
module fa(
    input a,
    input b,
    input cin,
    output sum,
    output carry
    );
    wire w_sum1;
    wire w_carry1, w_carry2;
ha  ha_1(
  .a(a),
  .b(b),
  .sum(w_sum1),
  .carry(w_carry1)
  );  
 ha  ha_2(
  .a(w_sum1),
  .b(cin),
  .sum(sum),
  .carry(w_carry2)
  );      
 assign carry = w_carry1 | w_carry2;   
endmodule
