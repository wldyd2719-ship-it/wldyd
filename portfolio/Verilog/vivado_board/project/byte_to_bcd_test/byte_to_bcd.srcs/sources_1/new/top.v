`timescale 1ns / 1ps

module top(
    input clk,
    input [7:0] sw,
    output reg [3:0] an,
    output [6:0] fnd
    );
    
    wire [11:0] bcd;
    
    byte_bcd u_bcd(.d(sw), .a(bcd));
    fnd_decoder u_fnd(.bcd(digit), .seg(fnd));
    
    reg [18:0] clk_div = 0;
    
    always @(posedge clk) begin
        clk_div <= clk_div + 1;
    end    

    reg [3:0] digit;
    //wire [1:0] sel = 0;
    //assign sel = clk_div[18:17];
    reg [1:0] sel = 0;
    /*
    wire scan_clk = clk_div[18];
    always @(posedge scan_clk) begin
        sel <= sel +1;
    end
    */
    always @(posedge clk_div[18]) begin
        sel <= sel +1;
    end

    always @(*) begin
        case(sel)
            2'b00 : begin
                        an = 4'b1110;
                        digit = bcd[3:0];
                    end
            2'b01 : begin
                        an = 4'b1101;
                        digit = bcd[7:4];
                    end
            2'b10 : begin
                        an = 4'b1011;
                        digit = bcd[11:8];
                    end                    
            //  16 bit
//            2'b11 : begin
//                        an = 4'b0111;
//                        digit = bcd[15:12];
//                    end
            // end
            default : begin
                        an = 4'b0111;
                        digit = 4'd0;
                    end
        endcase
    end
    
endmodule