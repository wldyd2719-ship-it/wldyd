`timescale 1ns / 1ps

module dff_tb();

    reg d;
    reg clk;
    reg reset;
    wire q;
    //parameter t = 4;
    
    dff dut(.d(d), .clk(clk), .reset(reset), .q(q));
    
    initial begin
           reset = 1;
        #1 reset = 0;
        #1 reset = 1;
    end
    
    initial begin
            d=1;
        #10 d=1;
        #10 d=0;
        #10 d=0;
        #10 d=1;
        #10 d=0;
        #10 d=1;
        #10 d=0;
        #10 d=1;
        #10 d=0;
        #10 $finish;
    end
    
    initial begin
        clk = 0;
        repeat(30) #5 clk = ~clk;
    end

endmodule
