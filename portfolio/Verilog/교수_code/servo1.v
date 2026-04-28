module top_servo_control (
    input clk_sys,         input reset,          output Servo     );
wire clk100000hz_w; 
clockdivider_100000hz u_clockdivider (     .clk(clk_sys),      .reset(reset),      .clk100000hz(clk100000hz_w) );
servo u_servo (      .clk(clk_sys),          .reset(reset),      .clk100000hz(clk100000hz_w),       .Servo(Servo)           );
endmodule

module servo(
    input clk, reset,      input clk100000hz,      output reg Servo  );
// 100kHz 클록에서 1주기(10us)당 카운트 값입니다.
// 일반적인 서보 모터는 20ms 주기 (2000 카운트) 내에서 1ms~2ms 펄스 폭을 사용합니다.
// 1ms = 100 카운트, 1.5ms = 150 카운트, 2ms = 200 카운트
// 0도 ~ 180도 서보의 경우:// 0도 근처: 약 150 (1.5ms)// 오른쪽 90도 : 약 200 (2ms)// 왼쪽 90도근처: 약 100 (1ms)
parameter DUTY_0_DEG = 50; parameter DUTY_90_DEG = 240; 
// 상태 머신을 위한 상태 정의
localparam S_0_DEG = 2'd0;    localparam S_WAIT_45 = 2'd1;   localparam S_90_DEG = 2'd2;  localparam S_WAIT_90 = 2'd3;  
reg [1:0] current_state;  reg [7:0] internal_data;   reg [9:0] cnt_duty;   reg [16:0] delay_cnt;
// PWM 신호 생성 로직
always @(posedge clk100000hz or posedge reset) begin
    if(reset) begin
        cnt_duty <= 0;          Servo <= 0;
    end else begin
        if(cnt_duty >= 1999) begin
            cnt_duty <= 0;
        end else begin
            cnt_duty <= cnt_duty + 1;
        end
        if(cnt_duty < internal_data) begin
            Servo <= 1;
        end else begin
            Servo <= 0;
        end
    end
end
// 상태 머신 로직
always @(posedge clk100000hz or posedge reset) begin
    if (reset) begin
        current_state <= S_0_DEG;         internal_data = DUTY_0_DEG;        delay_cnt = 0;
    end else begin
        case (current_state)
            S_0_DEG: begin
                internal_data <= DUTY_0_DEG;                delay_cnt <= 0;                current_state <= S_WAIT_45;
            end
            S_WAIT_45: begin
                if (delay_cnt >= 99999) begin
                    delay_cnt <= 0;                    current_state <= S_90_DEG;
                end else begin
                    delay_cnt <= delay_cnt + 1;
                end
            end
            S_90_DEG: begin
                internal_data <= DUTY_90_DEG;                delay_cnt <= 0;                current_state <= S_WAIT_90;
            end
            S_WAIT_90: begin
                if (delay_cnt >= 99999) begin
                    delay_cnt <= 0;                    current_state <= S_0_DEG;
                end else begin
                    delay_cnt <= delay_cnt + 1;
                end
            end
            default: begin
                current_state <= S_0_DEG;                internal_data <= DUTY_0_DEG;                delay_cnt <= 0;
            end
        endcase
    end
end
endmodule

module clockdivider_100000hz (
input clk,  input reset,  output reg clk100000hz  );
reg [25:0] cnt = 0;
always @(posedge clk, posedge reset) begin
    if (reset) cnt <= 0;
    else begin
        if (cnt == (500 - 1)) begin // 100MHz 입력 클록 가정 (100MHz / 100kHz = 1000 -> 1000/2 = 500)
            cnt <= 0;
            clk100000hz <= ~clk100000hz;
        end else cnt <= cnt + 1;
    end
end
endmodule
