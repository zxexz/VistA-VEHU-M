IBXSA21 ; ;09/25/15
 D DE G BEGIN
DE S DIE="^DGCR(399,D0,""PRV"",",DIC=DIE,DP=399.0222,DL=2,DIEL=1,DU="" K DG,DE,DB Q:$O(^DGCR(399,D0,"PRV",DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,1) S:%]"" DE(1)=% S %=$P(%Z,U,2) S:%]"" DE(3)=% S %=$P(%Z,U,3) S:%]"" DE(14)=% S %=$P(%Z,U,5) S:%]"" DE(29)=%,DE(41)=% S %=$P(%Z,U,6) S:%]"" DE(33)=% S %=$P(%Z,U,7) S:%]"" DE(37)=%
 I  S %=$P(%Z,U,12) S:%]"" DE(28)=%,DE(40)=% S %=$P(%Z,U,13) S:%]"" DE(32)=% S %=$P(%Z,U,14) S:%]"" DE(36)=% S %=$P(%Z,U,15) S:%]"" DE(10)=%
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
BEGIN S DNM="IBXSA21",DQ=1+D G B
1 S DW="0;1",DV="MRM*S",DU="",DLB="FUNCTION",DIFLD=.01
 S DE(DW)="C1^IBXSA21"
 S DU="1:REFERRING;2:OPERATING;3:RENDERING;4:ATTENDING;5:SUPERVISING;9:OTHER OPERATING;"
 G RE:'D S DQ=2 G 2
C1 G C1S:$D(DE(1))[0 K DB
 S X=DE(1),DIC=DIE
 K ^DGCR(399,DA(1),"PRV","B",$E(X,1,30),DA)
 S X=DE(1),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,4),X=X S DIU=X K Y S X="" X ^DD(399.0222,.01,1,2,2.4)
 S X=DE(1),DIC=DIE
 K ^DGCR(399,DA(1),"PRV","C",$E($$EXTERNAL^DILFD(399.0222,.01,,X),1,30),DA)
 S X=DE(1),DIC=DIE
 K ^DGCR(399,DA(1),"PRV","C",$$LOW^XLFSTR($E($$EXTERNAL^DILFD(399.0222,.01,,X),1,30)),DA)
C1S S X="" G:DG(DQ)=X C1F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^DGCR(399,DA(1),"PRV","B",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(0)=X S X=Y(0),X=X S X=X'=1 I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,4),X=X S DIU=X K Y S X="" X ^DD(399.0222,.01,1,2,1.4)
 S X=DG(DQ),DIC=DIE
 S ^DGCR(399,DA(1),"PRV","C",$E($$EXTERNAL^DILFD(399.0222,.01,,X),1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 S ^DGCR(399,DA(1),"PRV","C",$$LOW^XLFSTR($E($$EXTERNAL^DILFD(399.0222,.01,,X),1,30)),DA)=""
C1F1 Q
X1 Q
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 S DIPA("RF")=X S:$D(^XUSEC("IB PROVIDER EDIT",DUZ)) DLAYGO=355.93
 Q
3 D:$D(DG)>9 F^DIE17,DE S DQ=3,DW="0;2",DV="V",DU="",DLB="PERFORMED BY",DIFLD=.02
 S DE(DW)="C3^IBXSA21"
 G RE
C3 G C3S:$D(DE(3))[0 K DB
 S X=DE(3),DIC=DIE
 ;
 S X=DE(3),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y S X="" X ^DD(399.0222,.02,1,2,2.4)
 S X=DE(3),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,8),X=X S DIU=X K Y S X="" X ^DD(399.0222,.02,1,3,2.4)
 S X=DE(3),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,5),X=X S DIU=X K Y S X="" X ^DD(399.0222,.02,1,4,2.4)
 S X=DE(3),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,6),X=X S DIU=X K Y S X="" X ^DD(399.0222,.02,1,5,2.4)
 S X=DE(3),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,7),X=X S DIU=X K Y S X="" X ^DD(399.0222,.02,1,6,2.4)
 S X=DE(3),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,15),X=X S DIU=X K Y S X="" X ^DD(399.0222,.02,1,7,2.4)
