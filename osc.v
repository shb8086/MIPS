module osc (clk);
  output reg clk;
always
begin
  #100
   clk = 1'b1;
    #100
    clk = 1'b0;
  end  
endmodule