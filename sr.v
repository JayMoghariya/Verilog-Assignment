module sr(q,q_bar,s,r,clk);
    input s,r,clk;
    output q,q_bar;
    wire w1,w2;
    nand #1 N1(w1,s,clk);
    nand #1 N2(w2,r,clk);
    nand #1 N3(q,w1,clk);
    nand #1 N4(q_bar,w2,clk);
    

endmodule