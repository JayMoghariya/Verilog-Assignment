module tb_fsm;  
    reg clk;  
    reg rstn;
    reg x;
    wire  out;  
    fsm r0( clk,rstn, x ,out);  
    always #5 clk = ~clk;  
    initial begin
      $dumpfile("fsm.vcd");
	  $dumpvars(0, tb_fsm);
      $monitor($time," %b", out);
      rstn <= 0;  
      clk <= 0;  
      x<=0;
      repeat (2) @ (posedge clk); 
      rstn=1;
      x<=1;
      repeat (5) @(posedge clk);
      x<=1;
      repeat (2) @(posedge clk);
      x<=0;
      repeat (2) @(posedge clk);
      x<=1;
      repeat (6) @(posedge clk);
      x<=0;
      $finish;  
   end   
endmodule
