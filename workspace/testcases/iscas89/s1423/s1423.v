/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:25:21 2025
/////////////////////////////////////////////////////////////


module s1423 ( CK, G0, G1, G10, G11, G12, G13, G14, G15, G16, G2, G3, G4, G5, 
        G6, G7, G701BF, G702, G726, G727, G729, G8, G9 );
  input CK, G0, G1, G10, G11, G12, G13, G14, G15, G16, G2, G3, G4, G5, G6, G7,
         G8, G9;
  output G701BF, G702, G726, G727, G729;
  wire   G22, G23, G24, G109, G25, G113, G26, G118, G27, G125, G28, G129, G29,
         G140, G30, G144, G31, G149, G32, G154, G33, G159, G34, G166, G35,
         G175, G36, G189, G37, G193, G38, G198, G39, G208, G40, G214, G41,
         G218, G42, G237, G43, G242, G44, G247, G45, G252, G46, G260, G47, G48,
         G49, G50, G51, G360, G52, G365, G53, G373, G54, G379, G55, G384, G56,
         G392, G57, G397, G58, G405, G59, G408, G60, G416, G61, G424, G62,
         G427, G63, G438, G64, G65, G447, G66, G67, G459, G68, G464, G69, G469,
         G70, G477, G71, G494, G72, G498, G73, G503, G74, G526, G75, G531, G76,
         G536, G77, G541, G78, G548, G79, G80, G81, G82, G83, G590, G84, G85,
         G86, G657, G87, G88, G89, G90, G682, G91, G687, G92, G693, G93, G705,
         G94, G95, G713, n2, n3, n4, n5, n6, n7, n8, n9, n10, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n32,
         n33, n34, n35, n37, n38, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n62, n63, n64, n65, n66, n67, n68, n69, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, \DFF_1/n1 , \DFF_0/D ,
         \DFF_72/D , \DFF_67/D , \DFF_66/D , \DFF_65/D , \DFF_63/D ,
         \DFF_62/D , \DFF_60/D , \DFF_59/D , \DFF_58/D , \DFF_57/D ,
         \DFF_44/D , \DFF_42/D , \DFF_28/D , \DFF_27/D , \DFF_26/D ,
         \DFF_25/D , \DFF_1/D , n263, n264, n265, n266, n267, n268, n269, n270,
         n271;
  assign G726 = G93;
  assign G729 = G95;

  sg13g2_nor2_2 U1 ( .A(n265), .B(n46), .Y(G727) );
  sg13g2_nor3_2 U2 ( .A(n78), .B(n19), .C(n55), .Y(G713) );
  sg13g2_a21oi_2 U3 ( .A1(n84), .A2(n85), .B1(n271), .Y(G705) );
  sg13g2_nand2_2 U4 ( .A(n86), .B(n87), .Y(n92) );
  sg13g2_nor2_2 U5 ( .A(G83), .B(n97), .Y(n96) );
  sg13g2_nor3_2 U6 ( .A(n98), .B(n25), .C(n99), .Y(n93) );
  sg13g2_nor4_2 U7 ( .A(n104), .B(n105), .C(n106), .D(n107), .Y(G702) );
  sg13g2_nor3_2 U8 ( .A(n17), .B(G94), .C(n108), .Y(n107) );
  sg13g2_nor2_2 U9 ( .A(n109), .B(n62), .Y(n106) );
  sg13g2_nand2_2 U10 ( .A(n112), .B(G657), .Y(G693) );
  sg13g2_nor2_2 U11 ( .A(G10), .B(n65), .Y(n113) );
  sg13g2_nand2_2 U12 ( .A(n114), .B(G657), .Y(G687) );
  sg13g2_nor2_2 U13 ( .A(G10), .B(n64), .Y(n115) );
  sg13g2_nand2_2 U14 ( .A(G10), .B(G86), .Y(n116) );
  sg13g2_nand2_2 U15 ( .A(G86), .B(n266), .Y(n117) );
  sg13g2_nor2b_2 U16 ( .B_N(G11), .A(n269), .Y(n83) );
  sg13g2_nor2_2 U17 ( .A(n268), .B(G11), .Y(n82) );
  sg13g2_nor2b_2 U18 ( .B_N(G13), .A(n269), .Y(G657) );
  sg13g2_a21oi_2 U19 ( .A1(n124), .A2(n125), .B1(n126), .Y(G590) );
  sg13g2_nor2_2 U20 ( .A(n131), .B(n126), .Y(G548) );
  sg13g2_nor3_2 U21 ( .A(n126), .B(n132), .C(n133), .Y(G541) );
  sg13g2_a21oi_2 U22 ( .A1(n134), .A2(G76), .B1(G77), .Y(n133) );
  sg13g2_nor2_2 U23 ( .A(n135), .B(n126), .Y(G536) );
  sg13g2_nor3_2 U24 ( .A(n126), .B(n134), .C(n136), .Y(G531) );
  sg13g2_a21oi_2 U25 ( .A1(n7), .A2(G74), .B1(G75), .Y(n136) );
  sg13g2_nor2_2 U26 ( .A(n137), .B(n126), .Y(G526) );
  sg13g2_a21oi_2 U27 ( .A1(n141), .A2(G92), .B1(n50), .Y(n140) );
  sg13g2_a21oi_2 U28 ( .A1(G34), .A2(n15), .B1(n37), .Y(n141) );
  sg13g2_nor2_2 U29 ( .A(G38), .B(n142), .Y(n139) );
  sg13g2_a21oi_2 U30 ( .A1(n143), .A2(n49), .B1(n144), .Y(G503) );
  sg13g2_a21oi_2 U31 ( .A1(n143), .A2(n48), .B1(n145), .Y(G498) );
  sg13g2_a21oi_2 U32 ( .A1(n143), .A2(n47), .B1(n146), .Y(G494) );
  sg13g2_nor2b_2 U33 ( .B_N(n138), .A(n269), .Y(n143) );
  sg13g2_nor3_2 U34 ( .A(n147), .B(n148), .C(n149), .Y(G477) );
  sg13g2_a21oi_2 U35 ( .A1(n150), .A2(G69), .B1(G70), .Y(n149) );
  sg13g2_nor2_2 U36 ( .A(n151), .B(n147), .Y(G469) );
  sg13g2_nor3_2 U37 ( .A(n147), .B(n150), .C(n152), .Y(G464) );
  sg13g2_a21oi_2 U38 ( .A1(G67), .A2(n153), .B1(G68), .Y(n152) );
  sg13g2_nor2_2 U39 ( .A(n147), .B(n154), .Y(G459) );
  sg13g2_nand2_2 U40 ( .A(n266), .B(n155), .Y(n153) );
  sg13g2_nor2_2 U41 ( .A(n160), .B(n270), .Y(n158) );
  sg13g2_a21oi_2 U42 ( .A1(n32), .A2(n19), .B1(n271), .Y(G438) );
  sg13g2_a21oi_2 U43 ( .A1(n37), .A2(n23), .B1(n161), .Y(n95) );
  sg13g2_nor3_2 U44 ( .A(n268), .B(n2), .C(n162), .Y(G427) );
  sg13g2_nor2_2 U45 ( .A(n3), .B(G62), .Y(n162) );
  sg13g2_nand2_2 U46 ( .A(n3), .B(G62), .Y(n109) );
  sg13g2_nor2_2 U47 ( .A(n164), .B(n165), .Y(G424) );
  sg13g2_a21oi_2 U48 ( .A1(G60), .A2(n166), .B1(G61), .Y(n164) );
  sg13g2_nor2_2 U49 ( .A(n167), .B(n165), .Y(G416) );
  sg13g2_nand2_2 U50 ( .A(G14), .B(n163), .Y(n165) );
  sg13g2_nand2_2 U51 ( .A(G61), .B(n166), .Y(n163) );
  sg13g2_nor3_2 U52 ( .A(n269), .B(n156), .C(n168), .Y(G408) );
  sg13g2_nor2b_2 U53 ( .B_N(n169), .A(G59), .Y(n168) );
  sg13g2_nor2_2 U54 ( .A(n170), .B(n171), .Y(G405) );
  sg13g2_a21oi_2 U55 ( .A1(G57), .A2(n172), .B1(G58), .Y(n170) );
  sg13g2_nor2_2 U56 ( .A(n171), .B(n173), .Y(G397) );
  sg13g2_nand2_2 U57 ( .A(G14), .B(n169), .Y(n171) );
  sg13g2_a21oi_2 U58 ( .A1(n174), .A2(n30), .B1(n175), .Y(G392) );
  sg13g2_nor2_2 U59 ( .A(n175), .B(n176), .Y(G384) );
  sg13g2_nand2_2 U60 ( .A(G55), .B(n177), .Y(n174) );
  sg13g2_nor2_2 U61 ( .A(n175), .B(n178), .Y(G379) );
  sg13g2_nand2_2 U62 ( .A(G14), .B(n179), .Y(n175) );
  sg13g2_a21oi_2 U63 ( .A1(n180), .A2(n29), .B1(n181), .Y(G373) );
  sg13g2_nor3_2 U64 ( .A(n181), .B(n4), .C(n182), .Y(G365) );
  sg13g2_a21oi_2 U65 ( .A1(G51), .A2(n5), .B1(G52), .Y(n182) );
  sg13g2_nor2_2 U66 ( .A(n181), .B(n184), .Y(G360) );
  sg13g2_nor2_2 U67 ( .A(n29), .B(n183), .Y(n166) );
  sg13g2_nor2_2 U68 ( .A(n64), .B(n156), .Y(n183) );
  sg13g2_nor2b_2 U69 ( .B_N(G59), .A(n169), .Y(n156) );
  sg13g2_nand2_2 U70 ( .A(G58), .B(n172), .Y(n169) );
  sg13g2_nand2_2 U71 ( .A(n265), .B(n186), .Y(n87) );
  sg13g2_a21oi_2 U72 ( .A1(n51), .A2(n193), .B1(G82), .Y(n192) );
  sg13g2_nor2_2 U73 ( .A(G82), .B(G81), .Y(n194) );
  sg13g2_nor2b_2 U74 ( .B_N(n202), .A(n269), .Y(n198) );
  sg13g2_nor2_2 U75 ( .A(n202), .B(n270), .Y(n197) );
  sg13g2_nand2_2 U76 ( .A(G91), .B(n179), .Y(n202) );
  sg13g2_nand2_2 U77 ( .A(G56), .B(n177), .Y(n179) );
  sg13g2_nor2_2 U78 ( .A(n204), .B(n205), .Y(G260) );
  sg13g2_nor3_2 U79 ( .A(n205), .B(n206), .C(n207), .Y(G252) );
  sg13g2_a21oi_2 U80 ( .A1(n208), .A2(G44), .B1(G45), .Y(n207) );
  sg13g2_nor2_2 U81 ( .A(n209), .B(n205), .Y(G247) );
  sg13g2_nor3_2 U82 ( .A(n205), .B(n208), .C(n210), .Y(G242) );
  sg13g2_a21oi_2 U83 ( .A1(n211), .A2(G42), .B1(G43), .Y(n210) );
  sg13g2_nor2_2 U84 ( .A(n212), .B(n205), .Y(G237) );
  sg13g2_nand2_2 U85 ( .A(n265), .B(n147), .Y(n138) );
  sg13g2_nand2_2 U86 ( .A(G14), .B(n160), .Y(n147) );
  sg13g2_nor3_2 U87 ( .A(G71), .B(G73), .C(G72), .Y(n217) );
  sg13g2_nor4_2 U88 ( .A(n221), .B(n28), .C(G15), .D(n27), .Y(n220) );
  sg13g2_nand2_2 U89 ( .A(G50), .B(G49), .Y(n221) );
  sg13g2_nor2_2 U90 ( .A(G50), .B(G49), .Y(n222) );
  sg13g2_nor2_2 U91 ( .A(n223), .B(n270), .Y(G218) );
  sg13g2_a21oi_2 U92 ( .A1(n9), .A2(n224), .B1(n271), .Y(G214) );
  sg13g2_nand2_2 U93 ( .A(G40), .B(n225), .Y(n224) );
  sg13g2_nor2_2 U94 ( .A(n268), .B(n226), .Y(G208) );
  sg13g2_nor2_2 U95 ( .A(n227), .B(n270), .Y(G198) );
  sg13g2_nor3_2 U96 ( .A(n269), .B(n6), .C(n228), .Y(G193) );
  sg13g2_a21oi_2 U97 ( .A1(n8), .A2(n22), .B1(G37), .Y(n228) );
  sg13g2_nor2_2 U98 ( .A(n268), .B(n230), .Y(G189) );
  sg13g2_a21oi_2 U99 ( .A1(n111), .A2(G41), .B1(n64), .Y(n229) );
  sg13g2_nor2_2 U100 ( .A(n225), .B(G40), .Y(n111) );
  sg13g2_nand2_2 U101 ( .A(G92), .B(n110), .Y(n203) );
  sg13g2_nor2_2 U102 ( .A(G35), .B(n270), .Y(G175) );
  sg13g2_a21oi_2 U103 ( .A1(n110), .A2(n231), .B1(n271), .Y(G166) );
  sg13g2_nand2_2 U104 ( .A(G34), .B(n232), .Y(n231) );
  sg13g2_nand2_2 U105 ( .A(n15), .B(n20), .Y(n110) );
  sg13g2_nand2_2 U106 ( .A(G33), .B(n233), .Y(n232) );
  sg13g2_nor2_2 U107 ( .A(n234), .B(n270), .Y(G159) );
  sg13g2_nor3_2 U108 ( .A(n269), .B(n233), .C(n235), .Y(G154) );
  sg13g2_a21oi_2 U109 ( .A1(G31), .A2(n236), .B1(G32), .Y(n235) );
  sg13g2_nor2_2 U110 ( .A(n237), .B(n270), .Y(G149) );
  sg13g2_nor3_2 U111 ( .A(n268), .B(n236), .C(n238), .Y(G144) );
  sg13g2_a21oi_2 U112 ( .A1(n239), .A2(n18), .B1(G30), .Y(n238) );
  sg13g2_nor2_2 U113 ( .A(n268), .B(n240), .Y(G140) );
  sg13g2_nor2_2 U114 ( .A(n241), .B(n270), .Y(G129) );
  sg13g2_a21oi_2 U115 ( .A1(n108), .A2(n242), .B1(n271), .Y(G125) );
  sg13g2_nand2_2 U116 ( .A(G27), .B(n243), .Y(n242) );
  sg13g2_nand2_2 U117 ( .A(G26), .B(n244), .Y(n243) );
  sg13g2_nor2_2 U118 ( .A(n245), .B(n269), .Y(G118) );
  sg13g2_nor3_2 U119 ( .A(n268), .B(n244), .C(n246), .Y(G113) );
  sg13g2_a21oi_2 U120 ( .A1(n91), .A2(n16), .B1(G25), .Y(n246) );
  sg13g2_nor2_2 U121 ( .A(n268), .B(n247), .Y(G109) );
  sg13g2_a21oi_2 U122 ( .A1(G64), .A2(n264), .B1(G84), .Y(n260) );
  sg13g2_a21oi_2 U123 ( .A1(n266), .A2(n35), .B1(G85), .Y(n261) );
  sg13g2_inv_2 U124 ( .A(n195), .Y(\DFF_1/D ) );
  sg13g2_inv_2 U125 ( .A(n109), .Y(n2) );
  sg13g2_inv_2 U126 ( .A(n163), .Y(n3) );
  sg13g2_inv_2 U127 ( .A(n180), .Y(n4) );
  sg13g2_inv_2 U128 ( .A(n183), .Y(n5) );
  sg13g2_inv_2 U129 ( .A(n142), .Y(n6) );
  sg13g2_inv_2 U130 ( .A(n124), .Y(n7) );
  sg13g2_inv_2 U131 ( .A(n229), .Y(n8) );
  sg13g2_inv_2 U132 ( .A(n111), .Y(n9) );
  sg13g2_inv_2 U133 ( .A(n203), .Y(n10) );
  sg13g2_inv_2 U134 ( .A(n201), .Y(\DFF_25/D ) );
  sg13g2_inv_2 U135 ( .A(n200), .Y(\DFF_26/D ) );
  sg13g2_inv_2 U136 ( .A(n199), .Y(\DFF_27/D ) );
  sg13g2_inv_2 U137 ( .A(n196), .Y(\DFF_28/D ) );
  sg13g2_inv_2 U138 ( .A(n232), .Y(n15) );
  sg13g2_inv_2 U139 ( .A(G24), .Y(n16) );
  sg13g2_inv_2 U140 ( .A(G28), .Y(n17) );
  sg13g2_inv_2 U141 ( .A(G29), .Y(n18) );
  sg13g2_inv_2 U142 ( .A(n95), .Y(n19) );
  sg13g2_inv_2 U143 ( .A(G34), .Y(n20) );
  sg13g2_inv_2 U144 ( .A(G35), .Y(n21) );
  sg13g2_inv_2 U145 ( .A(G36), .Y(n22) );
  sg13g2_inv_2 U146 ( .A(G38), .Y(n23) );
  sg13g2_inv_2 U147 ( .A(G43), .Y(n24) );
  sg13g2_inv_2 U148 ( .A(n100), .Y(n25) );
  sg13g2_inv_2 U149 ( .A(G45), .Y(n26) );
  sg13g2_inv_2 U150 ( .A(G47), .Y(n27) );
  sg13g2_inv_2 U151 ( .A(G48), .Y(n28) );
  sg13g2_inv_2 U152 ( .A(G53), .Y(n29) );
  sg13g2_inv_2 U153 ( .A(G56), .Y(n30) );
  sg13g2_inv_2 U154 ( .A(n159), .Y(\DFF_42/D ) );
  sg13g2_inv_2 U155 ( .A(G63), .Y(n32) );
  sg13g2_inv_2 U156 ( .A(n253), .Y(n33) );
  sg13g2_inv_2 U157 ( .A(n258), .Y(n34) );
  sg13g2_inv_2 U158 ( .A(G64), .Y(n35) );
  sg13g2_inv_2 U159 ( .A(n157), .Y(\DFF_44/D ) );
  sg13g2_inv_2 U160 ( .A(n87), .Y(n37) );
  sg13g2_inv_2 U161 ( .A(G66), .Y(n38) );
  sg13g2_inv_2 U162 ( .A(n130), .Y(\DFF_57/D ) );
  sg13g2_inv_2 U163 ( .A(n129), .Y(\DFF_58/D ) );
  sg13g2_inv_2 U164 ( .A(n128), .Y(\DFF_59/D ) );
  sg13g2_inv_2 U165 ( .A(n127), .Y(\DFF_60/D ) );
  sg13g2_inv_2 U166 ( .A(n123), .Y(\DFF_62/D ) );
  sg13g2_inv_2 U167 ( .A(n121), .Y(\DFF_63/D ) );
  sg13g2_inv_2 U168 ( .A(n122), .Y(n45) );
  sg13g2_inv_2 U169 ( .A(n147), .Y(n46) );
  sg13g2_inv_2 U170 ( .A(G71), .Y(n47) );
  sg13g2_inv_2 U171 ( .A(G72), .Y(n48) );
  sg13g2_inv_2 U172 ( .A(G73), .Y(n49) );
  sg13g2_inv_2 U173 ( .A(n97), .Y(n50) );
  sg13g2_inv_2 U174 ( .A(G77), .Y(n51) );
  sg13g2_inv_2 U175 ( .A(G79), .Y(n52) );
  sg13g2_inv_2 U176 ( .A(G80), .Y(n53) );
  sg13g2_inv_2 U177 ( .A(G81), .Y(n54) );
  sg13g2_inv_2 U178 ( .A(G83), .Y(n55) );
  sg13g2_inv_2 U179 ( .A(n116), .Y(n56) );
  sg13g2_inv_2 U180 ( .A(G87), .Y(n57) );
  sg13g2_inv_2 U181 ( .A(n119), .Y(\DFF_66/D ) );
  sg13g2_inv_2 U182 ( .A(n120), .Y(\DFF_65/D ) );
  sg13g2_inv_2 U183 ( .A(n118), .Y(\DFF_67/D ) );
  sg13g2_inv_2 U184 ( .A(n81), .Y(\DFF_72/D ) );
  sg13g2_inv_2 U185 ( .A(G89), .Y(n62) );
  sg13g2_inv_2 U186 ( .A(n266), .Y(n63) );
  sg13g2_inv_2 U187 ( .A(G91), .Y(n64) );
  sg13g2_inv_2 U188 ( .A(G92), .Y(n65) );
  sg13g2_inv_2 U189 ( .A(G94), .Y(n66) );
  sg13g2_inv_2 U190 ( .A(G0), .Y(n67) );
  sg13g2_inv_2 U191 ( .A(G1), .Y(n68) );
  sg13g2_inv_2 U192 ( .A(G14), .Y(n69) );
  sg13g2_inv_2 U193 ( .A(G15), .Y(G701BF) );
  sg13g2_inv_2 U194 ( .A(G2), .Y(n71) );
  sg13g2_inv_2 U195 ( .A(G3), .Y(n72) );
  sg13g2_inv_2 U196 ( .A(G4), .Y(n73) );
  sg13g2_inv_2 U197 ( .A(G5), .Y(n74) );
  sg13g2_inv_2 U198 ( .A(G7), .Y(n75) );
  sg13g2_inv_2 U199 ( .A(G8), .Y(n76) );
  sg13g2_inv_2 U200 ( .A(G9), .Y(n77) );
  sg13g2_nand3_1 U201 ( .A(n79), .B(n80), .C(G14), .Y(n78) );
  sg13g2_a22oi_1 U202 ( .A1(G94), .A2(n82), .B1(n83), .B2(n62), .Y(n81) );
  sg13g2_nand3_1 U203 ( .A(n86), .B(n87), .C(n88), .Y(n85) );
  sg13g2_a22oi_1 U204 ( .A1(n89), .A2(n265), .B1(n63), .B2(n21), .Y(n88) );
  sg13g2_a22oi_1 U205 ( .A1(G59), .A2(n64), .B1(G91), .B2(G62), .Y(n89) );
  sg13g2_nand3_1 U206 ( .A(n90), .B(n91), .C(n92), .Y(n84) );
  sg13g2_or2_1 U207 ( .A(G6), .B(n265), .X(n86) );
  sg13g2_o21ai_1 U208 ( .A1(n93), .A2(n94), .B1(n95), .Y(n90) );
  sg13g2_a22oi_1 U209 ( .A1(n63), .A2(n74), .B1(n96), .B2(n266), .Y(n94) );
  sg13g2_nand3b_1 U210 ( .A_N(n101), .B(n102), .C(n103), .Y(n98) );
  sg13g2_o21ai_1 U211 ( .A1(n110), .A2(n57), .B1(n63), .Y(n105) );
  sg13g2_and3_1 U212 ( .A(G88), .B(n111), .C(G41), .X(n104) );
  sg13g2_a22oi_1 U213 ( .A1(n113), .A2(G86), .B1(n56), .B2(G91), .Y(n112) );
  sg13g2_a22oi_1 U214 ( .A1(n115), .A2(G86), .B1(n56), .B2(n266), .Y(n114) );
  sg13g2_nand3_1 U215 ( .A(n117), .B(n116), .C(G657), .Y(G682) );
  sg13g2_a22oi_1 U216 ( .A1(G89), .A2(n82), .B1(G88), .B2(n83), .Y(n118) );
  sg13g2_a22oi_1 U217 ( .A1(G88), .A2(n82), .B1(G87), .B2(n83), .Y(n119) );
  sg13g2_a22oi_1 U218 ( .A1(G87), .A2(n82), .B1(n83), .B2(n66), .Y(n120) );
  sg13g2_a22oi_1 U219 ( .A1(G85), .A2(n45), .B1(G11), .B2(n122), .Y(n121) );
  sg13g2_a22oi_1 U220 ( .A1(G84), .A2(n45), .B1(G10), .B2(n122), .Y(n123) );
  sg13g2_o21ai_1 U221 ( .A1(n95), .A2(n97), .B1(G83), .Y(n125) );
  sg13g2_a22oi_1 U222 ( .A1(n45), .A2(G82), .B1(G9), .B2(n122), .Y(n127) );
  sg13g2_a22oi_1 U223 ( .A1(n45), .A2(G81), .B1(G8), .B2(n122), .Y(n128) );
  sg13g2_a22oi_1 U224 ( .A1(n45), .A2(G80), .B1(G7), .B2(n122), .Y(n129) );
  sg13g2_a22oi_1 U225 ( .A1(n45), .A2(G79), .B1(G6), .B2(n122), .Y(n130) );
  sg13g2_o21ai_1 U226 ( .A1(n46), .A2(n64), .B1(G14), .Y(n122) );
  sg13g2_xnor2_1 U227 ( .A(n132), .B(G78), .Y(n131) );
  sg13g2_and3_1 U228 ( .A(G77), .B(G76), .C(n134), .X(n132) );
  sg13g2_xnor2_1 U229 ( .A(G76), .B(n134), .Y(n135) );
  sg13g2_and3_1 U230 ( .A(G75), .B(G74), .C(n7), .X(n134) );
  sg13g2_o21ai_1 U231 ( .A1(n266), .A2(n77), .B1(n138), .Y(n126) );
  sg13g2_xor2_1 U232 ( .A(n124), .B(G74), .X(n137) );
  sg13g2_o21ai_1 U233 ( .A1(n139), .A2(n87), .B1(n140), .Y(n124) );
  sg13g2_a221oi_1 U234 ( .A1(G63), .A2(G5), .B1(G2), .B2(n32), .C1(n143), .Y(
        n144) );
  sg13g2_a221oi_1 U235 ( .A1(G4), .A2(G63), .B1(G1), .B2(n32), .C1(n143), .Y(
        n145) );
  sg13g2_a221oi_1 U236 ( .A1(G3), .A2(G63), .B1(G0), .B2(n32), .C1(n143), .Y(
        n146) );
  sg13g2_and3_1 U237 ( .A(n150), .B(G70), .C(G69), .X(n148) );
  sg13g2_xnor2_1 U238 ( .A(n150), .B(G69), .Y(n151) );
  sg13g2_and3_1 U239 ( .A(G67), .B(n153), .C(G68), .X(n150) );
  sg13g2_xnor2_1 U240 ( .A(G67), .B(n153), .Y(n154) );
  sg13g2_o21ai_1 U241 ( .A1(n2), .A2(n64), .B1(n156), .Y(n155) );
  sg13g2_a22oi_1 U242 ( .A1(G65), .A2(n158), .B1(G66), .B2(n46), .Y(n157) );
  sg13g2_a21o_1 U243 ( .A1(G14), .A2(G65), .B1(n158), .X(G447) );
  sg13g2_a22oi_1 U244 ( .A1(n158), .A2(G63), .B1(n46), .B2(G64), .Y(n159) );
  sg13g2_a221oi_1 U245 ( .A1(G35), .A2(n65), .B1(G92), .B2(n20), .C1(n37), .Y(
        n161) );
  sg13g2_xnor2_1 U246 ( .A(G60), .B(n166), .Y(n167) );
  sg13g2_xnor2_1 U247 ( .A(G57), .B(n172), .Y(n173) );
  sg13g2_o21ai_1 U248 ( .A1(n177), .A2(G55), .B1(n174), .Y(n176) );
  sg13g2_xor2_1 U249 ( .A(G54), .B(n10), .X(n178) );
  sg13g2_nand3_1 U250 ( .A(G51), .B(n5), .C(G52), .Y(n180) );
  sg13g2_xor2_1 U251 ( .A(G51), .B(n183), .X(n184) );
  sg13g2_or2_1 U252 ( .A(n166), .B(n271), .X(n181) );
  sg13g2_o21ai_1 U253 ( .A1(n37), .A2(n10), .B1(n185), .Y(n172) );
  sg13g2_nand3_1 U254 ( .A(n6), .B(n37), .C(G38), .Y(n185) );
  sg13g2_nand4_1 U255 ( .A(G16), .B(n50), .C(n38), .D(n55), .Y(n186) );
  sg13g2_nand4_1 U256 ( .A(n187), .B(n188), .C(n189), .D(n190), .Y(n97) );
  sg13g2_a221oi_1 U257 ( .A1(G82), .A2(n51), .B1(G78), .B2(n191), .C1(n192), 
        .Y(n190) );
  sg13g2_nand4_1 U258 ( .A(n191), .B(n52), .C(n53), .D(n54), .Y(n193) );
  sg13g2_nand4_1 U259 ( .A(G78), .B(n52), .C(n194), .D(n53), .Y(n191) );
  sg13g2_xor2_1 U260 ( .A(G75), .B(n53), .X(n189) );
  sg13g2_xor2_1 U261 ( .A(G76), .B(n54), .X(n188) );
  sg13g2_xor2_1 U262 ( .A(G74), .B(n52), .X(n187) );
  sg13g2_a22oi_1 U263 ( .A1(n197), .A2(G50), .B1(n198), .B2(G49), .Y(n196) );
  sg13g2_a22oi_1 U264 ( .A1(n197), .A2(G49), .B1(n198), .B2(G48), .Y(n199) );
  sg13g2_a22oi_1 U265 ( .A1(n197), .A2(G48), .B1(n198), .B2(G47), .Y(n200) );
  sg13g2_a22oi_1 U266 ( .A1(n197), .A2(G47), .B1(G12), .B2(n198), .Y(n201) );
  sg13g2_and2_1 U267 ( .A(G54), .B(n203), .X(n177) );
  sg13g2_xnor2_1 U268 ( .A(n206), .B(G46), .Y(n204) );
  sg13g2_and3_1 U269 ( .A(G45), .B(G44), .C(n208), .X(n206) );
  sg13g2_xnor2_1 U270 ( .A(G44), .B(n208), .Y(n209) );
  sg13g2_and3_1 U271 ( .A(G43), .B(G42), .C(n211), .X(n208) );
  sg13g2_o21ai_1 U272 ( .A1(n265), .A2(n75), .B1(n138), .Y(n205) );
  sg13g2_nand4_1 U273 ( .A(n213), .B(n214), .C(n215), .D(n216), .Y(n160) );
  sg13g2_xnor2_1 U274 ( .A(G70), .B(n217), .Y(n216) );
  sg13g2_xor2_1 U275 ( .A(n47), .B(G67), .X(n215) );
  sg13g2_xor2_1 U276 ( .A(G68), .B(n48), .X(n214) );
  sg13g2_xor2_1 U277 ( .A(n49), .B(G69), .X(n213) );
  sg13g2_xnor2_1 U278 ( .A(n211), .B(G42), .Y(n212) );
  sg13g2_and4_1 U279 ( .A(G47), .B(n195), .C(G48), .D(n218), .X(n211) );
  sg13g2_and2_1 U280 ( .A(G49), .B(G50), .X(n218) );
  sg13g2_a22oi_1 U281 ( .A1(\DFF_0/D ), .A2(G15), .B1(G23), .B2(G701BF), .Y(
        n195) );
  sg13g2_a21o_1 U282 ( .A1(G22), .A2(n219), .B1(n220), .X(\DFF_0/D ) );
  sg13g2_nand4_1 U283 ( .A(G701BF), .B(n27), .C(n222), .D(n28), .Y(n219) );
  sg13g2_xor2_1 U284 ( .A(G41), .B(n9), .X(n223) );
  sg13g2_xor2_1 U285 ( .A(G39), .B(n10), .X(n226) );
  sg13g2_xor2_1 U286 ( .A(n23), .B(n6), .X(n227) );
  sg13g2_nand3_1 U287 ( .A(n8), .B(n22), .C(G37), .Y(n142) );
  sg13g2_xor2_1 U288 ( .A(G36), .B(n229), .X(n230) );
  sg13g2_nand2b_1 U289 ( .A_N(G39), .B(n203), .Y(n225) );
  sg13g2_xnor2_1 U290 ( .A(n233), .B(G33), .Y(n234) );
  sg13g2_and3_1 U291 ( .A(G31), .B(n236), .C(G32), .X(n233) );
  sg13g2_xnor2_1 U292 ( .A(n236), .B(G31), .Y(n237) );
  sg13g2_and3_1 U293 ( .A(n239), .B(n18), .C(G30), .X(n236) );
  sg13g2_xor2_1 U294 ( .A(n18), .B(n239), .X(n240) );
  sg13g2_o21ai_1 U295 ( .A1(n108), .A2(n17), .B1(G92), .Y(n239) );
  sg13g2_xor2_1 U296 ( .A(n108), .B(G28), .X(n241) );
  sg13g2_or2_1 U297 ( .A(n243), .B(G27), .X(n108) );
  sg13g2_xnor2_1 U298 ( .A(n244), .B(G26), .Y(n245) );
  sg13g2_and3_1 U299 ( .A(n91), .B(n16), .C(G25), .X(n244) );
  sg13g2_xor2_1 U300 ( .A(n16), .B(n91), .X(n247) );
  sg13g2_o21ai_1 U301 ( .A1(n248), .A2(n99), .B1(n249), .Y(n91) );
  sg13g2_or2_1 U302 ( .A(G46), .B(n250), .X(n249) );
  sg13g2_xnor2_1 U303 ( .A(G46), .B(n250), .Y(n99) );
  sg13g2_a22oi_1 U304 ( .A1(n63), .A2(n73), .B1(n251), .B2(G78), .Y(n250) );
  sg13g2_a22oi_1 U305 ( .A1(n100), .A2(n252), .B1(n26), .B2(n33), .Y(n248) );
  sg13g2_o21ai_1 U306 ( .A1(n254), .A2(n101), .B1(n255), .Y(n252) );
  sg13g2_or2_1 U307 ( .A(n256), .B(G44), .X(n255) );
  sg13g2_xnor2_1 U308 ( .A(G44), .B(n256), .Y(n101) );
  sg13g2_a22oi_1 U309 ( .A1(n63), .A2(n71), .B1(n251), .B2(G76), .Y(n256) );
  sg13g2_a22oi_1 U310 ( .A1(n102), .A2(n257), .B1(n24), .B2(n34), .Y(n254) );
  sg13g2_nand2b_1 U311 ( .A_N(n103), .B(G42), .Y(n257) );
  sg13g2_xor2_1 U312 ( .A(G42), .B(n259), .X(n103) );
  sg13g2_a22oi_1 U313 ( .A1(n63), .A2(n67), .B1(n251), .B2(G74), .Y(n259) );
  sg13g2_xor2_1 U314 ( .A(G43), .B(n258), .X(n102) );
  sg13g2_a22oi_1 U315 ( .A1(n63), .A2(n68), .B1(n251), .B2(G75), .Y(n258) );
  sg13g2_xnor2_1 U316 ( .A(n26), .B(n253), .Y(n100) );
  sg13g2_a22oi_1 U317 ( .A1(n63), .A2(n72), .B1(G77), .B2(n251), .Y(n253) );
  sg13g2_and3_1 U318 ( .A(n79), .B(n80), .C(n265), .X(n251) );
  sg13g2_o21ai_1 U319 ( .A1(n264), .A2(G8), .B1(n260), .Y(n80) );
  sg13g2_o21ai_1 U320 ( .A1(n265), .A2(n76), .B1(n261), .Y(n79) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(\DFF_0/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G22) );
  sg13g2_dfrbp_1 \DFF_73/Q_reg  ( .D(G713), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G95) );
  sg13g2_dfrbp_1 \DFF_72/Q_reg  ( .D(\DFF_72/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G94) );
  sg13g2_dfrbp_1 \DFF_71/Q_reg  ( .D(G705), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G93) );
  sg13g2_dfrbp_1 \DFF_70/Q_reg  ( .D(G693), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G92) );
  sg13g2_dfrbp_1 \DFF_69/Q_reg  ( .D(G687), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G91) );
  sg13g2_dfrbp_1 \DFF_68/Q_reg  ( .D(G682), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G90) );
  sg13g2_dfrbp_1 \DFF_67/Q_reg  ( .D(\DFF_67/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G89) );
  sg13g2_dfrbp_1 \DFF_66/Q_reg  ( .D(\DFF_66/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G88) );
  sg13g2_dfrbp_1 \DFF_65/Q_reg  ( .D(\DFF_65/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G87) );
  sg13g2_dfrbp_1 \DFF_64/Q_reg  ( .D(G657), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G86) );
  sg13g2_dfrbp_1 \DFF_63/Q_reg  ( .D(\DFF_63/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G85) );
  sg13g2_dfrbp_1 \DFF_62/Q_reg  ( .D(\DFF_62/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G84) );
  sg13g2_dfrbp_1 \DFF_61/Q_reg  ( .D(G590), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G83) );
  sg13g2_dfrbp_1 \DFF_60/Q_reg  ( .D(\DFF_60/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G82) );
  sg13g2_dfrbp_1 \DFF_59/Q_reg  ( .D(\DFF_59/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G81) );
  sg13g2_dfrbp_1 \DFF_58/Q_reg  ( .D(\DFF_58/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G80) );
  sg13g2_dfrbp_1 \DFF_57/Q_reg  ( .D(\DFF_57/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G79) );
  sg13g2_dfrbp_1 \DFF_56/Q_reg  ( .D(G548), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G78) );
  sg13g2_dfrbp_1 \DFF_55/Q_reg  ( .D(G541), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G77) );
  sg13g2_dfrbp_1 \DFF_54/Q_reg  ( .D(G536), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G76) );
  sg13g2_dfrbp_1 \DFF_53/Q_reg  ( .D(G531), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G75) );
  sg13g2_dfrbp_1 \DFF_52/Q_reg  ( .D(G526), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G74) );
  sg13g2_dfrbp_1 \DFF_51/Q_reg  ( .D(G503), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G73) );
  sg13g2_dfrbp_1 \DFF_50/Q_reg  ( .D(G498), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G72) );
  sg13g2_dfrbp_1 \DFF_49/Q_reg  ( .D(G494), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G71) );
  sg13g2_dfrbp_1 \DFF_48/Q_reg  ( .D(G477), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G70) );
  sg13g2_dfrbp_1 \DFF_47/Q_reg  ( .D(G469), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G69) );
  sg13g2_dfrbp_1 \DFF_46/Q_reg  ( .D(G464), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G68) );
  sg13g2_dfrbp_1 \DFF_45/Q_reg  ( .D(G459), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G67) );
  sg13g2_dfrbp_1 \DFF_44/Q_reg  ( .D(\DFF_44/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G66) );
  sg13g2_dfrbp_1 \DFF_43/Q_reg  ( .D(G447), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G65) );
  sg13g2_dfrbp_1 \DFF_42/Q_reg  ( .D(\DFF_42/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G64) );
  sg13g2_dfrbp_1 \DFF_41/Q_reg  ( .D(G438), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G63) );
  sg13g2_dfrbp_1 \DFF_40/Q_reg  ( .D(G427), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G62) );
  sg13g2_dfrbp_1 \DFF_39/Q_reg  ( .D(G424), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G61) );
  sg13g2_dfrbp_1 \DFF_38/Q_reg  ( .D(G416), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G60) );
  sg13g2_dfrbp_1 \DFF_37/Q_reg  ( .D(G408), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G59) );
  sg13g2_dfrbp_1 \DFF_36/Q_reg  ( .D(G405), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G58) );
  sg13g2_dfrbp_1 \DFF_35/Q_reg  ( .D(G397), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G57) );
  sg13g2_dfrbp_1 \DFF_34/Q_reg  ( .D(G392), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G56) );
  sg13g2_dfrbp_1 \DFF_33/Q_reg  ( .D(G384), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G55) );
  sg13g2_dfrbp_1 \DFF_32/Q_reg  ( .D(G379), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G54) );
  sg13g2_dfrbp_1 \DFF_31/Q_reg  ( .D(G373), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G53) );
  sg13g2_dfrbp_1 \DFF_30/Q_reg  ( .D(G365), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G52) );
  sg13g2_dfrbp_1 \DFF_29/Q_reg  ( .D(G360), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G51) );
  sg13g2_dfrbp_1 \DFF_28/Q_reg  ( .D(\DFF_28/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G50) );
  sg13g2_dfrbp_1 \DFF_27/Q_reg  ( .D(\DFF_27/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G49) );
  sg13g2_dfrbp_1 \DFF_26/Q_reg  ( .D(\DFF_26/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G48) );
  sg13g2_dfrbp_1 \DFF_25/Q_reg  ( .D(\DFF_25/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(G47) );
  sg13g2_dfrbp_1 \DFF_24/Q_reg  ( .D(G260), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G46) );
  sg13g2_dfrbp_1 \DFF_23/Q_reg  ( .D(G252), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G45) );
  sg13g2_dfrbp_1 \DFF_22/Q_reg  ( .D(G247), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G44) );
  sg13g2_dfrbp_1 \DFF_21/Q_reg  ( .D(G242), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G43) );
  sg13g2_dfrbp_1 \DFF_20/Q_reg  ( .D(G237), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G42) );
  sg13g2_dfrbp_1 \DFF_19/Q_reg  ( .D(G218), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G41) );
  sg13g2_dfrbp_1 \DFF_18/Q_reg  ( .D(G214), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G40) );
  sg13g2_dfrbp_1 \DFF_17/Q_reg  ( .D(G208), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G39) );
  sg13g2_dfrbp_1 \DFF_16/Q_reg  ( .D(G198), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G38) );
  sg13g2_dfrbp_1 \DFF_15/Q_reg  ( .D(G193), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G37) );
  sg13g2_dfrbp_1 \DFF_14/Q_reg  ( .D(G189), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G36) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(G175), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G35) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(G166), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G34) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(G159), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G33) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(G154), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G32) );
  sg13g2_dfrbp_1 \DFF_9/Q_reg  ( .D(G149), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G31) );
  sg13g2_dfrbp_1 \DFF_8/Q_reg  ( .D(G144), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G30) );
  sg13g2_dfrbp_1 \DFF_7/Q_reg  ( .D(G140), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G29) );
  sg13g2_dfrbp_1 \DFF_6/Q_reg  ( .D(G129), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G28) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(G125), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G27) );
  sg13g2_dfrbp_1 \DFF_4/Q_reg  ( .D(G118), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G26) );
  sg13g2_dfrbp_1 \DFF_3/Q_reg  ( .D(G113), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G25) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(G109), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        G24) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(\DFF_1/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(G23) );
  sg13g2_inv_1 U321 ( .A(n267), .Y(n263) );
  sg13g2_inv_1 U322 ( .A(n263), .Y(n264) );
  sg13g2_inv_1 U323 ( .A(n263), .Y(n265) );
  sg13g2_inv_1 U324 ( .A(n263), .Y(n266) );
  sg13g2_tiehi U325 ( .L_HI(\DFF_1/n1 ) );
  sg13g2_buf_16 U326 ( .A(G90), .X(n267) );
  sg13g2_buf_16 U327 ( .A(n69), .X(n268) );
  sg13g2_buf_16 U328 ( .A(n69), .X(n269) );
  sg13g2_buf_16 U329 ( .A(n69), .X(n270) );
  sg13g2_buf_16 U330 ( .A(n69), .X(n271) );
endmodule

