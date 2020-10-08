module ALU(A,B,alucontrol,z,C);
input [31:0]A;
input [31:0]B;
input [0:3]alucontrol;
output reg z;
output reg[31:0]C;
always
begin
#100
if(A==32'b00000000000000000000000000000000)
    begin
      z=1;
      C=32'b00000000000000000000000000000000;
    end
else
  begin
    z=0;
 C=(A+B);
 end
 
 case(alucontrol)
   4'b0010:C=(A+B);
   4'b0110:C=(A-B);
 endcase
 end
endmodule
