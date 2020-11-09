`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2020 07:43:41
// Design Name: 
// Module Name: Forwarding_Control_Unit
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


module Forwarding_Control_Unit(
    input [4:0] ID_EX_rs1,
    input [4:0] ID_EX_rs2,
    input [4:0] EX_MEM_rd,
    input EX_MEM_regWrite,
    input [4:0] MEM_WB_rd,
    input MEM_WB_regWrite,
    output reg [1:0] ForwardingMUX1_select,
    output reg [1:0] ForwardingMUX2_select
    );
    
    
    //ForwardingMUX1_select
    always@(*)
    begin
    
        //EX hazard
        if( (ID_EX_rs1 == EX_MEM_rd) && (EX_MEM_regWrite == 1'b1) && (EX_MEM_rd != 5'b00000) )
        begin
            ForwardingMUX1_select <= 2'b01;
        end
        
        //~(EX hazard) && (MEM hazard)
        else if( (ID_EX_rs1 == MEM_WB_rd) && (MEM_WB_regWrite == 1'b1) && (MEM_WB_rd != 5'b00000) )
        begin
            ForwardingMUX1_select <= 2'b10;
        end
        
        //NO EX OR MEM HAZARD
        else
        begin
            ForwardingMUX1_select <= 2'b00;
        end
        
    end
    
    
    
    
    //ForwardingMUX2_select
    always@(*)
    
    begin
        //EX hazard
        if( (ID_EX_rs2 == EX_MEM_rd) && (EX_MEM_regWrite == 1'b1) && (EX_MEM_rd != 5'b00000) )
        begin
            ForwardingMUX2_select <= 2'b01;

        end
        
        //~(EX hazard) && (MEM hazard)
        else if( (ID_EX_rs2 == MEM_WB_rd) && (MEM_WB_regWrite == 1'b1) && (MEM_WB_rd != 5'b00000) )
        begin
            ForwardingMUX2_select <= 2'b10;
        end
        
        //NO EX OR MEM HAZARD
        else
        begin
            ForwardingMUX2_select <= 2'b00;
        end
         
    end
    
    
    
endmodule
