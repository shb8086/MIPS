/**
 * @file datamem.v
 * @brief Data memory module in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module datamem(
  input [0:31] Adr,   ///< Address input
  input [0:31] data,  ///< Data input
  input R,            ///< Read control signal
  input W,            ///< Write control signal
  output reg [0:31] C  ///< Data output
);

  reg [31:0] dmem[31:0]; ///< Data memory array

  always
  begin
    #100 // Delay of 100 time units

    // Case statement to perform read or write operation based on control signals
    case ({R, W})
      2'b01: dmem[Adr] = data; // Write operation
      2'b10: C = dmem[Adr];    // Read operation
      default: C = 32'h00000000; // Default value when neither read nor write
    endcase
  end

endmodule
