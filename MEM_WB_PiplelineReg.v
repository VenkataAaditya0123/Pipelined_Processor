`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 06:24:04
// Design Name: 
// Module Name: MEM_WB_PiplelineReg
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


module MEM_WB_PiplelineReg(
    input clk,
    input rst_n,
    input memToReg_in,
    input regWrite_in,
    input [4:0] rd_in,
    input [31:0] dmem_read_data_in,
    input [31:0] ALU_result_in,
    output memToReg_out,
    output regWrite_out,
    output [4 : 0] rd_out,
    output [31:0] dmem_read_data_out,
    output [31:0] ALU_result_out
    );
    
    reg memToReg_save;
    reg regWrite_save;
    reg [4:0] rd_save;
    reg [31:0] dmem_read_data_save;
    reg [31:0] ALU_result_save;
    
    assign memToReg_out = memToReg_save;
    assign regWrite_out = regWrite_save;
    assign rd_out = rd_save;
    assign dmem_read_data_out = dmem_read_data_save;
    assign ALU_result_out = ALU_result_save;
    
    always@(posedge clk)
    begin
        
        if(rst_n == 1'b0)
        begin
            memToReg_save <= 1'b0;
            regWrite_save <= 1'b0;
            rd_save <= 1'b0;
            dmem_read_data_save <= 0;
            ALU_result_save <= 0;
        end
        
        else
        begin
            memToReg_save <= memToReg_in;
            regWrite_save <= regWrite_in;
            rd_save <= rd_in;
            dmem_read_data_save <= dmem_read_data_in;
            ALU_result_save <= ALU_result_in;
        end
        
    end
    
endmodule
