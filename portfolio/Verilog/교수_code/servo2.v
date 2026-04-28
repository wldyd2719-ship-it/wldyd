`timescale 1ns / 1ps
module top_servo_control (
    input clk_sys,      input reset,      input sw1,       input sw2,       input sw3,       output Servo  );
// 100kHz tick 생성
reg [9:0] div_cnt; reg tick_100khz;
always @(posedge clk_sys or posedge reset) begin
    if (reset) begin
        div_cnt <= 0;        tick_100khz <= 0;
    end else begin
        if (div_cnt == 999) begin
            div_cnt <= 0;            tick_100khz <= 1;
        end else begin
            div_cnt <= div_cnt + 1;            tick_100khz <= 0;
        end       end      end
// 스위치 디바운싱 + 펄스화
wire sw1_pulse, sw2_pulse, sw3_pulse;
debounce u_db1 (.clk(clk_sys), .reset(reset), .sw(sw1), .pulse(sw1_pulse));
debounce u_db2 (.clk(clk_sys), .reset(reset), .sw(sw2), .pulse(sw2_pulse));
debounce u_db3 (.clk(clk_sys), .reset(reset), .sw(sw3), .pulse(sw3_pulse));
// servo 제어
servo u_servo (
    .clk(clk_sys),    .reset(reset),    .tick_100khz(tick_100khz),    .sw1(sw1_pulse),    .sw2(sw2_pulse),    .sw3(sw3_pulse),    .Servo(Servo)     );
endmodule

module servo(
    input clk,     input reset,      input tick_100khz,    input sw1,     input sw2,      input sw3,      output reg Servo );
parameter DUTY_0_DEG   = 150;   parameter DUTY_90_DEG  = 240;  parameter DUTY_90_LEFTDEG = 50;
reg [9:0] duty;  reg [10:0] pwm_cnt;
// 버튼에 따른 각도 설정
always @(posedge clk or posedge reset) begin
    if (reset) begin
        duty <= DUTY_0_DEG;
    end else begin
        if (sw1)       duty <= DUTY_90_LEFTDEG; 
        else if (sw2)  duty <= DUTY_90_DEG;  
        else if (sw3)  duty <= DUTY_0_DEG;  
    end
end
// PWM 생성 (20ms)
always @(posedge clk or posedge reset) begin
    if (reset) begin
        pwm_cnt <= 0;        Servo <= 0;
    end else if (tick_100khz) begin
        if (pwm_cnt >= 1999)
            pwm_cnt <= 0;
        else
            pwm_cnt <= pwm_cnt + 1;
        if (pwm_cnt < duty)
            Servo <= 1;
        else
            Servo <= 0;
    end   end    endmodule
module debounce(
    input clk,    input reset,    input sw,    output reg pulse   );
reg [1:0] sync;  reg [19:0] cnt;  reg debounced;    reg prev;
always @(posedge clk) begin
    sync <= {sync[0], sw};
end
// 디바운싱
always @(posedge clk or posedge reset) begin
    if (reset) begin
        cnt <= 0;        debounced <= 0;
    end else begin
        if (sync[1] != debounced) begin
            if (cnt == 1_000_000) begin  // 약 10ms (100MHz)
                debounced <= sync[1];                   cnt <= 0;
            end else
                cnt <= cnt + 1;
        end else
            cnt <= 0;
    end
end
// 상승엣지 → 1펄스 생성
always @(posedge clk or posedge reset) begin
    if (reset) begin
        prev <= 0;        pulse <= 0;
    end else begin
        pulse <= (debounced & ~prev);          prev <= debounced;
    end
end
endmodule