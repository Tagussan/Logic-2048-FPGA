module fillEmptyCell(cell_all_in, cell_all_out, random_pos, random_prob, calc_done);
    input [79:0] cell_all_in;
    output reg [79:0] cell_all_out;
    input [3:0] random_pos;
    input [5:0] random_prob;
    output reg calc_done;
    wire [79:0] mask;
    wire [4:0] selected_cell;
    assign mask = {80{1'b1}} ^ (5'b11111 << (5*random_pos));
    select5From80 bitsel1(.X_all(cell_all_in), .pos(random_pos), .ans(selected_cell));
    always @* begin
        if(selected_cell == 0) begin
            if(random_prob == 0) begin
                cell_all_out <= (mask & cell_all_in) | (5'b00100 << (5*random_pos));
            end else begin
                cell_all_out <= (mask & cell_all_in) | (5'b00010 << (5*random_pos));
            end
            calc_done <= 1;
        end else begin
            cell_all_out <= 80'bx;
            calc_done <= 0;
        end
    end
endmodule

module mergeBoard(board_in, movDir, movable, board_after);
    input [79:0] board_in;
    input [1:0] movDir;
    output movable;
    output [79:0] board_after;
    wire [79:0] rotated, merged;
    wire movable0, movable1, movabl2, movable3;
    rotateBoard rb(.X_all(board_in), .Y_all(rotated), .dir(movDir));
    unRotateBoard urb(.X_all(merged), .Y_all(board_after), .dir(movDir));
    logic2048SingleLine logicL0(.x0(rotated[4:0]), .x1(rotated[9:5]), .x2(rotated[14:10]), .x3(rotated[19:15]), .y0(merged[4:0]), .y1(merged[9:5]), .y2(merged[14:10]), .y3(merged[19:15]));
    logic2048SingleLine logicL1(.x0(rotated[24:20]), .x1(rotated[29:25]), .x2(rotated[34:30]), .x3(rotated[39:35]), .y0(merged[24:20]), .y1(merged[29:25]), .y2(merged[34:30]), .y3(merged[39:35]));
    logic2048SingleLine logicL2(.x0(rotated[44:40]), .x1(rotated[49:45]), .x2(rotated[54:50]), .x3(rotated[59:55]), .y0(merged[44:40]), .y1(merged[49:45]), .y2(merged[54:50]), .y3(merged[59:55]));
    logic2048SingleLine logicL3(.x0(rotated[64:60]), .x1(rotated[69:65]), .x2(rotated[74:70]), .x3(rotated[79:75]), .y0(merged[64:60]), .y1(merged[69:65]), .y2(merged[74:70]), .y3(merged[79:75]));
    assign movable = movable0 | movable1 | movable2 | movable3;
endmodule

module rotateBoard(X_all, Y_all, dir);
    input [79:0] X_all;
    input [1:0] dir;
    output reg [79:0] Y_all;
    always @* begin
        if (dir == 0) begin
            Y_all[4:0] <= X_all[4:0];
            Y_all[9:5] <= X_all[9:5];
            Y_all[14:10] <= X_all[14:10];
            Y_all[19:15] <= X_all[19:15];
            Y_all[24:20] <= X_all[24:20];
            Y_all[29:25] <= X_all[29:25];
            Y_all[34:30] <= X_all[34:30];
            Y_all[39:35] <= X_all[39:35];
            Y_all[44:40] <= X_all[44:40];
            Y_all[49:45] <= X_all[49:45];
            Y_all[54:50] <= X_all[54:50];
            Y_all[59:55] <= X_all[59:55];
            Y_all[64:60] <= X_all[64:60];
            Y_all[69:65] <= X_all[69:65];
            Y_all[74:70] <= X_all[74:70];
            Y_all[79:75] <= X_all[79:75];
        end else if (dir == 1) begin
            Y_all[4:0] <= X_all[4:0];
            Y_all[9:5] <= X_all[24:20];
            Y_all[14:10] <= X_all[44:40];
            Y_all[19:15] <= X_all[64:60];
            Y_all[24:20] <= X_all[9:5];
            Y_all[29:25] <= X_all[29:25];
            Y_all[34:30] <= X_all[49:45];
            Y_all[39:35] <= X_all[69:65];
            Y_all[44:40] <= X_all[14:10];
            Y_all[49:45] <= X_all[34:30];
            Y_all[54:50] <= X_all[54:50];
            Y_all[59:55] <= X_all[74:70];
            Y_all[64:60] <= X_all[19:15];
            Y_all[69:65] <= X_all[39:35];
            Y_all[74:70] <= X_all[59:55];
            Y_all[79:75] <= X_all[79:75];
        end else if (dir == 2) begin
            Y_all[4:0] <= X_all[19:15];
            Y_all[9:5] <= X_all[14:10];
            Y_all[14:10] <= X_all[9:5];
            Y_all[19:15] <= X_all[4:0];
            Y_all[24:20] <= X_all[39:35];
            Y_all[29:25] <= X_all[34:30];
            Y_all[34:30] <= X_all[29:25];
            Y_all[39:35] <= X_all[24:20];
            Y_all[44:40] <= X_all[59:55];
            Y_all[49:45] <= X_all[54:50];
            Y_all[54:50] <= X_all[49:45];
            Y_all[59:55] <= X_all[44:40];
            Y_all[64:60] <= X_all[79:75];
            Y_all[69:65] <= X_all[74:70];
            Y_all[74:70] <= X_all[69:65];
            Y_all[79:75] <= X_all[64:60];
        end else if (dir == 3) begin
            Y_all[4:0] <= X_all[64:60];
            Y_all[9:5] <= X_all[44:40];
            Y_all[14:10] <= X_all[24:20];
            Y_all[19:15] <= X_all[4:0];
            Y_all[24:20] <= X_all[69:65];
            Y_all[29:25] <= X_all[49:45];
            Y_all[34:30] <= X_all[29:25];
            Y_all[39:35] <= X_all[9:5];
            Y_all[44:40] <= X_all[74:70];
            Y_all[49:45] <= X_all[54:50];
            Y_all[54:50] <= X_all[34:30];
            Y_all[59:55] <= X_all[14:10];
            Y_all[64:60] <= X_all[79:75];
            Y_all[69:65] <= X_all[59:55];
            Y_all[74:70] <= X_all[39:35];
            Y_all[79:75] <= X_all[19:15];
        end
    end
endmodule

module unRotateBoard(X_all, Y_all, dir);
    input [79:0] X_all;
    input [1:0] dir;
    output reg [79:0] Y_all;
    always @* begin
        if (dir == 0) begin
            Y_all[4:0] <= X_all[4:0];
            Y_all[9:5] <= X_all[9:5];
            Y_all[14:10] <= X_all[14:10];
            Y_all[19:15] <= X_all[19:15];
            Y_all[24:20] <= X_all[24:20];
            Y_all[29:25] <= X_all[29:25];
            Y_all[34:30] <= X_all[34:30];
            Y_all[39:35] <= X_all[39:35];
            Y_all[44:40] <= X_all[44:40];
            Y_all[49:45] <= X_all[49:45];
            Y_all[54:50] <= X_all[54:50];
            Y_all[59:55] <= X_all[59:55];
            Y_all[64:60] <= X_all[64:60];
            Y_all[69:65] <= X_all[69:65];
            Y_all[74:70] <= X_all[74:70];
            Y_all[79:75] <= X_all[79:75];
        end else if (dir == 1) begin
            Y_all[4:0] <= X_all[4:0];
            Y_all[24:20] <= X_all[9:5];
            Y_all[44:40] <= X_all[14:10];
            Y_all[64:60] <= X_all[19:15];
            Y_all[9:5] <= X_all[24:20];
            Y_all[29:25] <= X_all[29:25];
            Y_all[49:45] <= X_all[34:30];
            Y_all[69:65] <= X_all[39:35];
            Y_all[14:10] <= X_all[44:40];
            Y_all[34:30] <= X_all[49:45];
            Y_all[54:50] <= X_all[54:50];
            Y_all[74:70] <= X_all[59:55];
            Y_all[19:15] <= X_all[64:60];
            Y_all[39:35] <= X_all[69:65];
            Y_all[59:55] <= X_all[74:70];
            Y_all[79:75] <= X_all[79:75];
        end else if (dir == 2) begin
            Y_all[19:15] <= X_all[4:0];
            Y_all[14:10] <= X_all[9:5];
            Y_all[9:5] <= X_all[14:10];
            Y_all[4:0] <= X_all[19:15];
            Y_all[39:35] <= X_all[24:20];
            Y_all[34:30] <= X_all[29:25];
            Y_all[29:25] <= X_all[34:30];
            Y_all[24:20] <= X_all[39:35];
            Y_all[59:55] <= X_all[44:40];
            Y_all[54:50] <= X_all[49:45];
            Y_all[49:45] <= X_all[54:50];
            Y_all[44:40] <= X_all[59:55];
            Y_all[79:75] <= X_all[64:60];
            Y_all[74:70] <= X_all[69:65];
            Y_all[69:65] <= X_all[74:70];
            Y_all[64:60] <= X_all[79:75];
        end else if (dir == 3) begin
            Y_all[64:60] <= X_all[4:0];
            Y_all[44:40] <= X_all[9:5];
            Y_all[24:20] <= X_all[14:10];
            Y_all[4:0] <= X_all[19:15];
            Y_all[69:65] <= X_all[24:20];
            Y_all[49:45] <= X_all[29:25];
            Y_all[29:25] <= X_all[34:30];
            Y_all[9:5] <= X_all[39:35];
            Y_all[74:70] <= X_all[44:40];
            Y_all[54:50] <= X_all[49:45];
            Y_all[34:30] <= X_all[54:50];
            Y_all[14:10] <= X_all[59:55];
            Y_all[79:75] <= X_all[64:60];
            Y_all[59:55] <= X_all[69:65];
            Y_all[39:35] <= X_all[74:70];
            Y_all[19:15] <= X_all[79:75];
        end
    end
endmodule

module logic2048SingleLine(x0, x1, x2, x3, y0, y1, y2, y3, movable);
    input [4:0] x0, x1, x2, x3;
    output reg [4:0] y0, y1, y2, y3;
    output reg movable;
    always @* begin
        if (x0 == 0 && x1 == 0 && x2 == 0 && x3 != 0) begin
            y0 <= x3;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 == 0 && x1 == 0 && x2 != 0 && x3 == 0) begin
            y0 <= x2;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 == 0 && x1 != 0 && x2 == 0 && x3 == 0) begin
            y0 <= x1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 == 0 && x2 == 0 && x3 == 0) begin
            y0 <= x0;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 0;
        end else if (x0 == 0 && x1 == 0 && x2 != 0 && x3 != 0 && x2 != x3) begin
            y0 <= x2;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 == 0 && x1 != 0 && x2 == 0 && x3 != 0 && x1 != x3) begin
            y0 <= x1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 == 0 && x2 == 0 && x3 != 0 && x0 != x3) begin
            y0 <= x0;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 == 0 && x1 != x2) begin
            y0 <= x1;
            y1 <= x2;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 == 0 && x0 != x2) begin
            y0 <= x0;
            y1 <= x2;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 == 0 && x0 != x1) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= 0;
            y3 <= 0;
            movable <= 0;
        end else if (x0 == 0 && x1 == 0 && x2 != 0 && x3 != 0 && x2 == x3) begin
            y0 <= x2 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 == 0 && x1 != 0 && x2 == 0 && x3 != 0 && x1 == x3) begin
            y0 <= x1 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 == 0 && x2 == 0 && x3 != 0 && x0 == x3) begin
            y0 <= x0 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 == 0 && x1 == x2) begin
            y0 <= x1 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 == 0 && x0 == x2) begin
            y0 <= x0 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 == 0 && x0 == x1) begin
            y0 <= x0 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 != 0 && x1 != x2 && x2 != x3) begin
            y0 <= x1;
            y1 <= x2;
            y2 <= x3;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 != 0 && x0 != x2 && x2 != x3) begin
            y0 <= x0;
            y1 <= x2;
            y2 <= x3;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 != 0 && x0 != x1 && x1 != x3) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= x3;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 == 0 && x0 != x1 && x1 != x2) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= x2;
            y3 <= 0;
            movable <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 != 0 && x1 == x2 && x2 != x3) begin
            y0 <= x1 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 != 0 && x0 == x2 && x2 != x3) begin
            y0 <= x0 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 != 0 && x0 == x1 && x1 != x3) begin
            y0 <= x0 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 == 0 && x0 == x1 && x1 != x2) begin
            y0 <= x0 + 1;
            y1 <= x2;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 != 0 && x1 != x2 && x2 == x3) begin
            y0 <= x1;
            y1 <= x2 + 1;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 != 0 && x0 != x2 && x2 == x3) begin
            y0 <= x0;
            y1 <= x2 + 1;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 != 0 && x0 != x1 && x1 == x3) begin
            y0 <= x0;
            y1 <= x1 + 1;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 == 0 && x0 != x1 && x1 == x2) begin
            y0 <= x0;
            y1 <= x1 + 1;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 != 0 && x1 == x2 && x2 == x3) begin
            y0 <= x1 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 != 0 && x0 == x2 && x2 == x3) begin
            y0 <= x0 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 != 0 && x0 == x1 && x1 == x3) begin
            y0 <= x0 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 == 0 && x0 == x1 && x1 == x2) begin
            y0 <= x0 + 1;
            y1 <= x2;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 != x1 && x1 != x2 && x2 != x3) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= x2;
            y3 <= x3;
            movable <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 == x1 && x1 != x2 && x2 != x3) begin
            y0 <= x0 + 1;
            y1 <= x2;
            y2 <= x3;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 != x1 && x1 == x2 && x2 != x3) begin
            y0 <= x0;
            y1 <= x1 + 1;
            y2 <= x3;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 == x1 && x1 == x2 && x2 != x3) begin
            y0 <= x0 + 1;
            y1 <= x2;
            y2 <= x3;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 != x1 && x1 != x2 && x2 == x3) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= x2 + 1;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 == x1 && x1 != x2 && x2 == x3) begin
            y0 <= x0 + 1;
            y1 <= x2 + 1;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 != x1 && x1 == x2 && x2 == x3) begin
            y0 <= x0;
            y1 <= x1 + 1;
            y2 <= x3;
            y3 <= 0;
            movable <= 1;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 == x1 && x1 == x2 && x2 == x3) begin
            y0 <= x0 + 1;
            y1 <= x2 + 1;
            y2 <= 0;
            y3 <= 0;
            movable <= 1;
        end else begin
            y0 <= 31;//for debug
            y1 <= 31;
            y2 <= 31;
            y3 <= 31;
        end
    end
endmodule
