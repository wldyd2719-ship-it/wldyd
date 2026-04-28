`timescale 1ns / 1ps

module fnd_display(
    input [1:0] mode,
    input [5:0] sec_in, min_in,
    input [4:0] hour_in,
    
    input [5:0] al_sec, al_min,
    input [4:0] al_hour,
    
    input [5:0] ti_sec, ti_min,
    input [6:0] ti_mmsec,
    
    output reg [3:0] hour10, hour0,
    output reg [3:0] min10, min0,
    output reg [3:0] sec10, sec0    
    );
    
    always @(*) begin
        hour10 = 0; hour0 = 0;
        min10 = 0;  min0 = 0;
        sec10 = 0;  sec0 = 0;
        
        case(mode)
            2'b00, 2'b01 : begin
                hour10 = hour_in / 10;  hour0 = hour_in % 10;
                min10 = min_in / 10;    min0 = min_in %10;
                sec10 = sec_in / 10;    sec0 = sec_in %10;
            end            
            2'b10 : begin
                hour10 = ti_min / 10;  hour0 = ti_min % 10;
                min10 = ti_sec / 10;    min0 = ti_sec %10;
                sec10 = ti_mmsec / 10;    sec0 = ti_mmsec %10;
            end
            2'b11 : begin
                hour10 = al_hour / 10;  hour0 = al_hour % 10;
                min10 = al_min / 10;    min0 = al_min %10;
                sec10 = al_sec / 10;    sec0 = al_sec %10;
            end       
        endcase
    end
    
endmodule