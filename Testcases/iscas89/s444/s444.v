/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:22:46 2025
/////////////////////////////////////////////////////////////


module s444 ( GND, VDD, CK, G0, G1, G107, G108, G118, G119, G167, G168, G2 );
  input GND, VDD, CK, G0, G1, G2;
  output G107, G108, G118, G119, G167, G168;
  wire   G11, G37, G12, G41, G13, G45, G14, G49, G15, G58, G16, G62, G17, G66,
         G18, G19, G80, G20, G84, G21, G88, G22, G92, G23, G101, G24, G25,
         G109, G26, G110, G27, G28, G112, G29, G113, G30, G114, G31, G155, n1,
         n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, \DFF_1/n1 , \DFF_16/D , \DFF_13/D ,
         \DFF_7/D ;
  assign G107 = G25;
  assign G108 = G26;
  assign G118 = G27;
  assign G168 = G30;

  sg13g2_nand2_2 U1 ( .A(n17), .B(n18), .Y(\DFF_16/D ) );
  sg13g2_a21oi_2 U2 ( .A1(n19), .A2(n11), .B1(G0), .Y(n17) );
  sg13g2_a21oi_2 U3 ( .A1(n20), .A2(n11), .B1(n21), .Y(G92) );
  sg13g2_nand2_2 U4 ( .A(n24), .B(G21), .Y(n20) );
  sg13g2_nor3_2 U5 ( .A(n21), .B(n24), .C(n25), .Y(G84) );
  sg13g2_nor2b_2 U6 ( .B_N(n26), .A(G20), .Y(n25) );
  sg13g2_nor2_2 U7 ( .A(n9), .B(n26), .Y(n24) );
  sg13g2_nor2_2 U8 ( .A(n21), .B(n27), .Y(G80) );
  sg13g2_nand2_2 U9 ( .A(n28), .B(G19), .Y(n26) );
  sg13g2_nand2_2 U10 ( .A(n23), .B(n16), .Y(n21) );
  sg13g2_nor3_2 U11 ( .A(n2), .B(n31), .C(n33), .Y(G66) );
  sg13g2_nor2b_2 U12 ( .B_N(n34), .A(G17), .Y(n33) );
  sg13g2_nor2b_2 U13 ( .B_N(G17), .A(n34), .Y(n31) );
  sg13g2_nor2_2 U14 ( .A(n2), .B(n35), .Y(G62) );
  sg13g2_nand2_2 U15 ( .A(G16), .B(n4), .Y(n34) );
  sg13g2_nor2_2 U16 ( .A(n2), .B(n37), .Y(G58) );
  sg13g2_nand2_2 U17 ( .A(G15), .B(n38), .Y(n36) );
  sg13g2_nor2_2 U18 ( .A(n28), .B(G0), .Y(n32) );
  sg13g2_a21oi_2 U19 ( .A1(n41), .A2(n5), .B1(n42), .Y(G49) );
  sg13g2_nor2_2 U20 ( .A(n42), .B(n43), .Y(G45) );
  sg13g2_nand2_2 U21 ( .A(G13), .B(n1), .Y(n41) );
  sg13g2_nor2_2 U22 ( .A(n42), .B(n45), .Y(G41) );
  sg13g2_nand2_2 U23 ( .A(G12), .B(G11), .Y(n44) );
  sg13g2_nor2_2 U24 ( .A(G11), .B(n42), .Y(G37) );
  sg13g2_nand2_2 U25 ( .A(n40), .B(n16), .Y(n42) );
  sg13g2_nand2_2 U26 ( .A(G14), .B(n46), .Y(n40) );
  sg13g2_nor2_2 U27 ( .A(G0), .B(n47), .Y(G155) );
  sg13g2_nor2_2 U28 ( .A(G21), .B(G24), .Y(n19) );
  sg13g2_a21oi_2 U29 ( .A1(n49), .A2(n50), .B1(n51), .Y(G113) );
  sg13g2_nor2_2 U30 ( .A(G22), .B(n12), .Y(n56) );
  sg13g2_nor2_2 U31 ( .A(G21), .B(G0), .Y(n55) );
  sg13g2_a21oi_2 U32 ( .A1(n57), .A2(n6), .B1(n49), .Y(G112) );
  sg13g2_nor2_2 U33 ( .A(G17), .B(n6), .Y(n49) );
  sg13g2_nand2_2 U34 ( .A(n60), .B(n61), .Y(n53) );
  sg13g2_nor2_2 U35 ( .A(G23), .B(G22), .Y(n62) );
  sg13g2_nand2_2 U36 ( .A(n63), .B(n59), .Y(n57) );
  sg13g2_nor4_2 U37 ( .A(n48), .B(n10), .C(n60), .D(n64), .Y(G110) );
  sg13g2_nor3_2 U38 ( .A(n11), .B(G19), .C(G0), .Y(n64) );
  sg13g2_nor2_2 U39 ( .A(n13), .B(G0), .Y(n60) );
  sg13g2_nor3_2 U40 ( .A(n7), .B(G0), .C(n9), .Y(n48) );
  sg13g2_nor2_2 U41 ( .A(n65), .B(n66), .Y(G109) );
  sg13g2_nand2_2 U42 ( .A(G21), .B(n16), .Y(n59) );
  sg13g2_nor4_2 U43 ( .A(G23), .B(G22), .C(G20), .D(n7), .Y(n67) );
  sg13g2_nand2_2 U44 ( .A(G23), .B(n54), .Y(n58) );
  sg13g2_nor2_2 U45 ( .A(G20), .B(G19), .Y(n54) );
  sg13g2_nor2_2 U46 ( .A(G0), .B(n68), .Y(G101) );
  sg13g2_inv_2 U47 ( .A(n44), .Y(n1) );
  sg13g2_inv_2 U48 ( .A(n32), .Y(n2) );
  sg13g2_inv_2 U49 ( .A(n30), .Y(\DFF_7/D ) );
  sg13g2_inv_2 U50 ( .A(n36), .Y(n4) );
  sg13g2_inv_2 U51 ( .A(G14), .Y(n5) );
  sg13g2_inv_2 U52 ( .A(\DFF_13/D ), .Y(n6) );
  sg13g2_inv_2 U53 ( .A(G19), .Y(n7) );
  sg13g2_inv_2 U54 ( .A(n54), .Y(n8) );
  sg13g2_inv_2 U55 ( .A(G20), .Y(n9) );
  sg13g2_inv_2 U56 ( .A(n59), .Y(n10) );
  sg13g2_inv_2 U57 ( .A(G22), .Y(n11) );
  sg13g2_inv_2 U58 ( .A(G23), .Y(n12) );
  sg13g2_inv_2 U59 ( .A(G24), .Y(n13) );
  sg13g2_inv_2 U60 ( .A(G28), .Y(G119) );
  sg13g2_inv_2 U61 ( .A(G29), .Y(G167) );
  sg13g2_inv_2 U62 ( .A(G0), .Y(n16) );
  sg13g2_nand3_1 U63 ( .A(G19), .B(n9), .C(n19), .Y(n18) );
  sg13g2_and3_1 U64 ( .A(n22), .B(n23), .C(n20), .X(G88) );
  sg13g2_a21o_1 U65 ( .A1(n24), .A2(n16), .B1(n10), .X(n22) );
  sg13g2_o21ai_1 U66 ( .A1(G19), .A2(n28), .B1(n26), .Y(n27) );
  sg13g2_nand3_1 U67 ( .A(n28), .B(n29), .C(G22), .Y(n23) );
  sg13g2_or2_1 U68 ( .A(G21), .B(n8), .X(n29) );
  sg13g2_o21ai_1 U69 ( .A1(n31), .A2(G18), .B1(n32), .Y(n30) );
  sg13g2_o21ai_1 U70 ( .A1(n4), .A2(G16), .B1(n34), .Y(n35) );
  sg13g2_o21ai_1 U71 ( .A1(G15), .A2(n38), .B1(n36), .Y(n37) );
  sg13g2_and3_1 U72 ( .A(n39), .B(n38), .C(G18), .X(n28) );
  sg13g2_nand2b_1 U73 ( .A_N(G31), .B(n40), .Y(n38) );
  sg13g2_or3_1 U74 ( .A(G16), .B(G17), .C(G15), .X(n39) );
  sg13g2_o21ai_1 U75 ( .A1(n1), .A2(G13), .B1(n41), .Y(n43) );
  sg13g2_o21ai_1 U76 ( .A1(G12), .A2(G11), .B1(n44), .Y(n45) );
  sg13g2_or3_1 U77 ( .A(G12), .B(G13), .C(G11), .X(n46) );
  sg13g2_xnor2_1 U78 ( .A(G31), .B(G1), .Y(n47) );
  sg13g2_and2_1 U79 ( .A(n19), .B(n48), .X(G114) );
  sg13g2_and2_1 U80 ( .A(n50), .B(n6), .X(n51) );
  sg13g2_o21ai_1 U81 ( .A1(n52), .A2(n8), .B1(n53), .Y(n50) );
  sg13g2_a22oi_1 U82 ( .A1(n55), .A2(G22), .B1(n56), .B2(n10), .Y(n52) );
  sg13g2_o21ai_1 U83 ( .A1(n58), .A2(n59), .B1(n53), .Y(\DFF_13/D ) );
  sg13g2_nand4_1 U84 ( .A(G21), .B(G19), .C(n62), .D(n9), .Y(n61) );
  sg13g2_nand3_1 U85 ( .A(n54), .B(n16), .C(G22), .Y(n63) );
  sg13g2_o21ai_1 U86 ( .A1(n67), .A2(n13), .B1(n10), .Y(n66) );
  sg13g2_o21ai_1 U87 ( .A1(n12), .A2(n11), .B1(n58), .Y(n65) );
  sg13g2_xnor2_1 U88 ( .A(G23), .B(G2), .Y(n68) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(G37), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G11) );
  sg13g2_dfrbp_1 \DFF_20/Q_reg  ( .D(G155), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G31) );
  sg13g2_dfrbp_1 \DFF_19/Q_reg  ( .D(G114), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G30) );
  sg13g2_dfrbp_1 \DFF_18/Q_reg  ( .D(G113), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G29) );
  sg13g2_dfrbp_1 \DFF_17/Q_reg  ( .D(G112), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G28) );
  sg13g2_dfrbp_1 \DFF_16/Q_reg  ( .D(\DFF_16/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G27) );
  sg13g2_dfrbp_1 \DFF_15/Q_reg  ( .D(G110), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G26) );
  sg13g2_dfrbp_1 \DFF_14/Q_reg  ( .D(G109), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G25) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(\DFF_13/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G24) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(G101), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G23) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(G92), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G22) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(G88), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G21) );
  sg13g2_dfrbp_1 \DFF_9/Q_reg  ( .D(G84), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G20) );
  sg13g2_dfrbp_1 \DFF_8/Q_reg  ( .D(G80), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G19) );
  sg13g2_dfrbp_1 \DFF_7/Q_reg  ( .D(\DFF_7/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G18) );
  sg13g2_dfrbp_1 \DFF_6/Q_reg  ( .D(G66), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G17) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(G62), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G16) );
  sg13g2_dfrbp_1 \DFF_4/Q_reg  ( .D(G58), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G15) );
  sg13g2_dfrbp_1 \DFF_3/Q_reg  ( .D(G49), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G14) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(G45), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G13) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(G41), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G12) );
  sg13g2_tiehi U89 ( .L_HI(\DFF_1/n1 ) );
endmodule

