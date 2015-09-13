module fillEmptyCellBySeq(rst, clk, cell_all_in, cell_all_out, order_all, random, full, calc_done);
    input [79:0] cell_all_in;
    output [79:0] cell_all_out;
    input [63:0] order_all;
    input [5:0] random;
    input clk, rst;
    output full, calc_done;
    reg [3:0] order_pos;
    reg full;
    reg calc_done;
    reg [79:0] cell_all_out;
    wire [4:0] selected_cell;
    wire [3:0] current_pos;
    wire [79:0] mask;
    select5From80 bitsel1(.X_all(cell_all_in), .pos(current_pos), .ans(selected_cell));
    select4From64 bitsel2(.X_all(order_all), .pos(order_pos), .ans(current_pos));
    assign mask = {80{1'b1}} ^ (4'b1111 << (5*current_pos));
    always @(posedge clk) begin
        if(rst) begin
            order_pos <= 0;
            full <= 0;
            calc_done <= 0;
        end else begin
            if(selected_cell == 0) begin
                if(random == 0) begin
                    cell_all_out <= (mask & cell_all_in) | (5'b00100 << (5*current_pos));
                end else begin
                    cell_all_out <= (mask & cell_all_in) | (5'b00010 << (5*current_pos));
                end
                calc_done <= 1;
            end else begin
                if(order_pos == 4'b1111) begin
                    full <= 1;
                end else begin
                    order_pos <= order_pos + 1;
                end
            end
        end
    end
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
    input [3:0] x0, x1, x2, x3;
    output reg [3:0] y0, y1, y2, y3;
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
        end
    end
endmodule
