module shift(A,B);
  input [0:31]A;
  output  [0:31]B;
  assign B=A>>2;
endmodule