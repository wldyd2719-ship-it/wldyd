`timescale 1ns / 1ps

module function_2_tb();

    reg [2:0] x, y, z, w;
    reg e;
    wire f;
    wire [2:0] g;
    function_2 dut(.x(x), .y(y), .z(z), .w(w), .e(e), .f(f), .g(g));
    
    initial begin
        x = 3'b000; y = 3'b000; z = 3'b000; w = 3'b000; e = 1;
        #10 x = 3'b011; y = 3'b000; z = 3'b010; w = 3'b010;
        #10 x = 3'b010; y = 3'b000; z = 3'b010; w = 3'b001;
        #10 x = 3'b011; y = 3'b000; z = 3'b010; w = 3'b001;
        #10 x = 3'b011; y = 3'b000; z = 3'b110; w = 3'b001;
        #10 $finish;
    end
    
endmodule
