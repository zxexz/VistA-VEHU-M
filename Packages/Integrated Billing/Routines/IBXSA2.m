IBXSA2 ; GENERATED FROM 'IB SCREEN102' INPUT TEMPLATE(#2269), FILE 399;09/25/15
 D DE G BEGIN
DE S DIE="^DGCR(399,",DIC=DIE,DP=399,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^DGCR(399,DA,""))=""
 I $D(^("TX")) S %Z=^("TX") S %=$P(%Z,U,8) S:%]"" DE(51)=% S %=$P(%Z,U,9) S:%]"" DE(57)=%
 I $D(^("U")) S %Z=^("U") S %=$P(%Z,U,9) S:%]"" DE(24)=% S %=$P(%Z,U,13) S:%]"" DE(10)=%
 I $D(^("U1")) S %Z=^("U1") S %=$P(%Z,U,15) S:%]"" DE(22)=%
 I $D(^("U2")) S %Z=^("U2") S %=$P(%Z,U,1) S:%]"" DE(20)=% S %=$P(%Z,U,8) S:%]"" DE(13)=% S %=$P(%Z,U,9) S:%]"" DE(16)=% S %=$P(%Z,U,10) S:%]"" DE(32)=% S %=$P(%Z,U,11) S:%]"" DE(39)=%
 I $D(^("U3")) S %Z=^("U3") S %=$P(%Z,U,3) S:%]"" DE(37)=% S %=$P(%Z,U,11) S:%]"" DE(43)=%
 I $D(^("UF2")) S %Z=^("UF2") S %=$P(%Z,U,3) S:%]"" DE(3)=%
 I $D(^("UF3")) S %Z=^("UF3") S %=$P(%Z,U,4) S:%]"" DE(4)=% S %=$P(%Z,U,5) S:%]"" DE(6)=% S %=$P(%Z,U,6) S:%]"" DE(8)=%
 I $D(^("UF32")) S %Z=^("UF32") S %=$P(%Z,U,1) S:%]"" DE(11)=% S %=$P(%Z,U,2) S:%]"" DE(14)=% S %=$P(%Z,U,3) S:%]"" DE(17)=%
 K %Z Q
 ;
W W !?DL+DL-2,DLB_": "
 Q
