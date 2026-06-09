module SUB (
    input        CLK,
    input        RSTX,
    input        REQ,
    output [0:0] ACK,
    input  [7:0] DAT
);
    reg       r_ack;
    reg [7:0] r_dat;

    always @(posedge CLK or negedge RSTX) begin
        if (RSTX == 1'b0) begin
            r_ack <= 1'b0;
        end
        else if (REQ == 1'b1) begin
            r_ack <= 1'b1;
        end
        else begin
            r_ack <= 1'b0;
        end
    end

    assign ACK = r_ack;

    always @(posedge CLK or negedge RSTX) begin
        if (RSTX == 1'b0) begin
            r_dat <= 8'd0;
        end
        else if (REQ == 1'b1 && ACK == 1'b1) begin
            r_dat <= DAT;
        end
    end
endmodule
