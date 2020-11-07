`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 07:13:18
// Design Name: 
// Module Name: memToReg_Mux
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


module memToReg_Mux(
    input [31:0] ALU_result,
    input [31:0] dmem_read_data,
    input memToReg,
    output [31:0] memToReg_Mux_output
    );
    
    assign memToReg_Mux_output = (memToReg == 1'b0) ? ALU_result : dmem_read_data;
    
endmodule
