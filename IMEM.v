module inst_mem (
    input rst_n,
    input [31:0] pc_addr,
    output [31:0] inst
);
    reg [31:0] mem_cell [9:0];
    always @(negedge rst_n) begin
        if(!rst_n) begin
            mem_cell[0] <= 32'b00000001000001111000011110110011;
            mem_cell[1] <= 32'b00000001000001111000111010110011;   
            mem_cell[2] <= 32'b0;
            mem_cell[3] <= 32'b0;
            mem_cell[4] <= 32'b0;
            mem_cell[5] <= 32'b0;
            mem_cell[6] <= 32'b0;
            mem_cell[7] <= 32'b0;
            mem_cell[8] <= 32'b0;
            mem_cell[9] <= 32'b0;
        end
        else begin
            mem_cell[0] <= mem_cell[0];
            mem_cell[0] <= mem_cell[0];
            mem_cell[0] <= mem_cell[0];
            mem_cell[0] <= mem_cell[0];
            mem_cell[0] <= mem_cell[0];
            mem_cell[0] <= mem_cell[0];
            mem_cell[0] <= mem_cell[0];
            mem_cell[0] <= mem_cell[0];
            mem_cell[0] <= mem_cell[0];
            mem_cell[0] <= mem_cell[0];
        end
    end
    assign inst = {mem_cell[pc_addr]};
endmodule