module tb_ring;
    reg clk;  
    reg rstn;  
    reg [3:0] xin = 4'b1011;
    wire [3:0] out;  
    ring r0 (clk, rstn , xin , out);  
    always #5 clk = ~clk;  
    initial begin
      $dumpfile("ring.vcd");
	  $dumpvars(0, tb_ring);
      $monitor($time," %b", out);
      rstn <= 1; 
      clk <= 1;
      repeat (1) @ (posedge clk) begin
        rstn <=1;  
      end        
      repeat (15) @ (posedge clk) begin
          #10 xin<=out;
          #10 rstn <= 1;
      end
      $finish;  
   end  
endmodule