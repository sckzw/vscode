module sample (
    input        CLK,
    input        RSTX,
    input        REQ,
    output       ACK,
    input  [7:0] DAT
);

    `include "task.v"
    `include "task2.v"

    initial begin : sample_blobk
        sample1();
        sample2();
        $display("value %d", sub.r_ack);
    end

    SUB sub (
        /*AUTOINST*/
        // Outputs
        .ACK (ACK),
        // Inputs
        .CLK (CLK),
        .RSTX(RSTX),
        .REQ (REQ),
        .DAT (DAT[7:0])
    );
endmodule

// Local Variables:
// verilog-library-flags:("sub.v")
// End:
