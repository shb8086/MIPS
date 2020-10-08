module FA2(A,B,clk,cnt,C);
input [31:0]A;
input [31:0]B;
input clk;
output reg cnt;
output reg[31:0]C;
initial
begin
  if(A==32'h00000000)
    begin
      cnt=1;
      C=32'h00000000;
    end
else
 C=(A+B);
 end
endmodule
