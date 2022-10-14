`timescale 1ns / 1ps



module Mux(
    input [4:0] i_x,
    input [2:0] i_select,
    output o_y 
    );
    reg r_y;
    assign o_y = r_y;

    always @(*) begin
        case (i_select)
            3'b000 : r_y <= 1'b0;
            3'b001 : r_y <= i_x[0];
            3'b010 : r_y <= i_x[1];
            3'b011 : r_y <= i_x[2];
            3'b100 : r_y <= i_x[3];
            default : r_y <= 1'b0;
        endcase
        
    
    end
endmodule