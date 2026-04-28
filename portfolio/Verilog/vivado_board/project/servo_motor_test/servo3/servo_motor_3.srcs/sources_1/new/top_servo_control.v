`timescale 1ns / 1ps

module top_servo_control(
    input clk_sys,    input reset,    output Servo,    output LED1,    output LED2,    output LED3
    );
    wire clk100k;
    // 클럭 분주기
    clockdivider_100k u_clkdiv (
        .clk(clk_sys),    .reset(reset),    .clk100k(clk100k)   );
    // 서보 + LED 제어
    servo_control u_servo (
        .clk100k(clk100k),     .reset(reset),    .Servo(Servo),    .LED1(LED1),    .LED2(LED2),    .LED3(LED3)  );
    
endmodule