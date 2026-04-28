`timescale 1ns / 1ps

module debounce(
    input clk, reset, sw,
    output reg pulse
    );
    reg [1:0] sync;
    reg [19:0] cnt;
    reg debounced, prev;
    
    always @(posedge clk) begin
        sync <= {sync[0], sw};
    end
    // Debouncing
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            cnt <= 0;
            debounced <= 0;
        end
        else begin
            if(sync[1] != debounced) begin
                if(cnt == 1_000_000) begin  // ¾à 10ms (100MHz)
                    debounced <= sync[1];
                    cnt <= 0;
                end
                else    cnt <= cnt + 1;
            end
            else    cnt <= 0;
        end
    end
    // »ó½Â¿§Áö -> 1ÆÞ½º »ý¼º
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            prev <= 0;
            pulse <= 0;
        end
        else begin
            pulse <= (debounced & ~prev);
            prev <= debounced;
        end
    end
endmodule