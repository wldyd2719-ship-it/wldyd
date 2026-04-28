`timescale 1ns / 1ps

module byte_bcd(
    input [7:0] d,
    output [11:0] a
    );

    reg [3:0] hundreds, tens, ones;
    reg [6:0] temp_reg;
    
    always @(*) begin
        hundreds = d / 100;     temp_reg = d % 100;
        tens = temp_reg / 10;   ones = temp_reg %10;
    end
    
    assign a = {hundreds, tens, ones};

endmodule