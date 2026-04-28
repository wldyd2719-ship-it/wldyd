`timescale 1ns / 1ps

module moore_10110(
    input clk, input reset_n, input x,
    output y, output reg [2:0] state_reg
    );
    
    reg [2:0] state_next;
    localparam s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101;
    
    always @(posedge clk, negedge reset_n) begin
        if(~reset_n) state_reg <= s0;
        else        state_reg <= state_next;
    end
    
    always @(state_reg or x) begin
        case(state_reg)
            s0: if(x)   state_next = s1;
                else    state_next = s0;
           
            s1: if(x)   state_next = s1;
                else    state_next = s2;
           
            s2: if(x)   state_next = s3;
                else    state_next = s0;
           
            s3: if(x)   state_next = s4;
                else    state_next = s2;
                
            s4: if(x)   state_next = s1;
                else    state_next = s5;
            
            s5: if(x)   state_next = s3;
                else    state_next = s0;
                
            default : state_next = state_reg;
        endcase
    end
    assign y = (state_reg == s5);
    
endmodule