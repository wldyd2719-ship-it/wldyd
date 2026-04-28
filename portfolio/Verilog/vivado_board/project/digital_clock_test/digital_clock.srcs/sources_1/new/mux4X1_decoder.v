`timescale 1ns / 1ps

module mux4X1_decoder(
    input [1:0] sel_in,
    output reg [3:0] fnd_sel
    );
    
    always @(sel_in) begin
        case(sel_in)
            2'b00 : fnd_sel = 4'b1110;
            2'b01 : fnd_sel = 4'b1101;
            2'b10 : fnd_sel = 4'b1011;
            2'b11 : fnd_sel = 4'b0111;
            default : fnd_sel = 4'b1111;
        endcase
    end
    
endmodule