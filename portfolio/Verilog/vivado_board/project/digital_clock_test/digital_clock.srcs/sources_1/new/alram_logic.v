`timescale 1ns / 1ps

module alram_logic(
    input reset, clk_1000Hz, sw2, sw3,
    input [1:0] mode,
    input [2:0] set_pos,
    input [5:0] clk_min,
    input [4:0] clk_hour,
    output [5:0] sec_out, min_out,
    output [4:0] hour_out,
    output reg [2:0] alarm_out, alarm_on
    );
    
    reg alarm = 1'b0;
    reg [4:0] hour = 5'b00_000;
    reg [5:0] min, sec = 6'b000_000;
    
    always @(posedge sw3 or posedge reset) begin
        if(reset) begin
            alarm <= 1'b0;
            alarm_on <= 3'b000;
        end
        else
            case(alarm)
                1'b0 : begin
                    alarm <= 1'b1;
                    alarm_on <= 3'b111;
                end
                1'b1 : begin
                    alarm <= 1'b0;
                    alarm_on <= 3'b000;
                end                
            endcase
    end
    
    always @(posedge sw2 or posedge reset) begin
        if(reset)
            sec <= 6'd0;
        else begin
            if((mode == 2'b11) && (set_pos == 3'b001))
                if(sec >= 6'd59)
                    sec <= 6'd0;
                else
                    sec <= sec + 1'b1;
        end
    end
    
    always @(posedge sw2 or posedge reset) begin
        if(reset)
            min <= 6'd0;
        else begin
            if((mode == 2'b11) && (set_pos == 3'b010))
                if(min >= 6'd59)
                    min <= 6'd0;
                else
                    min <= min + 1'b1;
        end
    end
    
    always @(posedge sw2 or posedge reset) begin
        if(reset)
            hour <= 5'd0;
        else begin
            if((mode == 2'b11) && (set_pos == 3'b100))
                if(hour >= 5'd23)
                    hour <= 5'd0;
                else
                    hour <= hour + 1'b1;
        end
    end
    
    assign sec_out = sec;
    assign min_out = min;
    assign hour_out = hour;
    
    always @(posedge clk_1000Hz) begin
        if((hour == clk_hour) && (min == clk_min) && (mode != 2'b11) && (alarm == 1'b1))
            alarm_out <= 3'b111;
        else
            alarm_out <= 3'b000;
    end
    
endmodule