O D W W Y W:$X>45 !?9
 I $L(Y)>19,'DV,DV'["I",(DV["F"!(DV["K")) G RW^DIR2
 W:Y]"" "// " I 'DV,DV["I",$D(DE(DQ))#2 S X="" W "  (No Editing)" Q
TR R X:DTIME E  S (DTOUT,X)=U W $C(7)
 Q
A K DQ(DQ) S DQ=DQ+1
B G @DQ
RE G PR:$D(DE(DQ)) D W,TR
N I X="" G NKEY:$D(^DD("KEY","F",DP,DIFLD)),A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" X:$D(^DD(DP,DIFLD,12.1)) ^(12.1) I X?.ANP D SET I 'DDER X:$D(DIC("S")) DIC("S") I  W:'$D(DB(DQ)) "  "_% G V
 K DDER G X
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) G:DV["*" AST^DIED D NOSCR^DIED S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I $P(DQ(DQ),U,5)'["$",X?.1"-".N.1".".N,$P(DQ(DQ),U,5,99)["+X'=X" S X=+X
V D @("X"_DQ) K YS
Z K DIC("S"),DLAYGO I $D(X),X'=U D:$G(DE(DW,"INDEX")) SAVEVALS G:'$$KEYCHK UNIQFERR^DIE17 S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
X W:'$D(ZTQUEUED) $C(7),"??" I $D(DB(DQ)) G Z^DIE17
 S X="?BAD"
QS S DZ=X D D,QQ^DIEQ G B
D S D=DIFLD,DQ(DQ)=DLB_U_DV_U_DU_U_DW_U_$P($T(@("X"_DQ))," ",2,99) Q
Y I '$D(DE(DQ)) D O G RD:"@"'[X,A:DV'["R"&(X="@"),X:X="@" S X=Y G N
PR S DG=DV,Y=DE(DQ),X=DU I $D(DQ(DQ,2)) X DQ(DQ,2) G RP
R I DG["P",@("$D(^"_X_"0))") S X=+$P(^(0),U,2) G RP:'$D(^(Y,0)) S Y=$P(^(0),U),X=$P(^DD(X,.01,0),U,3),DG=$P(^(0),U,2) G R
 I DG["V",+Y,$P(Y,";",2)["(",$D(@(U_$P(Y,";",2)_"0)")) S X=+$P(^(0),U,2) G RP:'$D(^(+Y,0)) S Y=$P(^(0),U) I $D(^DD(+X,.01,0)) S DG=$P(^(0),U,2),X=$P(^(0),U,3) G R
 X:DG["D" ^DD("DD") I DG["S" S %=$P($P(";"_X,";"_Y_":",2),";") S:%]"" Y=%
RP D O I X="" S X=DE(DQ) G A:'DV,A:DC<2,N^DIE17
I I DV'["I",DV'["#" G RD
 D E^DIE0 G RD:$D(X),PR
 Q
SET N DIR S DIR(0)="SV"_$E("o",$D(DB(DQ)))_U_DU,DIR("V")=1
 I $D(DB(DQ)),'$D(DIQUIET) N DIQUIET S DIQUIET=1
 D ^DIR I 'DDER S %=Y(0),X=Y
 Q
SAVEVALS S @DIEZTMP@("V",DP,DIIENS,DIFLD,"O")=$G(DE(DQ)) S:$D(^("F"))[0 ^("F")=$G(DE(DQ))
 I $D(DE(DW,"4/")) S @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")=""
 E  K @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")
 Q
NKEY W:'$D(ZTQUEUED) "??  Required key field" S X="?BAD" G QS
KEYCHK() Q:$G(DE(DW,"KEY"))="" 1 Q @DE(DW,"KEY")
BEGIN S DNM="IBXSA2",DQ=1
 S DR(99,1,9.2)="S I(1,0)=$G(D1),I(0,0)=$G(D0),Y(1)=$S($D(^DGCR(399,D0,""PRV"",D1,0)):^(0),1:"""") S X=$$EXTERNAL^DIDU(399.0222,.02,"""",$P(Y(1),U,2))"
 N DIEZTMP,DIEZAR,DIEZRXR,DIIENS,DIXR K DIEFIRE,DIEBADK S DIEZTMP=$$GETTMP^DIKC1("DIEZ")
 M DIEZAR=^DIE(2269,"AR") S DICRREC="TRIG^DIE17"
 S:$D(DTIME)[0 DTIME=300 S D0=DA,DIIENS=DA_",",DIEZ=2269,U="^"
1 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=1 D X1 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X1 K DIPA S DIPA("I1")=$D(^DGCR(399,DA,"I1")),DIPA("I2")=$D(^("I2")),DIPA("I3")=$D(^("I3"))
 Q
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 S:IBDR20'["101" Y="@102"
 Q
3 S DW="UF2;3",DV="F",DU="",DLB="BILL REMARKS",DIFLD=402
 G RE
X3 K:$L(X)>80!($L(X)<1) X
 I $D(X),X'?.ANP K X
 Q
 ;
4 S DW="UF3;4",DV="F",DU="",DLB="PRIMARY INSURANCE ICN/DCN",DIFLD=453
 G RE
X4 K:$L(X)>50!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
5 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=5 D X5 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X5 S:'DIPA("I2") Y="@10111"
 Q
6 S DW="UF3;5",DV="F",DU="",DLB="SECONDARY INSURANCE ICN/DCN",DIFLD=454
 G RE
X6 K:$L(X)>50!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 S:'DIPA("I3") Y="@10111"
 Q
8 S DW="UF3;6",DV="F",DU="",DLB="TERTIARY INSURANCE ICN/DCN",DIFLD=455
 G RE
X8 K:$L(X)>50!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
9 S DQ=10 ;@10111
10 S DW="U;13",DV="F",DU="",DLB="PRIMARY AUTHORIZATION CODE",DIFLD=163
 G RE
X10 K:$L(X)>18!($L(X)<1) X
 I $D(X),X'?.ANP K X
 Q
 ;
11 S DW="UF32;1",DV="F",DU="",DLB="PRIMARY REFERRAL NUMBER",DIFLD=253
 G RE
X11 K:$L(X)>50!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
12 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=12 D X12 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X12 S:'DIPA("I2") Y="@1011"
 Q
13 S DW="U2;8",DV="FX",DU="",DLB="SECONDARY AUTHORIZATION CODE",DIFLD=230
 G RE
X13 K:$L(X)>18!($L(X)<1) X
 I $D(X),X'?.ANP K X
 Q
 ;
14 S DW="UF32;2",DV="F",DU="",DLB="SECONDARY REFERRAL NUMBER",DIFLD=254
 G RE
X14 K:$L(X)>50!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 S:'DIPA("I3") Y="@1011"
 Q
16 S DW="U2;9",DV="F",DU="",DLB="TERTIARY AUTHORIZATION CODE",DIFLD=231
 G RE
X16 K:$L(X)>18!($L(X)<1) X
 I $D(X),X'?.ANP K X
 Q
 ;
17 S DW="UF32;3",DV="F",DU="",DLB="TERTIARY REFERRAL NUMBER",DIFLD=255
 G RE
X17 K:$L(X)>50!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
18 S DQ=19 ;@1011
19 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=19 D X19 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X19 I '$$INPAT^IBCEF(DA) S Y="@1012"
 Q
20 S DW="U2;1",DV="*P80'",DU="",DLB="ADMITTING DIAGNOSIS",DIFLD=215
 S DU="ICD9("
 G RE
X20 S ICDVDT=$$BDATE^IBACSV(+$G(DA)),DIC("S")="I $$ICD9ACT^IBACSV(+Y,ICDVDT)",DIC("W")="D EN^DDIOL(""   ""_$P($$ICD9^IBACSV(+Y,ICDVDT),U,3),,""?0"")" D ^DIC K DIC S DIC=$G(DIE),X=+Y K:Y<0 X
 Q
 ;
21 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=21 D X21 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X21 S ICDVDT=$$BDATE^IBACSV(DA)
 Q
22 S DW="U1;15",DV="P80.2'",DU="",DLB="Prospective Payment System Code (DRG)",DIFLD=170
 S DU="ICD("
 G RE
X22 Q
23 S DQ=24 ;@1012
24 S DW="U;9",DV="S",DU="",DLB="SOURCE OF ADMISSION",DIFLD=159
 S DU="1:PHYSICIAN REFERRAL;2:CLINIC REFERRAL;3:HMO REFERRAL;4:TRANSFER FROM HOSPITAL;5:TRANSFER FROM SKILLED NURSING FAC.;6:TRANSFER FROM OTHER HEALTH CARE FAC.;7:EMERGENCY ROOM;8:COURT/LAW ENFORCEMENT;9:INFO NOT AVAILABLE;"
 G RE
X24 Q
25 S DQ=26 ;@102
26 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=26 D X26 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X26 S:IBDR20'["102" Y="@103"
 Q
27 S DQ=28 ;@103
28 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=28 D X28 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X28 S:IBDR20'["103" Y="@104"
 Q
29 S D=0 K DE(1) ;222
 S DIFLD=222,DGO="^IBXSA21",DC="18^399.0222ISA^PRV^",DV="399.0222MRM*S",DW="0;1",DOW="FUNCTION",DLB=$P($$EZBLD^DIALOG(8042,DOW),": ") S:D DC=DC_D
 S DU="1:REFERRING;2:OPERATING;3:RENDERING;4:ATTENDING;5:SUPERVISING;9:OTHER OPERATING;"
 G RE:D I $D(DSC(399.0222))#2,$P(DSC(399.0222),"I $D(^UTILITY(",1)="" X DSC(399.0222) S D=$O(^(0)) S:D="" D=-1 G M29
 S D=$S($D(^DGCR(399,DA,"PRV",0)):$P(^(0),U,3,4),$O(^(0))'="":$O(^(0)),1:-1)
M29 I D>0 S DC=DC_D I $D(^DGCR(399,DA,"PRV",+D,0)) S DE(29)=$P(^(0),U,1)
 G RE
R29 D DE
 S D=$S($D(^DGCR(399,DA,"PRV",0)):$P(^(0),U,3,4),1:1) G 29+1
 ;
30 S DQ=31 ;@104
31 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=31 D X31 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X31 S:IBDR20'["104" Y="@105"
 Q
32 S DW="U2;10",DV="*P355.93X",DU="",DLB="NON-VA FACILITY",DIFLD=232
 S DE(DW)="C32^IBXSA2",DE(DW,"INDEX")=1
 S DU="IBA(355.93,"
 G RE
C32 G C32S:$D(DE(32))[0 K DB
 S X=DE(32),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"U2")):^("U2"),1:"") S X=$P(Y(1),U,12),X=X S DIU=X K Y S X="" X ^DD(399,232,1,1,2.4)
 S X=DE(32),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"U2")):^("U2"),1:"") S X=$P(Y(1),U,11),X=X S DIU=X K Y S X="" X ^DD(399,232,1,2,2.4)
 S X=DE(32),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=$$CLIAREQ^IBCEP8A(DA) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"U2")):^("U2"),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y S X=DIV S X=$$CLIA^IBCEP8A(DA) X ^DD(399,232,1,3,2.4)
 S X=DE(32),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"U3")):^("U3"),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y S X="" S DIH=$G(^DGCR(399,DIV(0),"U3")),DIV=X S $P(^("U3"),U,3)=DIV,DIH=399,DIG=244 D ^DICR
C32S S X="" G:DG(DQ)=X C32F1 K DB
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"U2")):^("U2"),1:"") S X=$P(Y(1),U,12),X=X S DIU=X K Y X ^DD(399,232,1,1,1.1) X ^DD(399,232,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=$$CLIAREQ^IBCEP8A(DA) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"U2")):^("U2"),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y S X=DIV S X=$$CLIA^IBCEP8A(DA) X ^DD(399,232,1,3,1.4)
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"U3")):^("U3"),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y S X=DIV S X=$P($$TAXGET^IBCEP81(X),U,2) X ^DD(399,232,1,4,1.4)
C32F1 S DIEZRXR(399,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=855 S DIEZRXR(399,DIXR)=""
 Q
X32 S DIC("S")="I $P(^(0),U,2)=1" D ^DIC K DIC S DIC=$G(DIE),X=+Y K:Y<0 X
 Q
 ;
33 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=33 D X33 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X33 S DIPA("NVA_FC")=X S:DIPA("NVA_FC")="" Y="@1046"
 Q
34 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=34 S I(0,0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"U2")):^("U2"),1:"") S X=$P(Y(1),U,10),X=X S D(0)=+X S X=$S(D(0)>0:D(0),1:"")
 S DGO="^IBXSA22",DC="^355.93^IBA(355.93," G DIEZ^DIE0
