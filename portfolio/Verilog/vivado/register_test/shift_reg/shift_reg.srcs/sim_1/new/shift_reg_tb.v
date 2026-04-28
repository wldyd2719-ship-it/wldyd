`timescale 1ns / 1ps

module shift_reg_tb();

    reg clk, reset, DATA_IN;
    wire [3:0] Q;
    
    R_shift_reg dut1(.clk(clk), .reset(reset), .DATA_IN(DATA_IN), .Q(Q));
    //L_shift_reg dut2(.clk(clk), .reset(reset), .DATA_IN(DATA_IN), .Q(Q));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
              reset = 0;
            DATA_IN = 0;
        #3    reset = 1;
        #10   reset = 0;   
        #10 DATA_IN = 1;
        #10 DATA_IN = 0;
        #10 DATA_IN = 1;
        #10 DATA_IN = 1;
        #10 DATA_IN = 0;
        #10   reset = 1;
        #10 DATA_IN = 1;
        #10 DATA_IN = 0;
        #10 DATA_IN = 1;
        #10 DATA_IN = 1;
        #10   reset = 0;
        #50 $finish;
    end
    
    initial begin
        $monitor("TIME=%0t | RESETN=%b | DATA_IN=%b | Q=%b", $time, reset, DATA_IN, Q);
    end
    
/*    
    initial begin
        reset = 0;
        #1 reset = 1;
        #1 reset = 0;
    end
    
    initial begin
            DATA_IN = 0;
        #10 DATA_IN = 1;
        #10 DATA_IN = 1;
        #10 DATA_IN = 0;
        #10 DATA_IN = 1;
        #10 DATA_IN = 0;
        #10 DATA_IN = 0;
        #10 DATA_IN = 0;
        #10 DATA_IN = 1;
        #10 DATA_IN = 0;
        #10 DATA_IN = 1;
        #10 DATA_IN = 0;
        #10 DATA_IN = 1;
        #10 DATA_IN = 0;
        #10 DATA_IN = 0;
        #10 DATA_IN = 0;
        #10 $finish;
    end
*/
endmodule
