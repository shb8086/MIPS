module insmem(AdrA,A);
  input [0:31]AdrA; 
 // input W,R; 
  reg [0:31]imem[0:255];
  //output reg[0:31]C;
  output reg [0:31]A;
  /*  reg [0:5]a;
    reg [0:4]b;
    reg [0:4]c;
    reg [0:4]d;
    reg [0:4]e;
    reg [0:5]f;*/
    
    initial
begin
  //  a=6'd0;
  //  b=5'd31;
  //  c=5'd5;
  //  d=5'd0;
  //  e=5'd0;
  //  f=5'd32;
  //  imem[0][0:31]={f,e,d,c,b,a};
    imem[0][0:31]=32'b001000000001000011111111111111000;
    imem[1][0:31]=32'h20110008;
    imem[2][0:31]=32'h02119020;
    imem[3][0:31]=32'h1240fffc;
    end
    
  always @(*)
  begin
  if (AdrA>255)
  A=32'h00000000;
  else
  begin
  A=imem[AdrA[0:7]];
end
  /*case ({R,W})
  2'b01:A=imem[AdrA];//R
  //W
  2'b10:
  begin
  if (AdrA>255)
  A=32'h00000000;
  else
  begin
  A=imem[AdrA[0:7]];
  end
  end
  default:C=32'h00000000;
  endcase*/
  
end

  //00000000000000000000000000000000
  
endmodule
