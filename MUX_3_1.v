`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2020 07:57:20
// Design Name: 
// Module Name: MUX_3_1
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


module MUX_3_1(
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [1:0] select,
    output reg [31:0] out
    );
    
    always@(*)
    begin
        if(select == 2'b00)
        begin
            out <= in0;
        end
        
        else if(select == 2'b01)
        begin
            out <= in1;
        end
        
        else if(select == 2'b10)
        begin
            out <= in2;
        end
        
        else
        begin
            out <= 0;
        end
    end
    
endmodule