C3S S X="" G:DG(DQ)=X C3F1 K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(399.0222,.02,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,5),X=X S DIU=X K Y S X="" X ^DD(399.0222,.02,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 X ^DD(399.0222,.02,1,2,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y S X=DIV S X=$$EXTCR^IBCEU5(X) X ^DD(399.0222,.02,1,2,1.4)
 S X=DG(DQ),DIC=DIE
 X ^DD(399.0222,.02,1,3,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,8),X=X S DIU=X K Y S X=DIV S X=$$SPEC^IBCEU(X,$P($G(^DGCR(399,D0,"U")),U)) X ^DD(399.0222,.02,1,3,1.4)
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,15),X=X S DIU=X K Y X ^DD(399.0222,.02,1,7,1.1) X ^DD(399.0222,.02,1,7,1.4)
C3F1 Q
X3 Q
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 K DLAYGO S DIPA("PRF")=X S:DIPA("PRF")="" Y="@10399"
 Q
5 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=5 D X5 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X5 N Z1 S Z1=$P($G(^DGCR(399,DA(1),"PRV",DA,0)),U,2) S DIPA("NVA_PRV")=$S(Z1["IBA(355.93":+Z1,1:0)
 Q
6 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=6 D X6 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X6 S:DIPA("NVA_PRV")=0 Y="@1038"
 Q
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 N DIERR X DR(99,1,9.2) K DIC S DIC="^IBA(355.93,",DIC(0)="MF" D ^DIC S (D,D0,D(0))=+Y S Y(101)=$S($D(^IBA(355.93,D0,0)):^(0),1:"") S X=$P(Y(101),U,1) S D0=I(0,0) S D1=I(1,0) S X=$S(D(0)>0:D(0),1:"")
 S DGO="^IBXSA23",DC="^355.93^IBA(355.93," G DIEZ^DIE0
R7 D DE G A
 ;
8 S DQ=9 ;@1038
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 S DIK="^DGCR(399,"_DA(1)_",""PRV"",",DIK(1)=".02" D EN1^DIK K DIK
 Q
10 D:$D(DG)>9 F^DIE17,DE S DQ=10,DW="0;15",DV="P8932.1'",DU="",DLB="TAXONOMY",DIFLD=.15
 S DU="USC(8932.1,"
 G RE
X10 Q
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 D DISPTAX^IBCEP81($P($G(^DGCR(399,DA(1),"PRV",DA,0)),U,15),"")
 Q
12 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=12 D X12 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X12 N Z S Z=$$EXPAND^IBTRE(399.0222,.08,$P($G(^DGCR(399,DA(1),"PRV",DA,0)),U,8)),DIPA("SPC")=$S(Z'="":Z,1:"UNSPECIFIED") W !,"    Prov Specialty On File: ",DIPA("SPC")
 Q
13 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=13 D X13 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X13 S DIPA("CRD")=$$CRED^IBCEU($P($G(^DGCR(399,DA(1),"PRV",DA,0)),U,2))
 Q
14 S DW="0;3",DV="F",DU="",DLB="CREDENTIALS",DIFLD=.03
 G RE
X14 K:$L(X)>3!($L(X)<1) X
 I $D(X),X'?.ANP K X
 Q
 ;
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 K DIPA("W1") S:$G(DIPA("CRD"))'=$P($G(^DGCR(399,DA(1),"PRV",DA,0)),U,3) DIPA("W1")=1
 Q
16 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=16 D X16 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X16 I $G(DIPA("W1")) D WRT1^IBCSC10H($G(DIPA("CRD")))
 Q
17 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=17 D X17 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X17 K DIPA("W1")
 Q
18 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=18 D X18 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X18 I '$G(DIPA("I1")) S Y="@10305"
 Q
19 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=19 D X19 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X19 D PROVID^IBCEP2B(DA(1),DA,1,.DIPA) S Y=$S(DIPA("EDIT")<0:"@10382",DIPA("EDIT")=1:"@10391",DIPA("EDIT")=2:"@10371",1:"")
 Q
20 S DQ=21 ;@10382
21 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=21 D X21 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X21 I '$G(DIPA("I2")) S Y="@10305"
 Q
22 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=22 D X22 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X22 D PROVID^IBCEP2B(DA(1),DA,2,.DIPA) S Y=$S(DIPA("EDIT")<0:"@10383",DIPA("EDIT")=1:"@10392",DIPA("EDIT")=2:"@10372",1:"")
 Q
23 S DQ=24 ;@10383
24 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=24 D X24 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X24 I '$G(DIPA("I3")) S Y="@10305"
 Q
25 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=25 D X25 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X25 D PROVID^IBCEP2B(DA(1),DA,3,.DIPA) S Y=$S(DIPA("EDIT")<0:"@10305",DIPA("EDIT")=1:"@10393",DIPA("EDIT")=2:"@10373",1:"")
 Q
26 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=26 D X26 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X26 S Y="@10305"
 Q
27 S DQ=28 ;@10391
28 S DW="0;12",DV="*P355.97'R",DU="",DLB="PRIM INS PERF PROV SECONDARY ID TYPE",DIFLD=.12
 S DE(DW)="C28^IBXSA21"
 S DU="IBE(355.97,"
 G RE
C28 G C28S:$D(DE(28))[0 K DB
 S X=DE(28),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.12)
C28S S X="" G:DG(DQ)=X C28F1 K DB
 S X=DG(DQ),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.12)
C28F1 Q
X28 S DIC("S")="I $$RAINS^IBCEPU(Y)!($$RAOWN^IBCEPU(Y))" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
29 D:$D(DG)>9 F^DIE17,DE S DQ=29,DW="0;5",DV="FX",DU="",DLB="PRIM INS PERF PROV SECONDARY ID",DIFLD=.05
 S DE(DW)="C29^IBXSA21"
 G RE
C29 G C29S:$D(DE(29))[0 K DB
 S X=DE(29),DIC=DIE
 ;
 S X=DE(29),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.05)
C29S S X="" G:DG(DQ)=X C29F1 K DB
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(0)=X S X=Y(0)="SLF000" I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,"PRV",D1,0)):^(0),1:"") S X=$P(Y(1),U,2),X=X S DIU=X K Y S X="" X ^DD(399.0222,.05,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.05)
C29F1 Q
X29 I $D(DA) N Z S Z=$G(^DGCR(399,DA(1),"PRV",DA,0)) S:X="/ID" X=$$RECALC^IBCEP2A(.DA,1,$P(Z,U,5)) K:$L(X)>15!'$L(X) X I $D(X),$P(Z,U,2)="",$S($$INPAT^IBCEF(DA(1),1):1,1:X'="SLF000") K X
 I $D(X),X'?.ANP K X
 Q
 ;
