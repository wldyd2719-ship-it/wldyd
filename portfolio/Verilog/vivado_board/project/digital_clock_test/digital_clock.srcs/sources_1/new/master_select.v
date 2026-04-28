`timescale 1ns / 1ps

module master_select(
    input clk, reset, sw0, sw1,
    output [1:0] mode_out,
    output reg [2:0] set_pos_out
    );
    
    reg [2:0] set_pos = 3'b100;
    reg [1:0] mode = 2'b00;
    
    always @(posedge sw0 or posedge reset) begin
        if(reset)
            mode <= 2'b00;
        else
            mode <= mode + 1'b1;
    end
    
    assign mode_out = mode;
    
    always @(posedge sw1 or posedge reset) begin
        if(reset)
            set_pos <= 3'b100;
        else
            if((mode == 2'b01) || (mode == 2'b11))
                case(set_pos)
                    3'b100 : set_pos <= 3'b010;
                    3'b010 : set_pos <= 3'b001;
                    3'b001 : set_pos <= 3'b100;
                    default : set_pos <= 3'b100;
                endcase
            else
                set_pos <= set_pos;
    end
    
    always @(mode or set_pos) begin
        case(mode)
            2'b01, 2'b11 : set_pos_out <= set_pos;
            default      : set_pos_out <= 3'b000;
        endcase
    end
    
endmodule