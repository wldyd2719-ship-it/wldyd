`timescale 1ns / 1ps

module register_tb();

    reg clk;
    reg [3:0] DATA_IN;
    wire [3:0] A, B;
    
    registertrans dut1(.clk(clk), .DATA_IN(DATA_IN), .A(A), .B(B));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        DATA_IN = 0;
        $monitor("Time= %0t | DATA_IN= %b A= %b B= %b", $time, DATA_IN, A, B);
        #7  DATA_IN = 1;
        #10 DATA_IN = 7;
        #10 DATA_IN = 0;
        #10 DATA_IN = 14;
        #10 DATA_IN = 11;
        #10 $finish;
    end

endmodule