30 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=30 D X30 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X30 S Y="@10382"
 Q
31 S DQ=32 ;@10392
32 D:$D(DG)>9 F^DIE17,DE S DQ=32,DW="0;13",DV="*P355.97'R",DU="",DLB="SECOND INS PERF PROV SECONDARY ID TYPE",DIFLD=.13
 S DE(DW)="C32^IBXSA21"
 S DU="IBE(355.97,"
 G RE
C32 G C32S:$D(DE(32))[0 K DB
 S X=DE(32),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.13)
C32S S X="" G:DG(DQ)=X C32F1 K DB
 S X=DG(DQ),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.13)
C32F1 Q
X32 S DIC("S")="I $$RAINS^IBCEPU(Y)!($$RAOWN^IBCEPU(Y))" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
33 D:$D(DG)>9 F^DIE17,DE S DQ=33,DW="0;6",DV="FX",DU="",DLB="SECOND INS PERF PROV SECONDARY ID",DIFLD=.06
 S DE(DW)="C33^IBXSA21"
 G RE
C33 G C33S:$D(DE(33))[0 K DB
 S X=DE(33),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.06)
C33S S X="" G:DG(DQ)=X C33F1 K DB
 S X=DG(DQ),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.06)
C33F1 Q
X33 I $D(DA) N Z S Z=$G(^DGCR(399,DA(1),"PRV",DA,0)) S:X="/ID" X=$$RECALC^IBCEP2A(.DA,2,$P(Z,U,6)) K:$L(X)>15!'$L(X) X I $D(X),$P(Z,U,2)="",$S($$INPAT^IBCEF(DA(1),1):1,1:X'="SLF000") K X
 I $D(X),X'?.ANP K X
 Q
 ;
