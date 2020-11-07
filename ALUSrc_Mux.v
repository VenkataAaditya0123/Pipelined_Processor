`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 08:30:00
// Design Name: 
// Module Name: ALUSrc_Mux
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


module ALUSrc_Mux(
    input [31:0] read_data2,
    input [31:0] immData,
    input ALUSrc,
    output [31:0] operand2
    );
    
    assign operand2 = (ALUSrc == 1'b0) ? read_data2 : immData;
    
endmodule
