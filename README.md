# Pipelined_Processor
Implementation of RISC-V Pipelined processor in Verilog

## Features
There are 5 Pipeline stages:
1. Instruction Fetch
2. Instruction Decode
3. Execution
4. Memory
5. Write Back

Currently available instructions: 
R type - AND, OR, ADD, SUB, SLL, SRL, SRA, XOR, SLT 
I type - lw, addi
S type - sw
SB type - beq
J type - jal
The processor also includes Data Forwarding and a Correlating Branch Predictor.

The top-level description and instantiations can be found in toplevel1.v file.
