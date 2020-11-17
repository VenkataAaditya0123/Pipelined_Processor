`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2020 12:02:10
// Design Name: 
// Module Name: IF_ID_PipelineReg
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


module IF_ID_PipelineReg(
    input clk,
    input clk_gate,
    input rst_n,
    input [31:0] instruction_in,
    input [31 : 0] PC_in,
    output [31:0] instruction_out,
    output [31 : 0] PC_out
    );
    
    reg [31 : 0] instruction_save;
    reg [31 : 0] PC_save;
    
    assign instruction_out = instruction_save;
    assign PC_out = PC_save;
    
    always@(posedge clk)
    begin
        if(rst_n == 1'b0)
        begin
            instruction_save <= 0;
            PC_save <= -4; //if init value is 0 the first instr that will be executed will be from addr 4 in Imem
        end
        
        else if(clk_gate == 1'b1)
        begin
            instruction_save <= instruction_in;
            PC_save <= PC_in;
        end
    end
    
endmodule
