module logic2048SingleLine(x0, x1, x2, x3, y0, y1, y2, y3);
    input [3:0] x0, x1, x2, x3;
    output reg [3:0] y0, y1, y2, y3;
    always @* begin
        if (x0 == 0 && x1 == 0 && x2 == 0 && x3 != 0) begin
            y0 <= x3;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 == 0 && x2 != 0 && x3 == 0) begin
            y0 <= x2;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 == 0 && x3 == 0) begin
            y0 <= x1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 == 0 && x2 == 0 && x3 == 0) begin
            y0 <= x0;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 == 0 && x2 != 0 && x3 != 0 && x2 != x3) begin
            y0 <= x2;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 == 0 && x3 != 0 && x1 != x3) begin
            y0 <= x1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 == 0 && x2 == 0 && x3 != 0 && x0 != x3) begin
            y0 <= x0;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 == 0 && x1 != x2) begin
            y0 <= x1;
            y1 <= x2;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 == 0 && x0 != x2) begin
            y0 <= x0;
            y1 <= x2;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 == 0 && x0 != x1) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 == 0 && x2 != 0 && x3 != 0 && x2 == x3) begin
            y0 <= x2 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 == 0 && x3 != 0 && x1 == x3) begin
            y0 <= x1 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 == 0 && x2 == 0 && x3 != 0 && x0 == x3) begin
            y0 <= x0 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 == 0 && x1 == x2) begin
            y0 <= x1 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 == 0 && x0 == x2) begin
            y0 <= x0 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 == 0 && x0 == x1) begin
            y0 <= x0 + 1;
            y1 <= 0;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 != 0 && x1 != x2 && x2 != x3) begin
            y0 <= x1;
            y1 <= x2;
            y2 <= x3;
            y3 <= 0;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 != 0 && x0 != x2 && x2 != x3) begin
            y0 <= x0;
            y1 <= x2;
            y2 <= x3;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 != 0 && x0 != x1 && x1 != x3) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= x3;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 == 0 && x0 != x1 && x1 != x2) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= x2;
            y3 <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 != 0 && x1 == x2 && x2 != x3) begin
            y0 <= x1 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 != 0 && x0 == x2 && x2 != x3) begin
            y0 <= x0 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 != 0 && x0 == x1 && x1 != x3) begin
            y0 <= x0 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 == 0 && x0 == x1 && x1 != x2) begin
            y0 <= x0 + 1;
            y1 <= x2;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 != 0 && x1 != x2 && x2 == x3) begin
            y0 <= x1;
            y1 <= x2 + 1;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 != 0 && x0 != x2 && x2 == x3) begin
            y0 <= x0;
            y1 <= x2 + 1;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 != 0 && x0 != x1 && x1 == x3) begin
            y0 <= x0;
            y1 <= x1 + 1;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 == 0 && x0 != x1 && x1 == x2) begin
            y0 <= x0;
            y1 <= x1 + 1;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 == 0 && x1 != 0 && x2 != 0 && x3 != 0 && x1 == x2 && x2 == x3) begin
            y0 <= x1 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 == 0 && x2 != 0 && x3 != 0 && x0 == x2 && x2 == x3) begin
            y0 <= x0 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 == 0 && x3 != 0 && x0 == x1 && x1 == x3) begin
            y0 <= x0 + 1;
            y1 <= x3;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 == 0 && x0 == x1 && x1 == x2) begin
            y0 <= x0 + 1;
            y1 <= x2;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 != x1 && x1 != x2 && x2 != x3) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= x2;
            y3 <= x3;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 == x1 && x1 != x2 && x2 != x3) begin
            y0 <= x0 + 1;
            y1 <= x2;
            y2 <= x3;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 != x1 && x1 == x2 && x2 != x3) begin
            y0 <= x0;
            y1 <= x1 + 1;
            y2 <= x3;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 == x1 && x1 == x2 && x2 != x3) begin
            y0 <= x0 + 1;
            y1 <= x2;
            y2 <= x3;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 != x1 && x1 != x2 && x2 == x3) begin
            y0 <= x0;
            y1 <= x1;
            y2 <= x2 + 1;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 == x1 && x1 != x2 && x2 == x3) begin
            y0 <= x0 + 1;
            y1 <= x2 + 1;
            y2 <= 0;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 != x1 && x1 == x2 && x2 == x3) begin
            y0 <= x0;
            y1 <= x1 + 1;
            y2 <= x3;
            y3 <= 0;
        end else if (x0 != 0 && x1 != 0 && x2 != 0 && x3 != 0 && x0 == x1 && x1 == x2 && x2 == x3) begin
            y0 <= x0 + 1;
            y1 <= x2 + 1;
            y2 <= 0;
            y3 <= 0;
        end else begin
            y0 <= 15;
            y1 <= 15;
            y2 <= 15;
            y3 <= 15;
        end
    end
endmodule
