`timescale 1ns / 1ps

module decoder3_8_tb();
    
    reg [2:0] x;
    reg en;
    wire [7:0] d;
    
    decoder3_8assign_test dut1(.x(x), .en(en), .d(d));
    
    initial begin
        en = 0;
        #5 en =1;
    end
    
    initial begin
        x = 03'b000;
        
        #10 x = 03'b001;
        #10 x = 03'b010;
        #10 x = 03'b011;
        #10 x = 03'b100;
        #10 x = 03'b101;
        #10 x = 03'b110;
        #10 x = 03'b111;
        #10 $finish;
    end

endmodule
