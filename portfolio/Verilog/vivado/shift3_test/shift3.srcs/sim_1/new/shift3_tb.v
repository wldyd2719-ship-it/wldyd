`timescale 1ns / 1ps

module shift3_tb();

    reg clk;
    reg rst;
    reg din;
    wire [2:0] q;
    
    shift3 uut(.clk(clk), .rst(rst), .din(din), .q(q));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0; rst = 1; din = 0;
        #10 rst = 0;
        
        #10 din = 1;
        
        #80 $finish;
    end

/*
    initial begin
        rst = 1;
        #1 rst = 0;
    end
    
    initial begin
            din = 0;
        #5  din = 0;
        #5  din = 1;
        #10 din = 0;
        #10 din = 0;
        #5  din = 0;
        #5  din = 1;
        #10 din = 0;
        #5  din = 0;
        #5  din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 din = 1;
        #10 din = 0;
        #10 din = 0;
        #10 $finish;
    end
*/

endmodule
