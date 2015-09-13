module select4From64(X_all, pos, ans);
    input [63:0] X_all;
    input [3:0] pos;
    output reg [3:0] ans;
    always @* begin
        case (pos)
            0: ans <= X_all[3:0];
            1: ans <= X_all[7:4];
            2: ans <= X_all[11:8];
            3: ans <= X_all[15:12];
            4: ans <= X_all[19:16];
            5: ans <= X_all[23:20];
            6: ans <= X_all[27:24];
            7: ans <= X_all[31:28];
            8: ans <= X_all[35:32];
            9: ans <= X_all[39:36];
            10: ans <= X_all[43:40];
            11: ans <= X_all[47:44];
            12: ans <= X_all[51:48];
            13: ans <= X_all[55:52];
            14: ans <= X_all[59:56];
            15: ans <= X_all[63:60];
        endcase
    end
endmodule

module select5From80(X_all, pos, ans);
    input [79:0] X_all;
    input [3:0] pos;
    output reg [4:0] ans;
    always @* begin
        case (pos)
            0: ans <= X_all[4:0];
            1: ans <= X_all[9:5];
            2: ans <= X_all[14:10];
            3: ans <= X_all[19:15];
            4: ans <= X_all[24:20];
            5: ans <= X_all[29:25];
            6: ans <= X_all[34:30];
            7: ans <= X_all[39:35];
            8: ans <= X_all[44:40];
            9: ans <= X_all[49:45];
            10: ans <= X_all[54:50];
            11: ans <= X_all[59:55];
            12: ans <= X_all[64:60];
            13: ans <= X_all[69:65];
            14: ans <= X_all[74:70];
            15: ans <= X_all[79:75];
        endcase
    end
endmodule
