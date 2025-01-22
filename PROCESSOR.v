`include "CONTROL.v"
`include "DATAPATH.v"
`include "IFU.v"

module PROCESSOR( 
    input clk, 
    input reset,
    output zero
);

    wire [31:0] Instruction;
    wire [3:0] alu_control;
    wire regwrite;

    IFU IFU_module(.clk(clk), .reset(reset), .Instruction(Instruction));

    CONTROL control_module(Instruction[31:25], Instruction[14:12],Instruction[6:0], alu_control, regwrite);

    DATAPATH datapath_module(Instruction[19:15], Instruction[24:20], Instruction[11:7], alu_control, regwrite, clk, reset, zero);
endmodule