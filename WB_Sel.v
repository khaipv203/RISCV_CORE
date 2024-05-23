module wb_sel (
    input [1:0] WBsel,
    input [31:0] ALU_out, data_out, 
    output [31:0] WB_Data
);
    localparam DataR = 2'b00;
    localparam ALU = 2'b01;
    localparam Addr = 2'b10;
    
    assign WB_Data = (WBsel == DataR) ? data_out :
                     (WBsel == ALU) ? ALU_out : 32'b0;
endmodule