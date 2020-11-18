`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2020 18:05:10
// Design Name: 
// Module Name: PC_wrong_pred_PC_next_MUX
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


module PC_wrong_pred_PC_next_MUX(
    input [31:0] PC_beq,
    input [31:0] immData_beq,
    input wrong_prediction,
    input prediction,
    input [31:0] PC_next,
    output reg [31:0] actual_PC_next
    );
    
    always@(*)
    begin
        if(wrong_prediction == 1'b1)
        begin
            if(prediction == 1'b0) //NT
            begin
                actual_PC_next <= PC_beq + immData_beq;
            end
            
            else
            begin
                actual_PC_next <= PC_beq + 4;
            end
        end
        
        else
        begin
            actual_PC_next <= PC_next;
        end
    end
    
endmodule
