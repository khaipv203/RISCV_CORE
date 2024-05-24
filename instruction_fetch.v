module IF (
    input clk, rst_n;
    
    input [31:0] pc_added;
    input pc_sel;
    output [31:0] inst;
);
    wire [31:0] pc;

    PC pc_block
    (
        //input
        .clk(clk), 
        .rst_n(rst_n), 
        .pc_sel(pc_sel),
        .pc_wb(ALU_out),
        .pc_added(pc_added),

        //output
        .pc(pc)
    );

    pc_adder PA
    (
        //input
        .pc(pc),
        
        //output
        .pc_added(pc_added)
    );

    inst_mem IMEM
    (
        //input
        .rst_n(rst_n), 
        .pc(pc), 

        //output
        .inst(inst)
    );

endmodule