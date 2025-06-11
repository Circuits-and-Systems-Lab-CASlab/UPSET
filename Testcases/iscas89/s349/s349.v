/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:21:43 2025
/////////////////////////////////////////////////////////////


module s349 ( GND, VDD, CK, A0, A1, A2, A3, B0, B1, B2, B3, CNTVCO2, CNTVCON2, 
        P0, P1, P2, P3, P4, P5, P6, P7, READY, START );
  input GND, VDD, CK, A0, A1, A2, A3, B0, B1, B2, B3, START;
  output CNTVCO2, CNTVCON2, P0, P1, P2, P3, P4, P5, P6, P7, READY;
  wire   CT2, CNTVG3VD, CT1, CNTVG2VD, CT0, CNTVG1VD, ACVQN3, ACVQN2, ACVQN1,
         ACVQN0, MRVQN3, MRVG4VD, MRVQN2, MRVG3VD, MRVQN1, MRVG2VD, MRVQN0,
         MRVG1VD, AX3, AX2, AX1, AX0, n1, n6, n7, n10, n12, n14, n16, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, \DFF_1/n1 , \DFF_14/D , \DFF_13/D , \DFF_12/D ,
         \DFF_11/D , \DFF_6/D , \DFF_5/D , \DFF_4/D , \DFF_3/D , n74, n75, n76
