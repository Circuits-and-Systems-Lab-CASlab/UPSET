/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Fri Mar 28 13:21:56 2025
/////////////////////////////////////////////////////////////


module s382 ( CK, CLR, FM, GRN1, GRN2, RED1, RED2, TEST, YLW1, YLW2 );
  input CK, CLR, FM, TEST;
  output GRN1, GRN2, RED1, RED2, YLW1, YLW2;
  wire   TESTL, TESTLVIINLATCHVCDAD, FML, FMLVIINLATCHVCDAD, OLATCH_Y2L,
         TCOMB_YA2, OLATCHVUC_6, Y1C, OLATCHVUC_5, R2C, OLATCH_R1L, OLATCH_G2L,
         TCOMB_GA2, OLATCH_G1L, TCOMB_GA1, OLATCH_FEL, C3_Q3, C3_Q3VD, C3_Q2,
         C3_Q2VD, C3_Q1, C3_Q1VD, C3_Q0, C3_Q0VD, UC_16, UC_16VD, UC_17,
         UC_17VD, UC_18, UC_18VD, UC_19, UC_19VD, UC_8, UC_8VD, UC_9, UC_9VD,
         UC_10, UC_10VD, UC_11, UC_11VD, n1, n2, n3, n4, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, \DFF_1/n1 , \DFF_8/D , \DFF_5/D ;
  assign YLW2 = OLATCH_Y2L;
  assign RED1 = OLATCH_R1L;
  assign GRN2 = OLATCH_G2L;
  assign GRN1 = OLATCH_G1L;

  sg13g2_nand2_2 U1 ( .A(n10), .B(n7), .Y(n20) );
  sg13g2_a21oi_2 U2 ( .A1(C3_Q0), .A2(n12), .B1(n8), .Y(n19) );
  sg13g2_nor2_2 U3 ( .A(CLR), .B(C3_Q2), .Y(n27) );
  sg13g2_nor2_2 U4 ( .A(C3_Q3), .B(n4), .Y(n25) );
  sg13g2_nor3_2 U5 ( .A(n28), .B(n17), .C(n29), .Y(UC_9VD) );
  sg13g2_a21oi_2 U6 ( .A1(UC_11), .A2(UC_10), .B1(UC_9), .Y(n29) );
  sg13g2_a21oi_2 U7 ( .A1(n16), .A2(n30), .B1(n28), .Y(UC_8VD) );
  sg13g2_nor2_2 U8 ( .A(n31), .B(n32), .Y(UC_19VD) );
  sg13g2_nor3_2 U9 ( .A(n31), .B(n34), .C(n35), .Y(UC_18VD) );
  sg13g2_a21oi_2 U10 ( .A1(UC_19), .A2(n33), .B1(UC_18), .Y(n35) );
  sg13g2_nor2_2 U11 ( .A(n31), .B(n36), .Y(UC_17VD) );
  sg13g2_a21oi_2 U12 ( .A1(n14), .A2(n37), .B1(n31), .Y(UC_16VD) );
  sg13g2_nand2_2 U13 ( .A(n38), .B(n18), .Y(n31) );
  sg13g2_nand2_2 U14 ( .A(n34), .B(UC_17), .Y(n37) );
  sg13g2_nor2_2 U15 ( .A(UC_11), .B(n28), .Y(UC_11VD) );
  sg13g2_nor2_2 U16 ( .A(n39), .B(n28), .Y(UC_10VD) );
  sg13g2_nand2_2 U17 ( .A(n40), .B(n18), .Y(n28) );
  sg13g2_nor2_2 U18 ( .A(CLR), .B(n41), .Y(TESTLVIINLATCHVCDAD) );
  sg13g2_nor4_2 U19 ( .A(n26), .B(n42), .C(n43), .D(n44), .Y(TCOMB_GA2) );
  sg13g2_nor2_2 U20 ( .A(n45), .B(n46), .Y(TCOMB_GA1) );
  sg13g2_nor3_2 U21 ( .A(C3_Q0), .B(CLR), .C(n8), .Y(n43) );
  sg13g2_nor2_2 U22 ( .A(n7), .B(CLR), .Y(n44) );
  sg13g2_nand2_2 U23 ( .A(FML), .B(n11), .Y(n47) );
  sg13g2_nor2_2 U24 ( .A(CLR), .B(n50), .Y(FMLVIINLATCHVCDAD) );
  sg13g2_a21oi_2 U25 ( .A1(n8), .A2(n51), .B1(n52), .Y(C3_Q3VD) );
  sg13g2_nand2_2 U26 ( .A(n55), .B(C3_Q2), .Y(n51) );
  sg13g2_nor2_2 U27 ( .A(n10), .B(CLR), .Y(n26) );
  sg13g2_nor3_2 U28 ( .A(n13), .B(CLR), .C(n12), .Y(n42) );
  sg13g2_nor3_2 U29 ( .A(n52), .B(n55), .C(n56), .Y(C3_Q1VD) );
  sg13g2_a21oi_2 U30 ( .A1(n1), .A2(C3_Q0), .B1(C3_Q1), .Y(n56) );
  sg13g2_nor3_2 U31 ( .A(n12), .B(n13), .C(n38), .Y(n55) );
  sg13g2_nor2_2 U32 ( .A(n57), .B(n52), .Y(C3_Q0VD) );
  sg13g2_nand2_2 U33 ( .A(n54), .B(n18), .Y(n52) );
  sg13g2_nand2_2 U34 ( .A(n58), .B(n1), .Y(n54) );
  sg13g2_a21oi_2 U35 ( .A1(n11), .A2(n10), .B1(n8), .Y(n58) );
  sg13g2_nand2_2 U36 ( .A(n12), .B(n13), .Y(n23) );
  sg13g2_nand2_2 U37 ( .A(UC_8), .B(n60), .Y(n40) );
  sg13g2_inv_2 U38 ( .A(n38), .Y(n1) );
  sg13g2_inv_2 U39 ( .A(\DFF_8/D ), .Y(n2) );
  sg13g2_inv_2 U40 ( .A(n48), .Y(n3) );
  sg13g2_inv_2 U41 ( .A(FML), .Y(n4) );
  sg13g2_inv_2 U42 ( .A(OLATCHVUC_6), .Y(YLW1) );
  sg13g2_inv_2 U43 ( .A(OLATCHVUC_5), .Y(RED2) );
  sg13g2_inv_2 U44 ( .A(OLATCH_FEL), .Y(n7) );
  sg13g2_inv_2 U45 ( .A(C3_Q3), .Y(n8) );
  sg13g2_inv_2 U46 ( .A(n26), .Y(n9) );
  sg13g2_inv_2 U47 ( .A(C3_Q2), .Y(n10) );
  sg13g2_inv_2 U48 ( .A(n23), .Y(n11) );
  sg13g2_inv_2 U49 ( .A(C3_Q1), .Y(n12) );
  sg13g2_inv_2 U50 ( .A(C3_Q0), .Y(n13) );
  sg13g2_inv_2 U51 ( .A(UC_16), .Y(n14) );
  sg13g2_inv_2 U52 ( .A(UC_17), .Y(n15) );
  sg13g2_inv_2 U53 ( .A(UC_8), .Y(n16) );
  sg13g2_inv_2 U54 ( .A(n30), .Y(n17) );
  sg13g2_inv_2 U55 ( .A(CLR), .Y(n18) );
  sg13g2_o21ai_1 U56 ( .A1(n19), .A2(n20), .B1(n18), .Y(\DFF_5/D ) );
  sg13g2_o21ai_1 U57 ( .A1(n2), .A2(n15), .B1(n21), .Y(Y1C) );
  sg13g2_o21ai_1 U58 ( .A1(n22), .A2(n23), .B1(n24), .Y(n21) );
  sg13g2_a22oi_1 U59 ( .A1(n25), .A2(n26), .B1(n27), .B2(C3_Q3), .Y(n22) );
  sg13g2_nand3_1 U60 ( .A(UC_11), .B(UC_10), .C(UC_9), .Y(n30) );
  sg13g2_xnor2_1 U61 ( .A(UC_19), .B(n33), .Y(n32) );
  sg13g2_o21ai_1 U62 ( .A1(n34), .A2(UC_17), .B1(n37), .Y(n36) );
  sg13g2_and3_1 U63 ( .A(UC_19), .B(n33), .C(UC_18), .X(n34) );
  sg13g2_xnor2_1 U64 ( .A(UC_10), .B(UC_11), .Y(n39) );
  sg13g2_xnor2_1 U65 ( .A(TESTL), .B(TEST), .Y(n41) );
  sg13g2_and3_1 U66 ( .A(n42), .B(n7), .C(n10), .X(TCOMB_YA2) );
  sg13g2_o21ai_1 U67 ( .A1(n4), .A2(n8), .B1(n26), .Y(n46) );
  sg13g2_o21ai_1 U68 ( .A1(n3), .A2(n7), .B1(n47), .Y(n45) );
  sg13g2_a22oi_1 U69 ( .A1(\DFF_8/D ), .A2(n15), .B1(n49), .B2(n2), .Y(R2C) );
  sg13g2_a21o_1 U70 ( .A1(n12), .A2(n43), .B1(n26), .X(n49) );
  sg13g2_o21ai_1 U71 ( .A1(n47), .A2(n9), .B1(n24), .Y(\DFF_8/D ) );
  sg13g2_o21ai_1 U72 ( .A1(n48), .A2(n10), .B1(n44), .Y(n24) );
  sg13g2_nand4_1 U73 ( .A(C3_Q0), .B(n12), .C(n8), .D(n4), .Y(n48) );
  sg13g2_xnor2_1 U74 ( .A(FML), .B(FM), .Y(n50) );
  sg13g2_and3_1 U75 ( .A(n53), .B(n54), .C(n51), .X(C3_Q2VD) );
  sg13g2_a21o_1 U76 ( .A1(n1), .A2(n42), .B1(n26), .X(n53) );
  sg13g2_xnor2_1 U77 ( .A(n1), .B(C3_Q0), .Y(n57) );
  sg13g2_nand3_1 U78 ( .A(n59), .B(n33), .C(UC_16), .Y(n38) );
  sg13g2_nand2b_1 U79 ( .A_N(TESTL), .B(n40), .Y(n33) );
  sg13g2_or3_1 U80 ( .A(UC_11), .B(UC_9), .C(UC_10), .X(n60) );
  sg13g2_or3_1 U81 ( .A(UC_18), .B(UC_19), .C(UC_17), .X(n59) );
  sg13g2_dfrbp_1 \DFF_0/Q_reg  ( .D(TESTLVIINLATCHVCDAD), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(TESTL) );
  sg13g2_dfrbp_1 \DFF_20/Q_reg  ( .D(UC_11VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(UC_11) );
  sg13g2_dfrbp_1 \DFF_19/Q_reg  ( .D(UC_10VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(UC_10) );
  sg13g2_dfrbp_1 \DFF_18/Q_reg  ( .D(UC_9VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(UC_9) );
  sg13g2_dfrbp_1 \DFF_17/Q_reg  ( .D(UC_8VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(UC_8) );
  sg13g2_dfrbp_1 \DFF_16/Q_reg  ( .D(UC_19VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(UC_19) );
  sg13g2_dfrbp_1 \DFF_15/Q_reg  ( .D(UC_18VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(UC_18) );
  sg13g2_dfrbp_1 \DFF_14/Q_reg  ( .D(UC_17VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(UC_17) );
  sg13g2_dfrbp_1 \DFF_13/Q_reg  ( .D(UC_16VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(UC_16) );
  sg13g2_dfrbp_1 \DFF_12/Q_reg  ( .D(C3_Q0VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(C3_Q0) );
  sg13g2_dfrbp_1 \DFF_11/Q_reg  ( .D(C3_Q1VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(C3_Q1) );
  sg13g2_dfrbp_1 \DFF_10/Q_reg  ( .D(C3_Q2VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(C3_Q2) );
  sg13g2_dfrbp_1 \DFF_9/Q_reg  ( .D(C3_Q3VD), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(C3_Q3) );
  sg13g2_dfrbp_1 \DFF_8/Q_reg  ( .D(\DFF_8/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(OLATCH_FEL) );
  sg13g2_dfrbp_1 \DFF_7/Q_reg  ( .D(TCOMB_GA1), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(OLATCH_G1L) );
  sg13g2_dfrbp_1 \DFF_6/Q_reg  ( .D(TCOMB_GA2), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(OLATCH_G2L) );
  sg13g2_dfrbp_1 \DFF_5/Q_reg  ( .D(\DFF_5/D ), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(OLATCH_R1L) );
  sg13g2_dfrbp_1 \DFF_4/Q_reg  ( .D(R2C), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        OLATCHVUC_5) );
  sg13g2_dfrbp_1 \DFF_3/Q_reg  ( .D(Y1C), .CLK(CK), .RESET_B(\DFF_1/n1 ), .Q(
        OLATCHVUC_6) );
  sg13g2_dfrbp_1 \DFF_2/Q_reg  ( .D(TCOMB_YA2), .CLK(CK), .RESET_B(\DFF_1/n1 ), 
        .Q(OLATCH_Y2L) );
  sg13g2_dfrbp_1 \DFF_1/Q_reg  ( .D(FMLVIINLATCHVCDAD), .CLK(CK), .RESET_B(
        \DFF_1/n1 ), .Q(FML) );
  sg13g2_tiehi U82 ( .L_HI(\DFF_1/n1 ) );
endmodule

