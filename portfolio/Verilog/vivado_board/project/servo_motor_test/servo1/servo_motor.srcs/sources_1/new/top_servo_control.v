`timescale 1ns / 1ps

module top_servo_control(
    input clk_sys, reset,
    output Servo
    );
    wire clk100kHz_w;
    
    clock_divider_100kHz u_clkdivider(.clk(clk_sys), .reset(reset), .clk100kHz(clk100kHz_w));
    servo1 u_servo(.clk(clk_sys), .reset(reset), .clk100kHz(clk100kHz_w), .Servo(Servo));
    
endmodule