;

  sg13g2_nand2_2 U1 ( .A(n22), .B(n28), .Y(\DFF_6/D ) );
  sg13g2_nand2_2 U2 ( .A(n76), .B(P4), .Y(n31) );
  sg13g2_nand2_2 U3 ( .A(n22), .B(n37), .Y(\DFF_5/D ) );
  sg13g2_nand2_2 U4 ( .A(n76), .B(P5), .Y(n39) );
  sg13g2_nand2_2 U5 ( .A(n22), .B(n44), .Y(\DFF_4/D ) );
  sg13g2_nand2_2 U6 ( .A(n76), .B(P6), .Y(n46) );
  sg13g2_a21oi_2 U7 ( .A1(n47), .A2(n1), .B1(START), .Y(n51) );
  sg13g2_a21oi_2 U8 ( .A1(n52), .A2(n12), .B1(n49), .Y(n47) );
  sg13g2_nor2_2 U9 ( .A(n50), .B(ACVQN3), .Y(n49) );
  sg13g2_a21oi_2 U10 ( .A1(n53), .A2(n14), .B1(n42), .Y(n40) );
  sg13g2_nor2_2 U11 ( .A(n43), .B(ACVQN2), .Y(n42) );
  sg13g2_a21oi_2 U12 ( .A1(n54), .A2(n16), .B1(n34), .Y(n32) );
  sg13g2_nor2_2 U13 ( .A(n36), .B(ACVQN1), .Y(n34) );
  sg13g2_nand2_2 U14 ( .A(ACVQN1), .B(n36), .Y(n54) );
  sg13g2_nand2_2 U15 ( .A(AX1), .B(P0), .Y(n36) );
  sg13g2_nand2_2 U16 ( .A(ACVQN2), .B(n43), .Y(n53) );
  sg13g2_nand2_2 U17 ( .A(AX2), .B(P0), .Y(n43) );
  sg13g2_nand2_2 U18 ( .A(ACVQN3), .B(n50), .Y(n52) );
  sg13g2_nand2_2 U19 ( .A(AX3), .B(P0), .Y(n50) );
  sg13g2_nor2_2 U20 ( .A(n55), .B(n56), .Y(MRVG4VD) );
  sg13g2_a21oi_2 U21 ( .A1(READY), .A2(MRVQN3), .B1(n57), .Y(n56) );
  sg13g2_nor3_2 U22 ( .A(n76), .B(n16), .C(n58), .Y(n55) );
  sg13g2_a21oi_2 U23 ( .A1(AX0), .A2(P0), .B1(P4), .Y(n58) );
  sg13g2_a21oi_2 U24 ( .A1(n1), .A2(P3), .B1(n59), .Y(MRVG3VD) );
  sg13g2_a21oi_2 U25 ( .A1(READY), .A2(MRVQN2), .B1(n60), .Y(n59) );
  sg13g2_a21oi_2 U26 ( .A1(n1), .A2(P2), .B1(n61), .Y(MRVG2VD) );
  sg13g2_a21oi_2 U27 ( .A1(READY), .A2(MRVQN1), .B1(n62), .Y(n61) );
  sg13g2_a21oi_2 U28 ( .A1(n1), .A2(P1), .B1(n63), .Y(MRVG1VD) );
  sg13g2_a21oi_2 U29 ( .A1(READY), .A2(MRVQN0), .B1(n64), .Y(n63) );
  sg13g2_nand2_2 U30 ( .A(n6), .B(n65), .Y(n30) );
  sg13g2_nor3_2 U31 ( .A(CT1), .B(CT2), .C(CT0), .Y(n24) );
  sg13g2_a21oi_2 U32 ( .A1(n7), .A2(n66), .B1(n67), .Y(CNTVG3VD) );
  sg13g2_nand2_2 U33 ( .A(CNTVCON2), .B(n22), .Y(n67) );
  sg13g2_nor3_2 U34 ( .A(n68), .B(START), .C(n10), .Y(CNTVG2VD) );
  sg13g2_nand2_2 U35 ( .A(CT1), .B(CT0), .Y(n66) );
  sg13g2_a21oi_2 U36 ( .A1(CT0), .A2(n65), .B1(CT1), .Y(n68) );
  sg13g2_a21oi_2 U37 ( .A1(CT0), .A2(n65), .B1(START), .Y(CNTVG1VD) );
  sg13g2_inv_2 U38 ( .A(n75), .Y(n1) );
  sg13g2_inv_2 U39 ( .A(n27), .Y(\DFF_11/D ) );
  sg13g2_inv_2 U40 ( .A(n26), .Y(\DFF_12/D ) );
  sg13g2_inv_2 U41 ( .A(n25), .Y(\DFF_13/D ) );
  sg13g2_inv_2 U42 ( .A(n23), .Y(\DFF_14/D ) );
  sg13g2_inv_2 U43 ( .A(n24), .Y(n6) );
  sg13g2_inv_2 U44 ( .A(CT2), .Y(n7) );
  sg13g2_inv_2 U46 ( .A(CNTVCON2), .Y(CNTVCO2) );
  sg13g2_inv_2 U47 ( .A(n66), .Y(n10) );
  sg13g2_inv_2 U48 ( .A(ACVQN3), .Y(P7) );
  sg13g2_inv_2 U49 ( .A(n40), .Y(n12) );
  sg13g2_inv_2 U50 ( .A(ACVQN2), .Y(P6) );
  sg13g2_inv_2 U51 ( .A(n32), .Y(n14) );
  sg13g2_inv_2 U52 ( .A(ACVQN1), .Y(P5) );
  sg13g2_inv_2 U53 ( .A(n35), .Y(n16) );
  sg13g2_inv_2 U54 ( .A(ACVQN0), .Y(P4) );
  sg13g2_inv_2 U55 ( .A(MRVQN3), .Y(P3) );
  sg13g2_inv_2 U56 ( .A(MRVQN2), .Y(P2) );
  sg13g2_inv_2 U57 ( .A(MRVQN1), .Y(P1) );
  sg13g2_inv_2 U58 ( .A(MRVQN0), .Y(P0) );
  sg13g2_inv_2 U59 ( .A(START), .Y(n22) );
  sg13g2_a22oi_1 U60 ( .A1(AX0), .A2(n6), .B1(A0), .B2(n24), .Y(n23) );
  sg13g2_a22oi_1 U61 ( .A1(AX1), .A2(n6), .B1(A1), .B2(n24), .Y(n25) );
  sg13g2_a22oi_1 U62 ( .A1(AX2), .A2(n6), .B1(A2), .B2(n24), .Y(n26) );
  sg13g2_a22oi_1 U63 ( .A1(AX3), .A2(n6), .B1(A3), .B2(n24), .Y(n27) );
  sg13g2_o21ai_1 U64 ( .A1(n29), .A2(n76), .B1(n31), .Y(n28) );
  sg13g2_a22oi_1 U65 ( .A1(n32), .A2(n33), .B1(n34), .B2(n16), .Y(n29) );
  sg13g2_nand3_1 U66 ( .A(n35), .B(ACVQN1), .C(n36), .Y(n33) );
  sg13g2_o21ai_1 U67 ( .A1(n38), .A2(n76), .B1(n39), .Y(n37) );
  sg13g2_a22oi_1 U68 ( .A1(n40), .A2(n41), .B1(n42), .B2(n14), .Y(n38) );
  sg13g2_nand3_1 U69 ( .A(n43), .B(ACVQN2), .C(n32), .Y(n41) );
  sg13g2_o21ai_1 U70 ( .A1(n45), .A2(n76), .B1(n46), .Y(n44) );
  sg13g2_a22oi_1 U71 ( .A1(n47), .A2(n48), .B1(n49), .B2(n12), .Y(n45) );
  sg13g2_nand3_1 U72 ( .A(n50), .B(ACVQN3), .C(n40), .Y(n48) );
  sg13g2_o21ai_1 U73 ( .A1(P7), .A2(n1), .B1(n51), .Y(\DFF_3/D ) );
  sg13g2_o21ai_1 U74 ( .A1(B3), .A2(READY), .B1(n76), .Y(n57) );
  sg13g2_nand3_1 U75 ( .A(P4), .B(P0), .C(AX0), .Y(n35) );
  sg13g2_o21ai_1 U76 ( .A1(B2), .A2(READY), .B1(n75), .Y(n60) );
  sg13g2_o21ai_1 U77 ( .A1(B1), .A2(READY), .B1(n75), .Y(n62) );
  sg13g2_o21ai_1 U78 ( .A1(B0), .A2(READY), .B1(n75), .Y(n64) );
  sg13g2_nand3b_1 U79 ( .A_N(CT1), .B(CT0), .C(CT2), .Y(n65) );
  sg13g2_nand3_1 U80 ( .A(CT2), .B(CT0), .C(CT1), .Y(CNTVCON2) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(CNTVG3VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(CT2) );
  sg13g2_dfrbp_1 \DFF_14/Q_reg  ( .D(\DFF_14/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(AX0) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(\DFF_13/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(AX1) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(\DFF_12/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(AX2) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(\DFF_11/D ), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(AX3) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(MRVG1VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(MRVQN0) );
  sg13g2_dfrbp_1 \DFF_9/Q_reg  ( .D(MRVG2VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(MRVQN1) );
  sg13g2_dfrbp_1 \DFF_8/Q_reg  ( .D(MRVG3VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(MRVQN2) );
  sg13g2_dfrbp_1 \DFF_7/Q_reg  ( .D(MRVG4VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(MRVQN3) );
  sg13g2_dfrbp_1 \DFF_6/Q_reg  ( .D(\DFF_6/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(ACVQN0) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(\DFF_5/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(ACVQN1) );
  sg13g2_dfrbp_1 \DFF_4/Q_reg  ( .D(\DFF_4/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(ACVQN2) );
  sg13g2_dfrbp_1 \DFF_3/Q_reg  ( .D(\DFF_3/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(ACVQN3) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(CNTVG1VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(CT0) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(CNTVG2VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(CT1) );
  sg13g2_inv_1 U81 ( .A(n30), .Y(n74) );
  sg13g2_inv_1 U82 ( .A(n74), .Y(n75) );
  sg13g2_inv_1 U83 ( .A(n74), .Y(n76) );
  sg13g2_tiehi U84 ( .L_HI(\DFF_1/n1 ) );
  sg13g2_inv_4 U85 ( .A(n65), .Y(READY) );
endmodule

