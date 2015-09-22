module logic2048(clk, rst, calc_done, random, random_clk, initial_board, restrected, restrect_prob, stuck, filledBoard, storedBoard, mergedBoard, state, random_clk);
    input clk, rst;
    input [1:0] restrected;
    input [2:0] restrect_prob;
    output calc_done, stuck, random_clk;
    reg calc_done, stuck, random_clk;
    input [22:0] random;
    input [79:0] initial_board;
    output [79:0] filledBoard, storedBoard, mergedBoard;//for debug
    output [2:0] state;
    wire [79:0] filledBoard, storedBoard, mergedBoard;
    wire [79:0] ramIn;
    wire [79:0] ramOut;
    wire fillDone, rstFill, movable;
    wire [7:0] movSeq;
    wire [1:0] movDir;
    reg [1:0] movDirP;
    reg ramClk;
    reg [2:0] state;
    reg [1:0] storeSelect;
    fillEmptyCell boardFill(.cell_all_in(storedBoard), .cell_all_out(filledBoard), .random_pos(random[3:0]), .random_prob(random[9:4]), .calc_done(fillDone));
    boardRam ram(.clk(ramClk), .wren(1'b1), .data(ramIn), .q(storedBoard));
    restrectedMovSeq movGen(.restrected(restrected), .prob(restrect_prob), .random(random[22:10]), .outSeq(movSeq));
    mergeBoard mBoard(.board_in(storedBoard), .movDir(movDir), .movable(movable), .board_after(mergedBoard));
    select2From8 selDir(.X_all(movSeq), .pos(movDirP), .ans(movDir));
    selectBoard selBoard(.num(storeSelect), .X0_all(initial_board), .X1_all(filledBoard), .X2_all(mergedBoard), .Y_all(ramIn));
    always @(posedge clk) begin
        if(rst) begin
            movDirP <= 0;
            calc_done <= 0;
            stuck <= 0;
            storeSelect <= 0;
            ramClk <= 0;
            random_clk <= 0;
            state <= 0;
        end else begin
            if(state == 0) begin
                calc_done <= 0;
                stuck <= 0;
                ramClk <= 1;
                state <= 1;
            end else if(state == 1) begin
                calc_done <= 0;
                storeSelect <= 1;
                movDirP <= 0;
                state <= 2;
            end else if(fillDone == 1 && state == 2) begin
                ramClk <= 1; //write when posedge clk
                state <= 3;
            end else begin
                //wait for filling
                random_clk <= 1;
            end
            if(state == 3) begin
                if(movDirP != 2'd3) begin
                    if (movable) begin
                        storeSelect <= 2;
                        state <= 4;
                    end else begin
                        movDirP <= movDirP + 2'd1;
                    end
                end else begin
                    if (movable) begin
                        storeSelect <= 2;
                        state <= 4;
                    end else begin
                        stuck <= 1;
                        calc_done <= 1;
                        state <= 6;
                    end
                end
            end else if(state == 4) begin
                ramClk <= 1;
                calc_done <= 1;
                state <= 1;
            end
        end
    end
    always @(negedge clk) begin
        ramClk <= 0;
        random_clk <= 0;
    end
endmodule
