module EX (
    ports
);
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