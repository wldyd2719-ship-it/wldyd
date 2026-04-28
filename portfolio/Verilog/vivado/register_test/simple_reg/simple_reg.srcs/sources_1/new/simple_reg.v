`timescale 1ns / 1ps

module simple_reg
#(parameter N = 4)(
    input clk,
    input [N-1:0] I,
    output [N-1:0] Q
    );
    
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk) begin
        Q_reg <= Q_next;
    end
    
    always @(*) begin
        Q_next = I;
    end
    
    assign Q = Q_reg;
    
endmodule
