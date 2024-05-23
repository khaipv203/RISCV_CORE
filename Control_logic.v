module control_block (
    input [6:0] opcode, func7,
    input [2:0] func3,
    output reg [3:0] ALUop,
    output reg regWEn,
    output reg BSel,
    output reg [1:0] memRW,
    output reg [1:0] WBsel
);  

    //opcode parameter
    localparam R_Arith = 7'b0110011;
    localparam I_Arith = 7'b0010011;
    localparam I_Load = 7'b0000011;
    localparam S_Type = 7'b0100011;

    //func7_param
    localparam func7_sub_SRA = 7'b0100000;
    localparam func7_nor = 7'b0000000;

    //Arithmetic func3 param
    localparam func3_ADD = 3'b000;
    localparam func3_XOR = 3'b100;
    localparam func3_OR = 3'b110;
    localparam func3_AND = 3'b111;
    localparam func3_SLL = 3'b001;
    localparam func3_SR = 3'b101;
    localparam func3_SLT = 3'b010;

    //ALUop parameter
    localparam ADD_op = 4'b0000;
    localparam SUB_op = 4'b0001;
    localparam AND_op = 4'b0010;
    localparam OR_op = 4'b0011;
    localparam XOR_op = 4'b0100;
    localparam SLL_op = 4'b0101; //Shift Left Logical
    localparam SRL_op = 4'b0110; //Shift Right Logical 
    localparam SRA_op = 4'b0111; //Shift Right Arith

    //Reg_file enable param
    localparam enable_write = 1'b1;
    localparam disable_write = 1'b0;

    //memRW param
    localparam read_mem = 2'b01;
    localparam write_mem = 2'b10;
    localparam no_access = 2'b00;

    //WB param
    localparam data_mem_sel = 2'b00;
    localparam alu_out_sel = 2'b01;
    localparam pc_addr_sel = 2'b10;
    localparam no_WB = 2'b11;

    //ALU_B_sel param
    localparam imm_sel = 1'b1;
    localparam dataB_sel = 1'b0;
////////////////////////////////////////////////////////////////////////////////

    always @(opcode or func7 or func3) begin
        case (opcode)
            R_Arith: begin
                regWEn <= enable_write;
                BSel <= dataB_sel;
                WBsel <= alu_out_sel;
                memRW <= no_access;
                if(func7 == func7_nor) begin
                    case (func3)
                        func3_ADD: ALUop <= ADD_op;
                        func3_XOR: ALUop <= XOR_op;
                        func3_AND: ALUop <= AND_op;
                        func3_SLL: ALUop <= SLL_op;
                        func3_SR: ALUop <= SRL_op;
                        default: ALUop <= 4'b1111;
                    endcase
                end
                else begin
                    case (func3)
                        func3_ADD: ALUop <= SUB_op;  
                        func3_SR: ALUop <= SRA_op;
                        default: ALUop <= 4'b1111;
                    endcase
                end
            end
            I_Arith: begin
                regWEn <= enable_write;
                BSel <= imm_sel;
                WBsel <= alu_out_sel;
                memRW <= no_access;
                case (func3)
                    func3_ADD: ALUop <= ADD_op;
                    func3_XOR: ALUop <= XOR_op;
                    func3_AND: ALUop <= AND_op;
                    func3_SLL: ALUop <= SLL_op;
                    func3_SR: begin
                        if(func7 == func7_sub_SRA) ALUop <= SRA_op;
                        else ALUop <= SRL_op;
                    end 
                    default: ALUop <= 4'b1111;
                endcase
            end  
            I_Load: begin
                regWEn <= enable_write;
                BSel <= imm_sel;
                memRW <= read_mem;
                WBsel <= data_mem_sel;
                ALUop <= ADD_op;
            end  
            S_Type: begin
                WBsel <= no_WB;
                ALUop <= ADD_op;
                regWEn <= disable_write;
                memRW <= write_mem;
                BSel <= imm_sel;
            end
        endcase
    end
        

endmodule