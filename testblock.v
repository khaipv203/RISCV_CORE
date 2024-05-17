`timescale 1ps/1ps
module testblock (
);  
    reg clk, rst_n;
    wire [31:0] inst, pc_addr;
    wire [3:0] ALUop;
    wire regWEn;
    //reg [31:0] op1, op2;
    wire [31:0] ALU_out, DataA, DataB; 
    PC pc_block(.clk(clk), .rst_n(rst_n), .pc_addr(pc_addr));
    inst_mem IMEM(.rst_n(rst_n), .pc_addr(pc_addr), .inst(inst));
    reg_file reg_block(.clk(clk), .rst_n(rst_n), .regWEn(regWEn), .DataD(ALU_out), .inst(inst), .DataA(DataA), .DataB(DataB));
    ALU alu_block(.ALUop(ALUop), .op1(DataA), .op2(DataB), .ALU_out(ALU_out));
    control_block ctrl_unit(.inst(inst), .ALUop(ALUop), .regWEn(regWEn));
    always #1 clk = ~clk;
    initial begin
        clk = 0;
        rst_n = 1; #2;
        rst_n = 0; #2;
        rst_n = 1; #2;

        //ALUop = 4'b0001;
        //inst = 32'b00000001000001111000111010110011;
        // op1 = 6;
        // op2 = 8;
    end
endmodule