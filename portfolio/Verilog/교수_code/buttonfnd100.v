`timescale 1ns / 1ps
module counter_00_99_fnd (
    input clk,      input rst ,   input btnU,       input btnD,
    output reg [6:0] fnd,       output reg [3:0] an   );
reg [1:0] syncU, syncD;
reg [19:0] cntU, cntD;
reg debU, debD;
reg prevU, prevD;
parameter DEBOUNCE = 1_000_000;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        syncU <= 0; syncD <= 0;
    end else begin
        syncU <= {syncU[0], btnU};
        syncD <= {syncD[0], btnD};
    end
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cntU <= 0; debU <= 0;
        cntD <= 0; debD <= 0;
    end else begin
        if (syncU[1] != debU) begin
            if (cntU < DEBOUNCE) cntU <= cntU + 1;
            else begin debU <= syncU[1]; cntU <= 0; end
        end else cntU <= 0;

        if (syncD[1] != debD) begin
            if (cntD < DEBOUNCE) cntD <= cntD + 1;
            else begin debD <= syncD[1]; cntD <= 0; end
        end else cntD <= 0;
    end
end
always @(posedge clk or posedge rst) begin
    if (rst) begin
        prevU <= 0;
        prevD <= 0;
    end else begin
        prevU <= debU;
        prevD <= debD;
    end
end
wire pulseU = (~prevU) & debU;
wire pulseD = (~prevD) & debD;

localparam STOP = 2'b00;
localparam UP   = 2'b01;
localparam DOWN = 2'b10;
reg [1:0] mode;
always @(posedge clk or posedge rst) begin
    if (rst)
        mode <= STOP;
    else begin
        if (pulseU)
            mode <= UP;
        else if (pulseD)
            mode <= DOWN;
    end
end
//==================================================
// 3. 1초 타이머
//==================================================
parameter ONE_SEC = 100_000_000;
reg [26:0] sec_cnt;
reg tick;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        sec_cnt <= 0;
        tick <= 0;
    end else begin
        if (sec_cnt < ONE_SEC-1) begin
            sec_cnt <= sec_cnt + 1;
            tick <= 0;
        end else begin
            sec_cnt <= 0;
            tick <= 1;
        end
    end
end
reg [6:0] value; // 0~99
always @(posedge clk or posedge rst) begin
    if (rst)
        value <= 0;
    else if (tick) begin
        case (mode)
            UP: begin
                if (value == 99)
                    value <= 0;
                else
                    value <= value + 1;
            end

            DOWN: begin
                if (value == 0)
                    value <= 99;
                else
                    value <= value - 1;
            end

            default: value <= value;
        endcase
    end
end

wire [3:0] tens  = value / 10;
wire [3:0] ones  = value % 10;

//==================================================
// 6. 7-seg 디코더 함수
//==================================================
function [6:0] seg_decode;
    input [3:0] num;
    begin
        case (num)
            0: seg_decode = 7'b1000000;
            1: seg_decode = 7'b1111001;
            2: seg_decode = 7'b0100100;
            3: seg_decode = 7'b0110000;
            4: seg_decode = 7'b0011001;
            5: seg_decode = 7'b0010010;
            6: seg_decode = 7'b0000010;
            7: seg_decode = 7'b1111000;
            8: seg_decode = 7'b0000000;
            9: seg_decode = 7'b0010000;
            default: seg_decode = 7'b1111111;
        endcase
    end
endfunction
// 7. 자리 스캔 (멀티플렉싱)
reg [15:0] scan_cnt;
reg scan_sel;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        scan_cnt <= 0;
        scan_sel <= 0;
    end else begin
        scan_cnt <= scan_cnt + 1;
        scan_sel <= scan_cnt[15]; // 약 1kHz
    end
end

always @(*) begin
    case (scan_sel)
        0: begin
            an  = 4'b1110;           // 1의 자리
            fnd = seg_decode(ones);
        end
        1: begin
            an  = 4'b1101;           // 10의 자리
            fnd = seg_decode(tens);
        end
    endcase
end

endmodule