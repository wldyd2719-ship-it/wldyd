`timescale 1ns / 1ps

module function_2(
    input [2:0] x, y, z, w,
    input e,
    output f,
    output [2:0] g
    );
    
    function  [3:0] myfunction; // bit 수 고려 (ex) [2:0] myfunction일 때 myfunction = 8 (0b1000) => f = 0
        input [2:0] a, b, c, d;
        begin
            myfunction = (a+b) + (c-d);
        end
    endfunction
    
    function [2:0] myfunction1;
    input [2:0] a, b, c, d;
    begin
        myfunction1 = ((a+b) - (c-d));
    end
    endfunction
    
    assign f = myfunction (x, y, z, w) ? e : 0;
    assign g = myfunction1(x, y, z, w);
    
endmodule
