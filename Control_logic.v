module control_block (
    input [31:0] inst,
    output reg [3:0] ALUop,
    output reg regWEn
);  
    //opcode parameter
    localparam R_Type = 7'b0110011;
    localparam I_Format = 7'b0010011;
    // localparam R_Type = 7'b0110011;
    // localparam R_Type = 7'b0110011;

    //{funct7, funct3} parameter
    localparam ADD = 10'b0000000000;
    localparam SUB = 10'b0100000000;
    localparam OR = 10'b0000000110;
    localparam AND = 10'b0000000111;

    //ALUop parameter
    localparam AND_op = 4'b0000;
    localparam OR_op = 4'b0001;
    localparam SUB_op = 4'b0110;
    localparam ADD_op = 4'b0010;

////////////////////////////////////////////////////////////////////////////////

    wire [6:0] func7, opcode;
    wire [2:0] func3;
    assign func7 = inst[31:25];
    assign func3 = inst[14:12];
    assign opcode = inst[6:0];
    always @(inst) begin
        if((opcode == R_Type)|(opcode == I_Format)) begin
            regWEn <= 1;
        end
        else begin
            regWEn <= 0;
        end
    end
    always @(inst) begin
        if({func7,func3} == ADD) begin
            ALUop <= ADD_op;
        end
        else if ({func7,func3} == SUB) begin
            ALUop <= SUB_op;
        end
        else if ({func7,func3} == OR) begin
            ALUop <= OR_op;
        end
        else if ({func7,func3} == AND) begin
            ALUop <= AND_op;
        end
        else begin
            ALUop <= 4'b1111;
        end
    end
endmodule