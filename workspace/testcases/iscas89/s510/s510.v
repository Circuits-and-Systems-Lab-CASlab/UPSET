/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:22:58 2025
/////////////////////////////////////////////////////////////


module s510 ( GND, VDD, CK, cblank, cclr, cnt10, cnt13, cnt21, cnt261, cnt272, 
        cnt283, cnt284, cnt44, cnt45, cnt509, cnt511, cnt567, cnt591, csm, 
        csync, john, pc, pclr, pcnt12, pcnt17, pcnt241, pcnt27, pcnt6, vsync
 );
  input GND, VDD, CK, cnt10, cnt13, cnt21, cnt261, cnt272, cnt283, cnt284,
         cnt44, cnt45, cnt509, cnt511, cnt567, cnt591, john, pcnt12, pcnt17,
         pcnt241, pcnt27, pcnt6;
  output cblank, cclr, csm, csync, pc, pclr, vsync;
  wire   st_5, st_4, st_3, st_2, st_1, st_0, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, \DFF_1/n1 , \DFF_0/D , \DFF_5/D , \DFF_4/D ,
         \DFF_3/D , \DFF_2/D , \DFF_1/D , n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155;

  sg13g2_nor2_2 U1 ( .A(n140), .B(n5), .Y(n36) );
  sg13g2_nor2_2 U2 ( .A(n37), .B(n149), .Y(n35) );
  sg13g2_nor4_2 U3 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n29) );
  sg13g2_a21oi_2 U4 ( .A1(n43), .A2(n44), .B1(n8), .Y(n42) );
  sg13g2_nand2_2 U5 ( .A(cnt21), .B(n149), .Y(n44) );
  sg13g2_nor2_2 U6 ( .A(n46), .B(n37), .Y(n41) );
  sg13g2_nor3_2 U7 ( .A(n21), .B(n47), .C(n146), .Y(n39) );
  sg13g2_a21oi_2 U8 ( .A1(n149), .A2(n8), .B1(n135), .Y(n47) );
  sg13g2_nor2_2 U9 ( .A(st_1), .B(cnt261), .Y(n52) );
  sg13g2_nor2_2 U10 ( .A(n59), .B(n147), .Y(n58) );
  sg13g2_a21oi_2 U11 ( .A1(n4), .A2(n20), .B1(st_4), .Y(n65) );
  sg13g2_nand2_2 U12 ( .A(n45), .B(st_2), .Y(n50) );
  sg13g2_nand2_2 U13 ( .A(n154), .B(st_1), .Y(n73) );
  sg13g2_a21oi_2 U14 ( .A1(n147), .A2(n143), .B1(n138), .Y(n53) );
  sg13g2_nor3_2 U15 ( .A(n84), .B(n153), .C(n144), .Y(n49) );
  sg13g2_nand2_2 U16 ( .A(n80), .B(n75), .Y(n83) );
  sg13g2_nand2_2 U17 ( .A(n146), .B(n5), .Y(n75) );
  sg13g2_nor2_2 U18 ( .A(n13), .B(n85), .Y(n80) );
  sg13g2_nand2_2 U19 ( .A(n2), .B(n88), .Y(n87) );
  sg13g2_nand2_2 U20 ( .A(n90), .B(n91), .Y(\DFF_4/D ) );
  sg13g2_nor3_2 U21 ( .A(n61), .B(n13), .C(n5), .Y(n93) );
  sg13g2_a21oi_2 U22 ( .A1(pcnt17), .A2(cnt284), .B1(n135), .Y(n95) );
  sg13g2_nor2_2 U23 ( .A(n146), .B(n143), .Y(n31) );
  sg13g2_nand2_2 U24 ( .A(n14), .B(n3), .Y(n89) );
  sg13g2_nor2_2 U25 ( .A(n144), .B(n18), .Y(n110) );
  sg13g2_nor2_2 U26 ( .A(st_4), .B(n84), .Y(n109) );
  sg13g2_nor4_2 U27 ( .A(n45), .B(n71), .C(n111), .D(n112), .Y(n107) );
  sg13g2_a21oi_2 U28 ( .A1(n150), .A2(n144), .B1(n18), .Y(n112) );
  sg13g2_nor3_2 U29 ( .A(n147), .B(n141), .C(n154), .Y(n111) );
  sg13g2_nor2_2 U30 ( .A(n153), .B(st_2), .Y(n71) );
  sg13g2_nor2_2 U31 ( .A(n149), .B(st_1), .Y(n45) );
  sg13g2_nand2_2 U32 ( .A(n115), .B(n116), .Y(\DFF_2/D ) );
  sg13g2_a21oi_2 U33 ( .A1(n85), .A2(n154), .B1(n117), .Y(n116) );
  sg13g2_nand2_2 U34 ( .A(n152), .B(n143), .Y(n61) );
  sg13g2_nand2_2 U35 ( .A(n8), .B(n5), .Y(n37) );
  sg13g2_nor2_2 U36 ( .A(n147), .B(n5), .Y(n85) );
  sg13g2_nand2_2 U37 ( .A(n146), .B(n149), .Y(n84) );
  sg13g2_nand2_2 U38 ( .A(st_4), .B(n152), .Y(n62) );
  sg13g2_a21oi_2 U39 ( .A1(n88), .A2(n120), .B1(n103), .Y(csm) );
  sg13g2_nand2_2 U40 ( .A(n135), .B(st_2), .Y(n103) );
  sg13g2_nand2_2 U41 ( .A(n141), .B(n153), .Y(n120) );
  sg13g2_nand2_2 U42 ( .A(n140), .B(st_1), .Y(n88) );
  sg13g2_inv_2 U43 ( .A(n38), .Y(n1) );
  sg13g2_inv_2 U44 ( .A(n89), .Y(n2) );
  sg13g2_inv_2 U45 ( .A(n37), .Y(n3) );
  sg13g2_inv_2 U46 ( .A(n75), .Y(n4) );
  sg13g2_inv_2 U47 ( .A(n134), .Y(n5) );
  sg13g2_inv_2 U48 ( .A(n103), .Y(n6) );
  sg13g2_inv_2 U49 ( .A(n54), .Y(n7) );
  sg13g2_inv_2 U50 ( .A(st_4), .Y(n8) );
  sg13g2_inv_2 U51 ( .A(n62), .Y(n9) );
  sg13g2_inv_2 U52 ( .A(n84), .Y(n10) );
  sg13g2_inv_2 U53 ( .A(n50), .Y(n11) );
  sg13g2_inv_2 U55 ( .A(n88), .Y(n13) );
  sg13g2_inv_2 U56 ( .A(n61), .Y(n14) );
  sg13g2_inv_2 U57 ( .A(n53), .Y(n15) );
  sg13g2_inv_2 U60 ( .A(n154), .Y(n18) );
  sg13g2_inv_2 U61 ( .A(cnt13), .Y(n19) );
  sg13g2_inv_2 U62 ( .A(cnt284), .Y(n20) );
  sg13g2_inv_2 U63 ( .A(cnt44), .Y(n21) );
  sg13g2_inv_2 U64 ( .A(cnt511), .Y(n22) );
  sg13g2_inv_2 U65 ( .A(cnt567), .Y(n23) );
  sg13g2_nand4_1 U66 ( .A(n24), .B(n25), .C(n26), .D(n27), .Y(\DFF_5/D ) );
  sg13g2_a22oi_1 U67 ( .A1(n28), .A2(n18), .B1(n9), .B2(n11), .Y(n27) );
  sg13g2_o21ai_1 U68 ( .A1(st_2), .A2(n29), .B1(n30), .Y(n28) );
  sg13g2_a22oi_1 U69 ( .A1(n11), .A2(n1), .B1(n138), .B2(n32), .Y(n30) );
  sg13g2_o21ai_1 U70 ( .A1(n33), .A2(n8), .B1(n34), .Y(n32) );
  sg13g2_a22oi_1 U71 ( .A1(n35), .A2(cnt511), .B1(n36), .B2(cnt10), .Y(n34) );
  sg13g2_a22oi_1 U72 ( .A1(cnt10), .A2(n140), .B1(john), .B2(n149), .Y(n33) );
  sg13g2_a22oi_1 U73 ( .A1(cnt272), .A2(n3), .B1(cnt509), .B2(n135), .Y(n38)
         );
  sg13g2_a22oi_1 U74 ( .A1(cnt45), .A2(n45), .B1(cnt283), .B2(n13), .Y(n43) );
  sg13g2_a22oi_1 U75 ( .A1(cnt591), .A2(n45), .B1(cnt567), .B2(n13), .Y(n46)
         );
  sg13g2_and3_1 U76 ( .A(cnt45), .B(n146), .C(n135), .X(n40) );
  sg13g2_nand2b_1 U77 ( .A_N(n48), .B(st_4), .Y(n26) );
  sg13g2_a22oi_1 U78 ( .A1(cnt21), .A2(n11), .B1(cnt45), .B2(n49), .Y(n48) );
  sg13g2_nand4_1 U79 ( .A(pcnt6), .B(cnt284), .C(n3), .D(n49), .Y(n25) );
  sg13g2_nand3b_1 U80 ( .A_N(n51), .B(n150), .C(n153), .Y(n24) );
  sg13g2_a22oi_1 U81 ( .A1(n52), .A2(n6), .B1(n3), .B2(n15), .Y(n51) );
  sg13g2_nand4_1 U82 ( .A(n50), .B(n54), .C(n55), .D(n56), .Y(\DFF_3/D ) );
  sg13g2_a221oi_1 U83 ( .A1(n57), .A2(n18), .B1(n2), .B2(n147), .C1(n58), .Y(
        n56) );
  sg13g2_a22oi_1 U84 ( .A1(n60), .A2(n150), .B1(n14), .B2(st_4), .Y(n59) );
  sg13g2_nand3_1 U85 ( .A(n61), .B(n62), .C(n63), .Y(n60) );
  sg13g2_nand2b_1 U86 ( .A_N(n64), .B(n152), .Y(n63) );
  sg13g2_o21ai_1 U87 ( .A1(n20), .A2(pcnt17), .B1(n5), .Y(n64) );
  sg13g2_o21ai_1 U88 ( .A1(n65), .A2(n143), .B1(n66), .Y(n57) );
  sg13g2_o21ai_1 U89 ( .A1(n135), .A2(n19), .B1(n138), .Y(n66) );
  sg13g2_nand3_1 U90 ( .A(n153), .B(n135), .C(n53), .Y(n55) );
  sg13g2_nand3_1 U91 ( .A(n67), .B(n68), .C(n69), .Y(\DFF_1/D ) );
  sg13g2_a22oi_1 U92 ( .A1(n13), .A2(n6), .B1(st_4), .B2(n18), .Y(n69) );
  sg13g2_nand3_1 U93 ( .A(n153), .B(n3), .C(n53), .Y(n68) );
  sg13g2_nand2b_1 U94 ( .A_N(n70), .B(n4), .Y(n67) );
  sg13g2_a22oi_1 U95 ( .A1(n71), .A2(n150), .B1(n14), .B2(n141), .Y(n70) );
  sg13g2_nand3_1 U96 ( .A(n72), .B(n73), .C(n74), .Y(vsync) );
  sg13g2_a221oi_1 U97 ( .A1(n4), .A2(st_2), .B1(n71), .B2(n147), .C1(n141), 
        .Y(n74) );
  sg13g2_a22oi_1 U98 ( .A1(n138), .A2(n8), .B1(n37), .B2(n144), .Y(n72) );
  sg13g2_nand4_1 U99 ( .A(n76), .B(n54), .C(n77), .D(n78), .Y(csync) );
  sg13g2_a22oi_1 U100 ( .A1(n14), .A2(n37), .B1(n9), .B2(n147), .Y(n78) );
  sg13g2_a21o_1 U101 ( .A1(n79), .A2(n80), .B1(n154), .X(n77) );
  sg13g2_a22oi_1 U102 ( .A1(n53), .A2(n8), .B1(n141), .B2(n3), .Y(n79) );
  sg13g2_nand3_1 U103 ( .A(n154), .B(n3), .C(n138), .Y(n76) );
  sg13g2_nand4_1 U104 ( .A(n61), .B(n62), .C(n81), .D(n82), .Y(cclr) );
  sg13g2_a22oi_1 U105 ( .A1(n153), .A2(n83), .B1(n135), .B2(n49), .Y(n82) );
  sg13g2_nand3_1 U106 ( .A(n86), .B(n81), .C(n87), .Y(pc) );
  sg13g2_nand3_1 U107 ( .A(n13), .B(st_2), .C(n9), .Y(n86) );
  sg13g2_a221oi_1 U108 ( .A1(n9), .A2(n45), .B1(n92), .B2(n150), .C1(n93), .Y(
        n91) );
  sg13g2_o21ai_1 U109 ( .A1(n144), .A2(n62), .B1(n94), .Y(n92) );
  sg13g2_nand3_1 U110 ( .A(n138), .B(n154), .C(n95), .Y(n94) );
  sg13g2_a22oi_1 U111 ( .A1(n96), .A2(n18), .B1(n7), .B2(n154), .Y(n90) );
  sg13g2_nand4_1 U112 ( .A(n97), .B(n81), .C(n98), .D(n99), .Y(n96) );
  sg13g2_a22oi_1 U113 ( .A1(n100), .A2(n150), .B1(st_1), .B2(n37), .Y(n99) );
  sg13g2_a21o_1 U114 ( .A1(n137), .A2(n19), .B1(n101), .X(n100) );
  sg13g2_o21ai_1 U115 ( .A1(n146), .A2(n102), .B1(n103), .Y(n101) );
  sg13g2_o21ai_1 U116 ( .A1(pcnt12), .A2(n21), .B1(n143), .Y(n102) );
  sg13g2_nand2b_1 U117 ( .A_N(n104), .B(n138), .Y(n98) );
  sg13g2_o21ai_1 U118 ( .A1(pcnt241), .A2(n22), .B1(n141), .Y(n104) );
  sg13g2_nand3_1 U119 ( .A(n10), .B(n144), .C(n3), .Y(n81) );
  sg13g2_or2_1 U120 ( .A(n105), .B(n88), .X(n97) );
  sg13g2_o21ai_1 U121 ( .A1(pcnt27), .A2(n23), .B1(n144), .Y(n105) );
  sg13g2_o21ai_1 U122 ( .A1(n88), .A2(n89), .B1(n106), .Y(pclr) );
  sg13g2_nand3_1 U123 ( .A(n138), .B(n150), .C(n9), .Y(n106) );
  sg13g2_o21ai_1 U124 ( .A1(n107), .A2(n5), .B1(n108), .Y(\DFF_0/D ) );
  sg13g2_a22oi_1 U125 ( .A1(n109), .A2(n14), .B1(n110), .B2(n13), .Y(n108) );
  sg13g2_o21ai_1 U126 ( .A1(n153), .A2(n54), .B1(n113), .Y(cblank) );
  sg13g2_a22oi_1 U127 ( .A1(n14), .A2(n114), .B1(n141), .B2(n6), .Y(n113) );
  sg13g2_a21o_1 U128 ( .A1(st_4), .A2(n13), .B1(n85), .X(n114) );
  sg13g2_o21ai_1 U129 ( .A1(n118), .A2(n150), .B1(n119), .Y(n117) );
  sg13g2_nand3_1 U130 ( .A(st_1), .B(n8), .C(n14), .Y(n119) );
  sg13g2_a22oi_1 U131 ( .A1(n37), .A2(n144), .B1(n18), .B2(n5), .Y(n118) );
  sg13g2_a22oi_1 U132 ( .A1(n9), .A2(n10), .B1(n7), .B2(n147), .Y(n115) );
  sg13g2_nand3_1 U133 ( .A(st_2), .B(n8), .C(n141), .Y(n54) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(\DFF_5/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(st_0) );
  sg13g2_dfrbp_1 \DFF_4/Q_reg  ( .D(\DFF_4/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(st_1) );
  sg13g2_dfrbp_1 \DFF_3/Q_reg  ( .D(\DFF_3/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(st_2) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(\DFF_1/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(st_4) );
  sg13g2_dfrbp_2 \DFF_0/Q_reg  ( .D(\DFF_0/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(st_5) );
  sg13g2_dfrbp_2 \DFF_2/Q_reg  ( .D(\DFF_2/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(st_3) );
  sg13g2_inv_1 U134 ( .A(st_5), .Y(n133) );
  sg13g2_inv_1 U135 ( .A(n133), .Y(n134) );
  sg13g2_inv_1 U136 ( .A(n133), .Y(n135) );
  sg13g2_inv_1 U137 ( .A(n31), .Y(n136) );
  sg13g2_inv_1 U138 ( .A(n136), .Y(n137) );
  sg13g2_inv_1 U139 ( .A(n136), .Y(n138) );
  sg13g2_inv_1 U140 ( .A(st_3), .Y(n139) );
  sg13g2_inv_1 U141 ( .A(n139), .Y(n140) );
  sg13g2_inv_1 U142 ( .A(n139), .Y(n141) );
  sg13g2_inv_1 U143 ( .A(n16), .Y(n142) );
  sg13g2_inv_1 U144 ( .A(n142), .Y(n143) );
  sg13g2_inv_1 U145 ( .A(n142), .Y(n144) );
  sg13g2_inv_1 U146 ( .A(n17), .Y(n145) );
  sg13g2_inv_1 U147 ( .A(n145), .Y(n146) );
  sg13g2_inv_1 U148 ( .A(n145), .Y(n147) );
  sg13g2_inv_1 U149 ( .A(n12), .Y(n148) );
  sg13g2_inv_1 U150 ( .A(n148), .Y(n149) );
  sg13g2_inv_1 U151 ( .A(n148), .Y(n150) );
  sg13g2_inv_1 U152 ( .A(n155), .Y(n151) );
  sg13g2_inv_1 U153 ( .A(n151), .Y(n152) );
  sg13g2_inv_1 U154 ( .A(n151), .Y(n153) );
  sg13g2_inv_1 U155 ( .A(n151), .Y(n154) );
  sg13g2_tiehi U156 ( .L_HI(\DFF_1/n1 ) );
  sg13g2_buf_16 U157 ( .A(st_0), .X(n155) );
  sg13g2_inv_8 U158 ( .A(st_1), .Y(n17) );
  sg13g2_inv_8 U159 ( .A(st_2), .Y(n16) );
  sg13g2_inv_8 U160 ( .A(n140), .Y(n12) );
endmodule

