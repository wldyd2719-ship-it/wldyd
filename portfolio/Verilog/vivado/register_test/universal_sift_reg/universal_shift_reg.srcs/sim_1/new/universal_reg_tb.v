`timescale 1ns / 1ps

module universal_reg_tb();
    parameter N = 4;
    reg clk, reset;
    reg [1:0] s;
    reg [N-1:0] I;
    reg MSB_in, LSB_in;
    wire [N-1:0] Q;
    
    localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    
    universal_reg #(N) dut1(.clk(clk), .reset(reset), .s(s), .I(I), .MSB_in(MSB_in), .LSB_in(LSB_in), .Q(Q));
    
    initial begin
                   clk = 0;
        forever #20 clk = ~clk;
    end
    
    initial begin
           reset = 1;
        #1 reset = 0;
        #1 reset = 1;
    end
    
    initial begin
             I = 4'b1011;
        #300 I = 4'b1101;
    end
    
    initial begin
        #5 s =  s3;
        #40 s = s1;
        #40 s = s1;
        #40 s = s1;
        #40 s = s1;
        #40 s = s2;
        #40 s = s3;
        #40 s = s2;
        #40 s = s2;
        #40 s = s3;
        #40 s = s0;
        #40 s = s2;
        #40 s = s2;
        #40 $finish;
    end
    
    initial begin
        MSB_in = 0;
        LSB_in = 0;
    end

endmodule
