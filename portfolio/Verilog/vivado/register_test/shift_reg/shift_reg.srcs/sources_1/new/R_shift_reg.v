`timescale 1ns / 1ps

module R_shift_reg(
    input clk, reset, DATA_IN,
    output reg [3:0] Q
    );
    
    always @(posedge clk or posedge reset) begin
        if(reset == 1'b1)   Q <= 4'b0000;
        else
        begin
            Q[2:0] <= Q[3:1];
            Q[3] <= DATA_IN;
            //--> Q <= {DATA_IN, Q[3:1]};
        end
    end
    
endmodule
