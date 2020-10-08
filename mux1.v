module mux1(A,B,S1,C);
parameter max=5;
input [0:max-1]A;
input [0:max-1]B;
input S1;
output [0:max-1]C;

assign C=S1?B:A;

endmodule