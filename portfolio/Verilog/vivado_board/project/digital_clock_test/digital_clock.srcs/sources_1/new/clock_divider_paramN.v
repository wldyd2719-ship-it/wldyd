`timescale 1ns / 1ps

module clock_divider_paramN #(parameter N = 100_000)
(
    input clk, reset,
    output reg clk_out
    );
    
    reg [26:0] cnt;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            cnt <= 0;
            clk_out <= 0;
        end
        else begin
            if(cnt == (N-1)) begin
                cnt <= 0;
                clk_out <= 1;
            end
            else begin
                clk_out <= 0;
                cnt <= cnt + 1;
            end
        end
    end
    
endmodule