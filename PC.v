module PC (
    input clk, rst_n,
    output reg [31:0] pc_addr
);
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            pc_addr <= 32'h00000000;
        end
        else begin
            pc_addr = pc_addr + 1;
        end
    end
endmodule