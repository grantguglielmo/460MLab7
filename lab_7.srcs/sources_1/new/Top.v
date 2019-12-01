module Top(CLK, RST, HALT, REG_LED);
  input CLK;
  input RST, HALT;
  wire[6:0] A_Out;
  wire[31:0] D_Out;
  output[7:0] REG_LED;
  wire[31:0] REG_1;
  wire slowCLK;

  slowCLK slow(CLK, slowCLK);
  Complete_MIPS mips(slowCLK, RST, HALT, A_Out, D_Out, REG_1);
  
  assign REG_LED = REG_1[7:0];

endmodule


module slowCLK(CLK, slowCLK);
    input CLK;
    output slowCLK;
    reg slowCLK;
    integer cnt;
    
    initial begin
        slowCLK = 0;
        cnt = 0;
    end
    
    always @(posedge CLK) begin
            cnt = cnt + 1;
            if(cnt == 8000000) begin
                slowCLK = ~slowCLK;
                cnt = 0;
            end else begin end
    end
endmodule
