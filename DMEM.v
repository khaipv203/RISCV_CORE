    module data_mem (
        input clk, rst_n, memRW,
        input [31:0] addr, data_in,
        output [31:0] data_out
    );
        reg [31:0] mem_cell [20];

        always @(posedge clk or negedge rst_n) begin
            if(!rst_n) begin
                mem_cell[0] <= 0;
                mem_cell[1] <= 0;
                mem_cell[2] <= 0;
                mem_cell[3] <= 0;
                mem_cell[4] <= 0;
                mem_cell[5] <= 0;
                mem_cell[6] <= 0;
                mem_cell[7] <= 0;
                mem_cell[8] <= 0;
                mem_cell[9] <= 0;
                mem_cell[10] <= 0;
                mem_cell[11] <= 0;
                mem_cell[12] <= 0;
                mem_cell[13] <= 0;
                mem_cell[14] <= 0;
                mem_cell[15] <= 0;
                mem_cell[16] <= 0;
                mem_cell[17] <= 0;
                mem_cell[18] <= 0;
                mem_cell[19] <= 0;
            end
            else begin //memRW = 0: Read, 1: Write
                if(memRW) begin
                    mem_cell[addr] <= data_in;
                end
                else begin
                    data_out <= mem_cell[addr];
                end
            end
        end
    endmodule