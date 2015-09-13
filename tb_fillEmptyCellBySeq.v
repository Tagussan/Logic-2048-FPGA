`timescale 1ns/1ns
module tb_fillEmptyCellBySeq();
    parameter STEP = 20;
    reg rst, clk;
    reg [79:0] cell_all_in;
    wire [79:0] cell_all_out;
    wire [63:0] order_all = {4'd0, 4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd9, 4'd10, 4'd11, 4'd12, 4'd13, 4'd14, 4'd15};
    wire full;
    wire calc_done;
    fillEmptyCellBySeq filler(.rst(rst), .clk(clk), .cell_all_in(cell_all_in), .cell_all_out(cell_all_out), .order_all(order_all), .random(6'b1), .full(full), .calc_done(calc_done));
    initial begin
        $dumpfile("fillEmptyCellBySeq.vcd");
        $dumpvars(0, tb_fillEmptyCellBySeq);
        clk = 0;
        cell_all_in = {{13{5'd1}}, {3{5'd0}}};
        rst = 1;
        toggleclk;
        toggleclk;
        rst = 0;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        toggleclk;
        $dumpflush;
        $finish;
    end
    task toggleclk;
        begin
#STEP       clk <= ~clk;
            if(clk) begin
            end
        end
    endtask
endmodule
