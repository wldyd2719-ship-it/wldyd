`timescale 1ns / 1ps

module clockdivider_100k(
     input clk,    input reset,    output reg clk100k = 0
    );
    reg [9:0] cnt = 0;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            cnt <= 0;      clk100k <= 0;
        end else begin
            if (cnt == 499) begin
                cnt <= 0;              clk100k <= ~clk100k;
            end else begin
                cnt <= cnt + 1;
            end
        end
    end
endmodule