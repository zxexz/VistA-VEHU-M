ACKQTE8 ; ;11/24/10
 D DE G BEGIN
DE S DIE="^ACK(509850.6,",DIC=DIE,DP=509850.6,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^ACK(509850.6,DA,""))=""
 I $D(^(4)) S %Z=^(4) S %=$P(%Z,U,1) S:%]"" DE(1)=% S %=$P(%Z,U,2) S:%]"" DE(4)=% S %=$P(%Z,U,3) S:%]"" DE(7)=% S %=$P(%Z,U,4) S:%]"" DE(10)=% S %=$P(%Z,U,5) S:%]"" DE(13)=% S %=$P(%Z,U,7) S:%]"" DE(16)=% S %=$P(%Z,U,8) S:%]"" DE(19)=%
 I  S %=$P(%Z,U,9) S:%]"" DE(22)=% S %=$P(%Z,U,10) S:%]"" DE(25)=% S %=$P(%Z,U,11) S:%]"" DE(28)=% S %=$P(%Z,U,13) S:%]"" DE(31)=% S %=$P(%Z,U,14) S:%]"" DE(34)=% S %=$P(%Z,U,15) S:%]"" DE(37)=%
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
BEGIN S DNM="ACKQTE8",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S DQ=1,DW="4;1",DV="RNJ3,0",DU="",DLB="TONE R500",DIFLD=4.01
 S DE(DW)="C1^ACKQTE8"
 G RE
C1 G C1S:$D(DE(1))[0 K DB
 S X=DE(1),DIC=DIE
 S X1=^ACK(509850.6,DA,0) K ^ACK(509850.6,"AMD",+$P(X1,U,2),9999999-$P(X1,U),DA),X1
C1S S X="" G:DG(DQ)=X C1F1 K DB
 S X=DG(DQ),DIC=DIE
 S X1=^ACK(509850.6,DA,0) S:'$D(ACKNAMD) ^ACK(509850.6,"AMD",+$P(X1,U,2),9999999-$P(X1,U),DA)="" K X1
C1F1 Q
X1 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
2 S DQ=3 ;@130
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 D X3 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X3 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
4 D:$D(DG)>9 F^DIE17,DE S DQ=4,DW="4;2",DV="RNJ3,0",DU="",DLB="TONE R1000",DIFLD=4.02
 G RE
X4 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
5 S DQ=6 ;@140
6 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=6 D X6 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X6 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
7 S DW="4;3",DV="RNJ3,0",DU="",DLB="TONE R2000",DIFLD=4.03
 G RE
X7 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
8 S DQ=9 ;@150
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
10 S DW="4;4",DV="RNJ3,0",DU="",DLB="TONE R3000",DIFLD=4.04
 G RE
X10 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
11 S DQ=12 ;@160
12 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=12 D X12 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X12 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
13 S DW="4;5",DV="RNJ3,0",DU="",DLB="TONE R4000",DIFLD=4.05
 G RE
X13 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
14 S DQ=15 ;@170
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
16 S DW="4;7",DV="RNJ3,0",DU="",DLB="TONE L500",DIFLD=4.07
 G RE
X16 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
17 S DQ=18 ;@180
18 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=18 D X18 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X18 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
19 S DW="4;8",DV="RNJ3,0",DU="",DLB="TONE L1000",DIFLD=4.08
 G RE
X19 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
20 S DQ=21 ;@190
21 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=21 D X21 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X21 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
22 S DW="4;9",DV="RNJ3,0",DU="",DLB="TONE L2000",DIFLD=4.09
 G RE
X22 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
23 S DQ=24 ;@200
24 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=24 D X24 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X24 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
25 S DW="4;10",DV="RNJ3,0",DU="",DLB="TONE L3000",DIFLD=4.1
 G RE
X25 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
26 S DQ=27 ;@210
27 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=27 D X27 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X27 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
28 S DW="4;11",DV="RNJ3,0",DU="",DLB="TONE L4000",DIFLD=4.11
 G RE
X28 K:+X'=X!(X>105)!(X<-10)!(X?.E1"."1N.N) X
 Q
 ;
29 S DQ=30 ;@230
30 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=30 D X30 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X30 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
31 S DW="4;13",DV="NJ3,0",DU="",DLB="CNC R",DIFLD=4.13
 G RE
X31 K:+X'=X!(X>100)!(X<0)!(X?.E1"."1N.N) X
 Q
 ;
32 S DQ=33 ;@240
33 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=33 D X33 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X33 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
34 S DW="4;14",DV="NJ3,0",DU="",DLB="CNC L",DIFLD=4.14
 G RE
X34 K:+X'=X!(X>100)!(X<0)!(X?.E1"."1N.N) X
 Q
 ;
35 S DQ=36 ;@250
36 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=36 D X36 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X36 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
37 S DW="4;15",DV="NJ3,0",DU="",DLB="W22 R",DIFLD=4.15
 G RE
X37 K:+X'=X!(X>100)!(X<0)!(X?.E1"."1N.N) X
 Q
 ;
38 S DQ=39 ;@260
39 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=39 D X39 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X39 S ACKAUDIO=$$AUDIO^ACKQUTL4 I 'ACKAUDIO!($L(ACKLAMD)>7) S Y="@270"
 Q
40 D:$D(DG)>9 F^DIE17 G ^ACKQTE9
