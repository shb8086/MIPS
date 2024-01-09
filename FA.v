/**
 * @file FA.v
 * @brief 32-bit Full Adder module in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module FA(
  input [31:0] A, ///< 32-bit input operand A
  input [31:0] B, ///< 32-bit input operand B
  input clk,      ///< Clock input
  output [31:0] C ///< 32-bit output result
);

  // Assign statement to perform addition
  assign C = (A + B);

endmodule
