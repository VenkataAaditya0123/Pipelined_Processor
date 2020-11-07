`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 05:16:10
// Design Name: 
// Module Name: PC_plus_X_adder
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


module PC_plus_X_adder(
    input [31:0] PC,
    input [31:0] immData,
    output [31:0] PC_plus_X
    );
    
    assign PC_plus_X = PC + immData;
    
endmodule
