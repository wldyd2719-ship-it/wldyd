`timescale 1ns / 1ps

module mealy_detector_tb();
    reg clk; reg reset_n; reg x;
    wire y_101; //wire y_110; wire y_110_2;
    wire [1:0] state_reg101; //wire [1:0] state_reg110; wire [1:0] state_reg110_2;
    
    mealy_101detector dut1(.clk(clk), .reset_n(reset_n), .x(x), .y(y_101), .state_reg(state_reg101));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
           reset_n = 1;
        #1 reset_n = 0;
        #1 reset_n = 1;
    end
    
    initial begin
            x=0;
        #10 x=1;
        #10 x=1;
        #10 x=0;
        #10 x=0;
        #10 x=1;
        #10 x=0;
        #10 x=1;
        #10 x=1;
        #10 x=1;
        #10 x=0;
        #10 x=1;
        #10 $finish;
    end
endmodule