`timescale 1ns / 1ps

module serial_adder
#(parameter N =8)(
    input clk, reset, load,
    input [N-1:0] a, b,
    output [N-1:0] sum
    );
    
    wire [N-1:0] a_reg, b_in;
    wire sum_fa, cout;
    reg carry;
   
   paral_access_reg #(N) dut1(.clk(clk), .reset(reset), .load(load), .SI(sum_fa), .I(a), .Q(a_reg), .SO(a_reg[0]));
   paral_access_reg #(N) dut2(.clk(clk), .reset(reset), .load(load), .SI(1'b0), .I(b), .Q(b_in), .SO(b_in[0]));
   fa_reg dut3(.a(sum[0]), .b(b_in[0]), .cin(carry), .s(sum_fa), .cout(cout));
   
   always @(posedge clk, negedge  reset) begin
    if(~reset)  carry <= 0;
    else begin
        if(load)    carry <= 0;
        else        carry <= cout;
    end
   end
   
   assign sum = a_reg;
   
endmodule