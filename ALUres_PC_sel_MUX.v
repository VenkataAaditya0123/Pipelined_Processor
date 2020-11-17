`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2020 14:05:47
// Design Name: 
// Module Name: ALUres_PC_sel_MUX
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


module ALUres_PC_sel_MUX(
    input [31:0] ALU_result,
    input [31:0] PC,
    input jump,
    output [31:0] ALUres_PC_sel_MUX_output
    );
    
    //In MEM stage
    
    assign ALUres_PC_sel_MUX_output = (jump == 1'b0) ? ALU_result : (PC + 4);
    
endmodule
