/**
 * @file insmem.v
 * @brief Instruction memory module in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module insmem(
  input [0:31] AdrA, ///< Address input for instruction memory
  output reg [0:31] A ///< Output data from instruction memory
);

  // 256x32-bit instruction memory
  reg [0:31] imem[0:255];

  // Initial block to initialize instruction memory
  initial
  begin
    imem[0][0:31] = 32'b00100000000100001111111111111100; // Example instruction
    imem[1][0:31] = 32'h20110008; // Example instruction
    imem[2][0:31] = 32'h02119020; // Example instruction
    imem[3][0:31] = 32'h1240fffc; // Example instruction
    // Add more initializations if needed
  end

  // Always block to read from instruction memory based on the address
  always @(*)
  begin
    if (AdrA > 255)
      A = 32'h00000000;
    else
      A = imem[AdrA[0:7]];
  end

endmodule
