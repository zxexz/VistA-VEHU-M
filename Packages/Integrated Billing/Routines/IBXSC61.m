IBXSC61 ; ;09/01/09
 D DE G BEGIN
DE S DIE="^DGCR(399,",DIC=DIE,DP=399,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^DGCR(399,DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,19) S:%]"" DE(1)=%,DE(5)=%
 I $D(^("U")) S %Z=^("U") S %=$P(%Z,U,1) S:%]"" DE(19)=% S %=$P(%Z,U,2) S:%]"" DE(20)=% S %=$P(%Z,U,3) S:%]"" DE(16)=% S %=$P(%Z,U,5) S:%]"" DE(11)=% S %=$P(%Z,U,6) S:%]"" DE(14)=% S %=$P(%Z,U,7) S:%]"" DE(13)=% S %=$P(%Z,U,11) S:%]"" DE(23)=%
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
BEGIN S DNM="IBXSC61",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S DQ=1,DW="0;19",DV="R*P353'",DU="",DLB="FORM TYPE",DIFLD=.19
 S DE(DW)="C1^IBXSC61",DE(DW,"INDEX")=1
 S DU="IBE(353,"
 G RE
C1 G C1S:$D(DE(1))[0 K DB
 S X=DE(1),DIC=DIE
 ;
 S X=DE(1),DIC=DIE
 S DGRVRCAL=2
 S X=DE(1),DIC=DIE
 D ALLID^IBCEP3(DA,.19,2)
 S X=DE(1),DIC=DIE
 D ATTREND^IBCU1(DA,"","")
C1S S X="" G:DG(DQ)=X C1F1 K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(399,.19,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,0)):^(0),1:"") S X=$P(Y(1),U,9),X=X S DIU=X K Y S X=DIV S X=5 S DIH=$G(^DGCR(399,DIV(0),0)),DIV=X S $P(^(0),U,9)=DIV,DIH=399,DIG=.09 D ^DICR
 S X=DG(DQ),DIC=DIE
 S DGRVRCAL=1
 S X=DG(DQ),DIC=DIE
 D ALLID^IBCEP3(DA,.19,1)
 S X=DG(DQ),DIC=DIE
 D ATTREND^IBCU1(DA,"","")
