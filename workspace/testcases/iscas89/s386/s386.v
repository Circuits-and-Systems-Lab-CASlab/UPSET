/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:22:06 2025
/////////////////////////////////////////////////////////////


module s386 ( GND, VDD, CK, v0, v1, v13_D_10, v13_D_11, v13_D_12, v13_D_6, 
        v13_D_7, v13_D_8, v13_D_9, v2, v3, v4, v5, v6 );
  input GND, VDD, CK, v0, v1, v2, v3, v4, v5, v6;
  output v13_D_10, v13_D_11, v13_D_12, v13_D_6, v13_D_7, v13_D_8, v13_D_9;
  wire   v12, v11, v10, v9, v8, v7, Lv13_D_12, Lv13_D_11, Lv13_D_10, Lv13_D_9,
         Lv13_D_8, Lv13_D_7, Lv13_D_6, Lv13_D_5, Lv13_D_3, Lv13_D_2, Lv13_D_1,
         Lv13_D_0, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, \DFF_1/n1 , \DFF_1/D ;
  assign v13_D_12 = Lv13_D_12;
  assign v13_D_11 = Lv13_D_11;
  assign v13_D_10 = Lv13_D_10;
  assign v13_D_9 = Lv13_D_9;
  assign v13_D_8 = Lv13_D_8;
  assign v13_D_7 = Lv13_D_7;
  assign v13_D_6 = Lv13_D_6;

  sg13g2_nand2_2 U1 ( .A(n16), .B(n17), .Y(Lv13_D_9) );
  sg13g2_nor3_2 U2 ( .A(v1), .B(v7), .C(v10), .Y(n20) );
  sg13g2_nor2_2 U3 ( .A(v6), .B(n16), .Y(Lv13_D_8) );
  sg13g2_nor2_2 U4 ( .A(n21), .B(n22), .Y(Lv13_D_7) );
  sg13g2_a21oi_2 U5 ( .A1(n23), .A2(n10), .B1(n7), .Y(n21) );
  sg13g2_a21oi_2 U6 ( .A1(n40), .A2(v1), .B1(n41), .Y(n37) );
  sg13g2_nor2_2 U7 ( .A(v5), .B(n8), .Y(n40) );
  sg13g2_nor4_2 U8 ( .A(v0), .B(n8), .C(n15), .D(n44), .Y(Lv13_D_12) );
  sg13g2_nor2_2 U9 ( .A(n11), .B(n6), .Y(n23) );
  sg13g2_nor2_2 U10 ( .A(v12), .B(v9), .Y(n18) );
  sg13g2_nor3_2 U11 ( .A(n44), .B(n50), .C(n12), .Y(Lv13_D_10) );
  sg13g2_a21oi_2 U12 ( .A1(v5), .A2(v0), .B1(n8), .Y(n50) );
  sg13g2_nand2_2 U13 ( .A(v9), .B(n4), .Y(n44) );
  sg13g2_nor2b_2 U14 ( .B_N(n35), .A(n51), .Y(Lv13_D_1) );
  sg13g2_nor2b_2 U15 ( .B_N(n48), .A(n5), .Y(n36) );
  sg13g2_nor2_2 U16 ( .A(v7), .B(v8), .Y(n48) );
  sg13g2_nor2_2 U17 ( .A(v7), .B(n10), .Y(n56) );
  sg13g2_nor3_2 U18 ( .A(n15), .B(v8), .C(n11), .Y(n55) );
  sg13g2_nor2_2 U19 ( .A(n30), .B(n10), .Y(n57) );
  sg13g2_nor2_2 U20 ( .A(n13), .B(v7), .Y(n30) );
  sg13g2_a21oi_2 U21 ( .A1(n33), .A2(n59), .B1(n22), .Y(Lv13_D_0) );
  sg13g2_nand2_2 U22 ( .A(n35), .B(n5), .Y(n22) );
  sg13g2_nor3_2 U23 ( .A(v10), .B(v9), .C(n49), .Y(n35) );
  sg13g2_nand2_2 U24 ( .A(v0), .B(n12), .Y(n49) );
  sg13g2_nor3_2 U25 ( .A(v11), .B(v3), .C(n10), .Y(n19) );
  sg13g2_inv_2 U26 ( .A(n31), .Y(\DFF_1/D ) );
  sg13g2_inv_2 U27 ( .A(n22), .Y(n2) );
  sg13g2_inv_2 U28 ( .A(n24), .Y(n3) );
  sg13g2_inv_2 U29 ( .A(n38), .Y(n4) );
  sg13g2_inv_2 U30 ( .A(v12), .Y(n5) );
  sg13g2_inv_2 U31 ( .A(v11), .Y(n6) );
  sg13g2_inv_2 U32 ( .A(n33), .Y(n7) );
  sg13g2_inv_2 U33 ( .A(v10), .Y(n8) );
  sg13g2_inv_2 U34 ( .A(v9), .Y(n9) );
  sg13g2_inv_2 U35 ( .A(v8), .Y(n10) );
  sg13g2_inv_2 U36 ( .A(v7), .Y(n11) );
  sg13g2_inv_2 U37 ( .A(v1), .Y(n12) );
  sg13g2_inv_2 U38 ( .A(v2), .Y(n13) );
  sg13g2_inv_2 U39 ( .A(v3), .Y(n14) );
  sg13g2_inv_2 U40 ( .A(v5), .Y(n15) );
  sg13g2_nand4_1 U41 ( .A(n18), .B(n19), .C(v4), .D(n20), .Y(n17) );
  sg13g2_o21ai_1 U42 ( .A1(n24), .A2(n15), .B1(n25), .Y(Lv13_D_6) );
  sg13g2_nand3_1 U43 ( .A(n26), .B(n6), .C(n2), .Y(n25) );
  sg13g2_a21o_1 U44 ( .A1(v7), .A2(v4), .B1(n27), .X(n26) );
  sg13g2_a22oi_1 U45 ( .A1(n11), .A2(n13), .B1(v8), .B2(n14), .Y(n27) );
  sg13g2_o21ai_1 U46 ( .A1(n22), .A2(n28), .B1(n24), .Y(Lv13_D_5) );
  sg13g2_o21ai_1 U47 ( .A1(n29), .A2(n23), .B1(v8), .Y(n28) );
  sg13g2_and3_1 U48 ( .A(v3), .B(n6), .C(n30), .X(n29) );
  sg13g2_a22oi_1 U49 ( .A1(n3), .A2(n15), .B1(n2), .B2(n32), .Y(n31) );
  sg13g2_nand3_1 U50 ( .A(n33), .B(n11), .C(n34), .Y(n32) );
  sg13g2_nand3_1 U51 ( .A(n6), .B(n10), .C(v2), .Y(n34) );
  sg13g2_nand3_1 U52 ( .A(v11), .B(n35), .C(n36), .Y(n24) );
  sg13g2_o21ai_1 U53 ( .A1(n37), .A2(n38), .B1(n39), .Y(Lv13_D_3) );
  sg13g2_nand3_1 U54 ( .A(n42), .B(n39), .C(n43), .Y(Lv13_D_2) );
  sg13g2_nand3_1 U55 ( .A(v0), .B(n4), .C(v1), .Y(n43) );
  sg13g2_or3_1 U56 ( .A(v0), .B(v5), .C(n44), .X(n42) );
  sg13g2_nand3_1 U57 ( .A(n16), .B(n39), .C(n45), .Y(Lv13_D_11) );
  sg13g2_nand3_1 U58 ( .A(n46), .B(n8), .C(n18), .Y(n45) );
  sg13g2_a21o_1 U59 ( .A1(v8), .A2(n23), .B1(n7), .X(n46) );
  sg13g2_nand2b_1 U60 ( .A_N(n47), .B(n8), .Y(n39) );
  sg13g2_a22oi_1 U61 ( .A1(n48), .A2(n41), .B1(n18), .B2(n49), .Y(n47) );
  sg13g2_o21ai_1 U62 ( .A1(v9), .A2(n12), .B1(v0), .Y(n41) );
  sg13g2_nand4_1 U63 ( .A(v10), .B(v0), .C(n4), .D(n9), .Y(n16) );
  sg13g2_nand3_1 U64 ( .A(n6), .B(n5), .C(n48), .Y(n38) );
  sg13g2_a22oi_1 U65 ( .A1(n52), .A2(n5), .B1(n36), .B2(n6), .Y(n51) );
  sg13g2_o21ai_1 U66 ( .A1(v11), .A2(n53), .B1(n54), .Y(n52) );
  sg13g2_o21ai_1 U67 ( .A1(n55), .A2(n56), .B1(v11), .Y(n54) );
  sg13g2_a22oi_1 U68 ( .A1(n57), .A2(v3), .B1(v4), .B2(n58), .Y(n53) );
  sg13g2_o21ai_1 U69 ( .A1(v8), .A2(n13), .B1(n11), .Y(n58) );
  sg13g2_o21ai_1 U70 ( .A1(n10), .A2(n11), .B1(v11), .Y(n59) );
  sg13g2_nand2b_1 U71 ( .A_N(v4), .B(n19), .Y(n33) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(Lv13_D_5), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(v12) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(Lv13_D_0), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(v7) );
  sg13g2_dfrbp_1 \DFF_4/Q_reg  ( .D(Lv13_D_1), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(v8) );
  sg13g2_dfrbp_1 \DFF_3/Q_reg  ( .D(Lv13_D_2), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(v9) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(Lv13_D_3), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(v10) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(\DFF_1/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(v11) );
  sg13g2_tiehi U72 ( .L_HI(\DFF_1/n1 ) );
endmodule

