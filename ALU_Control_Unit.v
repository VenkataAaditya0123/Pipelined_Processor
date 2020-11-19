`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 04:22:29
// Design Name: 
// Module Name: ALU_Control_Unit
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


module ALU_Control_Unit(
    input rst_n,
    input [6:0] funct7,
    input [2:0] funct3,
    input [1:0] ALUop,
    output reg [3:0] operation
    );
    
    //operation = 4'b0000 => AND
    //operation = 4'b0001 => OR
    //operation = 4'b0010 => ADD
    //operation = 4'b0110 => SUB
    
    //TODO : add further operations
    
    //ALUop = 2'b00 => lw, sw => ADD
    //ALUOp = 2'b01 => beq => SUB
    //ALUOp = 2'b10 => R-type
    
    always@(*)
    begin
        if(rst_n == 1'b0)
        begin
            operation <= 4'b0000; //default operation is AND
        end
        
        else if(ALUop == 2'b00) //lw, sw
        begin
            operation <= 4'b0010; //ADD
        end
        
        else if(ALUop == 2'b01) //beq
        begin
            operation <= 4'b0110; //SUB
        end
        
        else if(ALUop == 2'b10) //R-type
        begin
            if(funct7 == 7'b0000000)
            begin
                if(funct3 == 3'b000)
                begin
                    operation <= 4'b0010; //ADD
                end
                
                else if(funct3 == 3'b111)
                begin
                    operation <= 4'b0000; //AND
                end
                
                else if(funct3 == 3'b110)
                begin
                    operation <= 4'b0001; //OR
                end
                
                else if(funct3 == 3'b001)
                begin
                    operation <= 4'b0111; //SLL
                end
                
                else if(funct3 == 3'b101)
                begin
                    operation <= 4'b1000; //SRL
                end
                
                else if(funct3 == 3'b100)
                begin
                    operation <= 4'b1010; //XOR
                end
                
                else if(funct3 == 3'b010)
                begin
                    operation <= 4'b1111; //SLT - Set on Less than
                end
            end
            
            else if(funct7 == 7'b0100000)
            begin
                if(funct3 == 3'b000)
                begin
                    operation <= 4'b0110; //SUB
                end
            end
            
            else if(funct7 == 7'b0100000)
            begin
                if(funct3 == 3'b101)
                begin
                    operation <= 4'b1001; //SRA
                end
            end
            
        end
        
    end
    
endmodule
