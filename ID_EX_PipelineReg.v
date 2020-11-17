`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 03:52:51
// Design Name: 
// Module Name: ID_EX_PipelineReg
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


module ID_EX_PipelineReg(
    input clk,
    input rst_n,
    input ALUSrc_in,
    input [1:0] ALUop_in,
    input branch_in,
    input jump_in,
    input memRead_in,
    input memWrite_in,
    input memToReg_in,
    input regWrite_in,
    input [31:0] read_data1_in,
    input [31:0] read_data2_in,
    input [4:0] rs1_in,
    input [4:0] rs2_in,
    input [4:0] rd_in,
    input [31:0] immData_in,
    input [6 : 0] funct7_in,
    input [2 : 0] funct3_in,
    input [31 : 0] PC_in,
    output ALUSrc_out,
    output [1:0] ALUop_out,
    output branch_out,
    output jump_out,
    output memRead_out,
    output memWrite_out,
    output memToReg_out,
    output regWrite_out,
    output [31:0] read_data1_out,
    output [31:0] read_data2_out,
    output [4:0] rs1_out,
    output [4:0] rs2_out,
    output [4:0] rd_out,
    output [31:0] immData_out,
    output [6 : 0] funct7_out,
    output [2 : 0] funct3_out,
    output [31 : 0] PC_out
    );
    
    reg ALUSrc_save;
    reg [1:0] ALUop_save;
    reg branch_save;
    reg jump_save;
    reg memRead_save;
    reg memWrite_save;
    reg memToReg_save;
    reg regWrite_save;
    reg [31:0] read_data1_save;
    reg [31:0] read_data2_save;
    reg [4:0] rs1_save;
    reg [4:0] rs2_save;
    reg [4:0] rd_save;
    reg [31:0] immData_save;
    reg [6 : 0] funct7_save;
    reg [2 : 0] funct3_save;
    reg [31 : 0] PC_save;
    
    assign ALUSrc_out = ALUSrc_save;
    assign ALUop_out = ALUop_save;
    assign branch_out = branch_save;
    assign jump_out = jump_save;
    assign memRead_out = memRead_save;
    assign memWrite_out = memWrite_save;
    assign memToReg_out = memToReg_save;
    assign regWrite_out = regWrite_save;
    assign read_data1_out = read_data1_save;
    assign read_data2_out = read_data2_save;
    assign rs1_out = rs1_save;
    assign rs2_out = rs2_save;
    assign rd_out = rd_save;
    assign immData_out = immData_save;
    assign funct7_out = funct7_save;
    assign funct3_out = funct3_save;
    assign PC_out = PC_save;
    
    always@(posedge clk)
    begin
        if(rst_n == 1'b0)
        begin
            ALUSrc_save <= 1'b0;
            ALUop_save <= 2'b00;
            branch_save <= 1'b0;
            jump_save <= 1'b0;
            memRead_save <= 1'b0;
            memWrite_save <= 1'b0;
            memToReg_save <= 1'b0;
            regWrite_save <= 1'b0;
            read_data1_save <= 0;
            read_data2_save <= 0;
            rs1_save <= 0;
            rs2_save <= 0;
            rd_save <= 0;
            immData_save <= 0;
            funct7_save <= 0;
            funct3_save <= 0;
            PC_save <= 0;
        end
        
        else
        begin
            ALUSrc_save <= ALUSrc_in;
            ALUop_save <= ALUop_in;
            branch_save <= branch_in;
            jump_save <= jump_in;
            memRead_save <= memRead_in;
            memWrite_save <= memWrite_in;
            memToReg_save <= memToReg_in;
            regWrite_save <= regWrite_in;
            read_data1_save <= read_data1_in;
            read_data2_save <= read_data2_in;
            rs1_save <= rs1_in;
            rs2_save <= rs2_in;
            rd_save <= rd_in;
            immData_save <= immData_in;
            funct7_save <= funct7_in;
            funct3_save <= funct3_in;
            PC_save <= PC_in;
        end
    end
    
endmodule
