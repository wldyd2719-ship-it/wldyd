`timescale 1ns / 1ps
module debounce_switch (
    input  i_clk,     input  i_rstn,     input  i_switch,      output o_switch  );
parameter PUSHED   = 1'b1;  parameter RELEASED = 1'b0; parameter DEBOUNCE_LIMIT = 500_000;
reg [18:0] r_count;
reg        r_prevState;
reg        r_output;
assign o_switch = r_output;

always @(posedge i_clk or negedge i_rstn) begin
    if (!i_rstn) begin
        r_count     <= 0;
        r_prevState <= RELEASED;
        r_output    <= 1'b0;
    end
    else begin
        r_output <= 1'b0;

        if (i_switch != r_prevState) begin
            if (r_count < DEBOUNCE_LIMIT)
                r_count <= r_count + 1;
            else begin
                r_prevState <= i_switch;
                r_count     <= 0;

                if (i_switch == RELEASED)
                    r_output <= 1'b1;
            end
        end
        else begin
            r_count <= 0;
        end
    end
end

endmodule
module LedControl(
    input clk,
    input reset,   // active high
    input btn0,
    input btn1,
    input btn2,
    input btn3,
    output [3:0] led
);

//---------------------------------
// reset 변환 (active low로 변환)
//---------------------------------
wire rstn;
assign rstn = ~reset;

//---------------------------------
// 버튼 동기화 (2FF sync) ?
//---------------------------------
reg btn0_sync1, btn0_sync2;
reg btn1_sync1, btn1_sync2;
reg btn2_sync1, btn2_sync2;
reg btn3_sync1, btn3_sync2;

always @(posedge clk) begin
    btn0_sync1 <= btn0;  btn0_sync2 <= btn0_sync1;
    btn1_sync1 <= btn1;  btn1_sync2 <= btn1_sync1;
    btn2_sync1 <= btn2;  btn2_sync2 <= btn2_sync1;
    btn3_sync1 <= btn3;  btn3_sync2 <= btn3_sync1;
end

//---------------------------------
// 디바운스 출력
//---------------------------------
wire w_btn0, w_btn1, w_btn2, w_btn3;

debounce_switch debounce_btn0 (
    .i_clk(clk),
    .i_rstn(rstn),
    .i_switch(btn0_sync2),
    .o_switch(w_btn0)
);

debounce_switch debounce_btn1 (
    .i_clk(clk),
    .i_rstn(rstn),
    .i_switch(btn1_sync2),
    .o_switch(w_btn1)
);

debounce_switch debounce_btn2 (
    .i_clk(clk),
    .i_rstn(rstn),
    .i_switch(btn2_sync2),
    .o_switch(w_btn2)
);

debounce_switch debounce_btn3 (
    .i_clk(clk),
    .i_rstn(rstn),
    .i_switch(btn3_sync2),
    .o_switch(w_btn3)
);

//---------------------------------
// LED 상태
//---------------------------------
reg [3:0] r_led_state;
assign led = r_led_state;

always @(posedge clk or posedge reset) begin
    if (reset)
        r_led_state <= 4'b0000;
    else begin
        if (w_btn0) r_led_state[0] <= ~r_led_state[0];
        if (w_btn1) r_led_state[1] <= ~r_led_state[1];
        if (w_btn2) r_led_state[2] <= ~r_led_state[2];
        if (w_btn3) r_led_state[3] <= ~r_led_state[3];
    end
end

endmodule
