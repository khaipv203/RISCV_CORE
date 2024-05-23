`timescale 1ps/1ps
module testblock (
);  
    reg clk, rst_n;
    wire [31:0] inst;
    wire [31:0] pc;
    wire [31:0] imm;
    wire [3:0] ALUop;
    wire regWEn; 
    wire BSel; 
    wire [1:0] memRW;
    wire [4:0] rs1;
    wire [4:0] rs2; 
    wire [4:0] rd;
    wire [6:0] opcode;
    wire [2:0] func3;
    wire [6:0] func7;
    wire [31:0] op1, op2;
    wire [31:0] ALU_out; 
    wire [31:0] DataA; 
    wire [31:0] DataB;
    wire [31:0] data_in;
    wire [31:0] data_out;
    wire [31:0] WB_Data;
    wire [1:0] WBsel;
    PC pc_block
    (
        //input
        .clk(clk), 
        .rst_n(rst_n), 

        //output
        .pc(pc)
    );


    inst_mem IMEM
    (
        //input
        .rst_n(rst_n), 
        .pc(pc), 

        //output
        .inst(inst)
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
        .DataD(ALU_out), 
        .rs1(rs1), 
        .rs2(rs2), 
        .rd(rd), 

        //output
        .DataA(DataA), 
        .DataB(DataB)
    );


    ALU_Sel AS
    (
        //input
        .imm(imm), 
        .DataA(DataA), 
        .DataB(DataB), 
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


    data_mem DM
    (
        //input
        .clk(clk), 
        .rst_n(rst_n), 
        .memRW(memRW), 
        .addr(ALU_out), 
        .data_in(data_in), 

        //output
        .data_out(data_out)
    );

    wb_sel WB
    (
        //input
        .WBsel(WBsel), 
        .ALU_out(ALU_out), 
        .data_out(data_out),

        //output 
        .WB_Data(WB_Data)
    );


    control_block ctrl_unit
    (
        //input
        .opcode(opcode), 
        .func3(func3), 
        .func7(func7), 

        //output
        .ALUop(ALUop), 
        .regWEn(regWEn), 
        .BSel(BSel), 
        .memRW(memRW), 
        .WBsel(WBsel));
    always #1 clk = ~clk;
    initial begin
        clk = 0;
        rst_n = 1; #20;
        rst_n = 0; #20;
        rst_n = 1;

        // ALUop = 4'b0001;
        // inst = 32'b00000001000001111000111010110011;
        // DataA = 6;
        // DataB = 8;
    end
endmodule