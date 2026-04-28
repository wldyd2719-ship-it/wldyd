`timescale 1ns / 1ps

module servo(
    input clk, reset, tick_100kHz, sw1, sw2, sw3,
    output reg Servo
    );
    parameter DUTY_0_DEG = 150;
    parameter DUTY_90_DEG = 240;
    parameter DUTY_90_LEFTDEG = 50;
    
    reg [9:0] duty;
    reg [10:0] pwm_cnt;
    // 버튼에 따른 각도 설정
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            duty <= DUTY_0_DEG;
        end
        else begin
            if(sw1)         duty <= DUTY_90_LEFTDEG;
            else if(sw2)    duty <= DUTY_90_DEG;
            else if(sw3)    duty <= DUTY_0_DEG;
        end
    end
    // PWM 생성(20ms)
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            pwm_cnt <= 0;
            Servo <= 0;
        end
        else if(tick_100kHz) begin
            if(pwm_cnt >= 1999)
                pwm_cnt <= 0;
            else
                pwm_cnt <= pwm_cnt + 1;
            if (pwm_cnt < duty)
                Servo <= 1;
            else
                Servo <= 0;
        end
    end
endmodule