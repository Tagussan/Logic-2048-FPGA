`timescale 1ns/1ns
module tb_fillEmptyCell();
    parameter STEP = 20;
    reg [79:0] cell_all_in;
    wire [79:0] cell_all_out;
    wire full;
    wire calc_done;
    reg [3:0] random_pos;
    fillEmptyCell filler(.cell_all_in(cell_all_in), .cell_all_out(cell_all_out), .random_prob(6'b1), .random_pos(random_pos), .calc_done(calc_done));
    initial begin
        $dumpfile("fillEmptyCell.vcd");
        $dumpvars(0, tb_fillEmptyCell);
        cell_all_in = {{13{5'd1}}, {3{5'd0}}};
#STEP   random_pos = 10;
#STEP   random_pos = 12;
#STEP   random_pos = 0;
#STEP   random_pos = 1;
#STEP   random_pos = 2;
#STEP   random_pos = 1;
        $dumpflush;
        $finish;
    end
endmodule
