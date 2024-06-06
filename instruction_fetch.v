module IF (
    input clk, rst_n,
    input [31:0] pc_wb,
    input pc_sel,
    output [31:0] inst,
    output [31:0] pc,
    output [31:0] pc_added
);
    wire [31:0] pc_in;
    wire [31:0] pc_added_in;
    PC pc_block
    (
        //input
        .clk(clk), 
        .rst_n(rst_n), 
        .pc_sel(pc_sel),
        .pc_wb(ALU_out),
        .pc_added(pc_added_in),

        //output
        .pc(pc_in)
    );

    pc_adder PA
    (
        //input
        .pc(pc),
        
        //output
        .pc_added(pc_added_in)
    );

    inst_mem IMEM
    (
        //input
        .rst_n(rst_n), 
        .pc(pc_in), 

        //output
        .inst(inst)
    );

    assign pc = pc_in;
    assign pc_added = pc_added_in;
endmodule