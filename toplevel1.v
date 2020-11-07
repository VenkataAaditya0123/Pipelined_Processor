`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 07:53:38
// Design Name: 
// Module Name: toplevel1
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


module toplevel1(
    input clk,
    input rst_n
    );
    
    wire [31 : 0] PC;
    wire [31 : 0] instrCode;
    wire [31 : 0] instruction;
    
    wire [1 : 0] immSel;
    wire [1 : 0] ALUop;
    wire ALUSrc;
    wire branch;
    wire jump;
    wire memRead;
    wire memWrite;
    wire memToReg;
    wire regWrite;
    
    wire [31 : 0] immData;
    
    wire [31 : 0] read_data1;
    wire [31 : 0] read_data2;
    
    wire ALUSrc_EX;
    wire [1 : 0] ALUop_EX;
    wire branch_EX;
    wire jump_EX;
    wire memRead_EX;
    wire memWrite_EX;
    wire memToReg_EX;
    wire regWrite_EX;
    wire [31 : 0] read_data1_EX;
    wire [31 : 0] read_data2_EX;
    wire [4 : 0] rs1_EX;
    wire [4 : 0] rs2_EX;
    wire [4 : 0] rd_EX;
    wire [31 : 0] immData_EX;
    wire [6 : 0] funct7_EX;
    wire [2 : 0] funct3_EX;
    
    
    
    wire [31 : 0] operand2_op_Mux;
    wire [3 : 0] ALU_operation;
    
    
    wire [31 : 0] ALU_result;
    wire ALU_zero;
    
    
    wire [31 : 0] PC_plus_X;
    
    
    
    
    wire [31 : 0] PC_plus_X_MEM;
    wire [31 : 0] ALU_result_MEM;
    wire zero_MEM;
    wire [31 : 0] read_data2_MEM;
    wire [4 : 0] rd_MEM;
    wire branch_MEM;
    wire jump_MEM;
    wire memRead_MEM;
    wire memWrite_MEM;
    wire memToReg_MEM;
    wire regWrite_MEM;
    
    
    
    wire [31 : 0] dmem_read_data_MEM;
    
    
    
    wire memToReg_WB;
    wire regWrite_WB;
    wire [4 : 0] rd_WB;
    wire [31 : 0] dmem_read_data_WB;
    wire [31 : 0] ALU_result_WB;
    
    
    
    wire [31 : 0] memToReg_Mux_output;
    
    
    
    ProgramCounter_Register i1(.clk(clk), .rst_n(rst_n), .PC(PC));
    
    InstructionMemory i2(.rst_n(rst_n), .PC(PC), .instrCode(instrCode));
    
    IF_ID_PipelineReg i3(.clk(clk), .rst_n(rst_n), .instruction_in(instrCode), .instruction_out(instruction));
    
    MainControlUnit i4(.rst_n(rst_n), .opcode(instruction[6 : 0]), .immSel(immSel), .ALUop(ALUop), .ALUSrc(ALUSrc),
                       .branch(branch), .jump(jump), .memRead(memRead), .memWrite(memWrite),
                       .memToReg(memToReg), .regWrite(regWrite));
                       
    immGen i5(.rst_n(rst_n), .instruction(instruction), .immSel(immSel), .immData(immData));
    
    RegisterFile i6(.rst_n(rst_n), .read_addr1(instruction[19 : 15]), .read_addr2(instruction[24 : 20]),
                    .regWrite(regWrite_WB), .write_addr(rd_WB), .write_data(memToReg_Mux_output),
                    .read_data1(read_data1), .read_data2(read_data2));
                    
                    
    ID_EX_PipelineReg i7(.clk(clk), .rst_n(rst_n), .ALUSrc_in(ALUSrc), .ALUop_in(ALUop), .branch_in(branch),
                         .jump_in(jump), .memRead_in(memRead), .memWrite_in(memWrite), .memToReg_in(memToReg),
                         .regWrite_in(regWrite), .read_data1_in(read_data1), .read_data2_in(read_data2),
                         .rs1_in(instruction[19 : 15]), .rs2_in(instruction[24 : 20]), .rd_in(instruction[11 : 7]),
                         .immData_in(immData), .funct7_in(instruction[31 : 25]), .funct3_in(instruction[14 : 12]),
                         .ALUSrc_out(ALUSrc_EX), .ALUop_out(ALUop_EX), .branch_out(branch_EX), .jump_out(jump_EX),
                         .memRead_out(memRead_EX), .memWrite_out(memWrite_EX), .memToReg_out(memToReg_EX),
                         .regWrite_out(regWrite_EX), .read_data1_out(read_data1_EX), .read_data2_out(read_data2_EX),
                         .rs1_out(rs1_EX), .rs2_out(rs2_EX), .rd_out(rd_EX), .immData_out(immData_EX),
                         .funct7_out(funct7_EX), .funct3_out(funct3_EX));
                         
                         
    
    ALUSrc_Mux i8(.read_data2(read_data2_EX), .immData(immData_EX), .ALUSrc(ALUSrc_EX), .operand2(operand2_op_Mux));
    
    
    
    ALU_Control_Unit i9(.rst_n(rst_n), .funct7(funct7_EX), .funct3(funct3_EX), .ALUop(ALUop_EX),
                        .operation(ALU_operation));
                        
                        
                        
    ALU i10(.rst_n(rst_n), .operand1(read_data1_EX), .operand2(operand2_op_Mux), .operation(ALU_operation),
            .result(ALU_result), .zero(ALU_zero));
            
            
            
            
    PC_plus_X_adder i11(.PC(PC), .immData(immData_EX), .PC_plus_X(PC_plus_X));
            
            
    
    EX_MEM_PipelineReg i12(.clk(clk), .rst_n(rst_n), .PC_plus_X_in(PC_plus_X), .ALU_result_in(ALU_result), 
                           .zero_in(ALU_zero), .read_data2_in(read_data2_EX), .rd_in(rd_EX), .branch_in(branch_EX),
                           .jump_in(jump_EX), .memRead_in(memRead_EX), .memWrite_in(memWrite_EX), 
                           .memToReg_in(memToReg_EX), .regWrite_in(regWrite_EX), 
                           .PC_plus_X_out(PC_plus_X_MEM), .ALU_result_out(ALU_result_MEM), .zero_out(zero_MEM),
                           .read_data2_out(read_data2_MEM), .rd_out(rd_MEM), .branch_out(branch_MEM), .jump_out(jump_MEM),
                           .memRead_out(memRead_MEM), .memWrite_out(memWrite_MEM), .memToReg_out(memToReg_MEM), 
                           .regWrite_out(regWrite_MEM));
                           
                           
                           
                           
    DataMemory i13(.rst_n(rst_n), .read_addr(ALU_result_MEM), .write_addr(ALU_result_MEM), .write_data(read_data2_MEM),
                   .memRead(memRead_MEM), .memWrite(memWrite_MEM), .read_data(dmem_read_data_MEM));
                   
                   
                   
                   
    MEM_WB_PiplelineReg i14(.clk(clk), .rst_n(rst_n), .memToReg_in(memToReg_MEM), .regWrite_in(regWrite_MEM),
                            .rd_in(rd_MEM), .dmem_read_data_in(dmem_read_data_MEM), .ALU_result_in(ALU_result_MEM),
                            .memToReg_out(memToReg_WB), .regWrite_out(regWrite_WB), .rd_out(rd_WB), 
                            .dmem_read_data_out(dmem_read_data_WB), .ALU_result_out(ALU_result_WB));
                            
                            
                            
                            
    memToReg_Mux i15(.ALU_result(ALU_result_WB), .dmem_read_data(dmem_read_data_WB), .memToReg(memToReg_WB),
                     .memToReg_Mux_output(memToReg_Mux_output)); 
    
    
endmodule
