`timescale 1ns / 1ps

module sram_model_bd #(
    parameter DEPTH = 8,
    parameter WIDTH = 16,
    parameter DEPTH_LOG = $clog2(DEPTH)
)(
    input clk, cs, we,
    input [DEPTH_LOG-1:0] ad,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout    
    );
    
    integer i;
    reg [WIDTH-1:0] mem[DEPTH-1:0];
    
    initial begin
        for(i=0; i<DEPTH; i=i+1)
            mem[i] = 0;
    end
    
    always @(posedge clk)
        if(cs & we)         mem[ad] <= din;
        else if(cs & !we)   dout <= mem[ad];

endmodule