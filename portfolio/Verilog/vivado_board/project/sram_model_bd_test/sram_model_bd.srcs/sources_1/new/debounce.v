`timescale 1ns / 1ps

module debounce(
    input clk,
    input rst,
    input noisy_in,
    output reg clean_out
    );
    
    parameter DEBOUNCE_CNT = 500_000;
    reg [19:0] cnt;
    reg sync0, sync1;
    
    always @(posedge clk) begin
        sync0 <= noisy_in;      sync1 <= sync0;
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;            clean_out <= 0;
        end else begin
            if (sync1 != clean_out) begin
                if (cnt < DEBOUNCE_CNT)
                    cnt <= cnt + 1;
                else begin
                    clean_out <= sync1;
                    cnt <= 0;
                end
            end else begin
                cnt <= 0;
            end
        end
    end

endmodule