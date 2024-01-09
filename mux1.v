/**
 * @file mux1.v
 * @brief 5-to-1 Multiplexer module in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module mux1(
  input [0:4] A, ///< 5-bit input A
  input [0:4] B, ///< 5-bit input B
  input S1,      ///< Select signal
  output [0:4] C ///< 5-bit output
);

  // Assign statement for the multiplexer operation
  assign C = S1 ? B : A;

endmodule
