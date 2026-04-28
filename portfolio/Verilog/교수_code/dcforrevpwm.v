module top_dc_motor_l298 (
    input clk,          input rst,       input sw_en,          input sw_dir,     
    input [7:0] sw_pwm,     output ENA,            output reg IN1,       output reg IN2          );
// PWM 积己 (20kHz)
wire pwm_sig;
pwm_generator #(    .CLK_FREQ(100_000_000),    .PWM_FREQ(20_000)) u_pwm (
    .clk(clk),    .rst(rst),    .duty(sw_pwm),    .pwm_out(pwm_sig)  );
// Enable + PWM 搬钦
assign ENA = (sw_en) ? pwm_sig : 1'b0;
always @(*) begin
    if (!sw_en) begin
        IN1 = 0;          IN2 = 0;
    end else begin
        if (sw_dir == 0) begin
            IN1 = 1;        IN2 = 0;
        end else begin
            IN1 = 0;              IN2 = 1;
        end         end     end
endmodule
// PWM 积己扁
module pwm_generator #(
    parameter CLK_FREQ = 100_000_000,    parameter PWM_FREQ = 20_000  )(
    input clk,    input rst,      input [7:0] duty,       output reg pwm_out    );
localparam PERIOD = CLK_FREQ / PWM_FREQ; // 100MHz / 20kHz = 5000
reg [15:0] cnt;  reg [15:0] duty_scaled;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        cnt <= 0;        pwm_out <= 0;
    end else begin
        if (cnt >= PERIOD - 1)
            cnt <= 0;
        else
            cnt <= cnt + 1;
        // duty scaling (0~255 ℃ 0~PERIOD)
        duty_scaled <= (duty * PERIOD) >> 8;
        if (cnt < duty_scaled)
            pwm_out <= 1;
        else
            pwm_out <= 0;
    end
end
endmodule