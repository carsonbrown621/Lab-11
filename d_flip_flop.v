`timescale 1ns / 1ps
// ============================================================
// D flip-flop with asynchronous reset
// Copied from Lab10 and given a reset input for Lab11.
// This is the ONLY file with behavioral code.
// ============================================================

module d_flip_flop(
    input      d,
    input      clk,
    input      reset,
    output reg q,
    output     qn
);

    initial begin
        q <= 0;
    end

    // Reset wins: if reset goes high, q is forced to 0 right away.
    // Otherwise q copies d on every rising clock edge.
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end

    assign qn = ~q;

endmodule
