`timescale 1ns / 1ps

module piso_reg(
    input clk, SH_LDN,
    input [3:0] I,
    output Q,
    output reg [3:0] BUFF
    );

    always @(posedge clk, negedge SH_LDN) begin
        if(~SH_LDN) BUFF <= I;
        else begin
                // right shift, ==> BUFF <= {0,BUFF[3:1]};
                BUFF[2:0] <= BUFF[3:1];
                BUFF[3] <= 1'b0;
             end
    end
    
    assign Q = BUFF[0];
    
endmodule
