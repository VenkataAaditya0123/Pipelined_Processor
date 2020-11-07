`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 05:23:31
// Design Name: 
// Module Name: EX_MEM_PipelineReg
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


module EX_MEM_PipelineReg(
    input clk,
    input rst_n,
    input [31:0] PC_plus_X_in,
    input [31:0] ALU_result_in,
    input zero_in,
    input [31 : 0] read_data2_in, //needed for sw ---> sw s0, 8(t2) will have to store contents of rs2 -> s0 in dmem
    input [4:0] rd_in,
    input branch_in,
    input jump_in,
    input memRead_in,
    input memWrite_in,
    input memToReg_in,
    input regWrite_in,
    output [31:0] PC_plus_X_out,
    output [31:0] ALU_result_out,
    output zero_out,
    output [31 : 0] read_data2_out,
    output [4:0] rd_out,
    output branch_out,
    output jump_out,
    output memRead_out,
    output memWrite_out,
    output memToReg_out,
    output regWrite_out
    );
    
    reg [31 : 0] PC_plus_X_save;
    reg [31:0] ALU_result_save;
    reg zero_save;
    reg [31 : 0] read_data2_save;
    reg [4:0] rd_save;
    reg branch_save;
    reg jump_save;
    reg memRead_save;
    reg memWrite_save;
    reg memToReg_save;
    reg regWrite_save;
    
    assign PC_plus_X_out = PC_plus_X_save;
    assign ALU_result_out = ALU_result_save;
    assign zero_out = zero_save;
    assign read_data2_out = read_data2_save;
    assign rd_out = rd_save;
    assign branch_out = branch_save;
    assign jump_out = jump_save;
    assign memRead_out = memRead_save;
    assign memWrite_out = memWrite_save;
    assign memToReg_out = memToReg_save;
    assign regWrite_out = regWrite_save;
    
    always@(posedge clk)
    begin
    
        if(rst_n == 1'b0)
        begin
            PC_plus_X_save <= 0;
            ALU_result_save <= 0;
            zero_save <= 1'b0;
            read_data2_save <= 0;
            rd_save <= 0;
            branch_save <= 1'b0;
            jump_save <= 1'b0;
            memRead_save <= 1'b0;
            memWrite_save <= 1'b0;
            memToReg_save <= 1'b0;
            regWrite_save <= 1'b0;
        end
        
        else
        begin
            PC_plus_X_save <= PC_plus_X_in;
            ALU_result_save <= ALU_result_in;
            zero_save <= zero_in;
            read_data2_save <= read_data2_in;
            rd_save <= rd_in;
            branch_save <= branch_in;
            jump_save <= jump_in;
            memRead_save <= memRead_in;
            memWrite_save <= memWrite_in;
            memToReg_save <= memToReg_in;
            regWrite_save <= regWrite_in;
        end
        
    end
    
    
endmodule
