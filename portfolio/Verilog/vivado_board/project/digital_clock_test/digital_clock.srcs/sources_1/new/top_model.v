`timescale 1ns / 1ps

module top_model(
    input clk, reset, time_mode, sw0, sw1, sw2, sw3,
    output [1:0] mode_out,
    output [2:0] set_pos_out, alarm_out, alarm_on,
    output [3:0] fnd_sel,
    output [6:0] fnd
    );
   
   wire w_clkout, w_clk_out;
   wire [1:0] out_counter;
   wire [3:0] fnd_in;
   wire [4:0] hour_out;
   wire [5:0] min_out, sec_out;
   wire [3:0] hour10, hour0, min10, min0, sec10, sec0;
   wire [6:0] w_t_mmsec_out;
   wire [5:0] w_t_sec_out, w_t_min_out;
   wire [4:0] w_a_hour_out;
   wire [5:0] w_a_sec_out, w_a_min_out;
   
   clock_divider_paramN #(.N(100_000_000)) u_clk1(.clk(clk), .reset(reset), .clk_out(w_clk_out));   // 1s
   clock_divider_paramN #(.N(1_000_000)) u_clk2(.clk(clk), .reset(reset), .clk_out(w_clkout10));    // 0.01s
   clock_divider_paramN #(.N(100_000)) u_clk3(.clk(clk), .reset(reset), .clk_out(w_clkout));        // 0.001s
   
   master_select u0(.clk(clk), .reset(reset), .sw0(sw0), .sw1(sw1), .mode_out(mode_out), .set_pos_out(set_pos_out));
   digital_clock u1(.clk(clk), .reset(reset), .clk_1Hz(w_clk_out), .mode(mode_out), .sw2(sw2), .set_pos(set_pos_out), .sec_out(sec_out), .min_out(min_out), .hour_out(hour_out));
   fnd_display   u2(.mode(mode_out), .sec_in(sec_out), .min_in(min_out), .hour_in(hour_out), .hour10(hour10), .hour0(hour0), .min10(min10), .min0(min0), .sec10(sec10), .sec0(sec0),
                    .ti_mmsec(w_t_mmsec_out), .ti_sec(w_t_sec_out), .ti_min(w_t_min_out), .al_hour(w_a_hour_out), .al_min(w_a_min_out), .al_sec(w_a_sec_out));
                  
   counter u3(.inclk(w_clkout), .reset(reset), .out_counter(out_counter));
   data_mux u4(.time_mode(time_mode), .in_a(sec0), .in_b(sec10), .in_c(min0), .in_d(min10), .in_e(hour0), .in_f(hour10), .in_sel(out_counter), .out_y(fnd_in));
   mux4X1_decoder u5(.sel_in(out_counter), .fnd_sel(fnd_sel));
   FNDdecoder u6(.fnd_in(fnd_in), .fnd(fnd));   
   timer u7(.clk(clk), .reset(reset), .clk_1000Hz(w_clkout10), .sw1(sw1), .sw2(sw2), .mode(mode_out), .mmsec_out(w_t_mmsec_out), .sec_out(w_t_sec_out), .min_out(w_t_min_out));
   alram_logic u8(.reset(reset), .clk_1000Hz(w_clkout), .sw2(sw2), .sw3(sw3), .mode(mode_out), .set_pos(set_pos_out), .clk_min(min_out), .clk_hour(hour_out), .sec_out(w_a_sec_out),
                  .min_out(w_a_min_out), .hour_out(w_a_hour_out), .alarm_out(alarm_out), .alarm_on(alarm_on));
     
endmodule