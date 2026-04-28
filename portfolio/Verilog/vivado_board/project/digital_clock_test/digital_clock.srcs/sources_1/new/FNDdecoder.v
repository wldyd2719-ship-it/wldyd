`timescale 1ns / 1ps

module FNDdecoder(
    input [3:0] fnd_in,
    output reg [7:0] fnd
    );
    
    always @(fnd_in) begin
        case(fnd_in)
            4'h0 : fnd = 8'b1100_0000;
            4'h1 : fnd = 8'b1111_1001;
            4'h2 : fnd = 8'b1010_0100;
            4'h3 : fnd = 8'b1011_0000;
            4'h4 : fnd = 8'b1001_1001;
            4'h5 : fnd = 8'b1001_0010;
            4'h6 : fnd = 8'b1000_0010;
            4'h7 : fnd = 8'b1111_1000;
            4'h8 : fnd = 8'b1000_0000;
            4'h9 : fnd = 8'b1001_0000;
            default : fnd = 8'hFF;  

               
        endcase
    end
    
endmodule