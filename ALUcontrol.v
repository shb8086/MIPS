/**
 * @file ALUcontrol.v
 * @brief ALU Control module in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module ALUcontrol(
  input [0:1] cntrlin,        ///< 2-bit control input for ALU operation selection
  input [0:5] func,           ///< 6-bit function input used for additional ALU control
  output reg [0:3] alucntrlout ///< 4-bit control output for ALU operation
);

  // Always block to determine ALU control based on inputs
  always
  begin
    #100 // Delay of 100 time units

    // Case statement to select ALU control based on cntrlin
    case(cntrlin)
      2'b00: alucntrlout = 4'b0010; // Addition
      2'b01: alucntrlout = 4'b0110; // Subtraction

      2'b10: // Additional cases based on func for extended ALU operations
        begin
          case (func)
            6'b001000: alucntrlout = 4'b0010; // Addition
            6'b100010: alucntrlout = 4'b0110; // Subtraction
            6'b100100: alucntrlout = 4'b0000; // AND
            6'b100101: alucntrlout = 4'b0001; // OR
            6'b101010: alucntrlout = 4'b0111; // Set on less than (SLT)
          endcase
        end
    endcase
  end
endmodule
