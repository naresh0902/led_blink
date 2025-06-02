module led_blink(
    input wire clk,        // 100 MHz input
    output reg led = 0     // LED output
);
    wire clk_1hz1;

    // Instantiate clock divider
    clk_1hz divider (
        .clk_in(clk),
        .clk_out(clk_1hz1)
    );

    // Use 1Hz clock to toggle LED
    always @(posedge clk_1hz1) begin
        led <= ~led;
    end
endmodule
