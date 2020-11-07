`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2020 05:44:17
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input rst_n,
    input [31:0] read_addr,
    input [31:0] write_addr,
    input [31:0] write_data,
    input memRead,
    input memWrite,
    output [31:0] read_data
    );
    
    reg [7 : 0] dataMem [0 : 127];
    
    integer cnt;
    
    assign read_data = (memRead == 1'b1) ? {dataMem[read_addr + 3], dataMem[read_addr + 2], dataMem[read_addr + 1], dataMem[read_addr]} : 0;
    
    always@(*)
    begin
    
        if(rst_n == 1'b0)
        begin
            for(cnt = 0; cnt < 128; cnt = cnt + 1)
            begin
                dataMem[cnt] <= 0;
            end
        end
        
        else if(memWrite == 1'b1)
        begin
            dataMem[write_addr + 3] <= write_data[31 : 24];
            dataMem[write_addr + 2] <= write_data[23 : 16];
            dataMem[write_addr + 1] <= write_data[15 : 8];
            dataMem[write_addr] <= write_data[7 : 0];
        end
        
    end
    
endmodule
