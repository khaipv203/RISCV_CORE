module control_block (
    input [6:0] opcode, func7,
    input [2:0] func3,
    output reg [3:0] ALUop,
    output reg regWEn,
    output reg BSel
);  

    //opcode parameter
    localparam R_Type = 7'b0110011;
    localparam I_Format = 7'b0010011;
    // localparam R_Type = 7'b0110011;
    // localparam R_Type = 7'b0110011;

    localparam func7_sub_SRA = 7'b0100000;
    localparam func7_nor = 7'b0000000;


    localparam func3_ADD = 3'b000;
    localparam func3_XOR = 3'b100;
    localparam func3_OR = 3'b110;
    localparam func3_AND = 3'b111;
    localparam func3_SLL = 3'b001;
    localparam func3_SR = 3'b101;
    localparam func3_SLT = 3'b010;


    reg [16:0] ALU_Param;
    assign ALU_Param = {opcode, func7, func3};

    //ALUop parameter
    localparam ADD_op = 4'b0000;
    localparam SUB_op = 4'b0001;
    localparam AND_op = 4'b0010;
    localparam OR_op = 4'b0011;
    localparam XOR_op = 4'b0100;
    localparam SLL_op = 4'b0101; //Shift Left Logical
    localparam SRL_op = 4'b0110; //Shift Right Logical 
    localparam SRA_op = 4'b0111; //Shift Right Arith

////////////////////////////////////////////////////////////////////////////////

    always @(opcode or func7 or func3) begin
        case (opcode)
            R_Type: begin
                regWEn <= 1;
                BSel <= 0;
                if(func7 == func7_nor) begin
                    case (func3)
                        func3_ADD: ALUop <= ADD_op;
                        func3_XOR: ALUop <= XOR_op;
                        func3_AND: ALUop <= AND_op;
                        func3_SLL: ALUop <= SLL_op;
                        func3_SR: ALUop <= SRL_op;
                        default: ALUop <= 4'b0;
                    endcase
                end
                else begin
                    case (func3)
                        func3_ADD: ALUop <= SUB_op;  
                        func3_SR: ALUop <= SRA_op;
                        default: ALUop <= 4'b0;
                    endcase
                end
            end
            I_Format: begin
                regWEn <= 1;
                BSel <= 1;
                case (func3)
                    func3_ADD: ALUop <= ADD_op;
                    func3_XOR: ALUop <= XOR_op;
                    func3_AND: ALUop <= AND_op;
                    func3_SLL: ALUop <= SLL_op;
                    func3_SR: begin
                        if(func7 == func7_sub_SRA) ALUop <= SRA_op;
                        else ALUop <= SRL_op;
                    end 
                    default: ALUop <= 4'b0;
                endcase
            end    
        endcase
    end
        

endmodule