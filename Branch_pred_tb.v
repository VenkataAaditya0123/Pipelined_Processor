`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2020 11:11:12
// Design Name: 
// Module Name: Branch_pred_tb
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


module Branch_pred_tb(

    );
   // reg clk;
    reg rst_n;
    reg [31:0] instrCode;
    reg actual_outcome;
    reg branch_EX_done;
    wire prediction;
    
    Corr_branch_pred BP1(rst_n,instrCode,actual_outcome,branch_EX_done,prediction);
    
    initial begin
        rst_n=1'b0; //instrCode = 32'h00000000; //clk = 0;
        #3 rst_n=1'b1;  //#3 rst_n=1'b1;
        #5 instrCode = 32'h0000000C;    #5 branch_EX_done=1; actual_outcome = 1;
        #3 branch_EX_done=0;
        #5 instrCode = 32'h00000008;    #5 branch_EX_done=1; actual_outcome = 0;
        #3 branch_EX_done=0;
        #5 instrCode = 32'h0000002C;    #5 branch_EX_done=1; actual_outcome = 0;
        #3 branch_EX_done=0;
        #5 instrCode = 32'h0000006C;    #5 branch_EX_done=1; actual_outcome = 0;
        #3 branch_EX_done=0;
        #5 instrCode = 32'h00000000;    #5 branch_EX_done=1; actual_outcome = 0;
        #3 branch_EX_done=0;
        #5 instrCode = 32'h0000002C;    #5 branch_EX_done=1; actual_outcome = 0;
        #3 branch_EX_done=0;
        #20 $finish;
    end
    
    //always #5 clk = ~clk;
endmodule
