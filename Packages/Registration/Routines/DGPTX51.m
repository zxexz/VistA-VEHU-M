DGPTX51 ; ;09/25/15
 D DE G BEGIN
DE S DIE="^DGPT(D0,""M"",",DIC=DIE,DP=45.02,DL=2,DIEL=1,DU="" K DG,DE,DB Q:$O(^DGPT(D0,"M",DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,3) S:%]"" DE(5)=% S %=$P(%Z,U,4) S:%]"" DE(8)=% S %=$P(%Z,U,5) S:%]"" DE(22)=% S %=$P(%Z,U,6) S:%]"" DE(32)=% S %=$P(%Z,U,7) S:%]"" DE(42)=% S %=$P(%Z,U,8) S:%]"" DE(52)=% S %=$P(%Z,U,18) S:%]"" DE(10)=%,DE(13)=%
 I $D(^(82)) S %Z=^(82) S %=$P(%Z,U,1) S:%]"" DE(25)=% S %=$P(%Z,U,2) S:%]"" DE(35)=% S %=$P(%Z,U,3) S:%]"" DE(45)=% S %=$P(%Z,U,4) S:%]"" DE(55)=%
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
BEGIN S DNM="DGPTX51",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=1 D X1 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X1 S:'$D(DGADD) DGADD=0
 Q
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 S:DGJUMP'[1 Y="@2"
 Q
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 D X3 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X3 S:DGADD Y="@20"
 Q
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 S DGNFLD="@10"
 Q
5 S DW="0;3",DV="NJ6,0",DU="",DLB="LEAVE DAYS",DIFLD=3
 G RE
X5 K:+X'=X!(X>999999)!(X<0)!(X?.E1"."1N.N) X
 Q
 ;
6 S DQ=7 ;@10
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 S DGNFLD="@15"
 Q
8 S DW="0;4",DV="NJ7,0",DU="",DLB="PASS DAYS",DIFLD=4
 G RE
X8 K:+X'=X!(X>9999999)!(X<0)!(X?.E1"."1N.N) X
 Q
 ;
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 I $D(^DPT(+^DGPT(DGPTF,0),.3)),$P(^(.3),U)="Y" S Y="@15"
 Q
10 S DW="0;18",DV="S",DU="",DLB="TREATED FOR SC CONDITION",DIFLD=18
 S DU="1:YES;2:NO;"
 S X=2
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X10 Q
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 S (DGNFLD,Y)="@20"
 Q
12 S DQ=13 ;@15
13 S DW="0;18",DV="S",DU="",DLB="WAS TREATMENT FOR A SERVICE CONNECTED CONDITION?",DIFLD=18
 S DU="1:YES;2:NO;"
 S Y="NO"
 G Y
X13 Q
14 S DQ=15 ;@20
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 S:DGJUMP'[2 Y=""
 Q
16 S DQ=17 ;@2
17 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=17 D X17 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X17 S DGNFLD="@25"
 Q
18 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=18 D X18 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X18 S Y="@9000"
 Q
19 S DQ=20 ;@25
20 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=20 D X20 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X20 I DGADD,$P(DGHOLD,U,5)]"" S Y="@40"
 Q
21 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=21 D X21 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X21 S DGNFLD="@40"
 Q
22 S DW="0;5",DV="*P80'X",DU="",DLB="ICD 1",DIFLD=5
 S DE(DW)="C22^DGPTX51",DE(DW,"INDEX")=1
 S DU="ICD9("
 G RE
C22 G C22S:$D(DE(22))[0 K DB
 S X=DE(22),DIC=DIE
 K ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)
 S X=DE(22),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGPT(D0,"M",D1,82)):^(82),1:"") S X=$P(Y(1),U,1),X=X S DIU=X K Y S X="" S DIH=$G(^DGPT(DIV(0),"M",DIV(1),82)),DIV=X S $P(^(82),U,1)=DIV,DIH=45.02,DIG=82.01 D ^DICR
 S X=DE(22),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C22S S X="" G:DG(DQ)=X C22F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGPT(D0,"M",D1,82)):^(82),1:"") S X=$P(Y(1),U,1),X=X S DIU=X K Y S X="" S DIH=$G(^DGPT(DIV(0),"M",DIV(1),82)),DIV=X S $P(^(82),U,1)=DIV,DIH=45.02,DIG=82.01 D ^DICR
 S X=DG(DQ),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C22F1 S DIEZRXR(45.02,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=1162 S DIEZRXR(45.02,DIXR)=""
 Q
X22 N K D GETAPI^DGICDGT("DG PTF","DIAG",$G(DA(1)),"EN")
 Q
 ;
23 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=23 D X23 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X23 S DGXX=X
 Q
24 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=24 D X24 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X24 I DGCODSYS="ICD9"!(DGTYPE=2)!(DGXX="") S Y="@26"
 Q
25 D:$D(DG)>9 F^DIE17,DE S DQ=25,DW="82;1",DV="SX",DU="",DLB="POA FOR ICD 1",DIFLD=82.01
 S DU="Y:Present on Admission;N:Not Present on Admission;U:Insufficient Docum to Present on Admission;W:Can't Determine if Present on Admission;"
 G RE
X25 I X]"",$G(DA),$G(DA(1)) K:'$$POA501^DGPTFUT1(X,DA(1),DA,0,5) X
 Q
 ;
