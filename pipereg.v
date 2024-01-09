/**
 * @file pipereg.v
 * @brief Pipeline Register module in Verilog for data forwarding.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module pipereg(
  input [31:0] A,       ///< Input data to the pipeline register
  output reg [31:0] B   ///< Output data from the pipeline register
);

  // Always block triggered on any change in the inputs
  always @(*)
  begin
    B = A; // Update the output with the input data
  end

endmodule
