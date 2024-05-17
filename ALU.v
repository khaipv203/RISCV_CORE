module ALU (
    input [3:0] ALUop, 
    input [31:0] op1, op2,
    output [31:0] ALU_out
);
    localparam AND_op = 4'b0000;
    localparam OR_op = 4'b0001;
    localparam SUB_op = 4'b0110;
    localparam ADD_op = 4'b0010;

    
    assign    ALU_out = (ALUop == AND_op) ? (op1 & op2):
                (ALUop == OR_op) ? (op1 | op2):
                (ALUop == ADD_op) ? (op1 + op2):
                (ALUop == SUB_op) ? (op1 - op2): 32'b0;
endmodule