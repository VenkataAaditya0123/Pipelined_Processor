`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2020 17:41:03
// Design Name: 
// Module Name: Corr_branch_pred
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


//(2,1) correlating branch predictor
//(0) -> Not Taken          (1) -> Taken
module Corr_branch_pred(
  //  input clk,
    input [31 : 0] PC,
    input [31 : 0] PC_prev,
    input rst_n, 
    input [31:0] instrCode,
    input actual_outcome,       //To modify contents
    input branch_EX_done,       //A control signal to indicate EX unit is sending actual_outcome result to this unit
    output reg prediction
    );
    reg [1:0] BHT_reg[0:15];    //16-entry Branch History Table, each entry of 2-bits
    reg global_shift_reg;       //1-bit shift register to analyze previous 1 branch
    integer cnt;
    reg [2:0] branch_index_bits;
    reg [3:0] index;
    
    reg [3:0] index_prev;
    reg [2 : 0] branch_index_bits_prev;
    //reg update;
   always@(PC)
   begin
     branch_index_bits = PC[4:2];
     index = {global_shift_reg,branch_index_bits};   
     prediction = BHT_reg[index][1];
     
     branch_index_bits_prev = PC_prev[4 : 2];
     index_prev = {global_shift_reg,branch_index_bits_prev};
   end
    //assign prediction = BHT_reg[index][1];
   // assign update = actual_outcome;
    always@(*)
    begin
        if(rst_n==1'b0)
        begin
            for(cnt = 0; cnt<16; cnt=cnt+1)
            begin
                BHT_reg[cnt] <= 2'b11;   //Initially predict Taken      
            end
            global_shift_reg <= 1'b0;   //Initially 0
        end
        
        else if(actual_outcome == 1'b0 && branch_EX_done == 1'b1)
        begin
            if(BHT_reg[index_prev] != 2'b00)
            begin
                BHT_reg[index_prev] = BHT_reg[index_prev]-1;
                $display("1 %d %d", PC_prev, BHT_reg[index_prev]);
            end
            
            global_shift_reg = 0;
         //   update = 1'bx;
        end
        
        else if(actual_outcome == 1'b1 && branch_EX_done == 1'b1)
        begin
            if(BHT_reg[index_prev] != 2'b11)
            begin
                BHT_reg[index_prev] = BHT_reg[index_prev]+1;
                $display("2 %d %d", PC_prev, BHT_reg[index_prev]);
            end
            
            global_shift_reg = 1;
           // update = 1'bx;
        end
    end

endmodule
