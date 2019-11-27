module Top(CLK, RST, A_Out, D_Out);
  input CLK;
  input RST;
  output[6:0] A_Out;
  output[31:0] D_Out;

  Complete_MIPS mips(CLK, RST, A_Out, D_Out);

endmodule
