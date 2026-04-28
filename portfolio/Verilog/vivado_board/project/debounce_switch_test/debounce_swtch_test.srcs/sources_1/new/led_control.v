`timescale 1ns / 1ps

module led_control(
    input clk,    input reset,    input btn0,     input btn1,     input btn2,   input btn3,
    output[3:0] led
    );
    
    wire w_btn0;     wire w_btn1;     wire w_btn2;     wire w_btn3; 
    reg [3:0] r_led_state; // Register to hold the state of the LEDs
    
    debounce_switch debounce_btn0 ( .i_clk(clk), .i_switch(btn0), .o_switch(w_btn0) );
    debounce_switch debounce_btn1 ( .i_clk(clk), .i_switch(btn1), .o_switch(w_btn1) );
    debounce_switch debounce_btn2 ( .i_clk(clk), .i_switch(btn2), .o_switch(w_btn2) );
    debounce_switch debounce_btn3 ( .i_clk(clk), .i_switch(btn3), .o_switch(w_btn3) );
    
    assign led = r_led_state;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_led_state <= 4'b0000; 
        end
        else begin
            if (w_btn0) begin
                r_led_state[0] <= ~r_led_state[0];
            end
            if (w_btn1) begin
                r_led_state[1] <= ~r_led_state[1];
            end
            if (w_btn2) begin
                r_led_state[2] <= ~r_led_state[2];
            end
            if (w_btn3) begin
                r_led_state[3] <= ~r_led_state[3];
            end    
    end
end
endmodule