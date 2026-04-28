`timescale 1ns / 1ps

module reg_4bit_load_tb();
    
    parameter N = 4;
    reg clk, load;
    reg [N-1:0] I;
    wire [N-1:0] Q;
    
    reg_4bit_load #(N) dut1(.clk(clk), .load(load), .I(I), .Q(Q));
    
    initial begin
                     clk = 0;
        forever #5 clk =~clk;
    end
    
    initial begin
        load = 0;
        I = 4'b0000;
        $monitor("Time=%0t | load=%b I=%b Q=%b", $time, load, I, Q);
        #10;      I = 4'b1010;
        #10;      I = 4'b1111;
        #10;      load = 1;
        I = 4'b1100;
        #10;      I = 4'b0011;
        #10;      load = 0;       I = 4'b0101;
        #20;      load = 1;       I = 4'b1110;
        #10;
        #20;     $finish;
    end
    
    /*
    initial begin
            load = 0;
              I = 00;
        #10   I = 10;
        #10   I = 15;
        #10 load = 1;
              I = 11;
        #10   I = 09;
        #10   I = 05;
        #10   I = 13;
        #10   I = 00;
        #10   I = 10;
        #10   I = 15;
        #10   I = 11;
        #10   I = 09;
        #10 load = 0;
              I = 05;
        #10   I = 13;
        #10 $finish;  
    end
    */
    
endmodule
