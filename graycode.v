module sff(
    input s,
    input r,
    input clk,
    input rstn, 
    output reg q,
    output q_bar);
    always @(posedge clk or negedge rstn) begin
        if (!rstn) q <= 0;  
        else if (s && (s^r)) begin
            q<=1;
        end
        else if (r && (s^r)) begin
             q<=0;
        end
        else if (!(s||r)) begin
            q<=q;
        end
    end
    assign q_bar = ~q;
endmodule

module graycode(
    input clk,  
    input [3:0] xin,  
    input rstn,
    output [3:0] out);
    wire  q3, q_bar3;  
    wire  q2, q_bar2;
    wire  q1, q_bar1;
    wire  q0, q_bar0;

    sff sff0 ( .s((~xin[1] && !(xin[2]^xin[3])) || (xin[1] && (xin[2]^xin[3]))),
      .r((~xin[1] && (xin[2]^xin[3])) || ((xin[1] && !(xin[2]^xin[3])))),
      .rstn(rstn),
       .clk(clk), 
       .q(q0),  
       .q_bar(q_bar0));  
  
    sff sff1 ( .s (xin[0] && !(xin[2]^xin[3])),
      .r(xin[0] && (xin[2]^xin[3])),
      .rstn(rstn),
      .clk (clk), 
      .q (q1),  
      .q_bar (q_bar1));
    
    sff sff2 ( .s (~xin[0] && xin[1] && ~xin[3]),
      .r(~xin[0] && xin[1] && xin[3]),
      .rstn(rstn),
      .clk (clk), 
      .q (q2),  
      .q_bar (q_bar2));

    sff sff3 ( .s (~xin[0] && ~xin[1] && xin[2]),
      .r(~xin[0] && ~xin[1] && ~xin[2]),
      .rstn(rstn),
      .clk (clk), 
      .q (q3),  
      .q_bar (q_bar3));
    assign out = {q3 , q2 , q1 , q0};
endmodule