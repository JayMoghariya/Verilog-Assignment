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

module fsm (
    input clk,  
    input rstn, 
    input x, 
    output out);  

    
    wire  q2, q_bar2;
    wire  q1, q_bar1;
    wire  q0, q_bar0; 
    wire yy,yy_bar;
    
    dff dff0 ( .d ((q1 && ~q0 && ~q2)||(~q0 && ~q1 && q2)||( x && ~q0)),  
      .clk (clk),  
      .rstn (rstn),  
      .q (q0),  
      .qn (q_bar0));  
  
    dff dff1 ( .d ((q1 && ~q0 && ~q2)||(q0 && ~q1)),  
      .clk (clk),  
      .rstn (rstn),  
      .q (q1),  
      .qn (q_bar1)); 
    
    dff dff2 ( .d ((q2 && ~q1)|| (q1 && q0)),  
      .clk (clk),  
      .rstn (rstn),  
      .q (q2),  
      .qn (q_bar2));  
    assign out =(~q2 && q1) || (q2 && q0);
   
endmodule