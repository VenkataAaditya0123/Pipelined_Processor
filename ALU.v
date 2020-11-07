`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 04:38:48
// Design Name: 
// Module Name: ALU
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


module ALU(
    input rst_n, 
    input [31:0] operand1,
    input [31:0] operand2,
    input [3:0] operation,
    output reg [31:0] result,
    output zero
    );
    
    assign zero = (result == 0) ? 1'b1 : 1'b0;
    
    always@(*)
    begin
        if(rst_n == 1'b0)
        begin
            result <= 0;
        end
        
        else if(operation == 4'b0000) //AND
        begin
            result <= operand1 & operand2;
        end
        
        else if(operation == 4'b0001) //OR
        begin
            result <= operand1 | operand2;
        end
        
        else if(operation == 4'b0010) //ADD
        begin
            result <= operand1 + operand2;
        end
        
        else if(operation == 4'b0110)
        begin
            result <= operand1 - operand2;
        end
        
        //else if() --->>> add other operations
        
        else
        begin
            result <= 0;
        end
        
    end
    
endmodule
