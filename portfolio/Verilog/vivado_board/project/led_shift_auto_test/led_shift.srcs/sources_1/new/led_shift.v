`timescale 1ns / 1ps

module led_shift(
    input clk, reset, btnL, btnR,
    output reg [7:0] led
    );
    // 1. 동기화
    reg [1:0] syncL, syncR;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            syncL <= 0;
            syncR <= 0;
        end
        else begin
            syncL <= {syncL[0], btnL};
            syncR <= {syncR[0], btnR};
        end
    end
    // 2. 디바운싱
    parameter DEBOUNCE = 1_000_000;
    reg [19:0] cntL, cntR;
    reg debL, debR;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            cntL <= 0;  debL <= 0;
            cntR <= 0;  debR <= 0;
        end
        else begin
            // LEFT
            if(syncL[1] != debL) begin
                if(cntL < DEBOUNCE)
                    cntL <= cntL +1;
                else begin
                    debL <= syncL[1];
                    cntL <= 0;
                end
            end
            else
                cntL <= 0;
            // RIGHT    
            if(syncR[1] != debR) begin
                if(cntR < DEBOUNCE)
                    cntR <= cntR +1;
                else begin
                    debR <= syncR[1];
                    cntR <= 0;
                end
            end
            else
                cntR <= 0;                
        end
    end
    // 3. 1sec timer 생성 (100MHz 기준)
    parameter ONE_SEC = 100_000_000;
    reg [26:0] sec_cnt;
    reg tick_1s;
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            sec_cnt <= 0;
            tick_1s <= 0;
        end
        else begin
            if(sec_cnt < ONE_SEC - 1) begin
                sec_cnt <= sec_cnt +1;
                tick_1s <= 0;
            end
            else begin
                sec_cnt <= 0;
                tick_1s <= 1;
            end
        end
    end
    // 4. LED SHIFT 제어
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            led <= 8'b0000_0001;
        end
        else begin
            if(tick_1s) begin
                if(debL)
                    led <= {led[6:0], led[7]};
                else if(debR)
                    led <= {led[0], led[7:1]};
            end
        end
    end

endmodule