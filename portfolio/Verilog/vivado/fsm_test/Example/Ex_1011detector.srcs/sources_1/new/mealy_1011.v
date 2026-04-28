`timescale 1ns / 1ps

module mealy_1011(
    input clk, reset, x,
    output y,
    output reg [2:0] state_reg
    );
    
    reg [2:0] state_next;
    localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    
    always @(posedge clk, negedge reset) begin
        if(~reset)  state_reg <= s0;
        else        state_reg <= state_next;
    end    
    
    always @(state_reg or x) begin
        case(state_reg)
            s0 : if(x)  state_next = s1;
                 else   state_next = s0;

            s1 : if(x)  state_next = s1;
                 else   state_next = s2;

            s2 : if(x)  state_next = s3;
                 else   state_next = s0;

            s3 : if(x)  state_next = s1;
                 else   state_next = s2;
                 
            default :   state_next = state_reg;
        endcase
    end
    
    assign y = (state_reg == s3 && x == 1);
    
endmodule
