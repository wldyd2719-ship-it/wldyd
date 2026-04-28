`timescale 1ns / 1ps

module top_dc_motor(
    input clk, rst, sw_en, sw_dir,
    input [7:0] sw_pwm,
    output ENA,
    output reg IN1, IN2
    ); 
    // PWM »ý¼º (20kHz)
    wire pwm_sig;
    pwm_generator #(.CLK_FREQ(100_000_000), .PWM_FREQ(20_000)) u_pwm(.clk(clk), .rst(rst), .duty(sw_pwm), .pwm_out(pwm_sig));
    // Enable + PWM
    assign ENA = (sw_en) ? pwm_sig : 1'b0;
    
    always @(*) begin
        if(!sw_en) begin
            IN1 = 0;
            IN2 = 0;
        end
        else begin
            if(sw_dir == 0) begin
                IN1 = 1;
                IN2 = 0;
            end
            else begin
                IN1 = 0;
                IN2 = 1;
            end
        end
    end
    
endmodule