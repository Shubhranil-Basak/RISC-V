`include "INST_MEM.v"

module IFU (
    input clk, reset,
    output [31:0] Instruction
);
    reg [31:0] PC = 32'b0;

    INST_MEM inst_mem (
        .PC(PC),
        .reset(reset),
        .Instruction(Instruction)
    );

    always @(posedge clk or posedge reset) begin
        PC <= reset ? 32'b0 : PC + 32'd4;
    end
endmodule