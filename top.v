module top(
    input        btnU,   // reset
    input        btnC,   // input "clock"
    output [6:0] led
);

    ripple_counter ripple (
        .clk   (btnC),
        .reset (btnU),
        .q     (led[2:0])
    );


    modulo_counter modulo (
        .clk   (btnC),
        .reset (btnU),
        .count (led[5:3]),
        .out   (led[6])
    );

endmodule