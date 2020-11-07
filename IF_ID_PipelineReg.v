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
    input rst_n,
    input [31:0] instruction_in,
    output [31:0] instruction_out
    );
    
    reg [31 : 0] instruction_save;
    
    assign instruction_out = instruction_save;
    
    always@(posedge clk)
    begin
        if(rst_n == 1'b0)
        begin
            instruction_save <= 0;
        end
        
        else
        begin
            instruction_save <= instruction_in;
        end
    end
    
endmodule
