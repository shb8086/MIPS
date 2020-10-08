module pc(clk,R,A,B);
  input clk,R;
  input [31:0]A;
  output reg [31:0]B;
  always @(clk)
  begin 
     B= A;
  if(R==1)
    begin
   #100 B=32'h00000000;
    end
    end
endmodule