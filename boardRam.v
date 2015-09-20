module boardRam(board_all, clk, rst, data_in);
    output [79:0] board_all;
    input clk,rst;
    input [79:0] data_in;
    reg [79:0] board_all;
    always @(posedge clk) begin
        if (rst)
            board_all <= 63'b0;
        else
            board_all <= data_in;
    end
endmodule
