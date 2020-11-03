`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2020 11:14:33
// Design Name: 
// Module Name: Instruction_Fetch
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


module Instruction_Fetch(
    input clk,
    input reset,
    output [31:0] Instruction_Code
    );      //Perform Jump instr. in this stage itself
    
    reg [31:0] PC;
    reg [31:0] instructions_list [31:0];
   // Instruction_Memory IM_UUT(PC,reset,Instruction_Code);
    
    assign Instruction_Code = instructions_list[PC];
    
    always@(negedge reset)
    begin
        PC<=0;
        $display("Loading instructions into instructions_list");
        $readmemh("instructions.mem", instructions_list);
    end
    
    always@(posedge clk)
    begin
        PC<=PC+1;       //To add jump, branch
    end
    
endmodule
