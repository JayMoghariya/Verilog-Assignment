module dff (
    input d,  
    input clk,  
    input rstn,  
    output reg q,  
    output qn);  

    always @ (posedge clk or negedge rstn)  
      if (!rstn) q <= 0;  
      else q <= d;  
    assign qn = ~q;  
endmodule  
  
module ring (
    input clk,  
    input rstn,  
    input [3:0] xin,
    output [3:0] out);  

    wire  q3, q_bar3;  
    wire  q2, q_bar2;
    wire  q1, q_bar1;
    wire  q0, q_bar0; 
  
    dff dff0 ( .d (xin[1]),  
      .clk (clk),  
      .rstn (rstn),  
      .q (q0),  
      .qn (q_bar0));  
  
    dff dff1 ( .d (xin[2]),  
      .clk (clk),  
      .rstn (rstn),  
      .q (q1),  
      .qn (q_bar1)); 
    
    dff dff2 ( .d (xin[3]),  
      .clk (clk),  
      .rstn (rstn),  
      .q (q2),  
      .qn (q_bar2));  
    
    dff dff3 ( .d (xin[0]^xin[1]),  
      .clk (clk),  
      .rstn (rstn),  
      .q (q3),  
      .qn (q_bar3));  
   assign out = {q3,q2,q1,q0};
   
endmodule