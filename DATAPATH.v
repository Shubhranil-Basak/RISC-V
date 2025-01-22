`include "ALU.v"
`include "REG_FILE.v"

module DATAPATH (
    input [4:0] read_reg_1,
    input [4:0] read_reg_2,
    input [4:0] write_reg,
    input [3:0] ALUControl,
    input write_enable,
    input clk,
    input reset,
    output Zero
);
    
    wire [31:0] read_data_1, read_data_2, ALUResult;


    REG_FILE REG_FILE1(
        .read_reg_1(read_reg_1),
        .read_reg_2(read_reg_2),
        .write_reg(write_reg),
        .write_data(ALUResult),
        .write_enable(write_enable),
        .clk(clk),
        .reset(reset),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2)
    );

    
    ALU ALU1(
        .A(read_data_1),
        .B(read_data_2),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );
endmodule