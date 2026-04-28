`timescale 1ns / 1ps

module L_shift_reg(
    input clk, reset, DATA_IN,
    output reg [3:0] Q
    );
    
    always @(posedge clk or posedge reset) begin
        if(reset == 1'b1)   Q <= 4'b0000;
        else
        begin
            Q[3:1] <= Q[2:0];
            Q[0] <= DATA_IN;
            //--> Q <= {Q[2:0], DATA_IN};
        end
    end
endmodule
