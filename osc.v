/**
 * @file osc.v
 * @brief Oscillator module in Verilog for clock generation.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module osc(
  output reg clk ///< Output clock signal
);

  // Always block for clock generation
  always
  begin
    #100 // Delay of 100 time units
    clk = 1'b1; // Set clock to high
    #100 // Delay of 100 time units
    clk = 1'b0; // Set clock to low
  end

endmodule
