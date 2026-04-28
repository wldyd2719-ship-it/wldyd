`timescale 1ns / 1ps

module paral_access_reg_tb();
    parameter N = 4;
    reg clk, reset, load, SI;
    reg [N-1:0] I;
    wire [N-1:0] Q;
    wire SO;
    
    paral_access_reg #(N) dut1(.clk(clk), .reset(reset), .load(load), .SI(SI), .I(I), .Q(Q), .SO(SO));
    
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
        I = 4'b1101;    load = 0;   SI = 0;
        #2 load = 1;
        #30 load = 0;
        #30 load = 0;
        #30 load = 1;
        #30 load = 1;
        #30 load = 0;
        #30 load = 0;        
        #40 $finish;
    end

endmodule
