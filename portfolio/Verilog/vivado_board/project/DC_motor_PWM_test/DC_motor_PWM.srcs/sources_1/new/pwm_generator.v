`timescale 1ns / 1ps

module pwm_generator #(parameter CLK_FREQ = 100_000_000, parameter PWM_FREQ = 20_000)(
    input clk, rst,
    input [7:0] duty,
    output reg pwm_out
    );
    
    localparam PERIOD = CLK_FREQ / PWM_FREQ;    // 100MHz / 20kHz = 5000
    reg [15:0] cnt, duty_scaled;
    
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            cnt <= 0;
            pwm_out <= 0;
        end
        else begin
            if(cnt >= PERIOD - 1)
                cnt <= 0;
            else
                cnt <= cnt + 1;
            // duty scaling (0 ~ 255 → 0 ~ PERIOD)
            duty_scaled <= (duty * PERIOD) >> 8;    // ==> duty_scaled <= (duty * PERIOD) / 256; but 회로 복잡
            if(cnt < duty_scaled)
                pwm_out <= 1;
            else
                pwm_out <= 0;
        end
    end
    
endmodule