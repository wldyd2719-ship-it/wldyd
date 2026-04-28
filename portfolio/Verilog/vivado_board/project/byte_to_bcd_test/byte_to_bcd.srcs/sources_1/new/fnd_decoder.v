`timescale 1ns / 1ps

module fnd_decoder(
    input [3:0] bcd,
    output reg [6:0] seg
    );
    
    always @(*) begin
        case(bcd)
            4'd0 : seg = 7'b100_0000;  // 7'b(gfe_dcba) & common anode type
            4'd1 : seg = 7'b111_1001;
            4'd2 : seg = 7'b010_0100;
            4'd3 : seg = 7'b011_0000;
            4'd4 : seg = 7'b001_1001;
            4'd5 : seg = 7'b001_0010;
            4'd6 : seg = 7'b000_0010;
            4'd7 : seg = 7'b111_1000;
            4'd8 : seg = 7'b000_0000;
            4'd9 : seg = 7'b001_0000;
            // 16bit
//            4'd10 : seg = 7'b000_1000;
//            4'd11 : seg = 7'b000_0011;
//            4'd12 : seg = 7'b100_0110;
//            4'd13 : seg = 7'b010_0001;
//            4'd14 : seg = 7'b000_0110;
//            4'd15 : seg = 7'b000_1110;
            // end
            default : seg = 7'b111_1111;
        endcase
    end
    
endmodule