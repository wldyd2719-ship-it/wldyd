`timescale 1ns / 1ps

module universal_reg
#(parameter N = 4)(
    input clk, reset,
    input [1:0] s,
    input[N-1:0] I,
    input MSB_in, LSB_in,
    output [N-1:0] Q
    );
    localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset) begin
        if(~reset)  Q_reg <= 0;
        else        Q_reg <= Q_next;
    end
   
    always @(Q_reg, s, I, MSB_in, LSB_in) begin     // --> always @(*) begin
        Q_next = Q_reg;
        case(s)
            s0 : Q_next = Q_reg;                    // hold
            s1 : Q_next = {MSB_in,Q_reg[N-1:1]};    // right shift
            s2 : Q_next = {Q_reg[N-2:0],LSB_in};    // left shift
            s3 : Q_next = I;                        // load
            default : Q_next = Q_reg;       
        endcase
    end
    
    assign Q = Q_reg;
    
endmodule