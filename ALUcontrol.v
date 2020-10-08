module ALUcontrol(cntrlin,func,alucntrlout);
  input [0:1]cntrlin;
  input [0:5]func;
  output reg [0:3]alucntrlout;
  //100000:
  always
  begin
    #100
    case(cntrlin)
      2'b00:
        alucntrlout=4'b0010;
     2'b01:
        alucntrlout=4'b0110;
     2'b10:
     begin
       case (func)
         6'b001000:
         alucntrlout=4'b0010;
         6'b100010:
         alucntrlout=4'b0110;
         6'b100100:
         alucntrlout=4'b0000;
         6'b100101:
         alucntrlout=4'b0001;
         6'b101010:
         alucntrlout=4'b0111;
       endcase
     end
  endcase
end
endmodule