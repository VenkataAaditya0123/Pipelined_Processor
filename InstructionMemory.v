`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2020 11:54:16
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input rst_n,
    input [31:0] PC,
    output [31:0] instrCode
    );
    
    reg [7 : 0] instructionsFile [0 : 255];
    
    assign instrCode = {instructionsFile[PC + 3], instructionsFile[PC + 2], instructionsFile[PC + 1], instructionsFile[PC]};
    
    always@(*)
    begin
        if(rst_n == 1'b0)
        begin
            $readmemh("Instructions.mem", instructionsFile);
        end
    end
    
endmodule
