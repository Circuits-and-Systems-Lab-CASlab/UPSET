/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:24:26 2025
/////////////////////////////////////////////////////////////


module s838 ( GND, VDD, CK, C_0, C_1, C_10, C_11, C_12, C_13, C_14, C_15, C_16, 
        C_17, C_18, C_19, C_2, C_20, C_21, C_22, C_23, C_24, C_25, C_26, C_27, 
        C_28, C_29, C_3, C_30, C_31, C_32, C_4, C_5, C_6, C_7, C_8, C_9, P_0, 
        Z );
  input GND, VDD, CK, C_0, C_1, C_10, C_11, C_12, C_13, C_14, C_15, C_16, C_17,
         C_18, C_19, C_2, C_20, C_21, C_22, C_23, C_24, C_25, C_26, C_27, C_28,
         C_29, C_3, C_30, C_31, C_32, C_4, C_5, C_6, C_7, C_8, C_9, P_0;
  output Z;
  wire   X_4, X_3, I13, X_2, I14, X_1, I15, X_8, X_7, I111, X_6, X_5, I113,
         X_12, X_11, I209, X_10, I210, X_9, I211, X_16, X_15, I307, X_14, I308,
         X_13, I309, X_20, X_19, I405, X_18, X_17, I407, X_24, X_23, I503,
         X_22, X_21, I505, X_28, X_27, I601, X_26, I602, X_25, I603, X_32,
         X_31, X_30, I700, X_29, I701, n2, n3, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, \DFF_1/n1 , \DFF_0/D ,
         \DFF_29/D , \DFF_28/D , \DFF_24/D , \DFF_22/D , \DFF_20/D ,
         \DFF_18/D , \DFF_16/D , \DFF_12/D , \DFF_8/D , \DFF_6/D , \DFF_4/D ;

  sg13g2_nor2_2 U1 ( .A(n9), .B(n8), .Y(n35) );
  sg13g2_nand2_2 U2 ( .A(X_31), .B(n37), .Y(n36) );
  sg13g2_nor2b_2 U3 ( .B_N(X_30), .A(n38), .Y(n37) );
  sg13g2_nor2_2 U4 ( .A(n40), .B(n30), .Y(n39) );
  sg13g2_nor2_2 U5 ( .A(n42), .B(n27), .Y(n41) );
  sg13g2_nor2_2 U6 ( .A(n44), .B(n24), .Y(n43) );
  sg13g2_nor2_2 U7 ( .A(n46), .B(n21), .Y(n45) );
  sg13g2_nor2_2 U8 ( .A(n48), .B(n17), .Y(n47) );
  sg13g2_nor2_2 U9 ( .A(n50), .B(n13), .Y(n49) );
  sg13g2_a21oi_2 U10 ( .A1(n51), .A2(n52), .B1(n34), .Y(Z) );
  sg13g2_nor4_2 U11 ( .A(n53), .B(n54), .C(C_0), .D(n55), .Y(n52) );
  sg13g2_nor4_2 U12 ( .A(n56), .B(n57), .C(X_25), .D(n58), .Y(n55) );
  sg13g2_nand2_2 U13 ( .A(C_30), .B(X_30), .Y(n61) );
  sg13g2_nor2b_2 U14 ( .B_N(X_32), .A(X_31), .Y(n62) );
  sg13g2_nor2_2 U15 ( .A(n63), .B(n57), .Y(n54) );
  sg13g2_nor3_2 U16 ( .A(X_22), .B(X_24), .C(X_23), .Y(n65) );
  sg13g2_nand2_2 U17 ( .A(C_26), .B(X_26), .Y(n68) );
  sg13g2_nor2_2 U18 ( .A(X_27), .B(n29), .Y(n69) );
  sg13g2_nand2_2 U19 ( .A(C_18), .B(X_18), .Y(n76) );
  sg13g2_nor2_2 U20 ( .A(X_19), .B(n23), .Y(n77) );
  sg13g2_nor3_2 U21 ( .A(X_18), .B(X_20), .C(X_19), .Y(n78) );
  sg13g2_nor3_2 U22 ( .A(X_14), .B(X_16), .C(X_15), .Y(n80) );
  sg13g2_nand2_2 U23 ( .A(C_22), .B(X_22), .Y(n83) );
  sg13g2_nor2_2 U24 ( .A(X_23), .B(n26), .Y(n84) );
  sg13g2_nand2_2 U25 ( .A(C_9), .B(X_9), .Y(n94) );
  sg13g2_nor2_2 U26 ( .A(X_11), .B(n16), .Y(n96) );
  sg13g2_nand2_2 U27 ( .A(C_13), .B(X_13), .Y(n98) );
  sg13g2_nor2_2 U28 ( .A(X_15), .B(n20), .Y(n100) );
  sg13g2_nor3_2 U29 ( .A(X_11), .B(X_9), .C(X_12), .Y(n101) );
  sg13g2_nor3_2 U30 ( .A(n88), .B(X_5), .C(n102), .Y(n91) );
  sg13g2_nand2_2 U31 ( .A(C_6), .B(X_6), .Y(n105) );
  sg13g2_nor2_2 U32 ( .A(X_7), .B(n12), .Y(n106) );
  sg13g2_nand2_2 U33 ( .A(C_2), .B(X_2), .Y(n108) );
  sg13g2_nor2_2 U34 ( .A(X_3), .B(n7), .Y(n109) );
  sg13g2_nand2_2 U35 ( .A(X_29), .B(n110), .Y(n38) );
  sg13g2_nor3_2 U36 ( .A(n30), .B(n40), .C(n29), .Y(n110) );
  sg13g2_a21oi_2 U37 ( .A1(n31), .A2(n112), .B1(n6), .Y(I602) );
  sg13g2_nand2_2 U38 ( .A(X_25), .B(n111), .Y(n112) );
  sg13g2_nor3_2 U39 ( .A(n27), .B(n42), .C(n26), .Y(n111) );
  sg13g2_nor2b_2 U40 ( .B_N(n113), .A(n28), .Y(n115) );
  sg13g2_nor3_2 U41 ( .A(n24), .B(n44), .C(n23), .Y(n113) );
  sg13g2_nor2b_2 U42 ( .B_N(n116), .A(n25), .Y(n118) );
  sg13g2_nor3_2 U43 ( .A(n21), .B(n46), .C(n20), .Y(n116) );
  sg13g2_a21oi_2 U44 ( .A1(n22), .A2(n120), .B1(n3), .Y(I308) );
  sg13g2_nand2_2 U45 ( .A(X_13), .B(n119), .Y(n120) );
  sg13g2_nor3_2 U46 ( .A(n17), .B(n48), .C(n16), .Y(n119) );
  sg13g2_a21oi_2 U47 ( .A1(n18), .A2(n122), .B1(n2), .Y(I210) );
  sg13g2_nand2_2 U48 ( .A(X_9), .B(n121), .Y(n122) );
  sg13g2_nor3_2 U49 ( .A(n13), .B(n50), .C(n12), .Y(n121) );
  sg13g2_a21oi_2 U50 ( .A1(n10), .A2(n123), .B1(n124), .Y(I14) );
  sg13g2_nand2_2 U51 ( .A(X_1), .B(P_0), .Y(n123) );
  sg13g2_nor2b_2 U52 ( .B_N(n125), .A(n14), .Y(n127) );
  sg13g2_nor3_2 U53 ( .A(n8), .B(n9), .C(n7), .Y(n125) );
  sg13g2_nor3_2 U54 ( .A(n11), .B(n34), .C(n10), .Y(n124) );
  sg13g2_inv_2 U55 ( .A(n126), .Y(\DFF_6/D ) );
  sg13g2_inv_2 U56 ( .A(n48), .Y(n2) );
  sg13g2_inv_2 U57 ( .A(n46), .Y(n3) );
  sg13g2_inv_2 U58 ( .A(n117), .Y(\DFF_18/D ) );
  sg13g2_inv_2 U59 ( .A(n114), .Y(\DFF_22/D ) );
  sg13g2_inv_2 U60 ( .A(n40), .Y(n6) );
  sg13g2_inv_2 U61 ( .A(X_4), .Y(n7) );
  sg13g2_inv_2 U62 ( .A(X_3), .Y(n8) );
  sg13g2_inv_2 U63 ( .A(n124), .Y(n9) );
  sg13g2_inv_2 U64 ( .A(X_2), .Y(n10) );
  sg13g2_inv_2 U65 ( .A(X_1), .Y(n11) );
  sg13g2_inv_2 U66 ( .A(X_8), .Y(n12) );
  sg13g2_inv_2 U67 ( .A(X_7), .Y(n13) );
  sg13g2_inv_2 U68 ( .A(X_5), .Y(n14) );
  sg13g2_inv_2 U69 ( .A(n95), .Y(n15) );
  sg13g2_inv_2 U70 ( .A(X_12), .Y(n16) );
  sg13g2_inv_2 U71 ( .A(X_11), .Y(n17) );
  sg13g2_inv_2 U72 ( .A(X_10), .Y(n18) );
  sg13g2_inv_2 U73 ( .A(n99), .Y(n19) );
  sg13g2_inv_2 U74 ( .A(X_16), .Y(n20) );
  sg13g2_inv_2 U75 ( .A(X_15), .Y(n21) );
  sg13g2_inv_2 U76 ( .A(X_14), .Y(n22) );
  sg13g2_inv_2 U77 ( .A(X_20), .Y(n23) );
  sg13g2_inv_2 U78 ( .A(X_19), .Y(n24) );
  sg13g2_inv_2 U79 ( .A(X_17), .Y(n25) );
  sg13g2_inv_2 U80 ( .A(X_24), .Y(n26) );
  sg13g2_inv_2 U81 ( .A(X_23), .Y(n27) );
  sg13g2_inv_2 U82 ( .A(X_21), .Y(n28) );
  sg13g2_inv_2 U83 ( .A(X_28), .Y(n29) );
  sg13g2_inv_2 U84 ( .A(X_27), .Y(n30) );
  sg13g2_inv_2 U85 ( .A(X_26), .Y(n31) );
  sg13g2_inv_2 U86 ( .A(X_25), .Y(n32) );
  sg13g2_inv_2 U87 ( .A(X_29), .Y(n33) );
  sg13g2_inv_2 U88 ( .A(P_0), .Y(n34) );
  sg13g2_xnor2_1 U89 ( .A(n7), .B(n35), .Y(\DFF_0/D ) );
  sg13g2_xnor2_1 U90 ( .A(X_32), .B(n36), .Y(\DFF_28/D ) );
  sg13g2_xor2_1 U91 ( .A(X_31), .B(n37), .X(\DFF_29/D ) );
  sg13g2_xnor2_1 U92 ( .A(n29), .B(n39), .Y(\DFF_24/D ) );
  sg13g2_xnor2_1 U93 ( .A(n26), .B(n41), .Y(\DFF_20/D ) );
  sg13g2_xnor2_1 U94 ( .A(n23), .B(n43), .Y(\DFF_16/D ) );
  sg13g2_xnor2_1 U95 ( .A(n20), .B(n45), .Y(\DFF_12/D ) );
  sg13g2_xnor2_1 U96 ( .A(n16), .B(n47), .Y(\DFF_8/D ) );
  sg13g2_xnor2_1 U97 ( .A(n12), .B(n49), .Y(\DFF_4/D ) );
  sg13g2_a22oi_1 U98 ( .A1(n59), .A2(n33), .B1(C_29), .B2(X_29), .Y(n58) );
  sg13g2_o21ai_1 U99 ( .A1(X_30), .A2(n60), .B1(n61), .Y(n59) );
  sg13g2_a22oi_1 U100 ( .A1(n62), .A2(C_32), .B1(C_31), .B2(X_31), .Y(n60) );
  sg13g2_nand3_1 U101 ( .A(n30), .B(n29), .C(n31), .Y(n56) );
  sg13g2_nand3b_1 U102 ( .A_N(n64), .B(n28), .C(n65), .Y(n57) );
  sg13g2_a22oi_1 U103 ( .A1(n66), .A2(n32), .B1(C_25), .B2(X_25), .Y(n63) );
  sg13g2_o21ai_1 U104 ( .A1(X_26), .A2(n67), .B1(n68), .Y(n66) );
  sg13g2_a22oi_1 U105 ( .A1(n69), .A2(C_28), .B1(C_27), .B2(X_27), .Y(n67) );
  sg13g2_o21ai_1 U106 ( .A1(n70), .A2(n64), .B1(n71), .Y(n53) );
  sg13g2_or2_1 U107 ( .A(n72), .B(n73), .X(n71) );
  sg13g2_a22oi_1 U108 ( .A1(n74), .A2(n25), .B1(C_17), .B2(X_17), .Y(n72) );
  sg13g2_o21ai_1 U109 ( .A1(X_18), .A2(n75), .B1(n76), .Y(n74) );
  sg13g2_a22oi_1 U110 ( .A1(n77), .A2(C_20), .B1(C_19), .B2(X_19), .Y(n75) );
  sg13g2_nand3b_1 U111 ( .A_N(n73), .B(n25), .C(n78), .Y(n64) );
  sg13g2_nand3b_1 U112 ( .A_N(X_13), .B(n79), .C(n80), .Y(n73) );
  sg13g2_a22oi_1 U113 ( .A1(n81), .A2(n28), .B1(C_21), .B2(X_21), .Y(n70) );
  sg13g2_o21ai_1 U114 ( .A1(X_22), .A2(n82), .B1(n83), .Y(n81) );
  sg13g2_a22oi_1 U115 ( .A1(n84), .A2(C_24), .B1(C_23), .B2(X_23), .Y(n82) );
  sg13g2_a221oi_1 U116 ( .A1(n85), .A2(n11), .B1(C_1), .B2(X_1), .C1(n86), .Y(
        n51) );
  sg13g2_o21ai_1 U117 ( .A1(n87), .A2(n88), .B1(n89), .Y(n86) );
  sg13g2_a22oi_1 U118 ( .A1(n79), .A2(n90), .B1(n91), .B2(n92), .Y(n89) );
  sg13g2_o21ai_1 U119 ( .A1(X_9), .A2(n93), .B1(n94), .Y(n92) );
  sg13g2_a22oi_1 U120 ( .A1(n15), .A2(n18), .B1(C_10), .B2(X_10), .Y(n93) );
  sg13g2_a22oi_1 U121 ( .A1(n96), .A2(C_12), .B1(C_11), .B2(X_11), .Y(n95) );
  sg13g2_o21ai_1 U122 ( .A1(X_13), .A2(n97), .B1(n98), .Y(n90) );
  sg13g2_a22oi_1 U123 ( .A1(n19), .A2(n22), .B1(C_14), .B2(X_14), .Y(n97) );
  sg13g2_a22oi_1 U124 ( .A1(n100), .A2(C_16), .B1(C_15), .B2(X_15), .Y(n99) );
  sg13g2_and3_1 U125 ( .A(n91), .B(n18), .C(n101), .X(n79) );
  sg13g2_nand3b_1 U126 ( .A_N(X_6), .B(n12), .C(n13), .Y(n102) );
  sg13g2_nand4_1 U127 ( .A(n11), .B(n10), .C(n8), .D(n7), .Y(n88) );
  sg13g2_a22oi_1 U128 ( .A1(n103), .A2(n14), .B1(C_5), .B2(X_5), .Y(n87) );
  sg13g2_o21ai_1 U129 ( .A1(X_6), .A2(n104), .B1(n105), .Y(n103) );
  sg13g2_a22oi_1 U130 ( .A1(n106), .A2(C_8), .B1(C_7), .B2(X_7), .Y(n104) );
  sg13g2_o21ai_1 U131 ( .A1(X_2), .A2(n107), .B1(n108), .Y(n85) );
  sg13g2_a22oi_1 U132 ( .A1(n109), .A2(C_4), .B1(C_3), .B2(X_3), .Y(n107) );
  sg13g2_xnor2_1 U133 ( .A(n33), .B(n110), .Y(I701) );
  sg13g2_xnor2_1 U134 ( .A(X_30), .B(n38), .Y(I700) );
  sg13g2_xnor2_1 U135 ( .A(n32), .B(n111), .Y(I603) );
  sg13g2_xnor2_1 U136 ( .A(X_27), .B(n40), .Y(I601) );
  sg13g2_nand3_1 U137 ( .A(X_25), .B(n111), .C(X_26), .Y(n40) );
  sg13g2_xnor2_1 U138 ( .A(n28), .B(n113), .Y(I505) );
  sg13g2_o21ai_1 U139 ( .A1(X_22), .A2(n115), .B1(n42), .Y(n114) );
  sg13g2_xnor2_1 U140 ( .A(X_23), .B(n42), .Y(I503) );
  sg13g2_nand3_1 U141 ( .A(X_21), .B(n113), .C(X_22), .Y(n42) );
  sg13g2_xnor2_1 U142 ( .A(n25), .B(n116), .Y(I407) );
  sg13g2_o21ai_1 U143 ( .A1(X_18), .A2(n118), .B1(n44), .Y(n117) );
  sg13g2_xnor2_1 U144 ( .A(X_19), .B(n44), .Y(I405) );
  sg13g2_nand3_1 U145 ( .A(X_17), .B(n116), .C(X_18), .Y(n44) );
  sg13g2_xor2_1 U146 ( .A(X_13), .B(n119), .X(I309) );
  sg13g2_xnor2_1 U147 ( .A(X_15), .B(n46), .Y(I307) );
  sg13g2_nand3_1 U148 ( .A(X_13), .B(n119), .C(X_14), .Y(n46) );
  sg13g2_xor2_1 U149 ( .A(X_9), .B(n121), .X(I211) );
  sg13g2_xnor2_1 U150 ( .A(X_11), .B(n48), .Y(I209) );
  sg13g2_nand3_1 U151 ( .A(X_10), .B(n121), .C(X_9), .Y(n48) );
  sg13g2_xnor2_1 U152 ( .A(n11), .B(P_0), .Y(I15) );
  sg13g2_xnor2_1 U153 ( .A(X_3), .B(n9), .Y(I13) );
  sg13g2_xnor2_1 U154 ( .A(n14), .B(n125), .Y(I113) );
  sg13g2_o21ai_1 U155 ( .A1(X_6), .A2(n127), .B1(n50), .Y(n126) );
  sg13g2_xnor2_1 U156 ( .A(X_7), .B(n50), .Y(I111) );
  sg13g2_nand3_1 U157 ( .A(X_5), .B(n125), .C(X_6), .Y(n50) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(\DFF_0/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_4) );
  sg13g2_dfrbp_1 \DFF_31/Q_reg  ( .D(I701), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_29) );
  sg13g2_dfrbp_1 \DFF_30/Q_reg  ( .D(I700), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_30) );
  sg13g2_dfrbp_1 \DFF_29/Q_reg  ( .D(\DFF_29/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_31) );
  sg13g2_dfrbp_1 \DFF_28/Q_reg  ( .D(\DFF_28/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_32) );
  sg13g2_dfrbp_1 \DFF_27/Q_reg  ( .D(I603), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_25) );
  sg13g2_dfrbp_1 \DFF_26/Q_reg  ( .D(I602), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_26) );
  sg13g2_dfrbp_1 \DFF_25/Q_reg  ( .D(I601), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_27) );
  sg13g2_dfrbp_1 \DFF_24/Q_reg  ( .D(\DFF_24/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_28) );
  sg13g2_dfrbp_1 \DFF_23/Q_reg  ( .D(I505), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_21) );
  sg13g2_dfrbp_1 \DFF_22/Q_reg  ( .D(\DFF_22/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_22) );
  sg13g2_dfrbp_1 \DFF_21/Q_reg  ( .D(I503), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_23) );
  sg13g2_dfrbp_1 \DFF_20/Q_reg  ( .D(\DFF_20/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_24) );
  sg13g2_dfrbp_1 \DFF_19/Q_reg  ( .D(I407), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_17) );
  sg13g2_dfrbp_1 \DFF_18/Q_reg  ( .D(\DFF_18/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_18) );
  sg13g2_dfrbp_1 \DFF_17/Q_reg  ( .D(I405), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_19) );
  sg13g2_dfrbp_1 \DFF_16/Q_reg  ( .D(\DFF_16/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_20) );
  sg13g2_dfrbp_1 \DFF_15/Q_reg  ( .D(I309), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_13) );
  sg13g2_dfrbp_1 \DFF_14/Q_reg  ( .D(I308), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_14) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(I307), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_15) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(\DFF_12/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(X_16) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(I211), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_9) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(I210), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(X_10) );
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
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(I14), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        X_2) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(I13), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        X_3) );
  sg13g2_tiehi U158 ( .L_HI(\DFF_1/n1 ) );
endmodule

