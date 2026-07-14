/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Mon Mar 17 14:26:06 2025
/////////////////////////////////////////////////////////////


module c17 ( N1, N2, N3, N6, N7, N22, N23 );
  input N1, N2, N3, N6, N7;
  output N22, N23;
  wire   n6, n7, n8;

  sg13g2_nor2b_1 U6 ( .B_N(n6), .A(n7), .Y(N23) );
  sg13g2_nor2_1 U7 ( .A(N2), .B(N7), .Y(n7) );
  sg13g2_inv_1 U8 ( .A(n8), .Y(N22) );
  sg13g2_a22oi_1 U9 ( .A1(N2), .A2(n6), .B1(N1), .B2(N3), .Y(n8) );
  sg13g2_nand2_1 U10 ( .A(N6), .B(N3), .Y(n6) );
endmodule

