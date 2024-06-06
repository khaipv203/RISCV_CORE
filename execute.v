module EX (
    input [31:0] DataA, DataB,
    input [1:0] ASel,
    input [1:0] BSel,
    input BrUn,
    input [31:0] pc,
    input [31:0] imm,
    input [3:0] ALUop
    output BrEq,
    output BrLT,
    output [31:0] ALU_out,
);
    wire [31:0] op1, op2;

    branch_comparator BC
    (
        //input
        .DataA(DataA),
        .DataB(DataB), 
        .BrUn(BrUn),

        //output
        .BrEq(BrEq),
        .BrLT(BrLT)
    );

    ALU_Sel AS
    (
        //input
        .imm(imm), 
        .pc(pc),
        .DataA(DataA), 
        .DataB(DataB),
        .ASel(ASel), 
        .BSel(BSel), 

        //output
        .op1(op1), 
        .op2(op2)
    );

    
    ALU alu_block
    (
        //input
        .ALUop(ALUop), 
        .op1(op1), 
        .op2(op2), 

        //output
        .ALU_out(ALU_out)
    );      
endmodule