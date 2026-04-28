`timescale 1ns / 1ps

module digital_clock(
    input clk, reset, clk_1Hz, sw2,
    input [1:0] mode,
    input [2:0] set_pos,
    
    output [5:0] sec_out, min_out,
    output [4:0] hour_out
    );
    parameter DEBOUNCE = 1_000_000;
    
    reg [1:0] sync;
    reg [19:0] cnt;
    reg deb, prev;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            sync <= 0;  cnt <= 0;   deb <= 0;
        end
        else begin
            sync <= {sync[0], sw2};
            
            if(sync[1] != deb) begin
                if(cnt < DEBOUNCE)
                    cnt <= cnt +1;
                else begin
                    deb <= sync [1];
                    cnt <= 0;
                end                
            end
            else
                cnt <= 0;            
        end
    end
    
    always @(posedge clk or posedge reset) begin
        if(reset)
            prev <= 0;
        else
            prev <= deb;
    end
    
    wire sw2_pulse = deb & ~prev;
    
    wire tick_sec = clk_1Hz;
    wire tick_set = sw2_pulse;
    
    wire enable = (mode == 2'b01) ? tick_set : tick_sec;
    
    reg [5:0] sec, min;
    reg [4:0] hour;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            sec <= 0;   min <= 0;   hour <= 0;
        end
        else if(enable) begin
            if(mode == 2'b01) begin
                case(set_pos)
                    3'b001 : begin
                        if(sec == 59)   sec <= 0;
                        else            sec <= sec +1;
                    end
                    3'b010 : begin
                        if(min == 59)   min <= 0;
                        else            min <= min +1;
                    end
                    3'b100 : begin
                        if(hour == 23)   hour <= 0;
                        else             hour <= hour +1;
                    end
                endcase
            end
            else begin
                if(sec == 59) begin
                    sec <= 0;
                    
                    if(min == 59) begin
                        min <= 0;
                        
                        if(hour == 23)
                            hour <= 0;
                        else
                            hour <= hour +1;
                    end
                    else
                        min <= min +1;
                end
                else
                    sec <= sec +1;
            end
        end        
    end
    
    assign sec_out = sec;
    assign min_out = min;
    assign hour_out = hour;   

endmodule