R34 D DE G A
 ;
35 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=35 D X35 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X35 S DIK="^DGCR(399,",DIK(1)="232" D EN1^DIK
 Q
36 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=36 D X36 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X36 K DIK
 Q
37 D:$D(DG)>9 F^DIE17,DE S DQ=37,DW="U3;3",DV="*P8932.1'",DU="",DLB="NON-VA FACILITY TAXONOMY",DIFLD=244
 S DU="USC(8932.1,"
 G RE
X37 S DIC("S")="I $P($G(^(90002)),U,2)=""N""" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
38 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=38 D X38 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X38 D DISPTAX^IBCEP81($P($G(^DGCR(399,DA,"U3")),U,3),"Non-VA Facility")
 Q
39 S DW="U2;11",DV="S",DU="",DLB="NON-VA CARE TYPE",DIFLD=233
 S DU="1:FEE BASIS, NON-LAB;2:FEE BASIS, LAB;3:NON-FEE BASIS, NON-LAB;4:NON-FEE BASIS, LAB;"
 G RE
X39 Q
40 S DQ=41 ;@1046
41 S DQ=42 ;@105
42 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=42 D X42 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X42 S:IBDR20'["105" Y="@106"
 Q
43 S DW="U3;11",DV="*P8932.1'",DU="",DLB="BILLING PROVIDER TAXONOMY",DIFLD=252
 S DU="USC(8932.1,"
 G RE
