`timescale 1ns / 1ps

module exam_fsm_tb();
    reg clk; reg reset_n; reg x;
    wire y_moore; wire y_mealy;
    wire [2:0] state_reg_moore; wire [2:0] state_reg_mealy;
    
    moore_10110 dut1(.clk(clk), .reset_n(reset_n), .x(x), .y(y_moore), .state_reg(state_reg_moore));
    mealy_10110 dut2(.clk(clk), .reset_n(reset_n), .x(x), .y(y_mealy), .state_reg(state_reg_mealy));
    
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
        #10 x=1;
        #10 x=1;
        #10 x=0;
        #10 x=1;
        #10 x=1;
        #10 x=0;
        #10 x=0;
        #10 x=1;
        #10 x=0;
        #10 x=1;
        #10 x=1;
        #10 x=0;
        #10 x=1;
        #10 $finish;
    end

endmodule
