module reg_file (
    input clk, rst_n,
    input [31:0] inst,
    input regWEn,
    input [31:0] DataD, //data in addr_rd
    output reg [31:0] DataA, DataB //data in addr_rs1 and addr_rs2

);
    reg [31:0] reg_file [31:0];
    wire [4:0] addr_rs1, addr_rs2, addr_rd;
    assign addr_rd = inst[11:7];
    assign addr_rs1 = inst[19:15];
    assign addr_rs2 = inst[24:20];
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            DataA <= 0;
            DataB <= 0;
            reg_file[0] <= 0;
            reg_file[1] <= 0;
            reg_file[2] <= 0;
            reg_file[3] <= 0;
            reg_file[4] <= 0;
            reg_file[5] <= 0;
            reg_file[6] <= 0;
            reg_file[7] <= 0;
            reg_file[8] <= 0;
            reg_file[9] <= 0;
            reg_file[10] <= 0;
            reg_file[11] <= 0;
            reg_file[12] <= 0;
            reg_file[13] <= 0;
            reg_file[14] <= 0;
            reg_file[15] <= 0;
            reg_file[16] <= 10;
            reg_file[17] <= 0;
            reg_file[18] <= 0;
            reg_file[19] <= 0;
            reg_file[20] <= 0;
            reg_file[21] <= 0;
            reg_file[22] <= 0;
            reg_file[23] <= 0;
            reg_file[24] <= 0;
            reg_file[25] <= 0;
            reg_file[26] <= 0;
            reg_file[27] <= 0;
            reg_file[28] <= 0;
            reg_file[29] <= 0;
            reg_file[30] <= 0;
            reg_file[31] <= 0;
        end
        else begin
            DataA <= reg_file[addr_rs1];
            DataB <= reg_file[addr_rs2];
        end
    end
    always @(DataD) begin
        if(regWEn) begin
                reg_file[addr_rd] <= DataD;
            end
            else begin
                reg_file[addr_rd] <= reg_file[addr_rd];
            end
    end
endmodule