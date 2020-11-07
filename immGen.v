`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2020 12:25:38
// Design Name: 
// Module Name: immGen
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


module immGen(
    input rst_n,
    input [31:0] instruction,
    input [1:0] immSel,
    output reg [31:0] immData
    );
    
    always@(*)
    begin
        if(rst_n == 1'b0)
        begin
            immData <= 0;
        end
        
        else if(immSel == 2'b00) //I-type --- lw, addi --- left shift NOT required
        begin
            if(instruction[31] == 1'b0) //MSB = 0
            begin
                immData <= {{20{1'b0}}, instruction[31 : 20]};
            end
            
            else //MSB = 1
            begin
                immData <= {{20{1'b1}}, instruction[31 : 20]};
            end
        end
        
        else if(immSel == 2'b01) //S-type --- sw --- left shift NOT required
        begin
            if(instruction[31] == 1'b0) //MSB = 0
            begin
                immData <= {{20{1'b0}}, instruction[31 : 25], instruction[11 : 7]};
            end
            
            else //MSB = 1
            begin
                immData <= {{20{1'b1}}, instruction[31 : 25], instruction[11 : 7]};
            end
        end
        
        else if(immSel == 2'b10) //SB-type --- beq --- left shift by 1
        begin
            if(instruction[31] == 1'b0) //MSB = 0
            begin
                immData <= {{19{1'b0}}, instruction[31], instruction[7], instruction[30 : 25], instruction[11 : 8], {1{1'b0}}};
            end
            
            else //MSB = 1
            begin
                immData <= {{19{1'b1}}, instruction[31], instruction[7], instruction[30 : 25], instruction[11 : 8], {1{1'b0}}};
            end
        end
        
        else if(immSel == 2'b11) //J-type --- jal --- left shift by 1
        begin
            if(instruction[31] == 1'b0) //MSB = 0
            begin
                immData <= {{11{1'b0}}, instruction[31], instruction[19 : 12], instruction[20], instruction[30 : 21], {1{1'b0}}};
            end
            
            else //MSB = 1
            begin
                immData <= {{11{1'b1}}, instruction[31], instruction[19 : 12], instruction[20], instruction[30 : 21], {1{1'b0}}};
            end
        end
    end
    
endmodule
