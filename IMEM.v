module inst_mem (
    input rst_n,
    input [31:0] pc,
    output [31:0] inst
);
    reg [31:0] mem_cell [9:0];
    always @(negedge rst_n) begin
        if(!rst_n) begin
            mem_cell[0] <= 32'b01000000000101111101011110010011;//srai x15, x15, 1
            mem_cell[1] <= 32'b00000000000101111101011110010011;//srli x15, x15, 1
            mem_cell[2] <= 32'b00000000000101111001011110010011;//slli x15, x15, 1 = 8 + 8 = 16
            mem_cell[3] <= 32'b00000000000000000000000000110011;
            mem_cell[4] <= 32'b00000000000000000000000000110011; 
            mem_cell[5] <= 32'b00000000000000000000000000110011;
            mem_cell[6] <= 32'b00000000000000000000000000110011;
            mem_cell[7] <= 32'b00000000000000000000000000110011;
            mem_cell[8] <= 32'b00000000000000000000000000110011;
            mem_cell[9] <= 32'b00000000000000000000000000110011;
        end
        else begin
            mem_cell[0] <= mem_cell[0];
            mem_cell[1] <= mem_cell[1];
            mem_cell[2] <= mem_cell[2];
            mem_cell[3] <= mem_cell[3];
            mem_cell[4] <= mem_cell[4];
            mem_cell[5] <= mem_cell[5];
            mem_cell[6] <= mem_cell[6];
            mem_cell[7] <= mem_cell[7];
            mem_cell[8] <= mem_cell[8];
            mem_cell[9] <= mem_cell[9];
        end
    end
    assign inst = {mem_cell[pc]};
endmodule