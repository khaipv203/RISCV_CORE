module ID (

);
    Imm_Gen IMG
    (
        //input
        .inst(inst), 
        
        //output
        .imm(imm)
    );


    inst_decode ID
    (
        //input
        .inst(inst), 
        .rs1(rs1), 
        .rs2(rs2), 
        .rd(rd), 

        //output
        .opcode(opcode), 
        .func3(func3), 
        .func7(func7)
    );


    reg_file reg_block
    (   
        //input
        .clk(clk), 
        .rst_n(rst_n), 
        .regWEn(regWEn), 
        .DataD(WB_Data), 
        .rs1(rs1), 
        .rs2(rs2), 
        .rd(rd), 

        //output
        .DataA(DataA), 
        .DataB(DataB)
    );
endmodule