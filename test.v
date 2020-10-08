module test();
wire clk;
wire [0:31]fa1out;//out fa1
wire [0:31]pcout;//in fa1,in imem
wire[0:31]insmemout;
wire [0:4]mux1out;//regbank in
wire S1,S2,W;
wire [0:31]rbout1;
wire [0:31]rbout2;
wire [0:31]seout;
wire [0:31]mux2out;
wire [0:31]shout;
wire dr,db;
wire [0:31]dmout;
wire [0:31]m3out;
wire [0:31]fa2out;
wire branch,andout,S3;
reg z;
wire [0:31]m4out;

osc osc1(clk);
pc pc1(clk,m4out,pcout);
FA fa1(32'd4,pcout,clk,fa1out);
shift shft(seout,shout);
datamem dm(fa2out,rbout2,dr,dw,dmout);
mux1 #(32)m3 (dmout,fa2out,S3,m3out);
insmem imem(pcout,insmemout);
mux1 #(5)m1(insmemout[16:20],insmemout[11:15],S1,mux1out);
control cntrl(insmemout[26:31],S1,W,S2,dr,dw,s3);
regbank rb(insmemout[21:25],insmemout[16:20],mux1out,m3out,W,clk,rbout1,rbout2);
extend se(insmemout[0:15],seout);
mux1 #(32)m2(seout,rbout2,S2,mux2out);//change 1,0
FA2 fa2(rbout1,mux2out,S2,fa2out);
and (andout,z,branch);
mux1 #(32) m4(shout,fa1out,andout,m4out);

endmodule