`timescale 1ns / 1ps

module fnd2_2(
    input clk,
    input [3:0] sw0, sw1, sw2, sw3,
    output reg [6:0] fnd,
    output reg [3:0] an
    );
    
    reg [20:0] seg_cnt;
    
    always @(posedge clk) begin
        seg_cnt <= seg_cnt +1;
    end
    
    function [6:0] decode;
        input [3:0] sw;
        begin
            case(sw)
                4'd0 : decode = 7'b100_0000;
                4'd1 : decode = 7'b111_1001;
                4'd2 : decode = 7'b010_0100;
                4'd3 : decode = 7'b011_0000;
                4'd4 : decode = 7'b001_1001;
                4'd5 : decode = 7'b001_0010;
                4'd6 : decode = 7'b000_0010;
                4'd7 : decode = 7'b101_1000;
                4'd8 : decode = 7'b000_0000;
                4'd9 : decode = 7'b001_1000;
                4'd10 : decode = 7'b000_1000;
                4'd11 : decode = 7'b100_0011;
                4'd12 : decode = 7'b100_0110;
                4'd13 : decode = 7'b010_0001;
                4'd14 : decode = 7'b000_0110;
                4'd15 : decode = 7'b000_1110;
                default : decode = 7'b111_1111;
            endcase
        end
    endfunction
    
    always @(posedge clk) begin
        case(seg_cnt[19:18])
            2'b00 : begin
                        an <= 4'b1110;
                        fnd <= decode(sw0);
                    end
            2'b01 : begin
                        an <= 4'b1101;
                        fnd <= decode(sw1);
                    end
            2'b10 : begin
                        an <= 4'b1011;
                        fnd <= decode(sw2);
                    end
            2'b11 : begin
                        an <= 4'b0111;
                        fnd <= decode(sw3);
                    end    
        endcase
    end
    
endmodule
