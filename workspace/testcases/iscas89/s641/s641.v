/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:23:25 2025
/////////////////////////////////////////////////////////////


module s641 ( CK, G1, G10, G100BF, G101BF, G103BF, G104BF, G105BF, G106BF, 
        G107, G11, G12, G13, G138, G14, G15, G16, G17, G18, G19, G2, G20, G21, 
        G22, G23, G24, G25, G26, G27, G28, G29, G3, G30, G31, G32, G33, G34, 
        G35, G36, G4, G5, G6, G8, G83, G84, G85, G86BF, G87BF, G88BF, G89BF, 
        G9, G90, G91, G92, G94, G95BF, G96BF, G97BF, G98BF, G99BF );
  input CK, G1, G10, G11, G12, G13, G14, G15, G16, G17, G18, G19, G2, G20, G21,
         G22, G23, G24, G25, G26, G27, G28, G29, G3, G30, G31, G32, G33, G34,
         G35, G36, G4, G5, G6, G8, G9;
  output G100BF, G101BF, G103BF, G104BF, G105BF, G106BF, G107, G138, G83, G84,
         G85, G86BF, G87BF, G88BF, G89BF, G90, G91, G92, G94, G95BF, G96BF,
         G97BF, G98BF, G99BF;
  wire   G27, G29, G64, G65, G66, G67, G250, G68, G69, G70, G71, G72, G73, G74,
         G75, G76, G77, G78, G79, G80, G81, G82, G277, G276, G275, G271, G272,
         G273, G274, n2, n3, n4, n5, n6, n8, n9, n10, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, \DFF_1/n1 , \DFF_0/D , \DFF_10/D , \DFF_9/D ,
         \DFF_8/D , \DFF_7/D , \DFF_6/D , \DFF_5/D , \DFF_4/D , \DFF_2/D ;
  assign G91 = G27;
  assign G94 = G29;
  assign G138 = \DFF_6/D ;

  sg13g2_nand2_2 U1 ( .A(n15), .B(n22), .Y(\DFF_10/D ) );
  sg13g2_nand2_2 U2 ( .A(G14), .B(\DFF_0/D ), .Y(G103BF) );
  sg13g2_nand2_2 U3 ( .A(n14), .B(n24), .Y(\DFF_8/D ) );
  sg13g2_nand2_2 U4 ( .A(G15), .B(n4), .Y(G104BF) );
  sg13g2_nand2_2 U5 ( .A(n13), .B(n26), .Y(\DFF_6/D ) );
  sg13g2_nand2_2 U6 ( .A(G16), .B(\DFF_2/D ), .Y(G105BF) );
  sg13g2_nand2_2 U7 ( .A(G36), .B(\DFF_4/D ), .Y(G101BF) );
  sg13g2_nand2_2 U8 ( .A(G17), .B(n10), .Y(G106BF) );
  sg13g2_nand2_2 U9 ( .A(G35), .B(n13), .Y(G100BF) );
  sg13g2_nand2_2 U10 ( .A(G33), .B(n14), .Y(G98BF) );
  sg13g2_nand2_2 U11 ( .A(G31), .B(n15), .Y(G96BF) );
  sg13g2_nand2_2 U12 ( .A(G26), .B(G12), .Y(n30) );
  sg13g2_nor3_2 U13 ( .A(n8), .B(G11), .C(n37), .Y(n28) );
  sg13g2_nor2_2 U14 ( .A(n5), .B(n2), .Y(n27) );
  sg13g2_nor3_2 U15 ( .A(n39), .B(n4), .C(n40), .Y(G275) );
  sg13g2_nor4_2 U16 ( .A(\DFF_2/D ), .B(\DFF_0/D ), .C(n4), .D(n37), .Y(n42)
         );
  sg13g2_nand2_2 U17 ( .A(G68), .B(n12), .Y(n37) );
  sg13g2_nor4_2 U18 ( .A(\DFF_0/D ), .B(n10), .C(n4), .D(n8), .Y(n45) );
  sg13g2_nor2_2 U19 ( .A(n26), .B(n25), .Y(n34) );
  sg13g2_nand2_2 U20 ( .A(G69), .B(n19), .Y(n25) );
  sg13g2_nand2_2 U21 ( .A(G70), .B(n9), .Y(n26) );
  sg13g2_nor4_2 U22 ( .A(\DFF_2/D ), .B(\DFF_0/D ), .C(n10), .D(n5), .Y(n48)
         );
  sg13g2_nor2_2 U23 ( .A(n24), .B(n23), .Y(n35) );
  sg13g2_nand2_2 U24 ( .A(G71), .B(n19), .Y(n23) );
  sg13g2_nand2_2 U25 ( .A(G72), .B(n6), .Y(n24) );
  sg13g2_nor4_2 U26 ( .A(\DFF_2/D ), .B(n10), .C(n4), .D(n2), .Y(n50) );
  sg13g2_nor2_2 U27 ( .A(n22), .B(n21), .Y(n36) );
  sg13g2_nand2_2 U28 ( .A(G73), .B(n19), .Y(n21) );
  sg13g2_nand2_2 U29 ( .A(G74), .B(n3), .Y(n22) );
  sg13g2_nor2_2 U30 ( .A(n46), .B(n40), .Y(G276) );
  sg13g2_nand2_2 U31 ( .A(n38), .B(n43), .Y(n40) );
  sg13g2_nand2_2 U32 ( .A(G66), .B(n38), .Y(n54) );
  sg13g2_nor2_2 U33 ( .A(n10), .B(G2), .Y(n38) );
  sg13g2_nor2_2 U34 ( .A(G65), .B(n56), .Y(n59) );
  sg13g2_nor2_2 U35 ( .A(n57), .B(G2), .Y(G250) );
  sg13g2_nor2_2 U36 ( .A(G67), .B(n56), .Y(n61) );
  sg13g2_nor2_2 U37 ( .A(G11), .B(G3), .Y(n56) );
  sg13g2_nor2_2 U38 ( .A(G13), .B(G3), .Y(n53) );
  sg13g2_inv_2 U39 ( .A(n39), .Y(\DFF_0/D ) );
  sg13g2_inv_2 U40 ( .A(n36), .Y(n2) );
  sg13g2_inv_2 U41 ( .A(G86BF), .Y(n3) );
  sg13g2_inv_2 U42 ( .A(n46), .Y(n4) );
  sg13g2_inv_2 U43 ( .A(n35), .Y(n5) );
  sg13g2_inv_2 U44 ( .A(G87BF), .Y(n6) );
  sg13g2_inv_2 U45 ( .A(n43), .Y(\DFF_2/D ) );
  sg13g2_inv_2 U46 ( .A(n34), .Y(n8) );
  sg13g2_inv_2 U47 ( .A(G88BF), .Y(n9) );
  sg13g2_inv_2 U48 ( .A(n57), .Y(n10) );
  sg13g2_inv_2 U49 ( .A(n37), .Y(\DFF_4/D ) );
  sg13g2_inv_2 U50 ( .A(G89BF), .Y(n12) );
  sg13g2_inv_2 U51 ( .A(n25), .Y(n13) );
  sg13g2_inv_2 U52 ( .A(n23), .Y(n14) );
  sg13g2_inv_2 U53 ( .A(n21), .Y(n15) );
  sg13g2_inv_2 U54 ( .A(G10), .Y(n16) );
  sg13g2_inv_2 U55 ( .A(n56), .Y(n17) );
  sg13g2_inv_2 U56 ( .A(G13), .Y(n18) );
  sg13g2_inv_2 U57 ( .A(G4), .Y(n19) );
  sg13g2_inv_2 U58 ( .A(G9), .Y(n20) );
  sg13g2_o21ai_1 U59 ( .A1(n3), .A2(n21), .B1(n22), .Y(\DFF_9/D ) );
  sg13g2_nand2b_1 U60 ( .A_N(n22), .B(G30), .Y(G95BF) );
  sg13g2_o21ai_1 U61 ( .A1(n6), .A2(n23), .B1(n24), .Y(\DFF_7/D ) );
  sg13g2_nand2b_1 U62 ( .A_N(n24), .B(G32), .Y(G97BF) );
  sg13g2_o21ai_1 U63 ( .A1(n9), .A2(n25), .B1(n26), .Y(\DFF_5/D ) );
  sg13g2_nand2b_1 U64 ( .A_N(n26), .B(G34), .Y(G99BF) );
  sg13g2_and4_1 U65 ( .A(G28), .B(G13), .C(G12), .D(G11), .X(G92) );
  sg13g2_a221oi_1 U66 ( .A1(n27), .A2(n28), .B1(n29), .B2(n18), .C1(n30), .Y(
        G90) );
  sg13g2_o21ai_1 U67 ( .A1(G9), .A2(n31), .B1(n32), .Y(n29) );
  sg13g2_nand2b_1 U68 ( .A_N(n33), .B(G9), .Y(n32) );
  sg13g2_a22oi_1 U69 ( .A1(n34), .A2(n16), .B1(\DFF_4/D ), .B2(G10), .Y(n33)
         );
  sg13g2_a22oi_1 U70 ( .A1(n35), .A2(G10), .B1(n36), .B2(n16), .Y(n31) );
  sg13g2_and3_1 U71 ( .A(G21), .B(n19), .C(G82), .X(G85) );
  sg13g2_and3_1 U72 ( .A(G20), .B(n19), .C(G81), .X(G84) );
  sg13g2_and3_1 U73 ( .A(G19), .B(n19), .C(G80), .X(G83) );
  sg13g2_and2_1 U74 ( .A(n38), .B(\DFF_2/D ), .X(G277) );
  sg13g2_nand2b_1 U75 ( .A_N(G250), .B(n41), .Y(G274) );
  sg13g2_o21ai_1 U76 ( .A1(n42), .A2(n10), .B1(G1), .Y(n41) );
  sg13g2_o21ai_1 U77 ( .A1(G2), .A2(n43), .B1(n44), .Y(G273) );
  sg13g2_o21ai_1 U78 ( .A1(n45), .A2(\DFF_2/D ), .B1(G6), .Y(n44) );
  sg13g2_o21ai_1 U79 ( .A1(G2), .A2(n46), .B1(n47), .Y(G272) );
  sg13g2_o21ai_1 U80 ( .A1(n48), .A2(n4), .B1(G5), .Y(n47) );
  sg13g2_o21ai_1 U81 ( .A1(G2), .A2(n39), .B1(n49), .Y(G271) );
  sg13g2_o21ai_1 U82 ( .A1(n50), .A2(\DFF_0/D ), .B1(G8), .Y(n49) );
  sg13g2_o21ai_1 U83 ( .A1(n3), .A2(G3), .B1(G75), .Y(n39) );
  sg13g2_nand4_1 U84 ( .A(G22), .B(n51), .C(n52), .D(n17), .Y(G86BF) );
  sg13g2_nand3_1 U85 ( .A(n16), .B(n20), .C(n53), .Y(n52) );
  sg13g2_nand3b_1 U86 ( .A_N(n40), .B(n46), .C(G64), .Y(n51) );
  sg13g2_o21ai_1 U87 ( .A1(n9), .A2(G3), .B1(G77), .Y(n43) );
  sg13g2_nand4_1 U88 ( .A(G24), .B(n54), .C(n55), .D(n17), .Y(G88BF) );
  sg13g2_nand3_1 U89 ( .A(n53), .B(n16), .C(G9), .Y(n55) );
  sg13g2_o21ai_1 U90 ( .A1(n6), .A2(G3), .B1(G76), .Y(n46) );
  sg13g2_nand3_1 U91 ( .A(G23), .B(n58), .C(n59), .Y(G87BF) );
  sg13g2_nand3_1 U92 ( .A(n53), .B(n20), .C(G10), .Y(n58) );
  sg13g2_o21ai_1 U93 ( .A1(n12), .A2(G3), .B1(G78), .Y(n57) );
  sg13g2_nand3_1 U94 ( .A(G25), .B(n60), .C(n61), .Y(G89BF) );
  sg13g2_nand3_1 U95 ( .A(G10), .B(n53), .C(G9), .Y(n60) );
  sg13g2_and3_1 U96 ( .A(G18), .B(n19), .C(G79), .X(G107) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(\DFF_0/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G64) );
  sg13g2_dfrbp_1 \DFF_18/Q_reg  ( .D(G250), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G82) );
  sg13g2_dfrbp_1 \DFF_17/Q_reg  ( .D(G277), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G81) );
  sg13g2_dfrbp_1 \DFF_16/Q_reg  ( .D(G276), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G80) );
  sg13g2_dfrbp_1 \DFF_15/Q_reg  ( .D(G275), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G79) );
  sg13g2_dfrbp_1 \DFF_14/Q_reg  ( .D(G274), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G78) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(G273), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G77) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(G272), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G76) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(G271), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G75) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(\DFF_10/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G74) );
  sg13g2_dfrbp_1 \DFF_9/Q_reg  ( .D(\DFF_9/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G73) );
  sg13g2_dfrbp_1 \DFF_8/Q_reg  ( .D(\DFF_8/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G72) );
  sg13g2_dfrbp_1 \DFF_7/Q_reg  ( .D(\DFF_7/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G71) );
  sg13g2_dfrbp_1 \DFF_6/Q_reg  ( .D(\DFF_6/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G70) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(\DFF_5/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G69) );
  sg13g2_dfrbp_1 \DFF_4/Q_reg  ( .D(\DFF_4/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G68) );
  sg13g2_dfrbp_1 \DFF_3/Q_reg  ( .D(G250), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G67) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(\DFF_2/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G66) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(G276), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G65) );
  sg13g2_tiehi U97 ( .L_HI(\DFF_1/n1 ) );
endmodule

