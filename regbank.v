/**
 * @file regbank.v
 * @brief Register Bank module in Verilog with read and write ports, synchronous behavior, and reset capability.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module regbank(
  input [0:4] AdrA, ///< Address input for data read from register A
  input [0:4] AdrB, ///< Address input for data read from register B
  input [0:4] AdrC, ///< Address input for data write to register C
  input [0:31] C,   ///< Data input for writing into the register C
  input W,          ///< Write control signal
  input clk,        ///< Clock input
  input R,          ///< Reset signal
  output reg [0:31] A, ///< Data output from register A
  output reg [0:31] B  ///< Data output from register B
);

  reg [31:0] imem[31:0]; ///< Internal memory array for register bank

  always @(posedge W or posedge clk)
  begin
    #100 // Delay of 100 time units

    // Write operation to the specified register in the internal memory
    imem[AdrC] = C;

    // Read operations for registers A and B
    A = imem[AdrA];
    B = imem[AdrB];

    // Check for reset condition
    if (R == 1)
    begin
      A = 32'h00000000;
      B = 32'h00000000;
    end
  end

endmodule
