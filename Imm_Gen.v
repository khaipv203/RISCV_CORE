module Imm_Gen (
    input [31:0] inst,
    output reg [31:0] imm
);
    wire [6:0] opcode;
    assign opcode = inst[6:0];

    always @(inst) begin
        case (opcode)
            7'b0010011: imm = {{20{inst[31]}}, inst[31:20]}; // I-type
            7'b0100011: imm = {{20{inst[31]}}, inst[31:25], inst[11:7]}; // S-type
            7'b1100011: imm = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0}; // B-type
            default: imm = 0;
        endcase
    end
endmodule