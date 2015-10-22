module cpu_tb();

reg clk,rst_n;

wire [15:0] pc;

//////////////////////
// Instantiate CPU //
////////////////////
cpu iCPU(.clk(clk), .rst_n(rst_n), .hlt(hlt), .pc(pc));

initial begin
  clk = 0;
  $display("rst assert\n");
  rst_n = 0;
  @(posedge clk);
  @(negedge clk);
  rst_n = 1;
  $display("rst deassert\n");
  $display("pc:%d", pc);
  @(posedge clk);
  $display("pc:%d", pc);
end 
  
always
  #1 clk = ~clk;
  
initial begin
  @(posedge hlt);
  $display("hlt");
  @(posedge clk);
  $stop();
end  

endmodule
