`timescale 1ns / 1ps

module clock_divider_tb();

    reg clk_100mHz;
    reg reset;
    wire clk_1Hz;
    
    clock_divider dut1(.clk_100mHz(clk_100mHz), .reset(reset), .clk_1Hz(clk_1Hz));
    
    initial begin
        clk_100mHz = 0;
        forever #5 clk_100mHz = ~clk_100mHz;
    end
    
    initial begin
        reset = 1;
        #20 reset = 0;
    end
    
    initial begin
        #400;
        $finish;
    end

endmodule
