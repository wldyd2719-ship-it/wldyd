`timescale 1ns / 1ps

module fa4_tb;

reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] sum;
wire carry;

fa4 dut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
    );
  
  initial begin
    #00 a=0;b=0;cin=0;
    #10 a=1;b=2;
    #10 a=5;b=2;
    #10 a=9;b=8;
    #10 a=1;b=2;
    #10 $finish;
  end

endmodule
