module ALU (
    input [3:0] ALUop, 
    input [31:0] op1, op2,
    output reg [31:0] ALU_out
);
    localparam AND_op = 4'b0000;
    localparam OR_op = 4'b0001;
    localparam SUB_op = 4'b0110;
    localparam ADD_op = 4'b0010;

    always @(op1 or op2 or ALUop) begin
        case (ALUop)
            ADD_op: begin
                ALU_out <= (op1 + op2);
            end
            SUB_op: begin
                ALU_out <= (op1 - op2);
            end
            OR_op: begin
                ALU_out <= (op1 | op2);
            end
            AND_op: begin
                ALU_out <= (op1 & op2);
            end
            default: begin
                ALU_out <= ALU_out;
            end
        endcase
        // if(ALUop == AND_op) ALU_out <= op1 & op2;
        // else if(ALUop == OR_op) ALU_out <= op1 | op2;
        // else if(ALUop == ADD_op) ALU_out <= op1 + op2;
        // else if(ALUop == SUB_op) ALU_out <= op1 - op2;
        // else ALU_out <= ALU_out;
    end
endmodule