`timescale 1ns / 1ps

module decoder3_8case(
    input [2:0] x,
    input en,
    output [7:0] d1
    );
    
    reg [7:0] d1;
    
    always @(en, x)begin
    d1 = 8'h00; // en = 0일 때 d1 = unknown & latch를 발생 --> d1 = 8'h00; or default : d1 = 8'h00; 사용
    if(en) begin
        case(x)
            3'h0 : d1 = 8'h01;
            3'h1 : d1 = 8'h02;
            3'h2 : d1 = 8'h04;
            3'h3 : d1 = 8'h08;
            3'h4 : d1 = 8'h10;
            3'h5 : d1 = 8'h20;
            3'h6 : d1 = 8'h40;
            //3'h7 : d1 = 8'h80;
            //default : d1 = 8'h00;
        endcase
    end
    end
    
endmodule
