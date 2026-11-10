`timescale 1ns / 1ps
// ============================================================
// Ripple Counter - divide by 8
// 3 T flip-flops chained together. Each stage runs at half
// the speed of the stage before it.
// Each stage is clocked by the previous stage's q, so the LEDs
// count DOWN: 000 -> 111 -> 110 -> ... -> 001 -> 000
// (this is what the provided test.v and Lab Question 2 expect).
// NO behavioral code in this file.
// ============================================================

module ripple_counter(
    input        clk,     // btnC from top
    input        reset,   // btnU from top
    output [2:0] q        // q[0] -> led[0], q[1] -> led[1], q[2] -> led[2]
);

    wire [2:0] qn;        // inverted outputs (not used)

    // Stage 1 - clocked by the real button clock
    t_flip_flop stage1 (
        .t     (1'b1),
        .clk   (clk),
        .reset (reset),
        .q     (q[0]),
        .qn    (qn[0])
    );

    // Stage 2 - clocked by stage 1's q
    t_flip_flop stage2 (
        .t     (1'b1),
        .clk   (q[0]),
        .reset (reset),
        .q     (q[1]),
        .qn    (qn[1])
    );

    // Stage 3 - clocked by stage 2's q
    t_flip_flop stage3 (
        .t     (1'b1),
        .clk   (q[1]),
        .reset (reset),
        .q     (q[2]),
        .qn    (qn[2])
    );

endmodule