26 S DQ=27 ;@26
27 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=27 D X27 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X27 S X=DGXX
 Q
28 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=28 D X28 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X28 I X K DGPTIT S DGNFLD="@40",Y="@8000",DGPTIT(X_$C(59)_"ICD9(")=""
 Q
29 S DQ=30 ;@40
30 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=30 D X30 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X30 I DGADD,$P(DGHOLD,U,6)]"" S Y="@50"
 Q
31 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=31 D X31 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X31 S DGNFLD="@50"
 Q
32 S DW="0;6",DV="*P80'X",DU="",DLB="ICD 2",DIFLD=6
 S DE(DW)="C32^DGPTX51",DE(DW,"INDEX")=1
 S DU="ICD9("
 G RE
C32 G C32S:$D(DE(32))[0 K DB
 S X=DE(32),DIC=DIE
 K ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)
 S X=DE(32),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGPT(D0,"M",D1,82)):^(82),1:"") S X=$P(Y(1),U,2),X=X S DIU=X K Y S X="" S DIH=$G(^DGPT(DIV(0),"M",DIV(1),82)),DIV=X S $P(^(82),U,2)=DIV,DIH=45.02,DIG=82.02 D ^DICR
 S X=DE(32),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C32S S X="" G:DG(DQ)=X C32F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGPT(D0,"M",D1,82)):^(82),1:"") S X=$P(Y(1),U,2),X=X S DIU=X K Y S X="" S DIH=$G(^DGPT(DIV(0),"M",DIV(1),82)),DIV=X S $P(^(82),U,2)=DIV,DIH=45.02,DIG=82.02 D ^DICR
 S X=DG(DQ),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C32F1 S DIEZRXR(45.02,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=1163 S DIEZRXR(45.02,DIXR)=""
 Q
X32 N K D GETAPI^DGICDGT("DG PTF","DIAG",$G(DA(1)),"EN")
 Q
 ;
33 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=33 D X33 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X33 S DGXX=X
 Q
34 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=34 D X34 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X34 I DGCODSYS="ICD9"!(DGTYPE=2)!(DGXX="") S Y="@41"
 Q
35 D:$D(DG)>9 F^DIE17,DE S DQ=35,DW="82;2",DV="SX",DU="",DLB="POA FOR ICD 2",DIFLD=82.02
 S DU="Y:Present on Admission;N:Not Present on Admission;U:Insufficient Docum to Present on Admission;W:Can't Determine if Present on Admission;"
 G RE
X35 I X]"",$G(DA),$G(DA(1)) K:'$$POA501^DGPTFUT1(X,DA(1),DA,0,6) X
 Q
 ;
36 S DQ=37 ;@41
37 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=37 D X37 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X37 S X=DGXX
 Q
38 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=38 D X38 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X38 I X K DGPTIT S DGNFLD="@50",Y="@8000",DGPTIT(X_$C(59)_"ICD9(")=""
 Q
39 S DQ=40 ;@50
40 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=40 D X40 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X40 I DGADD,$P(DGHOLD,U,7)]"" S Y="@60"
 Q
41 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=41 D X41 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X41 S DGNFLD="@60"
 Q
42 S DW="0;7",DV="*P80'X",DU="",DLB="ICD 3",DIFLD=7
 S DE(DW)="C42^DGPTX51",DE(DW,"INDEX")=1
 S DU="ICD9("
 G RE
