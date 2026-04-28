`timescale 1ns / 1ps

module piso_reg_tb();

    reg clk, SH_LDN;
    reg [3:0] I;
    wire Q;
    wire [3:0] BUFF;
    
    piso_reg dut1(.clk(clk), .SH_LDN(SH_LDN), .I(I), .Q(Q), .BUFF(BUFF));
    
    initial begin
                   clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
            SH_LDN = 1; I = 4'b1101;
        #02 SH_LDN = 0;
        #02 SH_LDN = 1;
        #50 I = 4'b1011;
        #02 SH_LDN = 0;
        #02 SH_LDN = 1;
        #55 $finish;
    end

endmodule
