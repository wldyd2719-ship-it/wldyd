module stepmotor(
    input clk, input rst,  input start_op,    output [3:0]stepmotor);
reg [3:0] motor_data ;   reg [29:0] clk_div_cnt;  reg clk_1hz;         
reg [1:0] cnt_step;    // 스테핑 시퀀스 카운터
reg [11:0] step_count;  // 현재까지 진행된 스텝 수 카운터
reg [11:0] target_steps; // 목표 스텝 수
reg [1:0] state;       // FSM (Finite State Machine) 상태 레지스터
localparam IDLE         = 2'b00; // 대기 상태
localparam ROTATE_90_CW = 2'b01; // 90도 정회전 상태
localparam ROTATE_180_CCW = 2'b10; // 180도 역회전 상태
localparam STOP         = 2'b11; // 정지 상태
localparam STEPS_90_DEGREE  =12'd512;  // 90도 회전 시 필요한 스텝 수
localparam STEPS_180_DEGREE =12'd1024; // 180도 회전 시 필요한 스텝 수
always @(posedge clk or posedge rst) begin
    if (rst) begin
        clk_div_cnt <= 25'd0;        clk_1hz <= 1'b0;
    end else begin
        if (clk_div_cnt == 30'd500_000) begin
            clk_div_cnt <= 30'd0;            clk_1hz <= ~clk_1hz;
        end else begin
            clk_div_cnt <= clk_div_cnt + 1;
        end      end    end
always @(posedge clk_1hz or posedge rst) begin
    if (rst) begin
        cnt_step <= 2'b00;        motor_data <= 4'b0000;        step_count <= 12'd0;
        target_steps <= 12'd0;        state <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                motor_data <= 4'b0000;
                step_count <= 12'd0;    // 스텝 카운터 초기화
                if (start_op) begin // start_op 신호가 들어오면 90도 정회전 시작
                    target_steps <= STEPS_90_DEGREE;  state <= ROTATE_90_CW;      end        end
            ROTATE_90_CW: begin
                if (step_count < target_steps) begin
                      case (cnt_step)
                        2'b00: motor_data <= 4'b0001;   2'b01: motor_data <= 4'b0010; 
                        2'b10: motor_data <= 4'b0100;  2'b11: motor_data <= 4'b1000; 
                        default: motor_data <= 4'b0000;              endcase
                    cnt_step <= cnt_step + 1;     step_count <= step_count + 1;
                end else begin
                    motor_data <= 4'b0000;       step_count <= 12'd0;    
                    target_steps <= STEPS_180_DEGREE; state <= ROTATE_180_CCW;    end       end
            ROTATE_180_CCW: begin
                if (step_count < target_steps) begin
                      case (cnt_step)
                        2'b00: motor_data <= 4'b1000;               2'b01: motor_data <= 4'b0100; 
                        2'b10: motor_data <= 4'b0010;               2'b11: motor_data <= 4'b0001; 
                        default: motor_data <= 4'b0000;            endcase
                    cnt_step <= cnt_step + 1;        step_count <= step_count + 1;
                end else begin
                    motor_data <= 4'b0000;   step_count <= 12'd0;    state <= STOP;   end   end
            STOP: begin
                motor_data <= 4'b0000;                 state <= IDLE;             end
         endcase    end   end    assign stepmotor = motor_data;
endmodule

/*module stepmotor(
    input clk,    input rst,    input start_op,    output [3:0] stepmotor  );
reg [3:0] motor_data;  reg [29:0] clk_div_cnt;  reg clk_step;              // 스텝 클럭 (속도 제어)
reg [1:0] cnt_step;        // 시퀀스
reg [12:0] step_count;     // 현재 스텝
reg [12:0] target_steps;   // 목표 스텝
reg state;
localparam IDLE   = 1'b0;
localparam ROTATE = 1'b1;
// 360도 기준 (모터에 따라 조정 필요)
localparam STEPS_360 = 13'd2048;
localparam TOTAL_STEPS = STEPS_360 * 3; // 3바퀴
// 클럭 분주 (속도 조절)
always @(posedge clk or posedge rst) begin
    if (rst) begin
        clk_div_cnt <= 0;        clk_step <= 0;
    end else begin
        if (clk_div_cnt == 50_000) begin // 속도 조절 (빠르면 값 증가)
            clk_div_cnt <= 0;            clk_step <= ~clk_step;
        end else begin
            clk_div_cnt <= clk_div_cnt + 1;
        end
    end
end
// FSM + 스텝 제어
always @(posedge clk_step or posedge rst) begin
    if (rst) begin
        state <= IDLE;        cnt_step <= 0;        step_count <= 0;        motor_data <= 4'b0000;
    end else begin
        case (state)
            IDLE: begin
                motor_data <= 4'b0000;           step_count <= 0;
                if (start_op) begin
                    target_steps <= TOTAL_STEPS;          state <= ROTATE;
                end
            end
            ROTATE: begin
                if (step_count < target_steps) begin
                    // 정회전 시퀀스
                    case (cnt_step)
                        2'b00: motor_data <= 4'b0001;       2'b01: motor_data <= 4'b0010;
                        2'b10: motor_data <= 4'b0100;      2'b11: motor_data <= 4'b1000;
                    endcase
                    cnt_step <= cnt_step + 1;
                    step_count <= step_count + 1;
                end else begin
                    motor_data <= 4'b0000;       state <= IDLE; // 완료 후 대기
                end
            end
        endcase
    end
end
assign stepmotor = motor_data;
endmodule*/


/*module stepmotor(
    input clk,    input rst,    input start_op,    output [3:0] stepmotor   );
reg [3:0] motor_data;   reg [29:0] clk_div_cnt;   reg clk_step;
reg [1:0] cnt_step;   reg [12:0] step_count;  reg [12:0] target_steps;   reg [1:0] state;
localparam IDLE       = 2'd0;  localparam CW_ROTATE  = 2'd1;   localparam CCW_ROTATE = 2'd2;  localparam STOP       = 2'd3;
// 스텝 정의
localparam STEPS_360 = 13'd2048;
localparam CW_TOTAL  = STEPS_360 * 3; // 3바퀴
localparam CCW_TOTAL = STEPS_360;     // 1바퀴
// 클럭 분주 (속도)
always @(posedge clk or posedge rst) begin
    if (rst) begin
        clk_div_cnt <= 0;        clk_step <= 0;
    end else begin
        if (clk_div_cnt == 50_000) begin
            clk_div_cnt <= 0;            clk_step <= ~clk_step;
        end else begin
            clk_div_cnt <= clk_div_cnt + 1;
        end
    end
end
// FSM
always @(posedge clk_step or posedge rst) begin
    if (rst) begin
        state <= IDLE;        cnt_step <= 0;        step_count <= 0;        motor_data <= 4'b0000;
    end else begin
        case (state)
            IDLE: begin
                motor_data <= 4'b0000;               step_count <= 0;
                if (start_op) begin
                    target_steps <= CW_TOTAL;        state <= CW_ROTATE;
                end
            end
            // 정회전 3바퀴
             CW_ROTATE: begin
                if (step_count < target_steps) begin
                    case (cnt_step)
                        2'b00: motor_data <= 4'b0001;                        2'b01: motor_data <= 4'b0010;
                        2'b10: motor_data <= 4'b0100;                        2'b11: motor_data <= 4'b1000;
                    endcase
                    cnt_step <= cnt_step + 1;
                    step_count <= step_count + 1;
                end else begin
                    step_count <= 0;
                    target_steps <= CCW_TOTAL;
                    state <= CCW_ROTATE;
                end
            end
            // 역회전 1바퀴
            CCW_ROTATE: begin
                if (step_count < target_steps) begin
                    case (cnt_step)
                        2'b00: motor_data <= 4'b1000;              2'b01: motor_data <= 4'b0100;
                        2'b10: motor_data <= 4'b0010;             2'b11: motor_data <= 4'b0001;
                    endcase
                    cnt_step <= cnt_step + 1;
                    step_count <= step_count + 1;
                end else begin
                    motor_data <= 4'b0000;
                    state <= STOP;
                end
            end
            STOP: begin
                motor_data <= 4'b0000;
                state <= IDLE; // 다시 시작 가능
            end
        endcase
    end
end
assign stepmotor = motor_data;
endmodule  */