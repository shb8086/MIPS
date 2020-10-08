module control(A,S1,W,S2,dr,dw,S3,R,Jump,Aluop,branch);
input [0:31]A;
output reg S1,W,S2,dr,dw,S3,Jump,branch;
output reg R;
output reg [0:1]Aluop;

initial
begin
  R=1;
end
always @(*)

case(A[26:31])
6'd35:
begin
S1=1'b0;
W=1'b1;
S2=1'b1;
dr=1'b1;
dw=1'b0;
S3=1'b1;
Jump=1'b0;//*
Aluop=2'b0;//*
branch=1'b0;
end
//2
6'd43:
begin
S1=1'b1;//*
W=1'b0;
S2=1'b1;
dr=1'b0;
dw=1'b1;
Jump=1'b0;//*
S3=1'b1;//*
Aluop=2'b0;//*
branch=1'b0;
end
//3
6'd0:
begin
S1=1'b1;//*
W=1'b1;
S2=1'b0;
dr=1'b0;
dw=1'b0;
S3=1'b0;
Jump=1'b0;//*
Aluop=2'b0;//*
branch=1'b0;
end
//4
6'd4:
begin
S1=1'b1;//*
W=1'b0;
S2=1'b0;
dr=1'b0;
dw=1'b0;
S3=1'b1;
Jump=1'b0;//*
Aluop=2'b0;//*
branch=1'b1;
end
//5
6'd2:
begin
S1=1'b1;//*
W=1'b0;
S2=1'b1;//*
dr=1'b1;
dw=1'b1;
S3=1'b1;
Jump=1'b0;//*
Aluop=2'b0;//*
branch=1'b0;
end
endcase
initial
begin
#50
  R=0;
end

endmodule
