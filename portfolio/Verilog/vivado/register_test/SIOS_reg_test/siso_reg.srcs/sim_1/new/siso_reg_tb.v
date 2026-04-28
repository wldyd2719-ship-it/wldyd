`timescale 1ns / 1ps

module siso_reg_tb();
    reg clk, reset, I;
    wire Q;
    wire [3:0] Q_reg;
    siso_reg dut1(.clk(clk), .reset(reset), .I(I), .Q(Q), .Q_reg(Q_reg));
    
    initial begin
                   clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
           reset = 0;
        #1 reset = 1;
        #1 reset = 0;
    end
    
    initial begin
            I = 0;
        #3  I = 1;
        #10 I = 0;
        #10 I = 0;
        #10 I = 0;
        #10 I = 1;
        #10 I = 0;
        #10 I = 0;
        #10 I = 1;
        #10 I = 0;
        #10 I = 0;
        #10 I = 0;
        #10 I = 0;
        #10 $finish;
    end

endmodule
