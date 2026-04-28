`timescale 1ns / 1ps

module encoder8_3_1_tb();

    reg [7:0] d;
    reg en;
    wire [2:0] a;
    wire v;
    
    encoder8_3_1 dut1(.d(d), .en(en), .a(a), .v(v));
    
    initial begin
        en = 0;
        #5 en =1;
    end
    
    initial begin
            d= 'h78;
    /*
        #10 d = 'h00;
        #10 d = 'h01;
        #10 d = 'h02;
        #10 d = 'h04;
        #10 d = 'h08;
        #10 d = 'h10;
        #10 d = 'h20;
        #10 d = 'h40;
        #10 d = 'h80;
    */
        #10 d = 'h48;   // a = 6
        #10 d = 'hA7;   // a = 7
        #10 d = 'hC0;   // a = 7
        #10 d = 'hFF;   // a = 7
        #10 d = 'h3F;   // a = 5
        #10 $finish;
    end
    
endmodule
