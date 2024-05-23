module ALU_Sel (
    input [31:0] imm, pc, DataA, DataB,
    // input ASel, BSel,
    input ASel, BSel,
    output [31:0] op1, op2
);
    localparam other_sel = 1'b1;
    localparam data_sel = 1'b0;
    assign op2 = (BSel == other_sel) ? imm : DataB;
    assign op1 = (ASel == other_sel) ? pc : DataA;
endmodule