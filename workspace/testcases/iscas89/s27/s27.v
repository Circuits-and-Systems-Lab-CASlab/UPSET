/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:21:04 2025
/////////////////////////////////////////////////////////////


module s27 ( CK, G0, G1, G17, G2, G3 );
  input CK, G0, G1, G2, G3;
  output G17;
  wire   G5, G10, G6, G11, G7, G13, n2, n3, n4, n5, n6, \DFF_1/n1 ;

  sg13g2_a21oi_2 U1 ( .A1(n2), .A2(n4), .B1(G2), .Y(G13) );
  sg13g2_nor2_2 U2 ( .A(G11), .B(n3), .Y(G10) );
  sg13g2_nor3_2 U3 ( .A(G5), .B(n5), .C(n6), .Y(G11) );
  sg13g2_a21oi_2 U4 ( .A1(G6), .A2(n3), .B1(G3), .Y(n6) );
  sg13g2_inv_2 U5 ( .A(G11), .Y(G17) );
  sg13g2_inv_2 U6 ( .A(G7), .Y(n2) );
  sg13g2_inv_2 U7 ( .A(G0), .Y(n3) );
  sg13g2_inv_2 U8 ( .A(G1), .Y(n4) );
  sg13g2_a22oi_1 U9 ( .A1(G6), .A2(n3), .B1(n4), .B2(n2), .Y(n5) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(G10), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G5) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(G13), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G7) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(G11), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G6) );
  sg13g2_tiehi U10 ( .L_HI(\DFF_1/n1 ) );
endmodule

