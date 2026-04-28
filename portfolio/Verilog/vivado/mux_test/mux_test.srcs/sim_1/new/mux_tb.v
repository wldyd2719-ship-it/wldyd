`timescale 1ns / 1ps

module mux_tb();

    reg a,b;
    reg A,B,C,D;
    wire Q0, Q1, Q2;
    
    mux_gatelevel u1(a, b, A, B, C, D, Q0);
    mux_dataflow u2(a, b, A, B, C, D, Q1);
    mux_behavior u3(a, b, A, B, C, D, Q2);
    
    initial begin
        A = 0; B = 1; C = 1; D = 0;
        a=0; b=0;
        #10 a=1; b=0;
        #10 a=0; b=1;
        #10 a=1; b=0;
        #10 a=1; b=1;
        #10 $finish;
    end
    
    /*
    initial begin
        $monitor("gatelevle : a %d, b %d, Q %d", a, b, Q0);
        $monitor("dataflow : a %d, b %d, Q %d", a, b, Q1);
        $monitor("behavior : a %d, b %d, Q %d", a, b, Q2);
    end
    */
    
endmodule
