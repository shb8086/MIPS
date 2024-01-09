/**
 * @file ALU.v
 * @brief Arithmetic Logic Unit (ALU) module in Verilog.
 * @author Shima Baniadamdizaj
 */

module ALU(
  input [31:0] A,         ///< 32-bit input operand A
  input [31:0] B,         ///< 32-bit input operand B
  input [0:3] alucontrol, ///< 4-bit control signal for ALU operation
  output reg z,           ///< Output flag indicating special case
  output reg [31:0] C      ///< 32-bit output result
);

  // Always block to perform ALU operations
  always
    begin
      #100 // Delay of 100 time units

      // Check if operand A is zero
      if (A == 32'b00000000000000000000000000000000)
        begin
          z = 1;                        // Set flag to indicate special case
          C = 32'b00000000000000000000000000000000; // Result is zero
        end
      else
        begin
          z = 0;         // Clear special case flag
          C = (A + B);   // Default operation is addition
        end

      // Perform specific operation based on alucontrol
      case (alucontrol)
        4'b0010: C = (A + B); // Addition
        4'b0110: C = (A - B); // Subtraction
      endcase
    end
endmodule
