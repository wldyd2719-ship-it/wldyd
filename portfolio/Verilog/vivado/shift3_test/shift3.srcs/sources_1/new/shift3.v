`timescale 1ns / 1ps

module shift3(
    input clk,
    input rst,  // 비동기 리셋
    input din,  // 입력 데이터
    output reg [2:0] q
    );
    
    always @(posedge clk, posedge rst)begin
        if(rst)
            q <= 3'b000;
        else
            q <= {q[1:0], din};  // shift
    end
    
endmodule
