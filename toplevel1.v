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
    
    
    
    wire [1 : 0] ForwardingMUX1_select;
    wire [1 : 0] ForwardingMUX2_select;
    
    
    wire [31 : 0] MUX_3_1_output_1;
    wire [31 : 0] MUX_3_1_output_2;
    
    
    wire clk_gate;
    wire contol_signals_select;
    
    
    
    wire [1 : 0] immSel_ctrl_signals_MUX_out;
    wire [1 : 0] ALUop_ctrl_signals_MUX_out;
    wire ALUSrc_ctrl_signals_MUX_out;
    wire branch_ctrl_signals_MUX_out;
    wire jump_ctrl_signals_MUX_out;
    wire memRead_ctrl_signals_MUX_out;
    wire memWrite_ctrl_signals_MUX_out;
    wire memToReg_ctrl_signals_MUX_out;
    wire regWrite_ctrl_signals_MUX_out;
    
    
    wire [1 : 0] PCSrc;
    
    wire [31 : 0] PC_next;
    
    wire [31 : 0] PC_EX;
    wire [31 : 0] PC_MEM;
    
    wire jump_WB;
    wire [31 : 0] PC_WB;
    
    wire [31 : 0] PC_ID;
    
    wire [31 : 0] ALUres_PC_sel_MUX_output;
    
    //wire clk_mod = clk & clk_gate;
    
    
    
    //ProgramCounter_Register i1(.clk(clk), .rst_n(rst_n), .PC(PC));
    //ProgramCounter_Register i1(.clk(clk), .clk_gate(clk_gate), .rst_n(rst_n), .PC_next(PC_next), .PC(PC));
    ProgramCounter_Register i1(.clk_gate(clk_gate), .rst_n(rst_n), .PC_next(PC_next), .PC(PC));
    
    
    InstructionMemory i2(.rst_n(rst_n), .PC(PC), .instrCode(instrCode));
    
    //IF_ID_PipelineReg i3(.clk(clk), .rst_n(rst_n), .instruction_in(instrCode), .instruction_out(instruction));
    IF_ID_PipelineReg i3(.clk(clk), .clk_gate(clk_gate), .rst_n(rst_n), .instruction_in(instrCode), .PC_in(PC),
                         .instruction_out(instruction), .PC_out(PC_ID));
    
    
    
    
    Stall_Detection_Control_Unit i19(.IF_ID_rs1(instruction[19 : 15]), .IF_ID_rs2(instruction[24 : 20]), 
                                     .ID_EX_rd(rd_EX), .ID_EX_memRead(memRead_EX), .clk_gate(clk_gate),
                                     .contol_signals_select(contol_signals_select));
    
    
    
    
    MainControlUnit i4(.rst_n(rst_n), .opcode(instruction[6 : 0]), .immSel(immSel), .ALUop(ALUop), .ALUSrc(ALUSrc),
                       .branch(branch), .jump(jump), .memRead(memRead), .memWrite(memWrite),
                       .memToReg(memToReg), .regWrite(regWrite), .PCSrc(PCSrc));
                       
                       
                       
                       
    
    Ctrl_Signals_MUX i20(.immSel_in(immSel), .ALUop_in(ALUop), .ALUSrc_in(ALUSrc), .branch_in(branch),
                         .jump_in(jump), .memRead_in(memRead), .memWrite_in(memWrite),
                         .memToReg_in(memToReg), .regWrite_in(regWrite), .ctrl_select(contol_signals_select),
                         .immSel_out(immSel_ctrl_signals_MUX_out), .ALUop_out(ALUop_ctrl_signals_MUX_out),
                         .ALUSrc_out(ALUSrc_ctrl_signals_MUX_out), .branch_out(branch_ctrl_signals_MUX_out),
                         .jump_out(jump_ctrl_signals_MUX_out), .memRead_out(memRead_ctrl_signals_MUX_out),
                         .memWrite_out(memWrite_ctrl_signals_MUX_out), .memToReg_out(memToReg_ctrl_signals_MUX_out),
                         .regWrite_out(regWrite_ctrl_signals_MUX_out));
    
                       
                       
                       
                       
                       
    //immGen i5(.rst_n(rst_n), .instruction(instruction), .immSel(immSel), .immData(immData));
    immGen i5(.rst_n(rst_n), .instruction(instruction), .immSel(immSel_ctrl_signals_MUX_out), .immData(immData));
    
    
    
    
    RegisterFile i6(.rst_n(rst_n), .read_addr1(instruction[19 : 15]), .read_addr2(instruction[24 : 20]),
                    .regWrite(regWrite_WB), .write_addr(rd_WB), .write_data(memToReg_Mux_output),
                    .read_data1(read_data1), .read_data2(read_data2));
                    
                    
                    
    //PC_Select_MUX i21(.PC_curr(PC), .immData(immData), .PCSrc(PCSrc), .PC_next(PC_next));
    PC_Select_MUX i21(.PC_curr(PC_ID), .immData(immData), .PCSrc(PCSrc), .PC_next(PC_next));
                    
                    
                    
                    
    /*ID_EX_PipelineReg i7(.clk(clk), .rst_n(rst_n), .ALUSrc_in(ALUSrc), .ALUop_in(ALUop), .branch_in(branch),
                         .jump_in(jump), .memRead_in(memRead), .memWrite_in(memWrite), .memToReg_in(memToReg),
                         .regWrite_in(regWrite), .read_data1_in(read_data1), .read_data2_in(read_data2),
                         .rs1_in(instruction[19 : 15]), .rs2_in(instruction[24 : 20]), .rd_in(instruction[11 : 7]),
                         .immData_in(immData), .funct7_in(instruction[31 : 25]), .funct3_in(instruction[14 : 12]),
                         .ALUSrc_out(ALUSrc_EX), .ALUop_out(ALUop_EX), .branch_out(branch_EX), .jump_out(jump_EX),
                         .memRead_out(memRead_EX), .memWrite_out(memWrite_EX), .memToReg_out(memToReg_EX),
                         .regWrite_out(regWrite_EX), .read_data1_out(read_data1_EX), .read_data2_out(read_data2_EX),
                         .rs1_out(rs1_EX), .rs2_out(rs2_EX), .rd_out(rd_EX), .immData_out(immData_EX),
                         .funct7_out(funct7_EX), .funct3_out(funct3_EX));*/
                         
   
    ID_EX_PipelineReg i7(.clk(clk), .rst_n(rst_n), .ALUSrc_in(ALUSrc_ctrl_signals_MUX_out), .ALUop_in(ALUop_ctrl_signals_MUX_out), .branch_in(branch_ctrl_signals_MUX_out),
                         .jump_in(jump_ctrl_signals_MUX_out), .memRead_in(memRead_ctrl_signals_MUX_out), .memWrite_in(memWrite_ctrl_signals_MUX_out), .memToReg_in(memToReg_ctrl_signals_MUX_out),
                         .regWrite_in(regWrite_ctrl_signals_MUX_out), .read_data1_in(read_data1), .read_data2_in(read_data2),
                         .rs1_in(instruction[19 : 15]), .rs2_in(instruction[24 : 20]), .rd_in(instruction[11 : 7]),
                         .immData_in(immData), .funct7_in(instruction[31 : 25]), .funct3_in(instruction[14 : 12]), .PC_in(PC_ID),
                         .ALUSrc_out(ALUSrc_EX), .ALUop_out(ALUop_EX), .branch_out(branch_EX), .jump_out(jump_EX),
                         .memRead_out(memRead_EX), .memWrite_out(memWrite_EX), .memToReg_out(memToReg_EX),
                         .regWrite_out(regWrite_EX), .read_data1_out(read_data1_EX), .read_data2_out(read_data2_EX),
                         .rs1_out(rs1_EX), .rs2_out(rs2_EX), .rd_out(rd_EX), .immData_out(immData_EX),
                         .funct7_out(funct7_EX), .funct3_out(funct3_EX), .PC_out(PC_EX));                     
                         
                         
                         
    
    Forwarding_Control_Unit i16(.ID_EX_rs1(rs1_EX), .ID_EX_rs2(rs2_EX), .EX_MEM_rd(rd_MEM),
                                .EX_MEM_regWrite(regWrite_MEM), .MEM_WB_rd(rd_WB), .MEM_WB_regWrite(regWrite_WB),
                                .ForwardingMUX1_select(ForwardingMUX1_select), .ForwardingMUX2_select(ForwardingMUX2_select));
                                
                                
                                
                                
                                
                                
    //MUX_3_1 i17(.in0(read_data1_EX), .in1(ALU_result_MEM), .in2(memToReg_Mux_output), .select(ForwardingMUX1_select),
    //            .out(MUX_3_1_output_1)); //read_data1 --->>> operand1 in ALU
    MUX_3_1 i17(.in0(read_data1_EX), .in1(ALUres_PC_sel_MUX_output), .in2(memToReg_Mux_output), .select(ForwardingMUX1_select),
                .out(MUX_3_1_output_1)); //read_data1 --->>> operand1 in ALU
                
                
                
    
    //MUX_3_1 i18(.in0(read_data2_EX), .in1(ALU_result_MEM), .in2(memToReg_Mux_output), .select(ForwardingMUX2_select),
    //            .out(MUX_3_1_output_2)); //read_data2 --->>> operand2 in ALU
    MUX_3_1 i18(.in0(read_data2_EX), .in1(ALUres_PC_sel_MUX_output), .in2(memToReg_Mux_output), .select(ForwardingMUX2_select),
                .out(MUX_3_1_output_2)); //read_data2 --->>> operand2 in ALU
                                
                                
                                
                                                   
                         
    
    //ALUSrc_Mux i8(.read_data2(read_data2_EX), .immData(immData_EX), .ALUSrc(ALUSrc_EX), .operand2(operand2_op_Mux));
    ALUSrc_Mux i8(.read_data2(MUX_3_1_output_2), .immData(immData_EX), .ALUSrc(ALUSrc_EX), .operand2(operand2_op_Mux));
    
    
    
    ALU_Control_Unit i9(.rst_n(rst_n), .funct7(funct7_EX), .funct3(funct3_EX), .ALUop(ALUop_EX),
                        .operation(ALU_operation));
                        
                        
                        
    //ALU i10(.rst_n(rst_n), .operand1(read_data1_EX), .operand2(operand2_op_Mux), .operation(ALU_operation),
    //        .result(ALU_result), .zero(ALU_zero));
    ALU i10(.rst_n(rst_n), .operand1(MUX_3_1_output_1), .operand2(operand2_op_Mux), .operation(ALU_operation),
            .result(ALU_result), .zero(ALU_zero));
            
            
            
            
    PC_plus_X_adder i11(.PC(PC), .immData(immData_EX), .PC_plus_X(PC_plus_X)); //can be removed -> WRONG PC is being fed
            
            
    
    /*EX_MEM_PipelineReg i12(.clk(clk), .rst_n(rst_n), .PC_plus_X_in(PC_plus_X), .ALU_result_in(ALU_result), 
                           .zero_in(ALU_zero), .read_data2_in(read_data2_EX), .rd_in(rd_EX), .branch_in(branch_EX),
                           .jump_in(jump_EX), .memRead_in(memRead_EX), .memWrite_in(memWrite_EX), 
                           .memToReg_in(memToReg_EX), .regWrite_in(regWrite_EX), 
                           .PC_plus_X_out(PC_plus_X_MEM), .ALU_result_out(ALU_result_MEM), .zero_out(zero_MEM),
                           .read_data2_out(read_data2_MEM), .rd_out(rd_MEM), .branch_out(branch_MEM), .jump_out(jump_MEM),
                           .memRead_out(memRead_MEM), .memWrite_out(memWrite_MEM), .memToReg_out(memToReg_MEM), 
                           .regWrite_out(regWrite_MEM));*/
                           
    EX_MEM_PipelineReg i12(.clk(clk), .rst_n(rst_n), .PC_plus_X_in(PC_plus_X), .ALU_result_in(ALU_result), 
                           .zero_in(ALU_zero), .read_data2_in(MUX_3_1_output_2), .rd_in(rd_EX), .branch_in(branch_EX),
                           .jump_in(jump_EX), .memRead_in(memRead_EX), .memWrite_in(memWrite_EX), 
                           .memToReg_in(memToReg_EX), .regWrite_in(regWrite_EX), .PC_in(PC_EX), 
                           .PC_plus_X_out(PC_plus_X_MEM), .ALU_result_out(ALU_result_MEM), .zero_out(zero_MEM),
                           .read_data2_out(read_data2_MEM), .rd_out(rd_MEM), .branch_out(branch_MEM), .jump_out(jump_MEM),
                           .memRead_out(memRead_MEM), .memWrite_out(memWrite_MEM), .memToReg_out(memToReg_MEM), 
                           .regWrite_out(regWrite_MEM), .PC_out(PC_MEM));
                           
                           
                           
                           
    
    ALUres_PC_sel_MUX i22(.ALU_result(ALU_result_MEM), .PC(PC_MEM), .jump(jump_MEM),
                                 .ALUres_PC_sel_MUX_output(ALUres_PC_sel_MUX_output));                       
    
                           
                           
                           
                           
    DataMemory i13(.rst_n(rst_n), .read_addr(ALU_result_MEM), .write_addr(ALU_result_MEM), .write_data(read_data2_MEM),
                   .memRead(memRead_MEM), .memWrite(memWrite_MEM), .read_data(dmem_read_data_MEM));
                   
                   
                   
                   
    MEM_WB_PiplelineReg i14(.clk(clk), .rst_n(rst_n), .memToReg_in(memToReg_MEM), .regWrite_in(regWrite_MEM),
                            .rd_in(rd_MEM), .dmem_read_data_in(dmem_read_data_MEM), .ALU_result_in(ALU_result_MEM),
                            .jump_in(jump_MEM), .PC_in(PC_MEM),
                            .memToReg_out(memToReg_WB), .regWrite_out(regWrite_WB), .rd_out(rd_WB), 
                            .dmem_read_data_out(dmem_read_data_WB), .ALU_result_out(ALU_result_WB),
                            .jump_out(jump_WB), .PC_out(PC_WB));
                            
                            
                            
                            
    memToReg_Mux i15(.ALU_result(ALU_result_WB), .dmem_read_data(dmem_read_data_WB),
                     .PC(PC_WB), .jump(jump_WB), .memToReg(memToReg_WB),
                     .memToReg_Mux_output(memToReg_Mux_output));
    
    
endmodule
