`timescale 1ns / 1ps
// ============================================================
// T flip-flop built from the JK flip-flop (J = K = T)
// Copied from Lab10; only change is the reset passed through.
// ============================================================

module t_flip_flop(
    input  t, clk, reset,
    output q, qn
);

    jk_flip_flop jk (
        .j     (t),
        .k     (t),
        .clk   (clk),
        .reset (reset),
        .q     (q),
        .qn    (qn)
    );

endmodule