C1F1 S DIEZRXR(399,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=855 S DIEZRXR(399,DIXR)=""
 Q
X1 S DIC("S")="N Z S Z=$G(^IBE(353,Y,2)) I $P(Z,U,2)=""P"",$P(Z,U,4)" D ^DIC K DIC S DIC=$G(DIE),X=+Y K:Y<0 X
 Q
 ;
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 S DIPA("FT")=$P($G(^DGCR(399,DA,0)),U,19)
 Q
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 D X3 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X3 I $P($G(^IBE(353,+DIPA("FT"),2)),U,2)="P",$P($G(^(2)),U,4) S DIPA("FT1")=DIPA("FT") D CKFT^IBCIUT1(IBIFN) S Y="@615"
 Q
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 W !,*7,"Must be a printable national form type"
 Q
5 D:$D(DG)>9 F^DIE17,DE S DQ=5,DW="0;19",DV="R*P353'",DU="",DLB="FORM TYPE",DIFLD=.19
 S DE(DW)="C5^IBXSC61",DE(DW,"INDEX")=1
 S DU="IBE(353,"
 S X=$G(DIPA("FT1"))
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C5 G C5S:$D(DE(5))[0 K DB
 S X=DE(5),DIC=DIE
 ;
 S X=DE(5),DIC=DIE
 S DGRVRCAL=2
 S X=DE(5),DIC=DIE
 D ALLID^IBCEP3(DA,.19,2)
 S X=DE(5),DIC=DIE
 D ATTREND^IBCU1(DA,"","")
C5S S X="" G:DG(DQ)=X C5F1 K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(399,.19,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DGCR(399,D0,0)):^(0),1:"") S X=$P(Y(1),U,9),X=X S DIU=X K Y S X=DIV S X=5 S DIH=$G(^DGCR(399,DIV(0),0)),DIV=X S $P(^(0),U,9)=DIV,DIH=399,DIG=.09 D ^DICR
 S X=DG(DQ),DIC=DIE
 S DGRVRCAL=1
 S X=DG(DQ),DIC=DIE
 D ALLID^IBCEP3(DA,.19,1)
 S X=DG(DQ),DIC=DIE
 D ATTREND^IBCU1(DA,"","")
C5F1 S DIEZRXR(399,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=855 S DIEZRXR(399,DIXR)=""
 Q
X5 S DIC("S")="N Z S Z=$G(^IBE(353,Y,2)) I $P(Z,U,2)=""P"",$P(Z,U,4)" D ^DIC K DIC S DIC=$G(DIE),X=+Y K:Y<0 X
 Q
 ;
6 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=6 D X6 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X6 S Y="@614"
 Q
7 S DQ=8 ;@615
8 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=8 D X8 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X8 D FTPRV^IBCEU5(DA)
 Q
9 S DQ=10 ;@62
10 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=10 D X10 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X10 S:IBDR20'["62" Y="@63"
 Q
11 D:$D(DG)>9 F^DIE17,DE S DQ=11,DW="U;5",DV="RFOX",DU="",DLB="IS THIS A SENSITIVE RECORD?",DIFLD=155
 S DQ(11,2)="S Y(0)=Y S Y=$S(Y:""YES"",Y=0:""NO"",1:"""")"
 G RE
X11 I $D(X) D YN^IBCU
 I $D(X),X'?.ANP K X
 Q
 ;
12 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=12 D X12 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X12 S:X=0 Y=156
 Q
13 S DW="U;7",DV="FOX",DU="",DLB="R.O.I. FORM(S) COMPLETED?",DIFLD=157
 S DQ(13,2)="S Y(0)=Y S Y=$S(Y:""YES"",Y=0:""NO"",1:"""")"
 G RE
X13 I $D(X) D YN^IBCU S:$G(X)=1 X=$$ROI399^IBNCPDR4($G(DA))
 I $D(X),X'?.ANP K X
 Q
 ;
14 S DW="U;6",DV="RFOX",DU="",DLB="ASSIGNMENT OF BENEFITS",DIFLD=156
 S DQ(14,2)="S Y(0)=Y S Y=$S(Y="""":"""",""Yy1""[Y:""YES"",""Nn0""[Y:""NO"",1:"""")"
 G RE
X14 I $D(X) D YN^IBCU I $D(X) X:X=0 ^DD(399,156,9.3) K IBRATY
 I $D(X),X'?.ANP K X
 Q
 ;
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 S:'$D(IBOX) Y="@63"
 Q
16 S DW="U;3",DV="RFOX",DU="",DLB="POWER OF ATTORNEY COMPLETED?",DIFLD=153
 S DQ(16,2)="S Y(0)=Y S Y=$S(Y:""YES"",Y=0:""NO"",1:"""")"
 G RE
X16 I $D(X) D YN^IBCU
 I $D(X),X'?.ANP K X
 Q
 ;
17 S DQ=18 ;@63
18 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=18 D X18 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X18 S:IBDR20'["63" Y="@64"
 Q
19 S DW="U;1",DV="RDX",DU="",DLB="STATEMENT COVERS FROM",DIFLD=151
 S DE(DW)="C19^IBXSC61"
 G RE
C19 G C19S:$D(DE(19))[0 K DB
 S X=DE(19),DIC=DIE
 ;
 S X=DE(19),DIC=DIE
 S DGRVRCAL=2
 S X=DE(19),DIC=DIE
 ;
 S X=DE(19),DIC=DIE
 K:$P(^DGCR(399,DA,0),"^",2) ^DGCR(399,"APDS",$P(^(0),U,2),-X,DA)
C19S S X="" G:DG(DQ)=X C19F1 K DB
 D ^IBXSC62
C19F1 Q
X19 S %DT="ETP" D ^%DT S X=Y K:Y<1 X I $D(X) D DDAT^IBCU4 K IB00
 Q
 ;
20 D:$D(DG)>9 F^DIE17,DE S DQ=20,DW="U;2",DV="RDX",DU="",DLB="STATEMENT COVERS TO",DIFLD=152
 S DE(DW)="C20^IBXSC61"
 G RE
C20 G C20S:$D(DE(20))[0 K DB
 D ^IBXSC63
C20S S X="" G:DG(DQ)=X C20F1 K DB
 D ^IBXSC64
C20F1 Q
X20 S %DT="ETP" D ^%DT S X=Y K:Y<1 X I $D(X) D DDAT1^IBCU4 K IB00
 Q
 ;
21 S DQ=22 ;@64
22 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=22 D X22 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X22 S:IBDR20'["64" Y="@65"
 Q
23 D:$D(DG)>9 F^DIE17,DE S DQ=23,DW="U;11",DV="*P399.1'",DU="",DLB="DISCHARGE BEDSECTION",DIFLD=161
 S DE(DW)="C23^IBXSC61"
 S DU="DGCR(399.1,"
 G RE
C23 G C23S:$D(DE(23))[0 K DB
 D ^IBXSC65
C23S S X="" G:DG(DQ)=X C23F1 K DB
 D ^IBXSC66
C23F1 Q
X23 S DIC("S")="I $P(^DGCR(399.1,+Y,0),""^"",5)=1" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
24 D:$D(DG)>9 F^DIE17 G ^IBXSC67
