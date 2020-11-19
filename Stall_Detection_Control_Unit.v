`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2020 17:03:43
// Design Name: 
// Module Name: Stall_Detection_Control_Unit
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


module Stall_Detection_Control_Unit(
    input [4:0] IF_ID_rs1,
    input [4:0] IF_ID_rs2,
    input [4:0] ID_EX_rd,
    input ID_EX_memRead,
    input wrong_prediction,
    output reg clk_gate,
    output reg contol_signals_select
    );
    
    //clk_gate
    always@(*)
    begin
        //WRONG PREDICTION
        if(wrong_prediction == 1'b1)
        begin
            clk_gate <= 1'b1;
        end
    
        //STALL condition
        else if( ((IF_ID_rs1 == ID_EX_rd) || (IF_ID_rs2 == ID_EX_rd)) && (ID_EX_memRead == 1'b1) && (ID_EX_rd != 5'b00000))
        begin
            clk_gate <= 1'b0;
        end
        
        //NO STALL
        else
        begin
            clk_gate <= 1'b1;
        end
    end
    
    
    //contol_signals_select
    always@(*)
    begin
        //WRONG PREDICTION
        if(wrong_prediction == 1'b1)
        begin
            contol_signals_select <= 1'b0;
        end
    
        //STALL condition
        else if( ((IF_ID_rs1 == ID_EX_rd) || (IF_ID_rs2 == ID_EX_rd)) && (ID_EX_memRead == 1'b1) && (ID_EX_rd != 5'b00000) )
        begin
            contol_signals_select <= 1'b0;
        end
        
        //NO STALL
        else
        begin
            contol_signals_select <= 1'b1;
        end
    end
    
endmodule
