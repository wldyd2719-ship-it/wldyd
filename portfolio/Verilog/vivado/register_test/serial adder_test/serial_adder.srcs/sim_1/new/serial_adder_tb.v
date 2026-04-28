`timescale 1ns / 1ps

module serial_adder_tb();
    parameter N = 8;
    reg clk, reset, load;
    reg [N-1:0] a, b;
    wire [N-1:0] sum;
    
    serial_adder u1(.clk(clk), .reset(reset), .load(load), .a(a), .b(b), .sum(sum));
    
    initial begin
                   clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
           reset = 1;
        #2 reset = 0;
        #2 reset = 1;
    end
    
    initial begin
        load = 0; a = 8'b00011010; b = 8'b01100111;
        #3 load = 1;
        #3 load = 0;
        #100 $finish;
    end
    
endmodule
