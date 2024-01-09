/**
 * @file FA2.v
 * @brief 32-bit Full Adder module with control signal in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module FA2(
  input [31:0] A, ///< 32-bit input operand A
  input [31:0] B, ///< 32-bit input operand B
  input clk,      ///< Clock input
  output reg cnt, ///< Control signal
  output reg [31:0] C ///< 32-bit output result
);

  // Initial block to check for a special case and set initial values
  initial
  begin
    if (A == 32'h00000000)
    begin
      cnt = 1;         // Set control signal
      C = 32'h00000000; // Result is zero
    end
    else
      C = (A + B); // Default operation is addition
  end

endmodule
