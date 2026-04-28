`timescale 1ns / 1ps

module data_mux(
    inout [3:0] in_a, in_b, in_c, in_d, in_e, in_f,
    input [1:0] in_sel,
    input time_mode,
    output reg [3:0] out_y
    );
    
    always @(in_sel or time_mode) begin
        if(time_mode == 1'b0) begin
            case(in_sel)
                2'b00 : out_y = in_a;
                2'b01 : out_y = in_b;
                2'b10 : out_y = in_c;
                2'b11 : out_y = in_d;
            endcase
        end
        else begin
            case(in_sel)
                2'b00 : out_y = in_c;
                2'b01 : out_y = in_d;
                2'b10 : out_y = in_e;
                2'b11 : out_y = in_f;
            endcase
        end        
    end
    
endmodule