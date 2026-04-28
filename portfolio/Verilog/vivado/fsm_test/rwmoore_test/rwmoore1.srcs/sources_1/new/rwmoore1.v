`timescale 1ns / 1ps

module rwmoore1(
    input clk, rstn, go, ws,
    output rd, ds,
    output reg [1:0] state,
    output reg [1:0] next_state
    );
    
    parameter idle = 2'b00, read = 2'b01, dly = 2'b10, done = 2'b11;
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn)   state <= idle;
        else        state <= next_state;    
    end
    
    always @(state or go or ws) begin
        case(state)
            idle : begin
                if(go)    next_state = read;
                else      next_state = idle;
            end
            
            read : next_state = dly;
            
            dly : begin
                if(ws)  next_state = read;
                else    next_state = done;
            end
            
            done : next_state = idle;
            
        endcase
    end
    
    assign rd = ((state == read) || (state == dly));
    assign ds = (state == done);
    
endmodule
