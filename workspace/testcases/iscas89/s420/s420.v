/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:22:32 2025
/////////////////////////////////////////////////////////////


module s420 ( CK, C_0, C_1, C_10, C_11, C_12, C_13, C_14, C_15, C_16, C_2, C_3, 
        C_4, C_5, C_6, C_7, C_8, C_9, P_0, Z );
  input CK, C_0, C_1, C_10, C_11, C_12, C_13, C_14, C_15, C_16, C_2, C_3, C_4,
         C_5, C_6, C_7, C_8, C_9, P_0;
  output Z;
  wire   X_4, X_3, I13, X_2, X_1, I15, X_8, X_7, I111, X_6, X_5, I113, X_12,
         X_11, I209, X_10, X_9, I211, X_16, X_15, X_14, I308, X_13, I309, n3,
         n4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         \DFF_1/n1 , \DFF_0/D , \DFF_13/D , \DFF_12/D , \DFF_10/D , \DFF_8/D ,
         \DFF_6/D , \DFF_4/D , \DFF_2/D ;

  sg13g2_nor2_2 U1 ( .A(n16), .B(n4), .Y(n15) );
  sg13g2_nand2_2 U2 ( .A(X_15), .B(n18), .Y(n17) );
  sg13g2_nor2b_2 U3 ( .B_N(X_14), .A(n19), .Y(n18) );
  sg13g2_nor2_2 U4 ( .A(n21), .B(n11), .Y(n20) );
  sg13g2_nor2_2 U5 ( .A(n23), .B(n8), .Y(n22) );
  sg13g2_a21oi_2 U6 ( .A1(n24), .A2(n25), .B1(n14), .Y(Z) );
  sg13g2_nor3_2 U7 ( .A(n26), .B(C_0), .C(n27), .Y(n25) );
  sg13g2_nor4_2 U8 ( .A(n28), .B(n29), .C(X_10), .D(n30), .Y(n27) );
  sg13g2_nand2_2 U9 ( .A(C_14), .B(X_14), .Y(n33) );
  sg13g2_nor2b_2 U10 ( .B_N(X_16), .A(X_15), .Y(n34) );
  sg13g2_nor2_2 U11 ( .A(n35), .B(n29), .Y(n26) );
  sg13g2_nor3_2 U12 ( .A(X_6), .B(X_8), .C(X_7), .Y(n37) );
  sg13g2_nand2_2 U13 ( .A(C_10), .B(X_10), .Y(n40) );
  sg13g2_nor2_2 U14 ( .A(X_11), .B(n10), .Y(n41) );
  sg13g2_nor2b_2 U15 ( .B_N(n36), .A(n44), .Y(n43) );
  sg13g2_nand2_2 U16 ( .A(C_6), .B(X_6), .Y(n47) );
  sg13g2_nor2_2 U17 ( .A(X_7), .B(n7), .Y(n48) );
  sg13g2_nor4_2 U18 ( .A(X_1), .B(X_2), .C(X_3), .D(X_4), .Y(n36) );
  sg13g2_nand2_2 U19 ( .A(C_2), .B(X_2), .Y(n50) );
  sg13g2_nor2_2 U20 ( .A(X_3), .B(n3), .Y(n51) );
  sg13g2_nand2_2 U21 ( .A(X_13), .B(n52), .Y(n19) );
  sg13g2_nor3_2 U22 ( .A(n11), .B(n21), .C(n10), .Y(n52) );
  sg13g2_nor2b_2 U23 ( .B_N(n53), .A(n12), .Y(n55) );
  sg13g2_nor3_2 U24 ( .A(n8), .B(n23), .C(n7), .Y(n53) );
  sg13g2_nor2_2 U25 ( .A(n6), .B(n14), .Y(n57) );
  sg13g2_nor2b_2 U26 ( .B_N(n58), .A(n9), .Y(n60) );
  sg13g2_nor3_2 U27 ( .A(n4), .B(n16), .C(n3), .Y(n58) );
  sg13g2_inv_2 U28 ( .A(n59), .Y(\DFF_6/D ) );
  sg13g2_inv_2 U29 ( .A(n54), .Y(\DFF_10/D ) );
  sg13g2_inv_2 U30 ( .A(X_4), .Y(n3) );
  sg13g2_inv_2 U31 ( .A(X_3), .Y(n4) );
  sg13g2_inv_2 U32 ( .A(n56), .Y(\DFF_2/D ) );
  sg13g2_inv_2 U33 ( .A(X_1), .Y(n6) );
  sg13g2_inv_2 U34 ( .A(X_8), .Y(n7) );
  sg13g2_inv_2 U35 ( .A(X_7), .Y(n8) );
  sg13g2_inv_2 U36 ( .A(X_5), .Y(n9) );
  sg13g2_inv_2 U37 ( .A(X_12), .Y(n10) );
  sg13g2_inv_2 U38 ( .A(X_11), .Y(n11) );
  sg13g2_inv_2 U39 ( .A(X_9), .Y(n12) );
  sg13g2_inv_2 U40 ( .A(X_13), .Y(n13) );
  sg13g2_inv_2 U41 ( .A(P_0), .Y(n14) );
  sg13g2_xnor2_1 U42 ( .A(n3), .B(n15), .Y(\DFF_0/D ) );
  sg13g2_xnor2_1 U43 ( .A(X_16), .B(n17), .Y(\DFF_12/D ) );
  sg13g2_xor2_1 U44 ( .A(X_15), .B(n18), .X(\DFF_13/D ) );
  sg13g2_xnor2_1 U45 ( .A(n10), .B(n20), .Y(\DFF_8/D ) );
  sg13g2_xnor2_1 U46 ( .A(n7), .B(n22), .Y(\DFF_4/D ) );
  sg13g2_a22oi_1 U47 ( .A1(n31), .A2(n13), .B1(C_13), .B2(X_13), .Y(n30) );
  sg13g2_o21ai_1 U48 ( .A1(X_14), .A2(n32), .B1(n33), .Y(n31) );
  sg13g2_a22oi_1 U49 ( .A1(n34), .A2(C_16), .B1(C_15), .B2(X_15), .Y(n32) );
  sg13g2_nand3_1 U50 ( .A(n10), .B(n12), .C(n11), .Y(n28) );
  sg13g2_nand3_1 U51 ( .A(n36), .B(n9), .C(n37), .Y(n29) );
  sg13g2_a22oi_1 U52 ( .A1(n38), .A2(n12), .B1(C_9), .B2(X_9), .Y(n35) );
  sg13g2_o21ai_1 U53 ( .A1(X_10), .A2(n39), .B1(n40), .Y(n38) );
  sg13g2_a22oi_1 U54 ( .A1(n41), .A2(C_12), .B1(C_11), .B2(X_11), .Y(n39) );
  sg13g2_a221oi_1 U55 ( .A1(C_1), .A2(X_1), .B1(n42), .B2(n6), .C1(n43), .Y(
        n24) );
  sg13g2_a22oi_1 U56 ( .A1(n45), .A2(n9), .B1(C_5), .B2(X_5), .Y(n44) );
  sg13g2_o21ai_1 U57 ( .A1(X_6), .A2(n46), .B1(n47), .Y(n45) );
  sg13g2_a22oi_1 U58 ( .A1(n48), .A2(C_8), .B1(C_7), .B2(X_7), .Y(n46) );
  sg13g2_o21ai_1 U59 ( .A1(X_2), .A2(n49), .B1(n50), .Y(n42) );
  sg13g2_a22oi_1 U60 ( .A1(n51), .A2(C_4), .B1(C_3), .B2(X_3), .Y(n49) );
  sg13g2_xnor2_1 U61 ( .A(n13), .B(n52), .Y(I309) );
  sg13g2_xnor2_1 U62 ( .A(X_14), .B(n19), .Y(I308) );
  sg13g2_xnor2_1 U63 ( .A(n12), .B(n53), .Y(I211) );
  sg13g2_o21ai_1 U64 ( .A1(X_10), .A2(n55), .B1(n21), .Y(n54) );
  sg13g2_xnor2_1 U65 ( .A(X_11), .B(n21), .Y(I209) );
  sg13g2_nand3_1 U66 ( .A(X_10), .B(n53), .C(X_9), .Y(n21) );
  sg13g2_xnor2_1 U67 ( .A(n6), .B(P_0), .Y(I15) );
  sg13g2_o21ai_1 U68 ( .A1(X_2), .A2(n57), .B1(n16), .Y(n56) );
  sg13g2_xnor2_1 U69 ( .A(X_3), .B(n16), .Y(I13) );
  sg13g2_xnor2_1 U70 ( .A(n9), .B(n58), .Y(I113) );
  sg13g2_o21ai_1 U71 ( .A1(X_6), .A2(n60), .B1(n23), .Y(n59) );
  sg13g2_xnor2_1 U72 ( .A(X_7), .B(n23), .Y(I111) );
  sg13g2_nand3_1 U73 ( .A(X_5), .B(n58), .C(X_6), .Y(n23) );
  sg13g2_nand3_1 U74 ( .A(X_1), .B(P_0), .C(X_2), .Y(n16) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(\DFF_0/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_4) );
  sg13g2_dfrbp_1 \DFF_15/Q_reg  ( .D(I309), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_13) );
  sg13g2_dfrbp_1 \DFF_14/Q_reg  ( .D(I308), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_14) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(\DFF_13/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_15) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(\DFF_12/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_16) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(I211), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_9) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(\DFF_10/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_10) );
  sg13g2_dfrbp_1 \DFF_9/Q_reg  ( .D(I209), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        X_11) );
  sg13g2_dfrbp_1 \DFF_8/Q_reg  ( .D(\DFF_8/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_12) );
  sg13g2_dfrbp_1 \DFF_7/Q_reg  ( .D(I113), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        X_5) );
  sg13g2_dfrbp_1 \DFF_6/Q_reg  ( .D(\DFF_6/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_6) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(I111), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        X_7) );
  sg13g2_dfrbp_1 \DFF_4/Q_reg  ( .D(\DFF_4/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_8) );
  sg13g2_dfrbp_1 \DFF_3/Q_reg  ( .D(I15), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        X_1) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(\DFF_2/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_2) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(I13), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        X_3) );
  sg13g2_tiehi U75 ( .L_HI(\DFF_1/n1 ) );
endmodule

