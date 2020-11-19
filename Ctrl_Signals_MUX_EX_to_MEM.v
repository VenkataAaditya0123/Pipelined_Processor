`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2020 20:55:12
// Design Name: 
// Module Name: Ctrl_Signals_MUX_EX_to_MEM
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


module Ctrl_Signals_MUX_EX_to_MEM(
    input branch_in,
    input jump_in,
    input memRead_in,
    input memWrite_in,
    input memToReg_in,
    input regWrite_in,
    output branch_out,
    output jump_out,
    output memRead_out,
    output memWrite_out,
    output memToReg_out,
    output regWrite_out,
    input wrong_prediction
    );
    
    assign branch_out   = (wrong_prediction == 1) ? 1'b0 : branch_in;
    assign jump_out     = (wrong_prediction == 1) ? 1'b0 : jump_in;
    assign memRead_out  = (wrong_prediction == 1) ? 1'b0 : memRead_in;
    assign memWrite_out = (wrong_prediction == 1) ? 1'b0 : memWrite_in;
    assign memToReg_out = (wrong_prediction == 1) ? 1'b0 : memToReg_in;
    assign regWrite_out = (wrong_prediction == 1) ? 1'b0 : regWrite_in;
    
endmodule
