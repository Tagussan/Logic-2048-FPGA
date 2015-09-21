`timescale 1ns/1ns
module tb_mergeBoard();
    parameter STEP = 20;
    reg [79:0] board_in;
    reg [1:0] movDir;
    wire movable;
    wire [79:0] board_after;
    mergeBoard mb(.board_in(board_in), .movDir(movDir), .movable(movable), .board_after(board_after));
    initial begin
        $dumpfile("tb_mergeBoard.vcd");
        $dumpvars(0, tb_mergeBoard);
#STEP   movDir = 0;
#STEP   board_in = {5'd3, {7{5'd0}},5'd1, 5'd2, 5'd3, 5'd3 ,5'd1, 5'd2, 5'd2, 5'd1};
#STEP   showBoardIn;
#STEP   showBoardAfter;
#STEP   movDir = 1;
#STEP   board_in = {5'd3, {7{5'd0}},5'd1, 5'd2, 5'd3, 5'd3 ,5'd1, 5'd2, 5'd2, 5'd1};
#STEP   showBoardIn;
#STEP   showBoardAfter;
#STEP   movDir = 2;
#STEP   board_in = {5'd3, {7{5'd0}},5'd1, 5'd2, 5'd3, 5'd3 ,5'd1, 5'd2, 5'd2, 5'd1};
#STEP   showBoardIn;
#STEP   showBoardAfter;
#STEP   movDir = 3;
#STEP   board_in = {5'd3, {7{5'd0}},5'd1, 5'd2, 5'd3, 5'd3 ,5'd1, 5'd2, 5'd2, 5'd1};
#STEP   showBoardIn;
#STEP   showBoardAfter;

        $dumpflush;
        $finish;
    end
    task showBoardAfter;
        begin
            $display("movDir:%d", movDir);
            $display("%d %d %d %d",board_after[19:15], board_after[14:10], board_after[9:5], board_after[4:0]);
            $display("%d %d %d %d",board_after[39:35], board_after[34:30], board_after[29:25], board_after[24:20]);
            $display("%d %d %d %d",board_after[59:55], board_after[54:50], board_after[49:45], board_after[44:40]);
            $display("%d %d %d %d",board_after[79:75], board_after[74:70], board_after[69:65], board_after[64:60]);
        end
    endtask
    task showBoardIn;
        begin
            $display("movDir:%d", movDir);
            $display("%d %d %d %d",board_in[19:15], board_in[14:10], board_in[9:5], board_in[4:0]);
            $display("%d %d %d %d",board_in[39:35], board_in[34:30], board_in[29:25], board_in[24:20]);
            $display("%d %d %d %d",board_in[59:55], board_in[54:50], board_in[49:45], board_in[44:40]);
            $display("%d %d %d %d",board_in[79:75], board_in[74:70], board_in[69:65], board_in[64:60]);
        end
    endtask
endmodule
