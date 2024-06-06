module ID (
    input clk, rst_n, regWEn,
    input [31:0] inst,
    input [31:0] WB_Data,
    output [31:0] imm,
    output [31:0] DataA, DataB
    output [6:0] opcode, func7,
    output [2:0] func3
);
    wire [4:0] rs1, rs2, rd;

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