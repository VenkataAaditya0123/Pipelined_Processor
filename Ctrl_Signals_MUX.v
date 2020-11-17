`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2020 17:22:57
// Design Name: 
// Module Name: Ctrl_Signals_MUX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Ctrl_Signals_MUX(
    input [1:0] immSel_in,
    input [1:0] ALUop_in,
    input ALUSrc_in,
    input branch_in,
    input jump_in,
    input memRead_in,
    input memWrite_in,
    input memToReg_in,
    input regWrite_in,
    input ctrl_select,
    output [1:0] immSel_out,
    output [1:0] ALUop_out,
    output ALUSrc_out,
    output branch_out,
    output jump_out,
    output memRead_out,
    output memWrite_out,
    output memToReg_out,
    output regWrite_out
    );
    
    assign immSel_out = (ctrl_select == 1'b1) ? immSel_in : 2'b00;
    assign ALUop_out = (ctrl_select == 1'b1) ? ALUop_in : 2'b00;
    assign ALUSrc_out = (ctrl_select == 1'b1) ? ALUSrc_in : 1'b0;
    assign branch_out = (ctrl_select == 1'b1) ? branch_in : 1'b0;
    assign jump_out = (ctrl_select == 1'b1) ? jump_in : 1'b0;
    assign memRead_out = (ctrl_select == 1'b1) ? memRead_in : 1'b0;
    assign memWrite_out = (ctrl_select == 1'b1) ? memWrite_in : 1'b0;
    assign memToReg_out = (ctrl_select == 1'b1) ? memToReg_in : 1'b0;
    assign regWrite_out = (ctrl_select == 1'b1) ? regWrite_in : 1'b0;
    
endmodule
