`timescale 1ns / 1ps

module decoder3_8assign_test(
    input [2:0] x,
    input en,
    output [7:0] d
    );
    
    assign d = (en) ? 1'b1 << x : 8'h00;

endmodule
