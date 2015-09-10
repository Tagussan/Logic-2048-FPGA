`timescale 1ns/1ns
module tb_logic2048SingleLine();
    parameter STEP = 20;
    reg [3:0] x0,x1,x2,x3;
    wire [3:0] y0,y1,y2,y3;
    wire movable;
    logic2048SingleLine md(x0,x1,x2,x3,y0,y1,y2,y3,movable);
    initial begin
        $dumpfile("logic2048.vcd");
        $dumpvars(0, tb_logic2048SingleLine);
        x0 = 0;
        x1 = 0;
        x2 = 0;
        x3 = 0;
        x0 = 0;
        x1 = 1;
        x2 = 2;
#STEP   x3 = 0;
        x0 = 1;
        x1 = 1;
        x2 = 2;
#STEP   x3 = 0;
        x0 = 1;
        x1 = 1;
        x2 = 1;
#STEP   x3 = 1;
        x0 = 0;
        x1 = 0;
        x2 = 0;
#STEP   x3 = 1;
        x0 = 0;
        x1 = 1;
        x2 = 0;
#STEP   x3 = 1;
        x0 = 2;
        x1 = 1;
        x2 = 0;
#STEP   x3 = 1;
        x0 = 1;
        x1 = 2;
        x2 = 3;
#STEP   x3 = 4;
#STEP   x3 = 4;
        $dumpflush;
        $finish;
    end
endmodule
