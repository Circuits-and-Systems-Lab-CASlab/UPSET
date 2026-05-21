/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:23:07 2025
/////////////////////////////////////////////////////////////


module s526 ( GND, VDD, CK, G0, G1, G147, G148, G198, G199, G2, G213, G214 );
  input GND, VDD, CK, G0, G1, G2;
  output G147, G148, G198, G199, G213, G214;
  wire   G10, G11, G61, G12, G13, G14, G79, G15, G84, G16, G89, G17, G96, G18,
         G101, G19, G106, G20, G115, G21, G22, G137, G23, G167, G24, G173, G25,
         G179, G26, G183, G27, G188, G28, G194, G29, G200, G30, G206, n1, n2,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         \DFF_1/n1 , \DFF_0/D , \DFF_11/D , \DFF_3/D , \DFF_2/D , n92, n93,
         n94, n95, n96, n97;
  assign G147 = G23;
  assign G148 = G24;
  assign G198 = G25;
  assign G199 = G26;
  assign G213 = G27;
  assign G214 = G28;

  sg13g2_nor2_2 U1 ( .A(G0), .B(n27), .Y(\DFF_2/D ) );
  sg13g2_nor2_2 U2 ( .A(n16), .B(G12), .Y(n26) );
  sg13g2_nand2_2 U3 ( .A(n28), .B(n29), .Y(\DFF_11/D ) );
  sg13g2_nand2_2 U4 ( .A(n94), .B(n6), .Y(n30) );
  sg13g2_a21oi_2 U5 ( .A1(n35), .A2(n36), .B1(n37), .Y(n34) );
  sg13g2_nor4_2 U6 ( .A(G18), .B(n11), .C(n14), .D(n19), .Y(n37) );
  sg13g2_nand2_2 U7 ( .A(n96), .B(n12), .Y(n32) );
  sg13g2_nor2_2 U8 ( .A(n31), .B(n38), .Y(G89) );
  sg13g2_nor3_2 U9 ( .A(n39), .B(G0), .C(n40), .Y(G84) );
  sg13g2_nor4_2 U10 ( .A(G0), .B(n42), .C(n43), .D(n41), .Y(G79) );
  sg13g2_nor2_2 U11 ( .A(G14), .B(G10), .Y(n42) );
  sg13g2_nor2_2 U12 ( .A(n5), .B(n4), .Y(n44) );
  sg13g2_nand2_2 U13 ( .A(n96), .B(n4), .Y(n45) );
  sg13g2_nor2_2 U14 ( .A(G0), .B(n47), .Y(G206) );
  sg13g2_nor2_2 U15 ( .A(G0), .B(n48), .Y(G200) );
  sg13g2_nor4_2 U16 ( .A(n49), .B(n50), .C(n7), .D(n23), .Y(G194) );
  sg13g2_a21oi_2 U17 ( .A1(n52), .A2(n53), .B1(n54), .Y(G188) );
  sg13g2_nand2_2 U18 ( .A(G21), .B(n18), .Y(n57) );
  sg13g2_nand2_2 U19 ( .A(G12), .B(n18), .Y(n56) );
  sg13g2_nor3_2 U20 ( .A(n58), .B(n54), .C(n59), .Y(G183) );
  sg13g2_nor3_2 U21 ( .A(n60), .B(G12), .C(n7), .Y(n59) );
  sg13g2_nor2_2 U22 ( .A(n13), .B(n52), .Y(n54) );
  sg13g2_nor4_2 U23 ( .A(G26), .B(n7), .C(n6), .D(n9), .Y(n58) );
  sg13g2_nor4_2 U24 ( .A(n63), .B(n64), .C(n7), .D(n23), .Y(G179) );
  sg13g2_nor2_2 U25 ( .A(n6), .B(n94), .Y(n23) );
  sg13g2_nor4_2 U26 ( .A(n66), .B(n67), .C(n7), .D(n64), .Y(G173) );
  sg13g2_nor3_2 U27 ( .A(n9), .B(G20), .C(n51), .Y(n64) );
  sg13g2_nor2_2 U28 ( .A(G24), .B(n61), .Y(n67) );
  sg13g2_nand2_2 U29 ( .A(n94), .B(G21), .Y(n61) );
  sg13g2_nor2b_2 U30 ( .B_N(G24), .A(n9), .Y(n68) );
  sg13g2_nor3_2 U31 ( .A(n70), .B(n71), .C(n7), .Y(G167) );
  sg13g2_nor2_2 U32 ( .A(n94), .B(G12), .Y(n71) );
  sg13g2_nand2_2 U33 ( .A(n16), .B(n6), .Y(n51) );
  sg13g2_nor2_2 U34 ( .A(G0), .B(n52), .Y(G137) );
  sg13g2_nand2_2 U35 ( .A(G12), .B(n16), .Y(n74) );
  sg13g2_nor2_2 U36 ( .A(G20), .B(n93), .Y(n50) );
  sg13g2_nor3_2 U37 ( .A(n75), .B(G0), .C(n2), .Y(G115) );
  sg13g2_nand2_2 U38 ( .A(n1), .B(n15), .Y(n78) );
  sg13g2_nor4_2 U39 ( .A(n14), .B(n11), .C(G17), .D(G18), .Y(n76) );
  sg13g2_nor2b_2 U40 ( .B_N(n79), .A(n11), .Y(n80) );
  sg13g2_nor2_2 U41 ( .A(n86), .B(n11), .Y(n35) );
  sg13g2_a21oi_2 U42 ( .A1(n84), .A2(n96), .B1(n83), .Y(n88) );
  sg13g2_nor2_2 U43 ( .A(n13), .B(G0), .Y(n83) );
  sg13g2_nor2_2 U44 ( .A(n12), .B(n11), .Y(n84) );
  sg13g2_nor2_2 U45 ( .A(n1), .B(n13), .Y(n87) );
  sg13g2_nand2_2 U46 ( .A(n86), .B(n19), .Y(n77) );
  sg13g2_nand2_2 U47 ( .A(G15), .B(n40), .Y(n86) );
  sg13g2_nor2b_2 U48 ( .B_N(n43), .A(n4), .Y(n40) );
  sg13g2_nor2_2 U49 ( .A(G11), .B(G14), .Y(n43) );
  sg13g2_inv_2 U50 ( .A(n77), .Y(n1) );
  sg13g2_inv_2 U51 ( .A(n24), .Y(n2) );
  sg13g2_inv_2 U52 ( .A(n45), .Y(\DFF_0/D ) );
  sg13g2_inv_2 U53 ( .A(G10), .Y(n4) );
  sg13g2_inv_2 U54 ( .A(G11), .Y(n5) );
  sg13g2_inv_2 U55 ( .A(G12), .Y(n6) );
  sg13g2_inv_2 U56 ( .A(n52), .Y(n7) );
  sg13g2_inv_2 U57 ( .A(n74), .Y(n8) );
  sg13g2_inv_2 U58 ( .A(n94), .Y(n9) );
  sg13g2_inv_2 U59 ( .A(G15), .Y(n10) );
  sg13g2_inv_2 U60 ( .A(G16), .Y(n11) );
  sg13g2_inv_2 U61 ( .A(G17), .Y(n12) );
  sg13g2_inv_2 U62 ( .A(G18), .Y(n13) );
  sg13g2_inv_2 U63 ( .A(G19), .Y(n14) );
  sg13g2_inv_2 U64 ( .A(G20), .Y(n15) );
  sg13g2_inv_2 U65 ( .A(G21), .Y(n16) );
  sg13g2_inv_2 U66 ( .A(G26), .Y(n17) );
  sg13g2_inv_2 U67 ( .A(G27), .Y(n18) );
  sg13g2_inv_2 U68 ( .A(G30), .Y(n19) );
  sg13g2_o21ai_1 U70 ( .A1(n9), .A2(n21), .B1(n22), .Y(\DFF_3/D ) );
  sg13g2_nand4_1 U71 ( .A(G21), .B(n2), .C(n23), .D(n97), .Y(n22) );
  sg13g2_o21ai_1 U72 ( .A1(n24), .A2(n25), .B1(n96), .Y(n21) );
  sg13g2_or2_1 U73 ( .A(n26), .B(n8), .X(n25) );
  sg13g2_a221oi_1 U74 ( .A1(G12), .A2(n24), .B1(n26), .B2(n2), .C1(n8), .Y(n27) );
  sg13g2_nand3_1 U75 ( .A(n24), .B(n97), .C(G21), .Y(n29) );
  sg13g2_nand4_1 U76 ( .A(n2), .B(n30), .C(n97), .D(n16), .Y(n28) );
  sg13g2_a221oi_1 U77 ( .A1(n1), .A2(n12), .B1(n31), .B2(n32), .C1(n33), .Y(
        G96) );
  sg13g2_o21ai_1 U78 ( .A1(G16), .A2(G17), .B1(n34), .Y(n33) );
  sg13g2_o21ai_1 U79 ( .A1(G18), .A2(n14), .B1(n12), .Y(n36) );
  sg13g2_a21o_1 U80 ( .A1(n11), .A2(n1), .B1(n35), .X(n38) );
  sg13g2_o21ai_1 U81 ( .A1(n11), .A2(n19), .B1(n97), .Y(n31) );
  sg13g2_xor2_1 U82 ( .A(n10), .B(n41), .X(n39) );
  sg13g2_and2_1 U83 ( .A(G14), .B(n44), .X(n41) );
  sg13g2_a221oi_1 U84 ( .A1(n45), .A2(n46), .B1(n4), .B2(n5), .C1(n44), .Y(G61) );
  sg13g2_o21ai_1 U85 ( .A1(G14), .A2(n10), .B1(n97), .Y(n46) );
  sg13g2_xor2_1 U86 ( .A(n19), .B(G1), .X(n47) );
  sg13g2_xnor2_1 U87 ( .A(G29), .B(G2), .Y(n48) );
  sg13g2_o21ai_1 U88 ( .A1(G28), .A2(n9), .B1(n51), .Y(n49) );
  sg13g2_nand4_1 U89 ( .A(n94), .B(n55), .C(n56), .D(n57), .Y(n53) );
  sg13g2_nand2b_1 U90 ( .A_N(n51), .B(G20), .Y(n55) );
  sg13g2_o21ai_1 U91 ( .A1(n61), .A2(n17), .B1(n62), .Y(n60) );
  sg13g2_nand3_1 U92 ( .A(n15), .B(n16), .C(n94), .Y(n62) );
  sg13g2_o21ai_1 U93 ( .A1(G25), .A2(n61), .B1(n65), .Y(n63) );
  sg13g2_or2_1 U94 ( .A(G25), .B(n6), .X(n65) );
  sg13g2_o21ai_1 U95 ( .A1(n68), .A2(n6), .B1(n69), .Y(n66) );
  sg13g2_nand3_1 U96 ( .A(G20), .B(n9), .C(G21), .Y(n69) );
  sg13g2_o21ai_1 U97 ( .A1(G23), .A2(n9), .B1(n51), .Y(n70) );
  sg13g2_o21ai_1 U98 ( .A1(n72), .A2(G22), .B1(n73), .Y(n52) );
  sg13g2_or4_1 U99 ( .A(n74), .B(n15), .C(n94), .D(G29), .X(n73) );
  sg13g2_and3_1 U100 ( .A(n50), .B(G29), .C(n8), .X(n72) );
  sg13g2_nand3_1 U101 ( .A(n76), .B(n77), .C(G20), .Y(n24) );
  sg13g2_o21ai_1 U102 ( .A1(G20), .A2(n76), .B1(n78), .Y(n75) );
  sg13g2_a221oi_1 U103 ( .A1(n35), .A2(n79), .B1(n80), .B2(G30), .C1(n81), .Y(
        G106) );
  sg13g2_a21o_1 U104 ( .A1(n1), .A2(n14), .B1(n82), .X(n81) );
  sg13g2_a22oi_1 U105 ( .A1(G19), .A2(n97), .B1(n83), .B2(n84), .Y(n82) );
  sg13g2_o21ai_1 U106 ( .A1(G18), .A2(G17), .B1(n85), .Y(n79) );
  sg13g2_nand3_1 U107 ( .A(G18), .B(G19), .C(G17), .Y(n85) );
  sg13g2_a221oi_1 U108 ( .A1(n1), .A2(n13), .B1(n87), .B2(n84), .C1(n88), .Y(
        G101) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(\DFF_0/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G10) );
  sg13g2_dfrbp_1 \DFF_20/Q_reg  ( .D(G206), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G30) );
  sg13g2_dfrbp_1 \DFF_19/Q_reg  ( .D(G200), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G29) );
  sg13g2_dfrbp_1 \DFF_18/Q_reg  ( .D(G194), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G28) );
  sg13g2_dfrbp_1 \DFF_17/Q_reg  ( .D(G188), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G27) );
  sg13g2_dfrbp_1 \DFF_16/Q_reg  ( .D(G183), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G26) );
  sg13g2_dfrbp_1 \DFF_15/Q_reg  ( .D(G179), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G25) );
  sg13g2_dfrbp_1 \DFF_14/Q_reg  ( .D(G173), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G24) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(G167), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G23) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(G137), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G22) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(\DFF_11/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G21) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(G115), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G20) );
  sg13g2_dfrbp_1 \DFF_9/Q_reg  ( .D(G106), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G19) );
  sg13g2_dfrbp_1 \DFF_8/Q_reg  ( .D(G101), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G18) );
  sg13g2_dfrbp_1 \DFF_7/Q_reg  ( .D(G96), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G17) );
  sg13g2_dfrbp_1 \DFF_6/Q_reg  ( .D(G89), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G16) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(G84), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G15) );
  sg13g2_dfrbp_1 \DFF_4/Q_reg  ( .D(G79), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G14) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(\DFF_2/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G12) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(G61), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G11) );
  sg13g2_dfrbp_2 \DFF_3/Q_reg  ( .D(\DFF_3/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G13) );
  sg13g2_inv_1 U109 ( .A(G13), .Y(n92) );
  sg13g2_inv_1 U110 ( .A(n92), .Y(n93) );
  sg13g2_inv_1 U111 ( .A(n92), .Y(n94) );
  sg13g2_inv_1 U112 ( .A(n20), .Y(n95) );
  sg13g2_inv_1 U113 ( .A(n95), .Y(n96) );
  sg13g2_inv_1 U114 ( .A(n95), .Y(n97) );
  sg13g2_tiehi U115 ( .L_HI(\DFF_1/n1 ) );
  sg13g2_inv_16 U116 ( .A(G0), .Y(n20) );
endmodule