C42 G C42S:$D(DE(42))[0 K DB
 S X=DE(42),DIC=DIE
 K ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)
 S X=DE(42),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGPT(D0,"M",D1,82)):^(82),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y S X="" S DIH=$G(^DGPT(DIV(0),"M",DIV(1),82)),DIV=X S $P(^(82),U,3)=DIV,DIH=45.02,DIG=82.03 D ^DICR
 S X=DE(42),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C42S S X="" G:DG(DQ)=X C42F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGPT(D0,"M",D1,82)):^(82),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y S X="" S DIH=$G(^DGPT(DIV(0),"M",DIV(1),82)),DIV=X S $P(^(82),U,3)=DIV,DIH=45.02,DIG=82.03 D ^DICR
 S X=DG(DQ),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C42F1 S DIEZRXR(45.02,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=1164 S DIEZRXR(45.02,DIXR)=""
 Q
X42 N K D GETAPI^DGICDGT("DG PTF","DIAG",$G(DA(1)),"EN")
 Q
 ;
43 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=43 D X43 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X43 S DGXX=X
 Q
44 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=44 D X44 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X44 I DGCODSYS="ICD9"!(DGTYPE=2)!(DGXX="") S Y="@51"
 Q
45 D:$D(DG)>9 F^DIE17,DE S DQ=45,DW="82;3",DV="SX",DU="",DLB="POA FOR ICD 3",DIFLD=82.03
 S DU="Y:Present on Admission;N:Not Present on Admission;U:Insufficient Docum to Present on Admission;W:Can't Determine if Present on Admission;"
 G RE
X45 I X]"",$G(DA),$G(DA(1)) K:'$$POA501^DGPTFUT1(X,DA(1),DA,0,7) X
 Q
 ;
46 S DQ=47 ;@51
47 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=47 D X47 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X47 S X=DGXX
 Q
48 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=48 D X48 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X48 I X K DGPTIT S DGNFLD="@60",Y="@8000",DGPTIT(X_$C(59)_"ICD9(")=""
 Q
49 S DQ=50 ;@60
50 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=50 D X50 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X50 I DGADD,$P(DGHOLD,U,8)]"" S Y="@70"
 Q
51 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=51 D X51 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X51 S DGNFLD="@70"
 Q
52 S DW="0;8",DV="*P80'X",DU="",DLB="ICD 4",DIFLD=8
 S DE(DW)="C52^DGPTX51",DE(DW,"INDEX")=1
 S DU="ICD9("
 G RE
C52 G C52S:$D(DE(52))[0 K DB
 S X=DE(52),DIC=DIE
 K ^DGPT(DA(1),"M","AC",$E(X,1,30),DA)
 S X=DE(52),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^DGPT(D0,"M",D1,82)):^(82),1:"") S X=$P(Y(1),U,4),X=X S DIU=X K Y S X="" S DIH=$G(^DGPT(DIV(0),"M",DIV(1),82)),DIV=X S $P(^(82),U,4)=DIV,DIH=45.02,DIG=82.04 D ^DICR
 S X=DE(52),DIC=DIE
 X "N X S X=""DGRUDD01"" X ^%ZOSF(""TEST"") Q:'$T  N DG1 S DG1=+$P(^DGPT(DA(1),0),""^"",1) D:(DG1>0) ADGRU^DGRUDD01(DG1)"
C52S S X="" G:DG(DQ)=X C52F1 K DB
 D ^DGPTX52
C52F1 S DIEZRXR(45.02,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=1165 S DIEZRXR(45.02,DIXR)=""
 Q
X52 N K D GETAPI^DGICDGT("DG PTF","DIAG",$G(DA(1)),"EN")
 Q
 ;
53 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=53 D X53 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X53 S DGXX=X
 Q
54 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=54 D X54 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X54 I DGCODSYS="ICD9"!(DGTYPE=2)!(DGXX="") S Y="@61"
 Q
55 D:$D(DG)>9 F^DIE17,DE S DQ=55,DW="82;4",DV="SX",DU="",DLB="POA FOR ICD 4",DIFLD=82.04
 S DU="Y:Present on Admission;N:Not Present on Admission;U:Insufficient Docum to Present on Admission;W:Can't Determine if Present on Admission;"
 G RE
X55 I X]"",$G(DA),$G(DA(1)) K:'$$POA501^DGPTFUT1(X,DA(1),DA,0,8) X
 Q
 ;
56 S DQ=57 ;@61
57 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=57 D X57 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X57 S X=DGXX
 Q
58 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=58 D X58 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X58 I X K DGPTIT S DGNFLD="@70",Y="@8000",DGPTIT(X_$C(59)_"ICD9(")=""
 Q
59 S DQ=60 ;@70
60 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=60 D X60 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X60 I DGADD,$P(DGHOLD,U,9)]"" S Y="@80"
 Q
61 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=61 D X61 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X61 S DGNFLD="@80"
 Q
62 D:$D(DG)>9 F^DIE17 G ^DGPTX53
