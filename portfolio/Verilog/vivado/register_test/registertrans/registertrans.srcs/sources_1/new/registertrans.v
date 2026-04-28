`timescale 1ns / 1ps

module registertrans(
    input clk,
    input wire [3:0] DATA_IN,
    output reg [3:0] A, B
    );
    
    always @(posedge clk) begin
        A <= DATA_IN;
    end
    
    always @(posedge clk) begin
        B <= A;
    end
    
endmodule
