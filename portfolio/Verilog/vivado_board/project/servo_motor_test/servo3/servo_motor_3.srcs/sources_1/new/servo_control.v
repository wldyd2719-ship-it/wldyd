`timescale 1ns / 1ps

module servo_control(
    input clk100k,    input reset,    output reg Servo,    output reg LED1,    output reg LED2,    output reg LED3
    );
    parameter PERIOD = 2000;
    // 각도 → PWM
    function [9:0] angle_to_pwm;
        input [7:0] angle;
        reg [7:0] a;
        begin
            if (angle > 180)
                a = 180;
            else
                a = angle;
            angle_to_pwm = 50 + ((a * 190) / 180); // (50~200 추천)
        end
    endfunction
    localparam S_0   = 2'd0;   localparam S_90  = 2'd1;   localparam S_180 = 2'd2;
    reg [1:0] state;  reg [16:0] delay_cnt;   reg [9:0] duty;
    // FSM (각도 순환)
    always @(posedge clk100k or posedge reset) begin
        if (reset) begin
            state <= S_0;        delay_cnt <= 0;
        end else begin
            case (state)
                S_0: begin
                    if (delay_cnt == 100000) begin
                        delay_cnt <= 0;              state <= S_90;
                    end else begin
                        delay_cnt <= delay_cnt + 1;
                    end
                end
                S_90: begin
                    if (delay_cnt == 100000) begin
                        delay_cnt <= 0;          state <= S_180;
                    end else begin
                        delay_cnt <= delay_cnt + 1;
                    end
                end
                S_180: begin
                    if (delay_cnt == 100000) begin
                        delay_cnt <= 0;              state <= S_0;
                    end else begin
                        delay_cnt <= delay_cnt + 1;
                    end              end        endcase     end      end
    // 각도 설정
    always @(*) begin
        case (state)
            S_0:   duty = angle_to_pwm(0);        S_90:  duty = angle_to_pwm(90);        S_180: duty = angle_to_pwm(180);
            default: duty = angle_to_pwm(90);
        endcase
    end
    always @(*) begin
        LED1 = 0;     LED2 = 0;    LED3 = 0;
        case (state)
            S_0:   LED1 = 1;        S_90:  LED2 = 1;        S_180: LED3 = 1;
        endcase
    end
    // PWM 생성
    reg [10:0] cnt_pwm;
    always @(posedge clk100k or posedge reset) begin
        if (reset) begin
            cnt_pwm <= 0;        Servo <= 0;
        end else begin
            if (cnt_pwm >= PERIOD-1)
                cnt_pwm <= 0;
            else
                cnt_pwm <= cnt_pwm + 1;
            if (cnt_pwm < duty)
                Servo <= 1;
            else
                Servo <= 0;
        end
    end
endmodule
