module extend(A,B);
input [0:15]A;
output [0:31]B;
assign B={{16{A[15]}},A};
endmodule
