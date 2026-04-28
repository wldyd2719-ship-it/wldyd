`timescale 1ns / 1ps

module blocking_nonblocking_tb();

    reg clk;
    reg data;
    wire rega;
    wire regb;
    wire regc;
    wire regd;
    wire rege;
    wire regf;
    
    blocking dut1(.clk(clk), .data(data), .rega(rega), .regb(regb), .regc(regc));
    nonblocking dut2(.clk(clk), .data(data), .regd(regd), .rege(rege), .regf(regf));
    
    initial begin
            data=0;
        #10 data = 1;
        #10 data = 0;
        #10 data = 1;
        #10 data = 1;
        #10 data = 1;
        #10 data = 0;
        #10 data = 0;
        #10 $finish;
    end

    initial begin
        clk = 0;
        repeat(30) #5 clk = ~clk;
    end

endmodule
