PRCST12 ; ;11/22/00
 D DE G BEGIN
DE S DIE="^PRCS(410,D0,""IT"",",DIC=DIE,DP=410.02,DL=2,DIEL=1,DU="" K DG,DE,DB Q:$O(^PRCS(410,D0,"IT",DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,1) S:%]"" DE(3)=% S %=$P(%Z,U,2) S:%]"" DE(12)=%,DE(19)=% S %=$P(%Z,U,3) S:%]"" DE(20)=% S %=$P(%Z,U,4) S:%]"" DE(10)=%,DE(16)=% S %=$P(%Z,U,5) S:%]"" DE(6)=% S %=$P(%Z,U,6) S:%]"" DE(21)=%
 I  S %=$P(%Z,U,7) S:%]"" DE(22)=%
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
BEGIN S DNM="PRCST12",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=1 D X1 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X1 I '$D(PRCSTDT) S PRCSTDT=$S($D(^PRCS(410,DA(1),1)):$P(^(1),U,4),1:"")
 Q
2 S DQ=3 ;@1
3 S DW="0;1",DV="MRNJ3,0",DU="",DLB="LINE ITEM NUMBER",DIFLD=.01
 S DE(DW)="C3^PRCST12"
 S Y="1"
 G Y
C3 G C3S:$D(DE(3))[0 K DB
 S X=DE(3),DIC=DIE
 K ^PRCS(410,DA(1),"IT","B",$E(X,1,30),DA)
 S X=DE(3),DIC=DIE
 K ^PRCS(410,DA(1),"IT","AB",$E(X,1,30),DA)
 S X=DE(3),DIC=DIE
 ;
C3S S X="" Q:DG(DQ)=X  K DB
 S X=DG(DQ),DIC=DIE
 S ^PRCS(410,DA(1),"IT","B",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 S ^PRCS(410,DA(1),"IT","AB",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 S Z(1)=$S($D(^PRCS(410,DA(1),3)):$P(^(3),U,3),1:"") S ^PRCS(410,DA(1),"IT",DA,0)=$P(^PRCS(410,DA(1),"IT",DA,0)_"^^^^^^^",U,1,7)_U_Z(1) K Z(1)
 Q
X3 K:+X'=X!(X>999)!(X<1)!(X?.E1"."1N.N) X
 Q
 ;
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 I $D(^PRCS(410,DA(1),3)),$P(^(3),"^",4),$D(^(2)),$P(^(2),"^",1)'="" S PRCSV=$P(^(3),"^",4)
 Q
5 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=5 D X5 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X5 I '$D(PRCSV) S Y=1
 Q
6 D:$D(DG)>9 F^DIE17,DE S DQ=6,DW="0;5",DV="FX",DU="",DLB="ITEM MASTER FILE NO.",DIFLD=5
 S DE(DW)="C6^PRCST12"
 G RE
C6 G C6S:$D(DE(6))[0 K DB
 S X=DE(6),DIC=DIE
 K ^PRCS(410,DA(1),"IT","AG",$E(X,1,30),DA)
C6S S X="" Q:DG(DQ)=X  K DB
 S X=DG(DQ),DIC=DIE
 S ^PRCS(410,DA(1),"IT","AG",$E(X,1,30),DA)=""
 Q
X6 K:X[""""!($A(X)=45) X I $D(X) D ITEM^PRCSES1
 I $D(X),X'?.ANP K X
 Q
 ;
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 K PRCSSUB I X="" S Y=1
 Q
8 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=8 D X8 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X8 S PRCSSUB=$S($D(^PRCD(420.1,+$S($D(^PRCS(410,DA(1),3)):$P(^(3),U,3),1:""),1,+$S($D(^PRC(441,+$S($D(^PRCS(410,DA(1),"IT",DA,0)):$P(^(0),U,5),1:""),0)):$P(^(0),U,10),1:""),0)):$P(^(0),U),1:"")
 Q
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 S X=$P($G(^PRCS(410,DA(1),3)),U,3) I X]"" S X=$$GETBOCNT^PRCSECP(PRC("SITE"),+PRC("CP"),+X) I (+X=1) S $P(^PRCS(410,DA(1),"IT",DA,0),U,4)=$P(X,U,2),Y="@44" W !,"BOC: ",$P(X,U,2)
 Q
10 D:$D(DG)>9 F^DIE17,DE S DQ=10,DW="0;4",DV="RFX",DU="",DLB="BOC",DIFLD=4
 S DE(DW)="C10^PRCST12"
 G RE
C10 G C10S:$D(DE(10))[0 K DB
 S X=DE(10),DIC=DIE
 K ^PRCS(410,"AD",$E(X,1,30),DA(1))
C10S S X="" Q:DG(DQ)=X  K DB
 S X=DG(DQ),DIC=DIE
 S ^PRCS(410,"AD",$E(X,1,30),DA(1))=""
 Q
X10 K:X[""""!($A(X)=45) X I $D(X) D SUB^PRCSES
 I $D(X),X'?.ANP K X
 Q
 ;
11 S DQ=12 ;@44
12 D:$D(DG)>9 F^DIE17,DE S DQ=12,DW="0;2",DV="RNJ9,2",DU="",DLB="QUANTITY",DIFLD=2
 S DE(DW)="C12^PRCST12"
 G RE
C12 G C12S:$D(DE(12))[0 K DB
 S X=DE(12),DIC=DIE
 X "S E=0,E(1)="""" S:'$D(^PRCS(410,DA(1),4)) ^(4)="""" F E(0)=1:1 S E=$O(^PRCS(410,DA(1),""IT"",E)) S:E?1N.N&(E'=DA) E(1)=E(1)+($P(^(E,0),U,2)*$P(^(0),U,7)) I E'?1N.N X ^DD(410.02,2,1,1,1.4) K E Q"
C12S S X="" Q:DG(DQ)=X  K DB
 S X=DG(DQ),DIC=DIE
 X "S E=0,E(1)="""" S:'$D(^PRCS(410,DA(1),4)) ^(4)="""" F E(0)=1:1 S E=$O(^PRCS(410,DA(1),""IT"",E)) S:E?1N.N E(1)=E(1)+($P(^(E,0),U,2)*$P(^(0),U,7)) I E'?1N.N X ^DD(410.02,2,1,1,1.4) K E Q"
 Q
X12 K:+X'=X!(X>999999)!(X<.01)!(X?.E1"."3N.N) X
 Q
 ;
13 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=13 D X13 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X13 S Y="@4"
 Q
14 D:$D(DG)>9 F^DIE17,DE S DQ=14,D=0 K DE(1) ;1
 S Y="DESCRIPTION^W^^0;1^Q",DG="1",DC="^410.03" D DIEN^DIWE K DE(1) G A
 ;
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 S X=$P($G(^PRCS(410,DA(1),3)),U,3) I X]"" S X=$$GETBOCNT^PRCSECP(PRC("SITE"),+PRC("CP"),+X) I (+X=1) S $P(^PRCS(410,DA(1),"IT",DA,0),U,4)=$P(X,U,2),Y="@444" W !,"BOC: ",$P(X,U,2)
 Q
16 S DW="0;4",DV="RFX",DU="",DLB="BOC",DIFLD=4
 S DE(DW)="C16^PRCST12"
 G RE
C16 G C16S:$D(DE(16))[0 K DB
 S X=DE(16),DIC=DIE
 K ^PRCS(410,"AD",$E(X,1,30),DA(1))
C16S S X="" Q:DG(DQ)=X  K DB
 S X=DG(DQ),DIC=DIE
 S ^PRCS(410,"AD",$E(X,1,30),DA(1))=""
 Q
X16 K:X[""""!($A(X)=45) X I $D(X) D SUB^PRCSES
 I $D(X),X'?.ANP K X
 Q
 ;
17 S DQ=18 ;@444
18 S DQ=19 ;@2
19 D:$D(DG)>9 F^DIE17,DE S DQ=19,DW="0;2",DV="RNJ9,2",DU="",DLB="QUANTITY",DIFLD=2
 S DE(DW)="C19^PRCST12"
 G RE
C19 G C19S:$D(DE(19))[0 K DB
 S X=DE(19),DIC=DIE
 X "S E=0,E(1)="""" S:'$D(^PRCS(410,DA(1),4)) ^(4)="""" F E(0)=1:1 S E=$O(^PRCS(410,DA(1),""IT"",E)) S:E?1N.N&(E'=DA) E(1)=E(1)+($P(^(E,0),U,2)*$P(^(0),U,7)) I E'?1N.N X ^DD(410.02,2,1,1,1.4) K E Q"
C19S S X="" Q:DG(DQ)=X  K DB
 D ^PRCST14
 Q
X19 K:+X'=X!(X>999999)!(X<.01)!(X?.E1"."3N.N) X
 Q
 ;
20 D:$D(DG)>9 F^DIE17,DE S DQ=20,DW="0;3",DV="RP420.5'",DU="",DLB="UNIT OF PURCHASE",DIFLD=3
 S DU="PRCD(420.5,"
 G RE
X20 Q
21 S DW="0;6",DV="FX",DU="",DLB="STOCK NUMBER",DIFLD=6
 G RE
X21 K:$L(X)>24!($L(X)<1)!(X'?.ANP) X
 I $D(X),X'?.ANP K X
 Q
 ;
22 S DW="0;7",DV="RNJ10,2X",DU="",DLB="EST. ITEM (UNIT) COST",DIFLD=7
 S DE(DW)="C22^PRCST12"
 G RE
C22 G C22S:$D(DE(22))[0 K DB
 D ^PRCST15
C22S S X="" Q:DG(DQ)=X  K DB
 D ^PRCST16
 Q
X22 S:X["$" X=$P(X,"$",2) Q:X?1"N/C"  K:+X'=X&(X'?.N1"."2N)!(X>9999999)!(X<0) X I $D(X) S:X=0 X="N/C"
 Q
 ;
23 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=23 D X23 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X23 K PRCSV
 Q
24 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=24 G A
25 S DQ=26 ;@4
26 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=26 D X26 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X26 I $D(^PRC(411,PRC("SITE"),0)),$P(^(0),U,18)'="Y" S Y="@5"
 Q
27 D:$D(DG)>9 F^DIE17 G ^PRCST17
