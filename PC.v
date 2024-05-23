module PC (
    input clk, rst_n,
    output reg [31:0] pc
);  
    reg [31:0] pc_next;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            pc_next <= 32'h00000000;
        end
        else if(pc_next > 32'h00000023) begin
            pc_next <= 32'h0000000C;
        end
        else begin
            pc_next <= pc_next + 4;
            pc <= pc_next;
        end
    end
endmodule