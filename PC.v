module PC (
    input clk, rst_n,
    output reg [31:0] pc
);  
    reg [31:0] pc_next;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            pc_next <= 32'h00000000;
        end
        else if(pc_next < 9) begin
            pc_next = pc_next + 1;
        end
        else begin
            pc_next <= 32'h00000004;
        end
    end
    always @(posedge clk) begin
        pc <= pc_next;
    end
endmodule