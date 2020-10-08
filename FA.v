module FA(A,B,clk,C);
input [31:0]A;
input [31:0]B;
input clk;
output [31:0]C;
assign C=(A+B);
endmodule