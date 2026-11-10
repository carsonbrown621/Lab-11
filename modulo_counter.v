`timescale 1ns / 1ps
// ============================================================
// Modulo Counter - divide by 12 (count of 6)
// Counts 0,1,2,3,4,5 then wraps to 0.
// Every wrap flips the output.
// Built from: 3 full adders, 4 D flip-flops, and basic gates.
// NO behavioral code in this file.
// ============================================================

module modulo_counter(
    input        clk,     // btnC from top
    input        reset,   // btnU from top
    output [2:0] count,   // count[0] -> led[3], count[1] -> led[4], count[2] -> led[5]
    output       out      // -> led[6]
);

    // --------------------------------------------------------
    // Internal wires
    // --------------------------------------------------------
    wire [2:0] sum;         // count + 1 (from the adders)
    wire [2:0] carry;       // carry out of each full adder (carry[2] is unused)
    wire       eq;          // high when count == 5 (binary 101)
    wire [2:0] next_count;  // what gets loaded into the count D-FFs
    wire       next_out;    // what gets loaded into the output D-FF
    wire [3:0] unused_qn;   // qn outputs we don't need


    // ========================================================
    // The +1 adder (3 full adders chained)
    // ========================================================
    full_adder fa0 (
        .A    (count[0]),
        .B    (1'b0),
        .Cin  (1'b1),        // this 1 is what makes it "+1"
        .Y    (sum[0]),
        .Cout (carry[0])
    );

    full_adder fa1 (
        .A    (count[1]),
        .B    (1'b0),
        .Cin  (carry[0]),
        .Y    (sum[1]),
        .Cout (carry[1])
    );

    full_adder fa2 (
        .A    (count[2]),
        .B    (1'b0),
        .Cin  (carry[1]),
        .Y    (sum[2]),
        .Cout (carry[2])     // unused
    );


    // ========================================================
    // The comparator - high when count == 5 (101)
    // ========================================================
    assign eq = count[2] & ~count[1] & count[0];


    // ========================================================
    // Wrap back to 0 - force next count to 000 when eq is high
    // ========================================================
    assign next_count[0] = sum[0] & ~eq;
    assign next_count[1] = sum[1] & ~eq;
    assign next_count[2] = sum[2] & ~eq;


    // ========================================================
    // Storage (3 D flip-flops for the count)
    // ========================================================
    d_flip_flop count0 (
        .d     (next_count[0]),
        .clk   (clk),
        .reset (reset),
        .q     (count[0]),
        .qn    (unused_qn[0])
    );

    d_flip_flop count1 (
        .d     (next_count[1]),
        .clk   (clk),
        .reset (reset),
        .q     (count[1]),
        .qn    (unused_qn[1])
    );

    d_flip_flop count2 (
        .d     (next_count[2]),
        .clk   (clk),
        .reset (reset),
        .q     (count[2]),
        .qn    (unused_qn[2])
    );


    // ========================================================
    // The output flip-flop - flips only when eq is high
    // ========================================================
    assign next_out = out ^ eq;

    d_flip_flop out_ff (
        .d     (next_out),
        .clk   (clk),
        .reset (reset),
        .q     (out),
        .qn    (unused_qn[3])
    );

endmodule
