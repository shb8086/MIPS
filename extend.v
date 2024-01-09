/**
 * @file extend.v
 * @brief Sign extension module in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module extend(
  input [0:15] A, ///< 16-bit input
  output [0:31] B ///< 32-bit output with sign extension
);

  // Assigning B with sign extension of A
  assign B = {{16{A[15]}}, A};

endmodule
