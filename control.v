/**
 * @file control.v
 * @brief Control unit module in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module control(
  input [0:31] A,       ///< Input instruction
  output reg S1,        ///< Stage 1 control signal
  output reg W,          ///< Write enable control signal
  output reg S2,         ///< Stage 2 control signal
  output reg dr,         ///< Data read control signal
  output reg dw,         ///< Data write control signal
  output reg S3,         ///< Stage 3 control signal
  output reg R,          ///< Reset control signal
  output reg Jump,       ///< Jump control signal
  output reg [0:1] Aluop, ///< ALU operation control signal
  output reg branch      ///< Branch control signal
);

  initial
  begin
    R = 1; // Initialize reset signal
  end

  always @(*)
    case (A[26:31])
      6'd35: // LW instruction
        begin
          S1 = 1'b0;
          W = 1'b1;
          S2 = 1'b1;
          dr = 1'b1;
          dw = 1'b0;
          S3 = 1'b1;
          Jump = 1'b0; // Jump not active
          Aluop = 2'b0; // ALU operation not specified
          branch = 1'b0; // Branch not taken
        end

      6'd43: // SW instruction
        begin
          S1 = 1'b1;
          W = 1'b0;
          S2 = 1'b1;
          dr = 1'b0;
          dw = 1'b1;
          Jump = 1'b0; // Jump not active
          S3 = 1'b1; // Stage 3 active
          Aluop = 2'b0; // ALU operation not specified
          branch = 1'b0; // Branch not taken
        end

      6'd0: // R-type instruction
        begin
          S1 = 1'b1;
          W = 1'b1;
          S2 = 1'b0;
          dr = 1'b0;
          dw = 1'b0;
          S3 = 1'b0;
          Jump = 1'b0; // Jump not active
          Aluop = 2'b0; // ALU operation not specified
          branch = 1'b0; // Branch not taken
        end

      6'd4: // BEQ instruction
        begin
          S1 = 1'b1;
          W = 1'b0;
          S2 = 1'b0;
          dr = 1'b0;
          dw = 1'b0;
          S3 = 1'b1;
          Jump = 1'b0; // Jump not active
          Aluop = 2'b0; // ALU operation not specified
          branch = 1'b1; // Branch taken
        end

      6'd2: // JUMP instruction
        begin
          S1 = 1'b1;
          W = 1'b0;
          S2 = 1'b1;
          dr = 1'b1;
          dw = 1'b1;
          S3 = 1'b1;
          Jump = 1'b0; // Jump active
          Aluop = 2'b0; // ALU operation not specified
          branch = 1'b0; // Branch not taken
        end
    endcase

  initial
  begin
    #50
    R = 0; // Deactivate reset after 50 time units
  end

endmodule
