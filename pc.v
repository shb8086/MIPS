/**
 * @file pc.v
 * @brief Program Counter (PC) module in Verilog for clocked register with reset capability.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module pc(
  input clk, ///< Clock input
  input R,   ///< Reset signal
  input [31:0] A, ///< Input data to be loaded into the PC
  output reg [31:0] B ///< Output data from the PC
);

  // Always block triggered on the positive edge of the clock
  always @(posedge clk)
  begin
    B = A; // Update the PC value with the input data

    // Check for reset condition
    if (R == 1)
    begin
      #100 // Delay of 100 time units
      B = 32'h00000000; // Reset the PC to zero
    end
  end

endmodule
