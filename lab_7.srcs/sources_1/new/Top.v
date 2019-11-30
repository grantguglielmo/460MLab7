module Top(CLK, RST, HALT, REG_LED);
  input CLK;
  input RST, HALT;
  wire[6:0] A_Out;
  wire[31:0] D_Out;
  output[7:0] REG_LED;
  wire[31:0] REG_1;
  wire slowCLK;

  slowCLK slow(CLK, HALT, slowCLK);
  Complete_MIPS mips(slowCLK, RST, A_Out, D_Out, REG_1);
  
  assign REG_LED = REG_1[7:0];

endmodule


module slowCLK(CLK, HALT, slowCLK);
    input CLK, HALT;
    output slowCLK;
    reg slowCLK;
    integer cnt;
    
    initial begin
        slowCLK = 0;
        cnt = 0;
    end
    
    always @(posedge CLK) begin
        if(~HALT) begin
            cnt = cnt + 1;
            if(cnt == 50000000) begin
                slowCLK = ~slowCLK;
            end else begin end
        end else begin end
    end
endmodule
