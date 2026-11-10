`timescale 1ns / 1ps
// ============================================================
// JK flip-flop built from the D flip-flop
// Copied from Lab10; only change is the reset passed through.
// ============================================================

module jk_flip_flop(
    input  j, k, clk, reset,
    output q, qn
);

    wire D;

    assign D = (j & ~q) | (~k & q);

    d_flip_flop dff_inst (
        .d     (D),
        .clk   (clk),
        .reset (reset),
        .q     (q),
        .qn    (qn)
    );

endmodule
