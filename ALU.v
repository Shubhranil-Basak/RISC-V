/*
ALU Control lines | Function
-----------------------------
        0000    Bitwise-AND
        0001    Bitwise-OR
        0010	Add (A+B)
        0100	Subtract (A-B)
        1000	Set on less than
        0011    Shift left logical
        0101    Shift right logical
        0110    Multiply
        0111    Bitwise-XOR
*/

module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUControl,
    output reg [31:0] ALUResult,
    output reg Zero
);
    always @(*)begin
        case(ALUControl)
        4'b0000: ALUResult = A & B;
        4'b0001: ALUResult = A | B;
        4'b0010: ALUResult = A + B;
        4'b0100: ALUResult = A - B;
        4'b1000: ALUResult = (A < B) ? 1 : 0;
        4'b0011: ALUResult = A << B;
        4'b0101: ALUResult = A >> B;
        4'b0110: ALUResult = A * B;
        4'b0111: ALUResult = A ^ B;
    endcase
    Zero = (ALUResult == 0) ? 1 : 0;
    end
endmodule