`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2020 15:52:07
// Design Name: 
// Module Name: PC_Select_MUX
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


module PC_Select_MUX(
    input [31:0] PC_curr,
    input [31:0] immData,
    input [1:0] PCSrc,
    output reg [31:0] PC_next
    );
    
    always@(*)
    begin
        if(PCSrc == 2'b00)
        begin
            PC_next <= PC_curr + 4;
        end
        
        else if(PCSrc === 2'b01)
        begin
            PC_next <= PC_curr + immData;
        end
        
        //else if(PCSrc == 2'b10)
        //PC_next <= output of branch predictor
    end
    
endmodule
