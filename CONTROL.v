module CONTROL (
    input [6:0] func7,
    input [2:0] func3,
    input [6:0] opcode,
    output reg [3:0] alu_op,
    output reg RegWrite
);

    always @ (func3 or func7 or opcode) begin
        if(opcode == 7'b0110011)begin
            RegWrite = 1;

            case(func3)
            0: begin
                if(func7 == 0) alu_op = 4'b0010;
                else if(func7 == 32) alu_op = 4'b0100;
            end
            6: alu_op = 4'b0001;
            7: alu_op = 4'b0000;
            1: alu_op = 4'b0011;
            5: alu_op = 4'b0101;
            2: alu_op = 4'b0110;
            4: alu_op = 4'b0111;
            endcase
        end
    end
endmodule