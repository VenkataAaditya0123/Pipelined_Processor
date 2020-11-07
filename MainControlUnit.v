`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2020 12:09:14
// Design Name: 
// Module Name: MainControlUnit
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


module MainControlUnit(
    input rst_n,
    input [6:0] opcode,
    output reg [1:0] immSel,
    output reg [1:0] ALUop,
    output reg ALUSrc,
    output reg branch,
    output reg jump,
    output reg memRead,
    output reg memWrite,
    output reg memToReg,
    output reg regWrite
    );
    
    always@(*)
    begin
        if(rst_n == 1'b0)
        begin
            immSel <= 2'b00;
            ALUop <= 2'b00;
            ALUSrc <= 1'b0;
            branch <= 1'b0;
            jump <= 1'b0;
            memRead <= 1'b0;
            memWrite <= 1'b0;
            memToReg <= 1'b0;
            regWrite <= 1'b0;
        end
        
        else if(opcode == 7'b0110011) //R-type
        begin
            immSel <= 2'b00; //actually 2'bXX
            ALUop <= 2'b10;
            ALUSrc <= 1'b0;
            branch <= 1'b0;
            jump <= 1'b0;
            memRead <= 1'b0;
            memWrite <= 1'b0;
            memToReg <= 1'b0;
            regWrite <= 1'b1;
        end
        
        else if(opcode == 7'b0000011) //I-type --->>> lw
        begin
            immSel <= 2'b00;
            ALUop <= 2'b00;
            ALUSrc <= 1'b1;
            branch <= 1'b0;
            jump <= 1'b0;
            memRead <= 1'b1;
            memWrite <= 1'b0;
            memToReg <= 1'b1;
            regWrite <= 1'b1;
        end
        
        else if(opcode == 7'b0010011) //I-type --->>> addi
        begin
            immSel <= 2'b00;
            ALUop <= 2'b00;
            ALUSrc <= 1'b1;
            branch <= 1'b0;
            jump <= 1'b0;
            memRead <= 1'b0;
            memWrite <= 1'b0;
            memToReg <= 1'b0;
            regWrite <= 1'b1;
        end
        
        else if(opcode == 7'b0100011) //S-type --->>> sw
        begin
            immSel <= 2'b01;
            ALUop <= 2'b00;
            ALUSrc <= 1'b1;
            branch <= 1'b0;
            jump <= 1'b0;
            memRead <= 1'b0;
            memWrite <= 1'b1;
            memToReg <= 1'b0; //1'bX
            regWrite <= 1'b0;
        end
        
        else if(opcode == 7'b1100011) //SB-type --->>> beq
        begin
            immSel <= 2'b10;
            ALUop <= 2'b01;
            ALUSrc <= 1'b0;
            branch <= 1'b1;
            jump <= 1'b0;
            memRead <= 1'b0;
            memWrite <= 1'b0;
            memToReg <= 1'b0; //1'bX
            regWrite <= 1'b0;
        end
        
        else if(opcode == 7'b1101111)
        begin
            immSel <= 2'b11;
            ALUop <= 2'b00; //2'bXX
            ALUSrc <= 1'b0; //1'bX
            branch <= 1'b0;
            jump <= 1'b1;
            memRead <= 1'b0;
            memWrite <= 1'b0;
            memToReg <= 1'b0; //1'bX
            regWrite <= 1'b0;
        end
        
        //else => unsupported instruction format
        
    end
    
endmodule
