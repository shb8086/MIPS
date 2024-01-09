/**
 * @file shift.v
 * @brief Right Shift module in Verilog by 2 bits for a 32-bit input data. 
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module shift(
  input [0:31] A, ///< 32-bit input data
  output [0:31] B ///< 32-bit output data after right shift by 2 bits
);

  // Assign statement for the right shift operation
  assign B = A >> 2;

endmodule
