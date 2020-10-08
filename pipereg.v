module pipereg(A,B);
  parameter max=32;
  input [max-1:0]A;
  output reg [max-1:0]B;
 always @(*)
  begin 
     B= A;
  end
endmodule