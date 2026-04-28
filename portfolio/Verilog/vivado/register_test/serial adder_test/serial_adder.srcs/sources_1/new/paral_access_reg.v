`timescale 1ns / 1ps

module paral_access_reg
#(parameter N = 4)(
    input clk, reset, load, SI,
    input [N-1:0] I,
    output [N-1:0] Q,
    output SO
    );
    
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset) begin
        if(~reset)  Q_reg <= 0;
        else        Q_reg <= Q_next;
    end
    
    always @(*) begin
        if(load)    Q_next = I;
        else        Q_next = {SI,Q_reg[N-1:1]};
    end
    
    assign SO = Q_reg[0], Q = Q_reg;
    
endmodule
