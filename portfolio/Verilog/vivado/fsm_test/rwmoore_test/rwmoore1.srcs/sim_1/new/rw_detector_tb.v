`timescale 1ns / 1ps

module rw_detector_tb();
    reg clk, rstn, go, ws;
    wire rd, ds;
    wire [1:0] state;
    wire [1:0] next_state;
    
    rwmoore1 dut(.clk(clk), .rstn(rstn), .go(go), .ws(ws), .rd(rd), .ds(ds), .state(state), .next_state(next_state));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
           rstn = 1;
        #1 rstn = 0;
        #1 rstn = 1;
    end
    
    initial begin
            go = 0; ws = 0; //idle
        #10 go = 1; ws = 1; //read
        #10 go = 0; ws = 0; //dly
        #10 go = 0; ws = 1; //read
        #10 go = 1; ws = 1; //dly
        #10 go = 1; ws = 0; //done
        #10 go = 1; ws = 0; //idle
        #10 go = 0; ws = 1; //idle
        #10 go = 1; ws = 0; //read
        #10 go = 1; ws = 0; //dly
        #10 go = 0; ws = 0; //done
        #10 go = 1; ws = 0; //idle
        #10 $finish;
    end
    

endmodule