34 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=34 D X34 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X34 S Y="@10383"
 Q
35 S DQ=36 ;@10393
36 D:$D(DG)>9 F^DIE17,DE S DQ=36,DW="0;14",DV="*P355.97'R",DU="",DLB="TERTIARY INS PERF PROV SECONDARY ID TYPE",DIFLD=.14
 S DE(DW)="C36^IBXSA21"
 S DU="IBE(355.97,"
 G RE
C36 G C36S:$D(DE(36))[0 K DB
 S X=DE(36),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.14)
C36S S X="" G:DG(DQ)=X C36F1 K DB
 S X=DG(DQ),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.14)
C36F1 Q
X36 S DIC("S")="I $$RAINS^IBCEPU(Y)!($$RAOWN^IBCEPU(Y))" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
37 D:$D(DG)>9 F^DIE17,DE S DQ=37,DW="0;7",DV="FX",DU="",DLB="TERTIARY INS PERF PROV SECONDARY ID",DIFLD=.07
 S DE(DW)="C37^IBXSA21"
 G RE
C37 G C37S:$D(DE(37))[0 K DB
 S X=DE(37),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.07)
C37S S X="" G:DG(DQ)=X C37F1 K DB
 S X=DG(DQ),DIC=DIE
 D ATTREND^IBCU1(DA(1),DA,.07)
C37F1 Q
X37 I $D(DA) N Z S Z=$G(^DGCR(399,DA(1),"PRV",DA,0)) S:X="/ID" X=$$RECALC^IBCEP2A(.DA,3,$P(Z,U,7)) K:$L(X)>15!'$L(X) X I $D(X),$P(Z,U,2)="",$S($$INPAT^IBCEF(DA(1),1):1,1:X'="SLF000") K X
 I $D(X),X'?.ANP K X
 Q
 ;
38 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=38 D X38 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X38 S Y="@10305"
 Q
39 S DQ=40 ;@10371
40 D:$D(DG)>9 F^DIE17,DE S DQ=40,DW="0;12",DV="*P355.97'",DU="",DLB="PRIM INS PROVIDER ID TYPE",DIFLD=.12
 S DE(DW)="C40^IBXSA21"
 S DU="IBE(355.97,"
 S X=DIPA("PRIDT")
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C40 G C40S:$D(DE(40))[0 K DB
 D ^IBXSA24
C40S S X="" G:DG(DQ)=X C40F1 K DB
 D ^IBXSA25
C40F1 Q
X40 Q
41 D:$D(DG)>9 F^DIE17,DE S DQ=41,DW="0;5",DV="FX",DU="",DLB="PRIMARY INS CO ID NUMBER",DIFLD=.05
 S DE(DW)="C41^IBXSA21"
 S X=DIPA("PRID")
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C41 G C41S:$D(DE(41))[0 K DB
 D ^IBXSA26
C41S S X="" G:DG(DQ)=X C41F1 K DB
 D ^IBXSA27
C41F1 Q
X41 Q
42 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=42 D X42 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X42 S Y="@10382"
 Q
43 S DQ=44 ;@10372
44 D:$D(DG)>9 F^DIE17 G ^IBXSA28
