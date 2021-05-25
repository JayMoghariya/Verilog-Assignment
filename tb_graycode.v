module tb_graycode;  
    reg clk;  
    reg rstn;  
    reg [3:0] xin;
    wire [3:0] out;  
    graycode r0(clk,xin , rstn, out);  
    always #5 clk = ~clk;  
    initial begin
      $dumpfile("graycode.vcd");
	    $dumpvars(0, tb_graycode);
      $monitor($time," %b", out);
      rstn <= 0;  
      clk <= 0;  
      repeat (1) @ (posedge clk); 
      repeat (16) begin
          #10 rstn <= 1;
          #10 xin<=out;   
      end
      $finish;  
   end   
endmodule
