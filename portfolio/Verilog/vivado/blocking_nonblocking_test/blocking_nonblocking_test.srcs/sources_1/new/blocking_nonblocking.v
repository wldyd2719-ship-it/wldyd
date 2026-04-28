`timescale 1ns / 1ps

module blocking(
    input clk, data,
    output reg rega, reg regb, reg regc    
    );
    
    always @(posedge clk)begin
        rega = data;
        regb = rega;
        regc = regb;
    end
    
endmodule

module nonblocking(
    input clk, data,
    output reg regd,
    output reg rege,
    output reg regf
    );
    
    always @(negedge clk)begin
        regd <= data;
        rege <= regd;
        regf <= rege;
    end
    
endmodule