`timescale 1ns / 1ps
module ha(
    input a,
    input b,
    input c,
    output sum,
    output carry
    );
    
    assign sum = a^b;
    assign carry = a & b;
    
endmodule
