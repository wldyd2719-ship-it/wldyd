`timescale 1ns / 1ps

module mux_behavior(
    input a, b,
	input A, B, C, D,
	output reg Q
    );
    
    always @(*) begin
		case({b, a})
			'b00 : Q = A;
			'b01 : Q = B;
			'b10 : Q = C;
			'b11 : Q = D;
			default : Q = 0;
		endcase
	end
    
endmodule
