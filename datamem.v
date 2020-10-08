module datamem(Adr,data,R,W,C);
  input [0:31]Adr;
  input [0:31]data;
  input R,W;
  reg [31:0]dmem[31:0];
  output reg[0:31]C;
  always
  begin
    #100
  case ({R,W})
    2'b01:dmem[Adr]=data;
    2'b10:C=dmem[Adr];
    default:C=32'h00000000;
  endcase
  end
endmodule