`timescale 1ns / 1ps

module Ex_1011_tb();
    reg clk, reset, x;
    wire y1, y2;
    wire [2:0] state_reg1;
    wire [2:0] state_reg2;
    
    moore_1011 dut1(.clk(clk), .reset(reset), .x(x), .y(y1), .state_reg(state_reg1));
    mealy_1011 dut2(.clk(clk), .reset(reset), .x(x), .y(y2), .state_reg(state_reg2));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1;
        #1 reset = 0;
        #1 reset = 1;
    end
    
    initial begin
            x = 0;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 $finish;      
    end   
endmodule
