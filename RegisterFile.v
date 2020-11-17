`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2020 12:57:28
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input rst_n,
    input [4:0] read_addr1,
    input [4:0] read_addr2,
    input regWrite,
    input [4:0] write_addr,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2
    );
    
    reg [31 : 0] registers [0 : 31];
    
    assign read_data1 = registers[read_addr1];
    assign read_data2 = registers[read_addr2];
    
    always@(*)
    begin
        if(rst_n == 1'b0)
        begin
            registers[0] <= 0;
            registers[1] <= 0;
            registers[2] <= 0;
            registers[3] <= 0;
            registers[4] <= 0;
            registers[5] <= 0;
            registers[6] <= 0;
            registers[7] <= 0;
            registers[8] <= 0;
            registers[9] <= 0;
            registers[10] <= 0;
            registers[11] <= 0;
            registers[12] <= 0;
            registers[13] <= 0;
            registers[14] <= 0;
            registers[15] <= 0;
            registers[16] <= 0;
            registers[17] <= 0;
            registers[18] <= 0;
            registers[19] <= 0;
            registers[20] <= 0;
            registers[21] <= 0;
            registers[22] <= 0;
            registers[23] <= 0;
            registers[24] <= 0;
            registers[25] <= 0;
            registers[26] <= 0;
            registers[27] <= 0;
            registers[28] <= 0;
            registers[29] <= 0;
            registers[30] <= 0;
            registers[31] <= 0;
        end
        
        else if(regWrite == 1'b1 && write_addr != 5'b00000)
        begin
            registers[write_addr] <= write_data;
        end
    end
    
endmodule
