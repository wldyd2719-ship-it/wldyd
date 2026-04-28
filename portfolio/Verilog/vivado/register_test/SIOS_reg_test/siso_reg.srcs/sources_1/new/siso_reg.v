`timescale 1ns / 1ps

module siso_reg(
    input clk, reset, I,
    output Q,
    output reg [3:0] Q_reg
    );

    reg [3:0] Q_next;
    
    always @(posedge clk, posedge reset) begin
        if(reset)  Q_reg <= 0;
        else        Q_reg <= Q_next;
    end
    
    always @(I, Q_reg) begin
        // left shift
        Q_next[3:1] = Q_reg[2:0];
        Q_next[0]   = I;
        // ==> Q_next = {Q_reg[2:0],I};
        
        /*
        // right shift
        Q_next[2:0] = Q_reg[3:1];
        Q_next[3]   = I;
        // ==> Q_next = {I,Q_reg[3:1]};
        */
        
    end
    
    assign Q = Q_reg[3];
    /*
    assign Q = Q_reg[0];
    */
    
endmodule

/*
module siso_reg(
    input clk, reset, DATA_IN,
    output Q,
    output reg [3:0] Q_reg
    );
    
    always @(posedge clk, posedge reset) begin
        if(reset)  Q_reg <= 0;
        else begin
                Q_reg[2:0] <= Q_reg[3:1];
                Q_reg[3] <= DATA_IN;
             end      
    end
    
    assign Q = Q_reg[0];
    
endmodule
*/