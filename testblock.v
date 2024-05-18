`timescale 1ps/1ps
module testblock (
);  
    reg clk, rst_n;
    wire [31:0] inst, pc;
    wire [3:0] ALUop;
    wire regWEn;
    wire [4:0] rs1, rs2, rd;
    wire [6:0] opcode;
    wire [2:0] func3;
    wire [6:0] func7;
    //reg [31:0] op1, op2;
    wire [31:0] ALU_out; 
    wire [31:0] DataA, DataB;
    PC pc_block(.clk(clk), .rst_n(rst_n), .pc(pc));
    inst_mem IMEM(.rst_n(rst_n), .pc(pc), .inst(inst));
    inst_decode ID(.inst(inst), .rs1(rs1), .rs2(rs2), .rd(rd), .opcode(opcode), .func3(func3), .func7(func7));
    reg_file reg_block(.clk(clk), .rst_n(rst_n), .regWEn(regWEn), .DataD(ALU_out), .rs1(rs1), .rs2(rs2), .rd(rd), .DataA(DataA), .DataB(DataB));
    ALU alu_block(.ALUop(ALUop), .op1(DataA), .op2(DataB), .ALU_out(ALU_out));
    control_block ctrl_unit(.opcode(opcode), .func3(func3), .func7(func7), .ALUop(ALUop), .regWEn(regWEn));
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