`timescale 1ns / 1ps


module TOP_UPdown(
    input i_clk,
    input i_reset,
    input [2:0] i_button,
    output o_LED_UP_down
    );

    wire [2:0] w_button;
    wire w_clk;
    wire [9:0] w_counter;
    wire [4:0] w_light;
    wire [2:0] w_lightState;

    clock_divider clock_divide (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_clk)
    );

    counter counter(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .o_counter(w_counter)
    );

    Comparator Compare(
    .i_counter(w_counter),
    .o_light_1(w_light[1]),
    .o_light_2(w_light[2]),
    .o_light_3(w_light[3]),
    .o_light_4(w_light[4])
    );

    ButtonController ButtonController0 (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[0]),
    .o_button(w_button[0])
    );


    ButtonController ButtonController1 (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[1]),
    .o_button(w_button[1])
    );

    

    ButtonController ButtonController2 (
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(i_button[2]),
    .o_button(w_button[2])
    );

    FSM_LED_UpDown FSM_LED_UpDown0(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .i_button(w_button),
    .o_lightState(w_lightState)
    );
    

    Mux Mux(
    .i_x(w_light),
    .i_select(w_lightState),
    .o_y(o_LED_UP_down) 
    );
    


    
endmodule
