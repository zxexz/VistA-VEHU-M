DGRPTX20 ; ;07/06/12
 D DE G BEGIN
DE S DIE="^DPT(",DIC=DIE,DP=2,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^DPT(DA,""))=""
 I $D(^(.32)) S %Z=^(.32) S %=$P(%Z,U,5) S:%]"" DE(4)=% S %=$P(%Z,U,8) S:%]"" DE(5)=%
 I $D(^(.33)) S %Z=^(.33) S %=$P(%Z,U,9) S:%]"" DE(1)=% S %=$P(%Z,U,11) S:%]"" DE(2)=%
 I $D(^(.52)) S %Z=^(.52) S %=$P(%Z,U,5) S:%]"" DE(6)=%
 I $D(^(.53)) S %Z=^(.53) S %=$P(%Z,U,1) S:%]"" DE(8)=% S %=$P(%Z,U,2) S:%]"" DE(13)=% S %=$P(%Z,U,4) S:%]"" DE(14)=%
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
BEGIN S DNM="DGRPTX20",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S DQ=1,DW=".33;9",DV="FX",DU="",DLB="E-PHONE NUMBER",DIFLD=.339
 S DE(DW)="C1^DGRPTX20",DE(DW,"INDEX")=1
 G RE
C1 G C1S:$D(DE(1))[0 K DB
C1S S X="" G:DG(DQ)=X C1F1 K DB
C1F1 S DIEZRXR(2,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=16 S DIEZRXR(2,DIXR)=""
 Q
X1 K:$L(X)>20!($L(X)<3) X I $D(X) S DFN=DA D E1^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
2 D:$D(DG)>9 F^DIE17,DE S DQ=2,DW=".33;11",DV="F",DU="",DLB="E-WORK PHONE NUMBER",DIFLD=.33011
 S DE(DW)="C2^DGRPTX20",DE(DW,"INDEX")=1
 G RE
C2 G C2S:$D(DE(2))[0 K DB
C2S S X="" G:DG(DQ)=X C2F1 K DB
C2F1 S DIEZRXR(2,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=16 S DIEZRXR(2,DIXR)=""
 Q
X2 K:$L(X)>20!($L(X)<4) X
 I $D(X),X'?.ANP K X
 Q
 ;
3 S DQ=4 ;@40
4 D:$D(DG)>9 F^DIE17,DE S DQ=4,DW=".32;5",DV="P23'X",DU="",DLB="SERVICE BRANCH [LAST]",DIFLD=.325
 S DE(DW)="C4^DGRPTX20",DE(DW,"INDEX")=1
 S DU="DIC(23,"
 G RE
C4 G C4S:$D(DE(4))[0 K DB
 S X=DE(4),DIC=DIE
 S A1B2TAG="PAT" D ^A1B2XFR
 S X=DE(4),DIC=DIE
 I $P($G(^DPT(DA,.321)),U,14)]"" D FVP^DGRPMS
 S X=DE(4),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DE(4),DIC=DIE
 X "S DGXRF=.325 D ^DGDDC Q"
C4S S X="" G:DG(DQ)=X C4F1 K DB
 S X=DG(DQ),DIC=DIE
 S A1B2TAG="PAT" D ^A1B2XFR
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DG(DQ),DIC=DIE
 ;
C4F1 N X,X1,X2 S DIXR=399 D C4X1(U) K X2 M X2=X D C4X1("O") K X1 M X1=X
 D
 . N DIEXARR M DIEXARR=X S DIEZCOND=1
 . S X=X2(1)=""
 . S DIEZCOND=$G(X) K X M X=DIEXARR Q:'DIEZCOND
 . D DELMSE^DGRPMS(DA,1)
 G C4F2
C4X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",2,DIIENS,.325,DION),$P($G(^DPT(DA,.32)),U,5))
 S X=$G(X(1))
 Q
C4F2 Q
X4 S DFN=DA K:X=$O(^DIC(23,"B","B.E.C.","")) X I $D(X) D SV^DGLOCK S DGCOMBR=$G(Y) Q
 Q
 ;
5 D:$D(DG)>9 F^DIE17,DE S DQ=5,DW=".32;8",DV="FX",DU="",DLB="SERVICE NUMBER [LAST]",DIFLD=.328
 S DE(DW)="C5^DGRPTX20"
 G RE
C5 G C5S:$D(DE(5))[0 K DB
 S X=DE(5),DIC=DIE
 D EVENT^IVMPLOG(DA)
C5S S X="" G:DG(DQ)=X C5F1 K DB
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
C5F1 Q
X5 S DFN=DA D SV^DGLOCK I $D(X) S:X?1"SS".E L=$S($D(^DPT(DA,0)):$P(^(0),U,9),1:X) W:X?1"SS".E "  ",L S:X?1"SS".E X=L K:$L(X)>15!($L(X)<1)!'(X?.N) X
 I $D(X),X'?.ANP K X
 Q
 ;
6 D:$D(DG)>9 F^DIE17,DE S DQ=6,DW=".52;5",DV="RSX",DU="",DLB="POW STATUS INDICATED?",DIFLD=.525
 S DE(DW)="C6^DGRPTX20",DE(DW,"INDEX")=1
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C6 G C6S:$D(DE(6))[0 K DB
 S X=DE(6),DIC=DIE
 ;
 S X=DE(6),DIC=DIE
 ;
 S X=DE(6),DIC=DIE
 ;
 S X=DE(6),DIC=DIE
 D AUTOUPD^DGENA2(DA)
 S X=DE(6),DIC=DIE
 X "S DFN=DA D EN^DGMTR K DGREQF"
 S X=DE(6),DIC=DIE
 D EVENT^IVMPLOG(DA)
C6S S X="" G:DG(DQ)=X C6F1 K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.525,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.52)):^(.52),1:"") S X=$S('$D(^DIC(22,+$P(Y(1),U,6),0)):"",1:$P(^(0),U,1)) S DIU=X K Y S X=DIV S X="" X ^DD(2,.525,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.525,1,2,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.52)):^(.52),1:"") S X=$P(Y(1),U,7) S DIU=X K Y S X=DIV S X="" X ^DD(2,.525,1,2,1.4)
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.525,1,3,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.52)):^(.52),1:"") S X=$P(Y(1),U,8) S DIU=X K Y S X=DIV S X="" X ^DD(2,.525,1,3,1.4)
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
 S X=DG(DQ),DIC=DIE
 X "S DFN=DA D EN^DGMTR K DGREQF"
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
C6F1 N X,X1,X2 S DIXR=556 D C6X1(U) K X2 M X2=X D C6X1("O") K X1 M X1=X
 D
 . D FC^DGFCPROT(.DA,2,.525,"KILL",$H,$G(DUZ),.X,.X1,.X2,$G(XQY0)) Q
 K X M X=X2 D
 . D FC^DGFCPROT(.DA,2,.525,"SET",$H,$G(DUZ),.X,.X1,.X2,$G(XQY0)) Q
 G C6F2
C6X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",2,DIIENS,.525,DION),$P($G(^DPT(DA,.52)),U,5))
 S X=$G(X(1))
 Q
C6F2 Q
X6 S DFN=DA D POWV^DGLOCK I $D(X) D SV^DGLOCK
 Q
 ;
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 I $P($G(^DPT(DFN,.53)),U)]"" S Y="@53"
 Q
