module onecounter(
    input clk,   input [7:0] d,    output reg [6:0] fnd,     
    output reg fndsel1,  output reg fndsel2,  output reg fndsel3,  output reg fndsel4);
    reg [3:0] onecount;     integer i;  
    parameter CLK_DIV_BITS = 29; 
    reg [CLK_DIV_BITS-1:0] clk_divider_reg=0;    reg [1:0] display_select; 
   always @(d) begin
        onecount = 0;
        for (i = 0; i < 8; i = i + 1) begin
            if (d[i]) begin   onecount = onecount + 1;  end      end        end
     always @(posedge clk) begin
        clk_divider_reg <= clk_divider_reg + 1;
        if (clk_divider_reg == (2**CLK_DIV_BITS-1)) begin
            clk_divider_reg <= 0;
            display_select <= display_select + 1;     end    end
  always @(posedge clk) begin  
    fndsel1 = 1'b1;  fndsel2 = 1'b1;
     fndsel3 = 1'b1;  fndsel4 = 1'b1;
     
         case (display_select)
            2'b00: fndsel1 <= 1'b0;        2'b01: fndsel2 <= 1'b0; 
            2'b10: fndsel3 <= 1'b0;        2'b11: fndsel4 <= 1'b0; 
        endcase
    end 
    always @(onecount) begin
        case (onecount)
            0 : fnd = 7'b1000000; // 0  
            1 : fnd = 7'b1111001; // 1
            2 : fnd = 7'b0100100; // 2
            3 : fnd = 7'b0110000; // 3
            4 : fnd = 7'b0011001; // 4
            5 : fnd = 7'b0010010; // 5
            6 : fnd = 7'b0000010; // 6
            7 : fnd = 7'b1111000; // 7
            8 : fnd = 7'b0000000; // 8
            default : fnd = 7'b0110010; // Error / E (for values > 8)
        endcase
    end
 

endmodule