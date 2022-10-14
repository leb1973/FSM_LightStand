`timescale 1ns / 1ps



module FSM_LED_UpDown(
    input i_clk,
    input i_reset,
    input  [2:0] i_button,
    output [2:0] o_lightState
    );

    parameter
        S_LS_000 = 3'b000,
        S_LS_001 = 3'b001,
        S_LS_010 = 3'b010,
        S_LS_011 = 3'b011,
        S_LS_100 = 3'b100;

    reg [2:0] curState, nextState;
    reg [2:0] r_lightState ; 
    assign o_lightState = r_lightState;

    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset) curState <= S_LS_000;
        else        curState <= nextState;

    end

    always @(curState or i_button) begin
        case(curState)
            S_LS_000 : begin 
                if      (i_button[0]) nextState <= S_LS_000;
                else if (i_button[1]) nextState <= S_LS_001;
                else if (i_button[2]) nextState <= S_LS_000;
                else nextState <= S_LS_000;
            end
            S_LS_001 : begin
                if      (i_button[0]) nextState <= S_LS_000;
                else if (i_button[1]) nextState <= S_LS_010;
                else if (i_button[2]) nextState <= S_LS_000;
                else nextState <= S_LS_001;
            end
            S_LS_010 : begin
                if      (i_button[0]) nextState <= S_LS_000;
                else if (i_button[1]) nextState <= S_LS_011;
                else if (i_button[2]) nextState <= S_LS_001;
                else nextState <= S_LS_010;
            end
            S_LS_011 : begin
                if      (i_button[0]) nextState <= S_LS_000;
                else if (i_button[1]) nextState <= S_LS_100;
                else if (i_button[2]) nextState <= S_LS_010;
                else nextState <= S_LS_011;
            end
            S_LS_100 : begin
                if      (i_button[0]) nextState <= S_LS_000;
                else if (i_button[1]) nextState <= S_LS_100;
                else if (i_button[2]) nextState <= S_LS_011;
                else nextState <= S_LS_100;
            end

            default : nextState <= S_LS_000;
        endcase
    end

    always @(curState) begin
        
        case (curState)
            S_LS_000 : r_lightState <= 3'b000;
            S_LS_001 : r_lightState <= 3'b001;
            S_LS_010 : r_lightState <= 3'b010;
            S_LS_011 : r_lightState <= 3'b011;
            S_LS_100 : r_lightState <= 3'b100;
            default  : r_lightState <= 3'b000;
        endcase
    end
endmodule
