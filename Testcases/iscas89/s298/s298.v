/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:21:18 2025
/////////////////////////////////////////////////////////////


module s298 ( GND, VDD, CK, G0, G1, G117, G118, G132, G133, G2, G66, G67 );
  input GND, VDD, CK, G0, G1, G2;
  output G117, G118, G132, G133, G66, G67;
  wire   G10, G11, G30, G12, G34, G13, G39, G14, G44, G15, G56, G16, G86, G17,
         G92, G18, G98, G19, G102, G20, G107, G21, G113, G22, G119, G23, G125,
         n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         \DFF_1/n1 , \DFF_0/D , n57, n58, n59, n60, n61, n62;
  assign G66 = G16;
  assign G67 = G17;
  assign G117 = G18;
  assign G118 = G19;
  assign G132 = G20;
  assign G133 = G21;

  sg13g2_nor4_2 U1 ( .A(n14), .B(n15), .C(n5), .D(n16), .Y(G98) );
  sg13g2_nor4_2 U2 ( .A(n19), .B(n20), .C(n5), .D(n16), .Y(G92) );
  sg13g2_nor3_2 U3 ( .A(n21), .B(G11), .C(n10), .Y(n16) );
  sg13g2_nor2_2 U4 ( .A(G17), .B(n17), .Y(n20) );
  sg13g2_nor2b_2 U5 ( .B_N(G17), .A(n10), .Y(n22) );
  sg13g2_nor3_2 U6 ( .A(n24), .B(n5), .C(n25), .Y(G86) );
  sg13g2_nor2_2 U7 ( .A(n59), .B(G13), .Y(n25) );
  sg13g2_a21oi_2 U8 ( .A1(n26), .A2(n27), .B1(G0), .Y(G56) );
  sg13g2_nand2_2 U9 ( .A(G15), .B(n28), .Y(n27) );
  sg13g2_nor2_2 U10 ( .A(G12), .B(n59), .Y(n29) );
  sg13g2_nor4_2 U11 ( .A(G0), .B(n30), .C(n31), .D(n32), .Y(G44) );
  sg13g2_nor3_2 U12 ( .A(n33), .B(G23), .C(n59), .Y(n32) );
  sg13g2_nor2_2 U13 ( .A(n62), .B(n34), .Y(n33) );
  sg13g2_nor3_2 U14 ( .A(n34), .B(n62), .C(n10), .Y(n30) );
  sg13g2_nor3_2 U15 ( .A(n35), .B(G0), .C(n1), .Y(G39) );
  sg13g2_nand2_2 U16 ( .A(G10), .B(n36), .Y(n34) );
  sg13g2_nor3_2 U17 ( .A(n38), .B(n36), .C(n37), .Y(G34) );
  sg13g2_nor2b_2 U18 ( .B_N(n39), .A(n7), .Y(n37) );
  sg13g2_nor2_2 U19 ( .A(n3), .B(n4), .Y(n39) );
  sg13g2_nand2_2 U20 ( .A(n13), .B(n3), .Y(n40) );
  sg13g2_nor2_2 U21 ( .A(G0), .B(n42), .Y(G125) );
  sg13g2_nor2_2 U22 ( .A(G0), .B(n43), .Y(G119) );
  sg13g2_nor4_2 U23 ( .A(n44), .B(n15), .C(n5), .D(n6), .Y(G113) );
  sg13g2_nand2_2 U24 ( .A(n10), .B(n4), .Y(n45) );
  sg13g2_a21oi_2 U25 ( .A1(n46), .A2(n47), .B1(n48), .Y(G107) );
  sg13g2_nand2_2 U26 ( .A(G12), .B(n11), .Y(n51) );
  sg13g2_nand2_2 U27 ( .A(G13), .B(n11), .Y(n50) );
  sg13g2_nand2_2 U28 ( .A(n6), .B(G11), .Y(n49) );
  sg13g2_nand2_2 U29 ( .A(n7), .B(n61), .Y(n21) );
  sg13g2_nor3_2 U30 ( .A(n52), .B(n48), .C(n53), .Y(G102) );
  sg13g2_nor4_2 U31 ( .A(G19), .B(n5), .C(n62), .D(n10), .Y(n53) );
  sg13g2_nor2_2 U32 ( .A(n46), .B(n3), .Y(n48) );
  sg13g2_nand2_2 U33 ( .A(n46), .B(n62), .Y(n54) );
  sg13g2_nor2_2 U34 ( .A(n61), .B(n58), .Y(n15) );
  sg13g2_nand2_2 U35 ( .A(G12), .B(n59), .Y(n17) );
  sg13g2_nor2_2 U36 ( .A(G11), .B(G12), .Y(n36) );
  sg13g2_inv_2 U37 ( .A(n34), .Y(n1) );
  sg13g2_inv_2 U38 ( .A(n40), .Y(\DFF_0/D ) );
  sg13g2_inv_2 U39 ( .A(G10), .Y(n3) );
  sg13g2_inv_2 U40 ( .A(G11), .Y(n4) );
  sg13g2_inv_2 U41 ( .A(n46), .Y(n5) );
  sg13g2_inv_2 U42 ( .A(n21), .Y(n6) );
  sg13g2_inv_2 U43 ( .A(G12), .Y(n7) );
  sg13g2_inv_2 U44 ( .A(n17), .Y(n8) );
  sg13g2_inv_2 U46 ( .A(n59), .Y(n10) );
  sg13g2_inv_2 U47 ( .A(G20), .Y(n11) );
  sg13g2_inv_2 U48 ( .A(G22), .Y(n12) );
  sg13g2_inv_2 U49 ( .A(G0), .Y(n13) );
  sg13g2_o21ai_1 U50 ( .A1(G18), .A2(n17), .B1(n18), .Y(n14) );
  sg13g2_or2_1 U51 ( .A(G18), .B(n62), .X(n18) );
  sg13g2_o21ai_1 U52 ( .A1(n22), .A2(n62), .B1(n23), .Y(n19) );
  sg13g2_nand3_1 U53 ( .A(G11), .B(n10), .C(G12), .Y(n23) );
  sg13g2_o21ai_1 U54 ( .A1(G16), .A2(n10), .B1(n21), .Y(n24) );
  sg13g2_nand4_1 U55 ( .A(n29), .B(G11), .C(G13), .D(n12), .Y(n28) );
  sg13g2_nand4_1 U56 ( .A(n29), .B(G22), .C(G13), .D(n4), .Y(n26) );
  sg13g2_and2_1 U57 ( .A(G23), .B(n59), .X(n31) );
  sg13g2_xor2_1 U58 ( .A(n62), .B(n37), .X(n35) );
  sg13g2_o21ai_1 U59 ( .A1(G12), .A2(G10), .B1(n13), .Y(n38) );
  sg13g2_a221oi_1 U60 ( .A1(n40), .A2(n41), .B1(n3), .B2(n4), .C1(n39), .Y(G30) );
  sg13g2_o21ai_1 U61 ( .A1(G12), .A2(n62), .B1(n13), .Y(n41) );
  sg13g2_xnor2_1 U62 ( .A(G23), .B(G1), .Y(n42) );
  sg13g2_xor2_1 U63 ( .A(n12), .B(G2), .X(n43) );
  sg13g2_o21ai_1 U64 ( .A1(G21), .A2(n10), .B1(n45), .Y(n44) );
  sg13g2_nand4_1 U65 ( .A(n59), .B(n49), .C(n50), .D(n51), .Y(n47) );
  sg13g2_a221oi_1 U66 ( .A1(n59), .A2(n36), .B1(G19), .B2(n8), .C1(n54), .Y(
        n52) );
  sg13g2_o21ai_1 U67 ( .A1(n55), .A2(G15), .B1(n56), .Y(n46) );
  sg13g2_nand4_1 U68 ( .A(G11), .B(n15), .C(n7), .D(n12), .Y(n56) );
  sg13g2_and3_1 U69 ( .A(G22), .B(n15), .C(n36), .X(n55) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(\DFF_0/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G10) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(G125), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G23) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(G119), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G22) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(G113), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G21) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(G107), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G20) );
  sg13g2_dfrbp_1 \DFF_9/Q_reg  ( .D(G102), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G19) );
  sg13g2_dfrbp_1 \DFF_8/Q_reg  ( .D(G98), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G18) );
  sg13g2_dfrbp_1 \DFF_7/Q_reg  ( .D(G92), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G17) );
  sg13g2_dfrbp_1 \DFF_6/Q_reg  ( .D(G86), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G16) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(G56), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G15) );
  sg13g2_dfrbp_1 \DFF_3/Q_reg  ( .D(G39), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G13) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(G34), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G12) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(G30), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G11) );
  sg13g2_dfrbp_2 \DFF_4/Q_reg  ( .D(G44), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G14) );
  sg13g2_inv_1 U70 ( .A(G14), .Y(n57) );
  sg13g2_inv_1 U71 ( .A(n57), .Y(n58) );
  sg13g2_inv_1 U72 ( .A(n57), .Y(n59) );
  sg13g2_inv_1 U73 ( .A(n9), .Y(n60) );
  sg13g2_inv_1 U74 ( .A(n60), .Y(n61) );
  sg13g2_inv_1 U75 ( .A(n60), .Y(n62) );
  sg13g2_tiehi U76 ( .L_HI(\DFF_1/n1 ) );
  sg13g2_inv_4 U77 ( .A(G13), .Y(n9) );
endmodule

