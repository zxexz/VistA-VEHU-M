RTCU3 ; ;08/25/94
 D DE G BEGIN
DE S DIE="^RTV(190.1,",DIC=DIE,DP=190.1,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^RTV(190.1,DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,4) S:%]"" DE(1)=%
 I $D(^("COMMENT")) S %Z=^("COMMENT") S %=$P(%Z,U,1) S:%]"" DE(7)=%,DE(10)=%
 K %Z Q
 ;
W W !?DL+DL-2,DLB_": "
 Q
O D W W Y W:$X>45 !?9
 I $L(Y)>19,'DV,DV'["I",(DV["F"!(DV["K")) G RW^DIR2
 W:Y]"" "// " I 'DV,DV["I",$D(DE(DQ))#2 S X="" W "  (No Editing)" Q
TR R X:DTIME E  S (DTOUT,X)=U W *7
 Q
A K DQ(DQ) S DQ=DQ+1
B G @DQ
RE G PR:$D(DE(DQ)) D W,TR
N I X="" G A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" X:$D(^DD(DP,DIFLD,12.1)) ^(12.1) S %=$P($P(";"_DU,";"_X_":",2),";"),Y=X I %]"" X:$D(DIC("S")) DIC("S") I  W:'$D(DB(DQ)) "  "_% G V
 F %=1:1 S Y=$P(DU,";",%),DG=$F(Y,":"_X) G X:Y="" S YS=Y,Y=$P(Y,":") I DG X:$D(DIC("S")) DIC("S") I  Q:DG
 W:'$D(DB(DQ)) $E(YS,DG,999) S X=$P(YS,":")
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) I DV'["*" D ^DIC S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I +$P(DV,",",2),X[".",$P(DQ(DQ),U,5)'["$" S X=$S($P(X,"00")="":"",$E(X)[0:$E(X,2,$L(X)),1:X) S:$E($P(X,".",2),$L($P(X,".",2)))[0 X=$E(X,1,$L(X)-1) I $P(X,".",2)=""&(X[".") S X=+X
V D @("X"_DQ) K YS
Z K DIC("S"),DLAYGO I $D(X),X'=U S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
X W:'$D(ZTQUEUED) *7,"??" I $D(DB(DQ)) G Z^DIE17
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
BEGIN S DNM="RTCU3",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S DQ=1,DW="0;4",DV="RDX",DU="",DLB="DATE/TIME RECORD NEEDED",DIFLD=4
 S DE(DW)="C1^RTCU3"
 S X="NOW"
 S Y=X
 G Y
C1 G C1S:$D(DE(1))[0 K DB S X=DE(1),DIC=DIE
 K ^RTV(190.1,"C",$E(X,1,30),DA)
 S X=DE(1),DIC=DIE
 K ^RTV(190.1,"AC",+^RTV(190.1,DA,0),$P(X,"."),DA)
C1S S X="" Q:DG(DQ)=X  K DB S X=DG(DQ),DIC=DIE
 S ^RTV(190.1,"C",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 S ^RTV(190.1,"AC",+^RTV(190.1,DA,0),$P(X,"."),DA)=""
 Q
X1 S %DT(0)=$S($D(RTNOW):RTNOW,1:DT),%DT="ETX" D ^%DT K %DT S X=Y K:Y<1 X I $D(X) S RTX="RTQDT" D TEST^RTQ1
 Q
 ;
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 I $D(RTFL) S Y=""
 Q
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 D X3 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X3 S:X?7N0.1".".N RTQDT=X
 Q
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 S:'$D(RTQDT) Y="@40"
 Q
5 S DQ=6 ;@50
6 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=6 D X6 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X6 S:$S('$D(RTSHOW):1,1:+RTSHOW) Y="@55"
 Q
7 D:$D(DG)>9 F^DIE17,DE S DQ=7,DW="COMMENT;1",DV="F",DU="",DLB="COMMENT",DIFLD=75
 S X=$S($D(RTCOM):RTCOM,1:"")
 S Y=X
 G Y
X7 K:$L(X)>50!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
8 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=8 D X8 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X8 S Y="@60"
 Q
9 S DQ=10 ;@55
10 S DW="COMMENT;1",DV="F",DU="",DLB="COMMENT",DIFLD=75
 S X=$S($D(RTCOM):RTCOM,1:"")
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
X10 K:$L(X)>50!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
11 S DQ=12 ;@60
12 D:$D(DG)>9 F^DIE17 G ^RTCU4