8 D:$D(DG)>9 F^DIE17,DE S DQ=8,DW=".53;1",DV="SX",DU="",DLB="CURRENT PH INDICATOR",DIFLD=.531
 S DE(DW)="C8^DGRPTX20"
 S DU="Y:YES;N:NO;"
 G RE
C8 G C8S:$D(DE(8))[0 K DB
 S X=DE(8),DIC=DIE
 K ^DPT("D",$E(X,1,30),DA)
 S X=DE(8),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C8S S X="" G:DG(DQ)=X C8F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^DPT("D",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C8F1 Q
X8 S DFN=DA D VET^DGLOCK
 Q
 ;
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 I X="Y" S Y="@532",DGPHMULT=1
 Q
10 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=10 D X10 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X10 I X="N" S Y="@533",DGPHMULT=1
 Q
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 S:X="" Y="@53"
 Q
12 S DQ=13 ;@532
13 D:$D(DG)>9 F^DIE17,DE S DQ=13,DW=".53;2",DV="S",DU="",DLB="CURRENT PURPLE HEART STATUS",DIFLD=.532
 S DE(DW)="C13^DGRPTX20"
 S DU="1:PENDING;2:IN PROCESS;3:CONFIRMED;"
 S X="PENDING"
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C13 G C13S:$D(DE(13))[0 K DB
 D ^DGRPTX21
C13S S X="" G:DG(DQ)=X C13F1 K DB
 D ^DGRPTX22
C13F1 Q
X13 Q
14 D:$D(DG)>9 F^DIE17,DE S DQ=14,DW=".53;4",DV="P4'",DU="",DLB="PH DIVISION",DIFLD=.535
 S DU="DIC(4,"
 S X=$$DIV^DGRPLE()
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
X14 Q
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 S Y="@53"
 Q
16 S DQ=17 ;@533
17 D:$D(DG)>9 F^DIE17 G ^DGRPTX23
