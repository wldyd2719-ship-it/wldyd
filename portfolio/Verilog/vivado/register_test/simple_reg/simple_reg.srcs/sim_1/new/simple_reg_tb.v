`timescale 1ns / 1ps

module simple_reg_tb();

    parameter N = 4;
    reg clk;
    reg [N-1:0] I;
    wire [N-1:0] Q;
    
    simple_reg #(N) dut1(.clk(clk), .I(I), .Q(Q));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
            I = 0;
        #10 I = 1;
        #10 I = 5;
        #10 I = 15;
        #10 I = 8;
        #10 I = 3;
        #10 I = 11;
        #10 I = 13;
        #10 I = 9;
        #10 I = 0;
        #10 I = 7;
        #10 I = 4;
        #10 $finish;
        
    end

endmodule
