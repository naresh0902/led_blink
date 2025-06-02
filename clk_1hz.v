`timescale 1ns / 1ps

module clk_1hz(
    input wire clk_in,        // 100 MHz input clock
    output reg clk_out = 0    // 1 Hz output clock
);
    reg [26:0] count = 0;

    always @(posedge clk_in) begin
        if (count == 49_999_999) begin
            count <= 0;
            clk_out <= ~clk_out;  // Toggle output clock
        end else begin
            count <= count + 1;
        end
    end
endmodule

