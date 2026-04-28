`timescale 1ns / 1ps
module debounce_switch (
    input   i_clk,    input   i_switch,    output  o_switch);
    parameter PUSHED = 1;    parameter RELEASED = 0;    parameter FALSE = 0;    parameter TRUE = 1;
    parameter DEBOUNCE_LIMIT = 500_000; // 10ms for 100MHz clock
   reg [32:0] r_count = 0;
    reg r_prevState = RELEASED;
    reg retValue = FALSE;
    assign o_switch = retValue;
    always @(posedge i_clk ) begin
        if ( ((i_switch == PUSHED) && (r_prevState == RELEASED)) && (r_count < DEBOUNCE_LIMIT) ) begin
            r_count <= r_count+1;            retValue <= FALSE;        end
/*else if ( ((i_switch == PUSHED) && (r_prevState == RELEASED)) && (r_count == DEBOUNCE_LIMIT) ) begin
            r_count <= 0;  r_prevState <= PUSHED;      retValue <= FALSE;         end 
            
r_count <= r_count+1;            retValue <= FALSE;        end
        else if ( ((i_switch == RELEASED) && (r_prevState == PUSHED)) && (r_count == DEBOUNCE_LIMIT) ) begin
            r_count <= 0;   r_prevState <= RELEASED;   retValue<=TRUE;        end*/        
          else if ( ((i_switch == PUSHED) && (r_prevState == RELEASED)) && (r_count == DEBOUNCE_LIMIT) ) begin
            r_count <= 0;  r_prevState <= RELEASED;      retValue <= TRUE;         end   
        else begin
            r_count <= 0;   retValue <= FALSE;        end
    end
endmodule

module LedControl(
    input clk,    input reset,    input btn0,     input btn1,     input btn2, 
    input btn3,     output[3:0] led     );
    wire w_btn0;     wire w_btn1;     wire w_btn2;     wire w_btn3; 
    reg [3:0] r_led_state; // Register to hold the state of the LEDs
    debounce_switch debounce_btn0 ( .i_clk(clk),     .i_switch(btn0),    .o_switch(w_btn0)    );
    debounce_switch debounce_btn1 ( .i_clk(clk),    .i_switch(btn1),    .o_switch(w_btn1)    );
    debounce_switch debounce_btn2 ( .i_clk(clk),     .i_switch(btn2),   .o_switch(w_btn2)    );
    debounce_switch debounce_btn3 ( .i_clk(clk),    .i_switch(btn3),    .o_switch(w_btn3)    );
    assign led = r_led_state;
    always @(posedge clk or posedge reset) begin
        if (reset) begin            r_led_state <= 4'b0000; 
        end else begin
           if (w_btn0) begin                r_led_state[0] <= ~r_led_state[0];            end
            if (w_btn1) begin                r_led_state[1] <= ~r_led_state[1];            end
            if (w_btn2) begin                r_led_state[2] <= ~r_led_state[2];            end
            if (w_btn3) begin                r_led_state[3] <= ~r_led_state[3];            end    
               end    end    endmodule
