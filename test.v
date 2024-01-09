/**
 * @file test.v
 * @brief Testbench module for the MIPS-like processor components in Verilog.
 * @author Shima Baniadamdizaj
 * @email baniadam.shima@gmail.com
 */

module test();
  // Module inputs and outputs
  wire clk;
  wire [0:31] fa1out;     // Output from FA1
  wire [0:31] pcout;      // Output from PC module
  wire [0:31] insmemout;  // Output from Instruction Memory
  wire [0:4]  mux1out;    // Output from MUX1
  wire        S1, S2, W;  // Control signals
  wire [0:31] rbout1, rbout2;  // Outputs from RegBank
  wire [0:31] seout;      // Output from Sign Extension
  wire [0:31] mux2out;    // Output from MUX2
  wire [0:31] shout;      // Output from Shift
  wire        dr, dw;     // Control signals for Data Memory
  wire [0:31] dmout;      // Output from Data Memory
  wire [0:31] m3out;      // Output from MUX3
  wire [0:31] fa2out;     // Output from FA2
  wire        branch, andout, S3;  // Control signals
  reg         z;           // Reset signal
  wire [0:31] m4out;      // Output from MUX4

  // Instantiating components
  osc osc1(clk);
  pc pc1(clk, m4out, pcout);
  FA fa1(32'd4, pcout, clk, fa1out);
  shift shft(seout, shout);
  datamem dm(fa2out, rbout2, dr, dw, dmout);
  mux1 #(32) m3(dmout, fa2out, S3, m3out);
  insmem imem(pcout, insmemout);
  mux1 #(5) m1(insmemout[16:20], insmemout[11:15], S1, mux1out);
  control cntrl(insmemout[26:31], S1, W, S2, dr, dw, S3);
  regbank rb(insmemout[21:25], insmemout[16:20], mux1out, m3out, W, clk, rbout1, rbout2);
  extend se(insmemout[0:15], seout);
  mux1 #(32) m2(seout, rbout2, S2, mux2out);
  FA2 fa2(rbout1, mux2out, S2, fa2out);
  and (andout, z, branch);
  mux1 #(32) m4(shout, fa1out, andout, m4out);

endmodule
