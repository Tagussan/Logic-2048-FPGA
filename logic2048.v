module logic2048(clk, rst, calc_done, random, initial_board, restrected, restrectProb, stuck);
    input clk, rst;
    input [1:0] restrected;
    input [2:0] restrectProb;
    output calc_done, stuck;
    reg calc_done, stuck;
    input random;
    input [79:0] initial_board;
    wire [79:0] filledBoard, storedBoard, mergedBoard;
    wire ramClk, fillDone, rstFill, movable;
    wire [7:0] movSeq;
    wire [1:0] movDir;
    reg [1:0] movDirP;
    fillEmptyCell boardFill(.cell_all_in(storedBoard), .cell_all_out(filledBoard), .random_pos(), .random_prob(), .calc_done(fillDone));
    boardRam ram(.board_all(storedBoard), .clk(ramClk), .rst(rst), .data_in(mergedBoard));
    restrectedMovSeq movGen(.restrected(restrected), .prob(restrectProb), .random(), .outSeq(movSeq));
    mergeBoard mBoard(.board_in(filledBoard), .movDir(movDir), .movable(movable), .board_after(mergedBoard));
    select2From8 sel(.X_all(movSeq), .pos(movDirP), .ans(movDir));
    always @(clk) begin
        if(rst) begin
            movDirP <= 0;
            calc_done <= 0;
            rstFill <= 1;
            stuck <= 0;
        end else begin
            rstFill <= 0;
            if(fillDone) begin
                if(movDirP != 2'd3) begin
                    if (movable) begin
                        ramClk <= 1;
                        calc_done <= 1;
                    end else begin
                        movDirP <= movDirP + 1;
                    end
                end else begin
                    if (movable) begin
                        ramClk <= 1;
                        calc_done <= 1;
                    end else begin
                        stuck <= 1;
                        calc_done <= 1;
                    end
                end
            end else begin
                //wait for filling
            end
        end
    end
endmodule
