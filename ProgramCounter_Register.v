`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 07:32:14
// Design Name: 
// Module Name: ProgramCounter_Register
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


module ProgramCounter_Register(
    input clk,
    input clk_gate,
    input rst_n,
    output reg [31:0] PC
    );
    
    //TODO : Add functionality to modify PC after branch and jump instructions
    
    always@(posedge clk)
    begin
        if(rst_n == 1'b0)
        begin
            PC <= 0;
        end
        
        else if(clk_gate == 1'b1)
        begin
            PC <= PC + 4;
        end
    end
    
endmodule
