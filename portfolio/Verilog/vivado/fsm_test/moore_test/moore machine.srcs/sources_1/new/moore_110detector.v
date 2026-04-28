`timescale 1ns / 1ps

module moore_110detector(
    input clk, input reset_n, input x,
    output y, output reg [1:0] state_reg
    );
    
    reg [1:0] state_next;
    localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    
    always @(posedge clk, negedge reset_n) begin
        if(~reset_n) state_reg <= s0;
        else        state_reg <= state_next;
    end
    
    always @(state_reg or x) begin
        case(state_reg)
            s0: if(x)   state_next = s1;
                else    state_next = s0;
           
            s1: if(x)   state_next = s2;
                else    state_next = s0;
           
            s2: if(x)   state_next = s2;
                else    state_next = s3;
           
            s3: if(x)   state_next = s1;
                else    state_next = s0;
                
            default : state_next = state_reg;
        endcase
    end
    assign y = (state_reg == s3);        
    
endmodule
