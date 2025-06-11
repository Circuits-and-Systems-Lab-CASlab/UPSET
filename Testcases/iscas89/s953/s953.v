/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:24:39 2025
/////////////////////////////////////////////////////////////


module s953 ( GND, VDD, CK, ActBmHS1, ActRtHS1, DumpIIHS1, FullIIHS1, FullOHS1, 
        GoBmHS1, GoRtHS1, IInDoneHS1, LdProgHS1, LoadIIHHS1, LoadOHHS1, 
        LxHIInHS1, Mode0HS1, Mode1HS1, Mode2HS1, NewLineHS1, NewTrHS1, 
        OutAvHS1, OutputHS1, Prog_0, Prog_1, Prog_2, Rdy1BmHS1, Rdy1RtHS1, 
        Rdy2BmHS1, Rdy2RtHS1, ReRtTSHS1, ReWhBufHS1, RtTSHS1, SeFullIIHS1, 
        SeFullOHS1, SeOutAvHS1, ShftIIRHS1, ShftORHS1, TgWhBufHS1, TpArrayHS1, 
        TxHIInHS1, WantBmHS1, WantRtHS1 );
  input GND, VDD, CK, FullIIHS1, FullOHS1, IInDoneHS1, OutAvHS1, OutputHS1,
         Prog_0, Prog_1, Prog_2, Rdy1BmHS1, Rdy1RtHS1, Rdy2BmHS1, Rdy2RtHS1,
         RtTSHS1, TpArrayHS1, WantBmHS1, WantRtHS1;
  output ActBmHS1, ActRtHS1, DumpIIHS1, GoBmHS1, GoRtHS1, LdProgHS1,
         LoadIIHHS1, LoadOHHS1, LxHIInHS1, Mode0HS1, Mode1HS1, Mode2HS1,
         NewLineHS1, NewTrHS1, ReRtTSHS1, ReWhBufHS1, SeFullIIHS1, SeFullOHS1,
         SeOutAvHS1, ShftIIRHS1, ShftORHS1, TgWhBufHS1, TxHIInHS1;
  wire   State_5, State_4, State_3, State_2, State_1, State_0, II24, II27,
         II28, II29, II414, n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, \DFF_1/n1 , \DFF_0/D , \DFF_28/D , \DFF_24/D ,
         \DFF_23/D , \DFF_21/D , \DFF_20/D , \DFF_19/D , \DFF_18/D ,
         \DFF_17/D , \DFF_16/D , \DFF_15/D , \DFF_14/D , \DFF_13/D ,
         \DFF_12/D , \DFF_10/D , \DFF_9/D , \DFF_8/D , \DFF_7/D , \DFF_6/D ,
         \DFF_5/D , \DFF_4/D , \DFF_3/D , \DFF_2/D , \DFF_1/D , n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235;

  sg13g2_nor4_2 U1 ( .A(n52), .B(n53), .C(n54), .D(n55), .Y(n51) );
  sg13g2_nor3_2 U2 ( .A(n56), .B(Rdy1RtHS1), .C(Rdy1BmHS1), .Y(n55) );
  sg13g2_nand2_2 U3 ( .A(n57), .B(n58), .Y(n53) );
  sg13g2_nor2_2 U4 ( .A(II414), .B(n69), .Y(n68) );
  sg13g2_nor2_2 U5 ( .A(n77), .B(n235), .Y(n76) );
  sg13g2_nor3_2 U6 ( .A(n78), .B(n52), .C(n79), .Y(n77) );
  sg13g2_nor4_2 U7 ( .A(State_3), .B(n44), .C(n23), .D(n80), .Y(n79) );
  sg13g2_nor3_2 U8 ( .A(n22), .B(IInDoneHS1), .C(n18), .Y(n78) );
  sg13g2_nand2_2 U9 ( .A(n58), .B(n95), .Y(\DFF_17/D ) );
  sg13g2_nor2_2 U10 ( .A(n88), .B(n81), .Y(n99) );
  sg13g2_nand2_2 U11 ( .A(n94), .B(n23), .Y(n95) );
  sg13g2_nor2_2 U12 ( .A(n66), .B(n103), .Y(n94) );
  sg13g2_nor2_2 U13 ( .A(n41), .B(n48), .Y(n110) );
  sg13g2_nor2_2 U14 ( .A(n27), .B(n113), .Y(n109) );
  sg13g2_nand2_2 U15 ( .A(n115), .B(n116), .Y(\DFF_3/D ) );
  sg13g2_nand2_2 U16 ( .A(n118), .B(n119), .Y(n105) );
  sg13g2_a21oi_2 U17 ( .A1(n2), .A2(n229), .B1(n120), .Y(n115) );
  sg13g2_nor3_2 U18 ( .A(n235), .B(n125), .C(n65), .Y(n118) );
  sg13g2_nor2b_2 U19 ( .B_N(n89), .A(FullOHS1), .Y(n127) );
  sg13g2_a21oi_2 U20 ( .A1(n130), .A2(WantBmHS1), .B1(n48), .Y(n126) );
  sg13g2_nor3_2 U21 ( .A(n232), .B(n28), .C(n56), .Y(n52) );
  sg13g2_nor2b_2 U22 ( .B_N(n132), .A(n226), .Y(n82) );
  sg13g2_a21oi_2 U23 ( .A1(n37), .A2(n145), .B1(Rdy2RtHS1), .Y(n144) );
  sg13g2_nand2_2 U24 ( .A(Prog_0), .B(n146), .Y(n145) );
  sg13g2_nor2_2 U25 ( .A(Rdy2BmHS1), .B(n147), .Y(n143) );
  sg13g2_a21oi_2 U26 ( .A1(n146), .A2(n35), .B1(Prog_2), .Y(n147) );
  sg13g2_nand2_2 U27 ( .A(Rdy2RtHS1), .B(Rdy1RtHS1), .Y(n60) );
  sg13g2_nor2_2 U28 ( .A(Rdy2RtHS1), .B(Rdy1RtHS1), .Y(n113) );
  sg13g2_nand2_2 U29 ( .A(n111), .B(n85), .Y(n152) );
  sg13g2_nor2_2 U30 ( .A(FullOHS1), .B(n81), .Y(n158) );
  sg13g2_nor3_2 U31 ( .A(n23), .B(n229), .C(State_0), .Y(n161) );
  sg13g2_a21oi_2 U32 ( .A1(II414), .A2(Prog_2), .B1(n90), .Y(n165) );
  sg13g2_nand2_2 U33 ( .A(n171), .B(n90), .Y(n170) );
  sg13g2_nor3_2 U34 ( .A(n103), .B(n229), .C(n65), .Y(n90) );
  sg13g2_a21oi_2 U35 ( .A1(n173), .A2(n129), .B1(n88), .Y(n171) );
  sg13g2_nand2_2 U36 ( .A(FullOHS1), .B(n30), .Y(n88) );
  sg13g2_nand2_2 U37 ( .A(n119), .B(Prog_0), .Y(n129) );
  sg13g2_nor2_2 U38 ( .A(Rdy2BmHS1), .B(Rdy1BmHS1), .Y(n130) );
  sg13g2_a21oi_2 U39 ( .A1(n175), .A2(n176), .B1(n177), .Y(n174) );
  sg13g2_nand2_2 U40 ( .A(n232), .B(n235), .Y(n177) );
  sg13g2_a21oi_2 U41 ( .A1(n154), .A2(WantBmHS1), .B1(n120), .Y(n180) );
  sg13g2_nor3_2 U42 ( .A(n63), .B(n125), .C(n232), .Y(n75) );
  sg13g2_a21oi_2 U43 ( .A1(Prog_2), .A2(n28), .B1(State_4), .Y(n125) );
  sg13g2_nor2_2 U44 ( .A(n56), .B(FullIIHS1), .Y(n166) );
  sg13g2_nor2_2 U45 ( .A(FullOHS1), .B(Rdy1RtHS1), .Y(n139) );
  sg13g2_nand2_2 U46 ( .A(n183), .B(n100), .Y(n179) );
  sg13g2_a21oi_2 U47 ( .A1(n128), .A2(n81), .B1(n27), .Y(n183) );
  sg13g2_nand2_2 U48 ( .A(FullIIHS1), .B(FullOHS1), .Y(n146) );
  sg13g2_nand2_2 U49 ( .A(Rdy2BmHS1), .B(n40), .Y(n81) );
  sg13g2_a21oi_2 U50 ( .A1(n162), .A2(n148), .B1(n10), .Y(n185) );
  sg13g2_a21oi_2 U51 ( .A1(n12), .A2(n21), .B1(n54), .Y(n187) );
  sg13g2_nand2_2 U52 ( .A(n21), .B(n37), .Y(n103) );
  sg13g2_a21oi_2 U53 ( .A1(n11), .A2(n46), .B1(n12), .Y(n192) );
  sg13g2_a21oi_2 U54 ( .A1(n232), .A2(n235), .B1(n163), .Y(n188) );
  sg13g2_nor2_2 U55 ( .A(n234), .B(n232), .Y(n163) );
  sg13g2_nand2_2 U56 ( .A(n24), .B(n172), .Y(n64) );
  sg13g2_nand2_2 U57 ( .A(Prog_0), .B(Rdy2RtHS1), .Y(n137) );
  sg13g2_nor2_2 U58 ( .A(n45), .B(Rdy2RtHS1), .Y(n119) );
  sg13g2_nand2_2 U59 ( .A(WantBmHS1), .B(n128), .Y(n195) );
  sg13g2_nand2_2 U60 ( .A(Rdy1BmHS1), .B(n46), .Y(n128) );
  sg13g2_nand2_2 U61 ( .A(n190), .B(n48), .Y(n85) );
  sg13g2_nand2_2 U62 ( .A(n190), .B(Rdy2RtHS1), .Y(n84) );
  sg13g2_nor3_2 U63 ( .A(n37), .B(State_4), .C(n197), .Y(n87) );
  sg13g2_nor3_2 U64 ( .A(n197), .B(n226), .C(n135), .Y(n181) );
  sg13g2_nand2_2 U65 ( .A(Rdy2BmHS1), .B(Rdy1BmHS1), .Y(n62) );
  sg13g2_nand2_2 U66 ( .A(State_0), .B(n235), .Y(n168) );
  sg13g2_nor3_2 U67 ( .A(State_4), .B(State_5), .C(n22), .Y(n162) );
  sg13g2_nand2_2 U68 ( .A(State_4), .B(n69), .Y(n58) );
  sg13g2_nor2_2 U69 ( .A(n63), .B(State_0), .Y(n69) );
  sg13g2_nand2_2 U70 ( .A(n172), .B(n148), .Y(n63) );
  sg13g2_nor2_2 U71 ( .A(n228), .B(n225), .Y(n148) );
  sg13g2_nor2_2 U72 ( .A(n18), .B(n117), .Y(II414) );
  sg13g2_nor3_2 U73 ( .A(n23), .B(State_5), .C(n80), .Y(n114) );
  sg13g2_nor3_2 U74 ( .A(n135), .B(n226), .C(n22), .Y(II29) );
  sg13g2_nand2_2 U75 ( .A(n231), .B(n21), .Y(n80) );
  sg13g2_nor2_2 U76 ( .A(OutAvHS1), .B(FullIIHS1), .Y(II28) );
  sg13g2_nor2_2 U77 ( .A(OutAvHS1), .B(n30), .Y(II27) );
  sg13g2_nor2_2 U78 ( .A(OutAvHS1), .B(n28), .Y(II24) );
  sg13g2_nand2_2 U79 ( .A(n30), .B(n31), .Y(n197) );
  sg13g2_inv_2 U80 ( .A(n162), .Y(n1) );
  sg13g2_inv_2 U81 ( .A(n71), .Y(n2) );
  sg13g2_inv_2 U82 ( .A(n58), .Y(\DFF_14/D ) );
  sg13g2_inv_2 U83 ( .A(n84), .Y(n4) );
  sg13g2_inv_2 U84 ( .A(n85), .Y(n5) );
  sg13g2_inv_2 U85 ( .A(n63), .Y(n6) );
  sg13g2_inv_2 U86 ( .A(n75), .Y(n7) );
  sg13g2_inv_2 U87 ( .A(n66), .Y(n8) );
  sg13g2_inv_2 U88 ( .A(n95), .Y(n9) );
  sg13g2_inv_2 U89 ( .A(n186), .Y(n10) );
  sg13g2_inv_2 U90 ( .A(n64), .Y(n11) );
  sg13g2_inv_2 U91 ( .A(n57), .Y(n12) );
  sg13g2_inv_2 U92 ( .A(n56), .Y(n13) );
  sg13g2_inv_2 U93 ( .A(n112), .Y(n14) );
  sg13g2_inv_2 U94 ( .A(n111), .Y(n15) );
  sg13g2_inv_2 U95 ( .A(n65), .Y(n16) );
  sg13g2_inv_2 U96 ( .A(n105), .Y(n17) );
  sg13g2_inv_2 U97 ( .A(n114), .Y(n18) );
  sg13g2_inv_2 U98 ( .A(n80), .Y(n19) );
  sg13g2_inv_2 U99 ( .A(n103), .Y(n20) );
  sg13g2_inv_2 U100 ( .A(State_4), .Y(n21) );
  sg13g2_inv_2 U101 ( .A(State_3), .Y(n22) );
  sg13g2_inv_2 U102 ( .A(n225), .Y(n23) );
  sg13g2_inv_2 U103 ( .A(n168), .Y(n24) );
  sg13g2_inv_2 U106 ( .A(n146), .Y(n27) );
  sg13g2_inv_2 U107 ( .A(n197), .Y(n28) );
  sg13g2_inv_2 U108 ( .A(n140), .Y(n29) );
  sg13g2_inv_2 U109 ( .A(FullIIHS1), .Y(n30) );
  sg13g2_inv_2 U110 ( .A(FullOHS1), .Y(n31) );
  sg13g2_inv_2 U111 ( .A(IInDoneHS1), .Y(n32) );
  sg13g2_inv_2 U112 ( .A(n193), .Y(n33) );
  sg13g2_inv_2 U113 ( .A(n137), .Y(n34) );
  sg13g2_inv_2 U114 ( .A(Prog_0), .Y(n35) );
  sg13g2_inv_2 U115 ( .A(Prog_1), .Y(n36) );
  sg13g2_inv_2 U116 ( .A(Prog_2), .Y(n37) );
  sg13g2_inv_2 U117 ( .A(n130), .Y(n38) );
  sg13g2_inv_2 U118 ( .A(n81), .Y(n39) );
  sg13g2_inv_2 U119 ( .A(Rdy1BmHS1), .Y(n40) );
  sg13g2_inv_2 U120 ( .A(n195), .Y(n41) );
  sg13g2_inv_2 U121 ( .A(n128), .Y(n42) );
  sg13g2_inv_2 U122 ( .A(n62), .Y(n43) );
  sg13g2_inv_2 U123 ( .A(n60), .Y(n44) );
  sg13g2_inv_2 U124 ( .A(Rdy1RtHS1), .Y(n45) );
  sg13g2_inv_2 U125 ( .A(Rdy2BmHS1), .Y(n46) );
  sg13g2_inv_2 U126 ( .A(WantBmHS1), .Y(n47) );
  sg13g2_inv_2 U127 ( .A(WantRtHS1), .Y(n48) );
  sg13g2_nand3_1 U128 ( .A(n49), .B(n50), .C(n51), .Y(\DFF_0/D ) );
  sg13g2_a22oi_1 U129 ( .A1(n59), .A2(n60), .B1(n61), .B2(n62), .Y(n50) );
  sg13g2_o21ai_1 U130 ( .A1(Prog_0), .A2(n63), .B1(n64), .Y(n61) );
  sg13g2_o21ai_1 U131 ( .A1(n65), .A2(n35), .B1(n66), .Y(n59) );
  sg13g2_a22oi_1 U132 ( .A1(Prog_2), .A2(n67), .B1(Prog_1), .B2(II414), .Y(n49) );
  sg13g2_o21ai_1 U133 ( .A1(n28), .A2(n56), .B1(n68), .Y(n67) );
  sg13g2_nand4_1 U134 ( .A(n70), .B(n71), .C(n72), .D(n73), .Y(\DFF_4/D ) );
  sg13g2_a221oi_1 U135 ( .A1(n8), .A2(n74), .B1(n75), .B2(n39), .C1(n76), .Y(
        n73) );
  sg13g2_o21ai_1 U136 ( .A1(n44), .A2(n20), .B1(n82), .Y(n74) );
  sg13g2_nand3_1 U137 ( .A(Rdy2BmHS1), .B(n83), .C(WantBmHS1), .Y(n72) );
  sg13g2_nand3_1 U138 ( .A(n84), .B(n85), .C(n86), .Y(n83) );
  sg13g2_nand4_1 U139 ( .A(n87), .B(n16), .C(Rdy1RtHS1), .D(n235), .Y(n86) );
  sg13g2_nand3b_1 U140 ( .A_N(n88), .B(n89), .C(n90), .Y(n70) );
  sg13g2_nand3_1 U141 ( .A(n91), .B(n92), .C(n93), .Y(\DFF_12/D ) );
  sg13g2_a22oi_1 U142 ( .A1(n94), .A2(n35), .B1(\DFF_14/D ), .B2(Prog_0), .Y(
        n93) );
  sg13g2_nand3_1 U143 ( .A(n226), .B(n21), .C(n8), .Y(n91) );
  sg13g2_nand3_1 U144 ( .A(n96), .B(n97), .C(n98), .Y(\DFF_24/D ) );
  sg13g2_a22oi_1 U145 ( .A1(n99), .A2(n100), .B1(n9), .B2(IInDoneHS1), .Y(n98)
         );
  sg13g2_nand3b_1 U146 ( .A_N(\DFF_10/D ), .B(n58), .C(n101), .Y(\DFF_7/D ) );
  sg13g2_a22oi_1 U147 ( .A1(n102), .A2(n35), .B1(n11), .B2(n226), .Y(n101) );
  sg13g2_o21ai_1 U148 ( .A1(n103), .A2(n64), .B1(n95), .Y(n102) );
  sg13g2_nand3_1 U149 ( .A(n92), .B(n58), .C(n104), .Y(\DFF_6/D ) );
  sg13g2_a22oi_1 U150 ( .A1(n8), .A2(n226), .B1(n94), .B2(Prog_0), .Y(n104) );
  sg13g2_nand4_1 U151 ( .A(n24), .B(Prog_0), .C(n13), .D(n37), .Y(n92) );
  sg13g2_nand4_1 U152 ( .A(n105), .B(n106), .C(n107), .D(n108), .Y(\DFF_8/D )
         );
  sg13g2_a22oi_1 U153 ( .A1(n109), .A2(n14), .B1(n110), .B2(n15), .Y(n108) );
  sg13g2_nand4_1 U154 ( .A(n44), .B(n114), .C(n229), .D(n22), .Y(n107) );
  sg13g2_a221oi_1 U155 ( .A1(n12), .A2(n32), .B1(n114), .B2(n117), .C1(n17), 
        .Y(n116) );
  sg13g2_nand4_1 U156 ( .A(n121), .B(n122), .C(n123), .D(n124), .Y(\DFF_5/D )
         );
  sg13g2_nand3_1 U157 ( .A(Rdy2RtHS1), .B(n45), .C(n118), .Y(n124) );
  sg13g2_a22oi_1 U158 ( .A1(n126), .A2(n4), .B1(n127), .B2(n90), .Y(n123) );
  sg13g2_o21ai_1 U159 ( .A1(Prog_0), .A2(n128), .B1(n129), .Y(n89) );
  sg13g2_a22oi_1 U160 ( .A1(n11), .A2(n131), .B1(n52), .B2(n229), .Y(n121) );
  sg13g2_o21ai_1 U161 ( .A1(n43), .A2(n20), .B1(n82), .Y(n131) );
  sg13g2_o21ai_1 U162 ( .A1(Prog_2), .A2(n32), .B1(n125), .Y(n132) );
  sg13g2_nand4_1 U163 ( .A(n133), .B(n134), .C(n71), .D(n135), .Y(\DFF_19/D )
         );
  sg13g2_nand3_1 U164 ( .A(n136), .B(n37), .C(n16), .Y(n134) );
  sg13g2_o21ai_1 U165 ( .A1(FullIIHS1), .A2(n137), .B1(n138), .Y(n136) );
  sg13g2_a22oi_1 U166 ( .A1(n29), .A2(n35), .B1(n139), .B2(Prog_0), .Y(n138)
         );
  sg13g2_a22oi_1 U167 ( .A1(n30), .A2(n40), .B1(Rdy2BmHS1), .B2(n31), .Y(n140)
         );
  sg13g2_nand3_1 U168 ( .A(State_0), .B(n40), .C(n13), .Y(n133) );
  sg13g2_nand4_1 U169 ( .A(n71), .B(n135), .C(n141), .D(n142), .Y(\DFF_18/D )
         );
  sg13g2_a22oi_1 U170 ( .A1(n143), .A2(n6), .B1(n144), .B2(n16), .Y(n142) );
  sg13g2_nand4_1 U171 ( .A(Prog_2), .B(n19), .C(n148), .D(n22), .Y(n141) );
  sg13g2_nand4_1 U172 ( .A(n149), .B(n106), .C(n150), .D(n151), .Y(\DFF_20/D )
         );
  sg13g2_a221oi_1 U173 ( .A1(n152), .A2(n47), .B1(n153), .B2(n31), .C1(n154), 
        .Y(n151) );
  sg13g2_o21ai_1 U174 ( .A1(n113), .A2(n112), .B1(n155), .Y(n153) );
  sg13g2_nand3_1 U175 ( .A(n38), .B(n62), .C(n100), .Y(n155) );
  sg13g2_nand3_1 U176 ( .A(Prog_0), .B(n60), .C(n90), .Y(n112) );
  sg13g2_nand3_1 U177 ( .A(n119), .B(n16), .C(n87), .Y(n111) );
  sg13g2_nand4_1 U178 ( .A(n150), .B(n106), .C(n156), .D(n157), .Y(\DFF_23/D )
         );
  sg13g2_a22oi_1 U179 ( .A1(n158), .A2(n100), .B1(IInDoneHS1), .B2(n159), .Y(
        n157) );
  sg13g2_a21o_1 U180 ( .A1(OutputHS1), .A2(\DFF_14/D ), .B1(n10), .X(n159) );
  sg13g2_nand3_1 U181 ( .A(n139), .B(n90), .C(n34), .Y(n156) );
  sg13g2_o21ai_1 U182 ( .A1(n160), .A2(n161), .B1(n162), .Y(n150) );
  sg13g2_and3_1 U183 ( .A(TpArrayHS1), .B(n23), .C(n163), .X(n160) );
  sg13g2_nand4_1 U184 ( .A(n106), .B(n164), .C(n149), .D(n165), .Y(\DFF_15/D )
         );
  sg13g2_nand4_1 U185 ( .A(n166), .B(Prog_2), .C(n167), .D(n31), .Y(n149) );
  sg13g2_o21ai_1 U186 ( .A1(n168), .A2(n128), .B1(n169), .Y(n167) );
  sg13g2_nand3_1 U187 ( .A(n229), .B(n232), .C(n119), .Y(n169) );
  sg13g2_nand3_1 U188 ( .A(n96), .B(n97), .C(n170), .Y(\DFF_21/D ) );
  sg13g2_nand3_1 U189 ( .A(n231), .B(n23), .C(n172), .Y(n65) );
  sg13g2_nand3_1 U190 ( .A(n62), .B(n35), .C(n38), .Y(n173) );
  sg13g2_nand3_1 U191 ( .A(n166), .B(Rdy2RtHS1), .C(n174), .Y(n96) );
  sg13g2_nand4_1 U192 ( .A(FullOHS1), .B(Prog_0), .C(n37), .D(n45), .Y(n176)
         );
  sg13g2_nand3b_1 U193 ( .A_N(n178), .B(Prog_2), .C(n31), .Y(n175) );
  sg13g2_nand3_1 U194 ( .A(n179), .B(n106), .C(n180), .Y(\DFF_9/D ) );
  sg13g2_o21ai_1 U195 ( .A1(n128), .A2(n7), .B1(n164), .Y(n120) );
  sg13g2_nand3_1 U196 ( .A(n181), .B(n22), .C(n43), .Y(n164) );
  sg13g2_and4_1 U197 ( .A(n87), .B(n42), .C(n6), .D(n182), .X(n154) );
  sg13g2_nand4_1 U198 ( .A(n163), .B(n139), .C(n166), .D(n40), .Y(n106) );
  sg13g2_nand3_1 U199 ( .A(n23), .B(n21), .C(n172), .Y(n56) );
  sg13g2_and3_1 U200 ( .A(n69), .B(n35), .C(n20), .X(n100) );
  sg13g2_nand4_1 U201 ( .A(n71), .B(n58), .C(n184), .D(n185), .Y(\DFF_16/D )
         );
  sg13g2_a22oi_1 U202 ( .A1(n11), .A2(n20), .B1(n12), .B2(n21), .Y(n186) );
  sg13g2_o21ai_1 U203 ( .A1(n36), .A2(n58), .B1(n187), .Y(\DFF_13/D ) );
  sg13g2_and3_1 U204 ( .A(n188), .B(n172), .C(n20), .X(n54) );
  sg13g2_o21ai_1 U205 ( .A1(IInDoneHS1), .A2(n58), .B1(n189), .Y(\DFF_1/D ) );
  sg13g2_a22oi_1 U206 ( .A1(n190), .A2(n33), .B1(State_4), .B2(n191), .Y(n189)
         );
  sg13g2_o21ai_1 U207 ( .A1(Rdy2RtHS1), .A2(n66), .B1(n192), .Y(n191) );
  sg13g2_nand3_1 U208 ( .A(n188), .B(n172), .C(n226), .Y(n57) );
  sg13g2_nand3_1 U209 ( .A(n172), .B(n232), .C(n229), .Y(n66) );
  sg13g2_a22oi_1 U210 ( .A1(n194), .A2(n182), .B1(n34), .B2(n195), .Y(n193) );
  sg13g2_or2_1 U211 ( .A(n119), .B(n48), .X(n182) );
  sg13g2_o21ai_1 U212 ( .A1(n196), .A2(n46), .B1(n41), .Y(n194) );
  sg13g2_o21ai_1 U213 ( .A1(n178), .A2(n84), .B1(n97), .Y(\DFF_28/D ) );
  sg13g2_nand4_1 U214 ( .A(n196), .B(n5), .C(WantBmHS1), .D(Rdy2BmHS1), .Y(n97) );
  sg13g2_xor2_1 U215 ( .A(n36), .B(Prog_0), .X(n196) );
  sg13g2_and2_1 U216 ( .A(n87), .B(n69), .X(n190) );
  sg13g2_nand3_1 U217 ( .A(n35), .B(n47), .C(WantRtHS1), .Y(n178) );
  sg13g2_nand3b_1 U218 ( .A_N(n198), .B(n122), .C(n199), .Y(\DFF_2/D ) );
  sg13g2_or2_1 U219 ( .A(TpArrayHS1), .B(n71), .X(n199) );
  sg13g2_a22oi_1 U220 ( .A1(n43), .A2(n181), .B1(n162), .B2(n148), .Y(n122) );
  sg13g2_o21ai_1 U221 ( .A1(n1), .A2(n168), .B1(n184), .Y(n198) );
  sg13g2_nand3_1 U222 ( .A(n114), .B(n229), .C(State_3), .Y(n184) );
  sg13g2_o21ai_1 U223 ( .A1(n1), .A2(n200), .B1(n71), .Y(\DFF_10/D ) );
  sg13g2_nand3_1 U224 ( .A(State_0), .B(n23), .C(n162), .Y(n71) );
  sg13g2_o21ai_1 U225 ( .A1(n226), .A2(n235), .B1(n232), .Y(n200) );
  sg13g2_and2_1 U226 ( .A(State_5), .B(n22), .X(n172) );
  sg13g2_nand3_1 U227 ( .A(n235), .B(n22), .C(RtTSHS1), .Y(n117) );
  sg13g2_nand3b_1 U228 ( .A_N(State_5), .B(n234), .C(n19), .Y(n135) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(\DFF_0/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(State_5) );
  sg13g2_dfrbp_1 \DFF_28/Q_reg  ( .D(\DFF_28/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(DumpIIHS1) );
  sg13g2_dfrbp_1 \DFF_27/Q_reg  ( .D(II29), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(LdProgHS1) );
  sg13g2_dfrbp_1 \DFF_26/Q_reg  ( .D(II28), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(ReWhBufHS1) );
  sg13g2_dfrbp_1 \DFF_25/Q_reg  ( .D(II27), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(TgWhBufHS1) );
  sg13g2_dfrbp_1 \DFF_24/Q_reg  ( .D(\DFF_24/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(SeFullIIHS1) );
  sg13g2_dfrbp_1 \DFF_23/Q_reg  ( .D(\DFF_23/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(SeFullOHS1) );
  sg13g2_dfrbp_1 \DFF_22/Q_reg  ( .D(II24), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(SeOutAvHS1) );
  sg13g2_dfrbp_1 \DFF_21/Q_reg  ( .D(\DFF_21/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(LoadIIHHS1) );
  sg13g2_dfrbp_1 \DFF_20/Q_reg  ( .D(\DFF_20/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(LoadOHHS1) );
  sg13g2_dfrbp_1 \DFF_19/Q_reg  ( .D(\DFF_19/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(TxHIInHS1) );
  sg13g2_dfrbp_1 \DFF_18/Q_reg  ( .D(\DFF_18/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(LxHIInHS1) );
  sg13g2_dfrbp_1 \DFF_17/Q_reg  ( .D(\DFF_17/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(ShftIIRHS1) );
  sg13g2_dfrbp_1 \DFF_16/Q_reg  ( .D(\DFF_16/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(ShftORHS1) );
  sg13g2_dfrbp_1 \DFF_15/Q_reg  ( .D(\DFF_15/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(NewLineHS1) );
  sg13g2_dfrbp_1 \DFF_14/Q_reg  ( .D(\DFF_14/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(Mode2HS1) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(\DFF_13/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(Mode1HS1) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(\DFF_12/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(Mode0HS1) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(II414), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(ReRtTSHS1) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(\DFF_10/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(NewTrHS1) );
  sg13g2_dfrbp_1 \DFF_9/Q_reg  ( .D(\DFF_9/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(GoBmHS1) );
  sg13g2_dfrbp_1 \DFF_8/Q_reg  ( .D(\DFF_8/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(GoRtHS1) );
  sg13g2_dfrbp_1 \DFF_7/Q_reg  ( .D(\DFF_7/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(ActBmHS1) );
  sg13g2_dfrbp_1 \DFF_6/Q_reg  ( .D(\DFF_6/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(ActRtHS1) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(\DFF_5/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(State_0) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(\DFF_2/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(State_3) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(\DFF_1/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(State_4) );
  sg13g2_dfrbp_2 \DFF_4/Q_reg  ( .D(\DFF_4/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(State_1) );
  sg13g2_dfrbp_2 \DFF_3/Q_reg  ( .D(\DFF_3/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(State_2) );
  sg13g2_inv_1 U229 ( .A(State_2), .Y(n224) );
  sg13g2_inv_1 U230 ( .A(n224), .Y(n225) );
  sg13g2_inv_1 U231 ( .A(n224), .Y(n226) );
  sg13g2_inv_1 U232 ( .A(State_1), .Y(n227) );
  sg13g2_inv_1 U233 ( .A(n227), .Y(n228) );
  sg13g2_inv_1 U234 ( .A(n227), .Y(n229) );
  sg13g2_inv_1 U235 ( .A(n26), .Y(n230) );
  sg13g2_inv_1 U236 ( .A(n230), .Y(n231) );
  sg13g2_inv_1 U237 ( .A(n230), .Y(n232) );
  sg13g2_inv_1 U238 ( .A(n25), .Y(n233) );
  sg13g2_inv_1 U239 ( .A(n233), .Y(n234) );
  sg13g2_inv_1 U240 ( .A(n233), .Y(n235) );
  sg13g2_tiehi U241 ( .L_HI(\DFF_1/n1 ) );
  sg13g2_inv_8 U242 ( .A(State_0), .Y(n26) );
  sg13g2_inv_8 U243 ( .A(n228), .Y(n25) );
endmodule

