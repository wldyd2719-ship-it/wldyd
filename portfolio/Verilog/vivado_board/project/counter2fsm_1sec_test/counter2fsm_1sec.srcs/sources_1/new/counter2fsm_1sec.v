`timescale 1ns / 1ps

module counter2fsm_1sec(
    input clk, rstn,
    output reg [1:0] cnt,
    output y
    );
    
    reg [26:0] div_cnt;
    reg tick_1sec;
    
    always @(posedge clk or posedge rstn) begin
        if(rstn) begin
            div_cnt <=27'd0;
            tick_1sec <= 1'b0;
        end
        else if(div_cnt == 100_000_000 - 1) begin
            div_cnt <=27'd0;
            tick_1sec <= 1'b1;
        end
        else begin
            div_cnt <= div_cnt + 1;
            tick_1sec <= 1'b0;
        end
    end
    
    reg [1:0] next_cnt;    
    
    always @(posedge clk or posedge rstn) begin
        if(rstn)            cnt <= 2'b00;
        else if(tick_1sec)  cnt <= next_cnt;
    end
    
    always @(*) begin
        if(cnt != 2'b11)    next_cnt = cnt + 1;
        else                next_cnt = 2'b00;
    end
    
    assign y = (cnt == 2'b11);
    
endmodule