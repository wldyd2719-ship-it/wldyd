`timescale 1ns / 1ps

module clock_divider(
    input wire clk_100mHz,
    input wire reset,
    output reg clk_1Hz
    );
    
        reg [4:0] counter;
        localparam COUNT_MAX = 10- 1;
        
        always @(posedge clk_100mHz or posedge reset) begin
            if(reset) begin
                counter <= 0;
                clk_1Hz <= 1'b0;
            end
            else begin
                if(counter == COUNT_MAX) begin
                    counter <= 0;
                    clk_1Hz <= ~clk_1Hz;
                end
                else begin
                    counter <= counter + 1;
                end
            end       
        end
endmodule
