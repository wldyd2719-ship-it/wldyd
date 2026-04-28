`timescale 1ns / 1ps

module sram_model_tb();

    parameter	DEPTH =8, WIDTH=16;
	parameter	DEPTH_LOG = $clog2(DEPTH);
	
	reg clk, cs, we;
	reg [DEPTH_LOG-1:0] ad;    reg [WIDTH-1:0] 	din;
	wire [WIDTH-1:0] dout;
	
	sram_model #(DEPTH, WIDTH) u_sram_8x32 (clk, cs, we, ad, din, dout);
	
	initial begin
                   clk   = 0;    	
        forever #5 clk = ~clk;   
	end
	
	initial begin
		cs <= 0; we <= 0;
		@(posedge clk);
            for(integer i=0;i<8;i=i+1) begin
                cs  <= 1;      we <= 1;   ad  <= i;
                din <= 'h10+i;  	
                @(posedge clk);			
            end
		cs <= 0; we <= 0;
		@(posedge clk);
            for(integer i=0;i<8;i=i+1) begin
                cs <= 1; 
                we <= 0;
                ad <= i;			
                @(posedge clk);		
            end
        repeat (3) @(posedge clk);
        $finish;
	end
endmodule