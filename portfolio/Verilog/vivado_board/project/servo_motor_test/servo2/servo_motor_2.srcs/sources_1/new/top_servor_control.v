`timescale 1ns / 1ps

module top_servor_control(
    input clk_sys, reset, sw1, sw2, sw3,
    output Servo
    );
    // 100kHz tick 생성
    reg [9:0] div_cnt;
    reg tick_100kHz;
    
    always @(posedge clk_sys or posedge reset) begin
        if(reset) begin
            div_cnt <= 0;
            tick_100kHz <= 0;
        end
        else begin
            if(div_cnt == 999) begin
                div_cnt <= 0;
                tick_100kHz <= 1;
            end
            else begin
                div_cnt <= div_cnt + 1;
                tick_100kHz <= 0;
            end
        end        
    end
    // 스위치 디바운싱 + 펄스화
    wire sw1_pulse, sw2_pulse, sw3_pulse;
    
    debounce u_db1 (.clk(clk_sys), .reset(reset), .sw(sw1), .pulse(sw1_pulse));
    debounce u_db2 (.clk(clk_sys), .reset(reset), .sw(sw2), .pulse(sw2_pulse));
    debounce u_db3 (.clk(clk_sys), .reset(reset), .sw(sw3), .pulse(sw3_pulse));
    // servo 제어
    servo u_servo (.clk(clk_sys), .reset(reset), .tick_100kHz(tick_100kHz), .sw1(sw1_pulse), .sw2(sw2_pulse),.sw3(sw3_pulse), .Servo(Servo));
    
endmodule