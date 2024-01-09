/**
 * @file mips.v
 * @brief MIPS processor module in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module mips();
  // Clock input
  wire clk;

  // Outputs from various modules
  wire [0:31] fa1out;         // Output from FA1
  wire [0:31] pcout;          // Output from PC module
  wire [0:31] insmemout;      // Output from Instruction Memory
  wire [0:4]  mux1out;        // Output from MUX1
  wire        S1, S2, W;      // Control signals
  wire [0:31] rbout1, rbout2; // Outputs from RegBank
  wire [0:31] seout;          // Output from Sign Extension
  wire [0:31] mux2out;        // Output from MUX2
  wire [0:31] shout;          // Output from Shift
  wire       dr, dw;          // Control signals for Data Memory
  reg        R;               // Reset signal
  wire [0:31] dmout;          // Output from Data Memory
  wire [0:31] m3out;          // Output from MUX3
  wire [0:31] fa2out;         // Output from FA2
  wire       branch, S3, jump, zero, reset; // Control signals
  wire [0:1]  aluop;          // Output from ALU Control
  wire [0:31] m4out;          // Output from MUX4
  wire [0:3]  alucontrolout;  // Output from ALUControl

  // Clock oscillator
  osc osc1(clk);

  // Program Counter
  pc pc1(clk, R, pcout);

  // Full Adder 1
  FA fa1(32'd4, pcout, clk, fa1out);

  // Shift
  shift shft(seout, shout);

  // Data Memory
  datamem dm(fa2out, rbout2, dr, dw, dmout);

  // MUX3
  mux1 #(32) m3(dmout, fa2out, S3, m3out);

  // Instruction Memory
  insmem imem(pcout, insmemout);

  // MUX1
  mux1 #(5) m1(insmemout[16:20], insmemout[11:15], S1, mux1out);

  // Control Unit
  control cntrl(insmemout[26:31], S1, W, S2, dr, dw, S3, reset, jump, aluop, branch);

  // Register Bank
  regbank rb(insmemout[21:25], insmemout[16:20], mux1out, m3out, W, clk, rbout1, rbout2, reset);

  // Sign Extension
  extend se(insmemout[0:15], seout);

  // MUX2
  mux1 #(32) m2(seout, rbout2, S2, mux2out);

  // ALU 2
  ALU fa2(rbout1, mux2out, alucontrolout, zero, fa2out);

  // MUX4
  mux1 #(32) m4(shout, fa1out, andout, m4out);

  // AND gate
  and (andout, zero, branch);

  // Shift 2
  shift shf2(insmemout[0:25], shft2out);

  // ALU
  ALU al(shout, fa1out, mux5in);

  // MUX5
  mux1 #(32) m5(shft2out, mux5in, jump, pcin);

  // ALU Control
  ALUcontrol alucnt(aluop, insmemout[0:5], alucontrolout);

endmodule
