module boardRam(data, clk, wren, q);
    output [79:0] q;
    input wren, clk;
    input [79:0] data;
    reg [79:0] q;
    always @(posedge clk) begin
        if (wren)
            q <= data;
    end
endmodule
