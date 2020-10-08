module regbank (AdrA,AdrB,AdrC,C,W,clk,A,B,R);
  input [0:4]AdrA;
  input [0:4]AdrB;
  input [0:4]AdrC;
  input [0:31]C;  
  input W,clk,R;
  reg [31:0]imem[31:0];
  output  reg[0:31]A;
  output reg [0:31]B;

  always @(posedge W or clk)
   begin
     #100
     imem[AdrC]=C;
   A=(imem[AdrA]);
    B=(imem[AdrB]); 
     if(R==1)
       begin   
    B=32'h00000000;
    A=32'h00000000;
       end
   end
endmodule