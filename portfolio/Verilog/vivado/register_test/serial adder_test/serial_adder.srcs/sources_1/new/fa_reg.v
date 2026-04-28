`timescale 1ns / 1ps

module fa_reg(
    input a, b, cin,
    output s, cout
    );
    
    assign s  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
    
endmodule
