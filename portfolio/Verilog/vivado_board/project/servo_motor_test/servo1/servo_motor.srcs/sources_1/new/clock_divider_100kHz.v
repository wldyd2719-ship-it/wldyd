`timescale 1ns / 1ps

module clock_divider_100kHz(
    input clk, reset,
    output reg clk100kHz
    );
    reg [25:0] cnt = 0;
    
    always @(posedge clk or posedge reset) begin
        if(reset)   cnt <= 0;
        else begin
            if(cnt == (500-1)) begin
                cnt <= 0;
                clk100kHz <= ~clk100kHz;
            end
            else    cnt <= cnt + 1;
        end
    end
endmodule