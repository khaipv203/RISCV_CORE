module ALU_Sel (
    input [31:0] imm, DataA, DataB,
    // input ASel, BSel,
    input BSel,
    output [31:0] op1, op2
);
    assign op2 = (BSel == 1) ? imm : DataB;
    assign op1 = DataA;
endmodule