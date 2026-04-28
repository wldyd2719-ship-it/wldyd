`timescale 1ns / 1ps

module counter(
    input inclk, reset,
    output reg [1:0] out_counter
    );
    
    always @(posedge inclk or posedge reset) begin
        if(reset) begin
            out_counter <= 0;
        end
        else begin
            out_counter <= out_counter + 1;
        end
    end
    
endmodule