X43 S DIC("S")="I $P($G(^(90002)),U,2)=""N""" D ^DIC K DIC S DIC=$G(DIE),X=+Y K:Y<0 X
 Q
 ;
44 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=44 D X44 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X44 D DISPTAX^IBCEP81($P($G(^DGCR(399,DA,"U3")),U,11),"Billing Provider")
 Q
45 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=45 D X45 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X45 I $P($G(^DGCR(399,DA,"U3")),U,11) N X,Y,DIR S DIR(0)="EA",DIR("A")="Press Return to continue" D ^DIR K DIR
 Q
46 S DQ=47 ;@106
47 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=47 D X47 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X47 S:IBDR20'["106" Y="@107"
 Q
48 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=48 D X48 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X48 I $$TEST^IBCEF84(DA) S Y="@1060"
 Q
49 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=49 D X49 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X49 I '$P($G(^DGCR(399,DA,"TX")),U,8),'$$TXMT^IBCEF4(DA) S Y="@1061"
 Q
50 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=50 D X50 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X50 I $$REQMRA^IBEFUNC(DA) S Y="@10611"
 Q
51 S DW="TX;8",DV="*S",DU="",DLB="FORCE CLAIM TO PRINT",DIFLD=27
 S DU="0:NO FORCED PRINT;1:FORCE LOCAL PRINT;2:*FORCE CLEARINGHOUSE PRINT;"
 S Y="NO FORCED PRINT"
 G Y
X51 Q
52 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=52 D X52 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X52 S Y="@1069"
 Q
53 S DQ=54 ;@1060
54 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=54 D X54 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X54 D MESSAGE^IBCEF84
 Q
55 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=55 D X55 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X55 S Y="@1069"
 Q
56 S DQ=57 ;@10611
57 S DW="TX;9",DV="S",DU="",DLB="FORCE PRINT MRA SECONDARY",DIFLD=28
 S DU="0:NO FORCED PRINT;1:MEDICARE SECONDARY FORCE LOCAL PRINT;"
 S Y="NO FORCED PRINT"
 G Y
X57 Q
58 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=58 D X58 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X58 S Y="@1069"
 Q
59 S DQ=60 ;@1061
60 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=60 D X60 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X60 N X,Y,DIR S DIR(0)="EA",DIR("A",1)="NO FIELDS AVAILABLE TO EDIT",DIR("A")="PRESS RETURN TO CONTINUE: " W ! D ^DIR K DIR
 Q
61 S DQ=62 ;@1069
62 S DQ=63 ;@107
63 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=63 D X63 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X63 S:IBDR20'["107" Y="@109"
 Q
64 S DQ=65 ;@109
65 G 0^DIE17
