DGPMX23 ; ;12/05/12
 D DE G BEGIN
DE S DIE="^DGPM(",DIC=DIE,DP=405,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^DGPM(DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,5) S:%]"" DE(13)=% S %=$P(%Z,U,6) S:%]"" DE(14)=%,DE(22)=% S %=$P(%Z,U,7) S:%]"" DE(1)=%,DE(5)=%,DE(23)=% S %=$P(%Z,U,13) S:%]"" DE(9)=%,DE(17)=%
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
BEGIN S DNM="DGPMX23",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S DQ=1,DW="0;7",DV="*P405.4'X",DU="",DLB="ROOM-BED",DIFLD=.07
 S DE(DW)="C1^DGPMX23"
 S DU="DG(405.4,"
 G RE
C1 G C1S:$D(DE(1))[0 K DB
 S X=DE(1),DIC=DIE
 S DGPMDDF=7,DGPMDDT=0 D ^DGPMDDCN
C1S S X="" G:DG(DQ)=X C1F1 K DB
 S X=DG(DQ),DIC=DIE
 S DGPMDDF=7,DGPMDDT=1 D ^DGPMDDCN
C1F1 Q
X1 K:'$D(DGPMT) X I $D(X) S DIC("S")="I $D(^DG(405.4,""W"",+$P(^DGPM(DA,0),""^"",6),+Y)) D OCC^DGPMRB I 'DGPMOC" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X I $D(X) D ROOM^DGPMVDD K:$D(DGOOS) X K DGOOS
 Q
 ;
2 S DQ=3 ;@24
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 D X3 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X3 I DGZ<4 S Y="@26"
 Q
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 I $S(DGZ=22:0,DGZ'=24:1,1:0) S Y="@25"
 Q
5 D:$D(DG)>9 F^DIE17,DE S DQ=5,DW="0;7",DV="*P405.4'X",DU="",DLB="ROOM-BED",DIFLD=.07
 S DE(DW)="C5^DGPMX23"
 S DU="DG(405.4,"
 G RE
C5 G C5S:$D(DE(5))[0 K DB
 S X=DE(5),DIC=DIE
 S DGPMDDF=7,DGPMDDT=0 D ^DGPMDDCN
C5S S X="" G:DG(DQ)=X C5F1 K DB
 S X=DG(DQ),DIC=DIE
 S DGPMDDF=7,DGPMDDT=1 D ^DGPMDDCN
C5F1 Q
X5 K:'$D(DGPMT) X I $D(X) S DIC("S")="I $D(^DG(405.4,""W"",+$P(^DGPM(DA,0),""^"",6),+Y)) D OCC^DGPMRB I 'DGPMOC" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X I $D(X) D ROOM^DGPMVDD K:$D(DGOOS) X K DGOOS
 Q
 ;
6 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=6 D X6 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X6 S Y="@25"
 Q
7 S DQ=8 ;@26
8 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=8 D X8 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X8 D UARET^DGPMVDD
 Q
9 D:$D(DG)>9 F^DIE17,DE S DQ=9,DW="0;13",DV="DX",DU="",DLB="ABSENCE RETURN DATE",DIFLD=.13
 S X=DGPMRET
 S Y=X
 G Y
X9 K:'$D(DGPMT) X I $D(X) S %DT="EX" D ^%DT S X=Y K:Y<1!(Y<$P($P(^DGPM(DA,0),"^",1),".",1)) X I $D(X) D ABSRET^DGPMVDD
 Q
 ;
10 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=10 D X10 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X10 K DGPMRET
 Q
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 S Y="@25"
 Q
12 S DQ=13 ;@21
13 S DW="0;5",DV="RP4'X",DU="",DLB="ASIH FACILITY",DIFLD=.05
 S DE(DW)="C13^DGPMX23"
 S DU="DIC(4,"
 G RE
C13 G C13S:$D(DE(13))[0 K DB
 S X=DE(13),DIC=DIE
 I $P(^DGPM(DA,0),"^",2)=3 S A1B2TAG="ADM" D ^A1B2XFR
C13S S X="" G:DG(DQ)=X C13F1 K DB
 S X=DG(DQ),DIC=DIE
 I $P(^DGPM(DA,0),"^",2)=3 S A1B2TAG="ADM" D ^A1B2XFR
C13F1 Q
X13 I '$D(DGPMT) W !?3,*7,"USE BED CONTROL MOVEMENT OPTIONS!" K X
 Q
 ;
14 D:$D(DG)>9 F^DIE17,DE S DQ=14,DW="0;6",DV="R*P42'X",DU="",DLB="WARD LOCATION",DIFLD=.06
 S DE(DW)="C14^DGPMX23"
 S DU="DIC(42,"
 S X=$P(DGPM0,"^",6)
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C14 G C14S:$D(DE(14))[0 K DB
 S X=DE(14),DIC=DIE
 S DGPMDDF=6,DGPMDDT=0 D ^DGPMDDCN
 S X=DE(14),DIC=DIE
 ;
 S X=DE(14),DIC=DIE
 S Y=^DGPM(DA,0) I +Y,Y<DT,X'=$P(Y,U,6) S Y=$P(Y,U,2) I Y<3 S DGOWD=$S($D(^DIC(42,+X,0)):$P(^(0),U),1:"") K DGIDX
C14S S X="" G:DG(DQ)=X C14F1 K DB
 S X=DG(DQ),DIC=DIE
 S DGPMDDF=6,DGPMDDT=1 D ^DGPMDDCN
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGPM(D0,0)):^(0),1:"") S X=$P(Y(1),U,7),X=X S DIU=X K Y S X="" S DIH=$G(^DGPM(DIV(0),0)),DIV=X S $P(^(0),U,7)=DIV,DIH=405,DIG=.07 D ^DICR
 S X=DG(DQ),DIC=DIE
 S Y=^DGPM(DA,0) I +Y,Y<DT S Y=$P(Y,U,2) I Y<3,$D(DGOWD) S DGHNYT=$S(Y=1:10,1:12) D ^DGPMGLC K DGIDX
C14F1 Q
X14 Q
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 S Y="@25"
 Q
16 S DQ=17 ;@2
17 D:$D(DG)>9 F^DIE17,DE S DQ=17,DW="0;13",DV="DX",DU="",DLB="ABSENCE RETURN DATE",DIFLD=.13
 S Y="@"
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
X17 K:'$D(DGPMT) X I $D(X) S %DT="X" D ^%DT S X=Y K:Y<1!(Y<$P($P(^DGPM(DA,0),"^",1),".",1)) X I $D(X) D ABSRET^DGPMVDD
 Q
 ;
18 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=18 G A
19 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=19 G A
20 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=20 G A
21 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=21 G A
22 S DW="0;6",DV="R*P42'X",DU="",DLB="WARD LOCATION",DIFLD=.06
 S DE(DW)="C22^DGPMX23"
 S DU="DIC(42,"
 G RE
C22 G C22S:$D(DE(22))[0 K DB
 S X=DE(22),DIC=DIE
 S DGPMDDF=6,DGPMDDT=0 D ^DGPMDDCN
 S X=DE(22),DIC=DIE
 ;
 S X=DE(22),DIC=DIE
 S Y=^DGPM(DA,0) I +Y,Y<DT,X'=$P(Y,U,6) S Y=$P(Y,U,2) I Y<3 S DGOWD=$S($D(^DIC(42,+X,0)):$P(^(0),U),1:"") K DGIDX
C22S S X="" G:DG(DQ)=X C22F1 K DB
 D ^DGPMX24
C22F1 Q
X22 S DIC("S")="I $S($D(^(""ORDER"")):^(""ORDER""),1:0)" D W^DGPMVDD I $D(X) D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X I $D(X) D WARD^DGPMVDD K:$D(DGOOS) X K DGOOS
 Q
 ;
23 D:$D(DG)>9 F^DIE17,DE S DQ=23,DW="0;7",DV="*P405.4'X",DU="",DLB="ROOM-BED",DIFLD=.07
 S DE(DW)="C23^DGPMX23"
 S DU="DG(405.4,"
 G RE
C23 G C23S:$D(DE(23))[0 K DB
 S X=DE(23),DIC=DIE
 S DGPMDDF=7,DGPMDDT=0 D ^DGPMDDCN
C23S S X="" G:DG(DQ)=X C23F1 K DB
 D ^DGPMX25
C23F1 Q
X23 K:'$D(DGPMT) X I $D(X) S DIC("S")="I $D(^DG(405.4,""W"",+$P(^DGPM(DA,0),""^"",6),+Y)) D OCC^DGPMRB I 'DGPMOC" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X I $D(X) D ROOM^DGPMVDD K:$D(DGOOS) X K DGOOS
 Q
 ;
24 S DQ=25 ;@25
25 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=25 D X25 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X25 I DGPMP=^DGPM(DA,0) S Y=""
 Q
26 D:$D(DG)>9 F^DIE17 G ^DGPMX26
