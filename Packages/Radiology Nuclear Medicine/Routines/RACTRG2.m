RACTRG2 ; ;03/19/19
 D DE G BEGIN
DE S DIE="^RADPT(D0,""DT"",D1,""P"",",DIC=DIE,DP=70.03,DL=3,DIEL=2,DU="" K DG,DE,DB Q:$O(^RADPT(D0,"DT",D1,"P",DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,2) S:%]"" DE(11)=%,DE(18)=% S %=$P(%Z,U,3) S:%]"" DE(8)=% S %=$P(%Z,U,4) S:%]"" DE(42)=% S %=$P(%Z,U,6) S:%]"" DE(60)=%,DE(63)=% S %=$P(%Z,U,7) S:%]"" DE(66)=%,DE(69)=% S %=$P(%Z,U,8) S:%]"" DE(53)=%
 I  S %=$P(%Z,U,9) S:%]"" DE(48)=% S %=$P(%Z,U,11) S:%]"" DE(38)=% S %=$P(%Z,U,14) S:%]"" DE(39)=% S %=$P(%Z,U,18) S:%]"" DE(40)=% S %=$P(%Z,U,19) S:%]"" DE(72)=%,DE(75)=% S %=$P(%Z,U,21) S:%]"" DE(77)=% S %=$P(%Z,U,22) S:%]"" DE(78)=%
 I  S %=$P(%Z,U,26) S:%]"" DE(4)=% S %=$P(%Z,U,31) S:%]"" DE(6)=%
 I $D(^("R")) S %Z=^("R") S %=$P(%Z,U,1) S:%]"" DE(45)=%
 I $D(^("SIUID")) S %Z=^("SIUID") S %=$E(%Z,1,240) S:%'?." " DE(7)=%
 K %Z Q
 ;
W W !?DL+DL-2,DLB_": "
 Q
O D W W Y W:$X>45 !?9
 I $L(Y)>19,'DV,DV'["I",(DV["F"!(DV["K")) G RW^DIR2
 W:Y]"" "// " I 'DV,DV["I",$D(DE(DQ))#2 K X S X("FIELD")=DIFLD,X("FILE")=DP W "  ("_$$EZBLD^DIALOG(710,.X)_")" K X S X="" Q  ;**
TR Q:DV["K"&(DUZ(0)'="@")  R X:DTIME E  S (DTOUT,X)=U W $C(7)
 Q
A K DQ(DQ) S DQ=DQ+1
B G @DQ
RE G A:DV["K"&(DUZ(0)'["@"),PR:$D(DE(DQ)) D W,TR
N I X="" G NKEY:$D(^DD("KEY","F",DP,DIFLD)),A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" I X?.ANP D SET^DIED I 'DDER G V
 K DDER G X
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) G:DV["*" AST^DIED D NOSCR^DIED S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I $P(DQ(DQ),U,5)'["$",X?.1"-".N.1".".N,$P(DQ(DQ),U,5,99)["+X'=X" S X=+X
V D @("X"_DQ) K YS
UNIQ I DV["U",$D(X),DIFLD=.01 K % M %=@(DIE_"""B"",X)") K %(DA) K:$O(%(0)) X
Z K DIC("S"),DLAYGO I $D(X),X'=U D:$G(DE(DW,"INDEX")) SAVEVALS G:'$$KEYCHK UNIQFERR^DIE17 S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
X W:'$D(ZTQUEUED) $C(7),"??" I $D(DB(DQ)) G Z^DIE17
 S X="?BAD"
QS S DZ=X D D,QQ^DIEQ G B
D S D=DIFLD,DQ(DQ)=DLB_U_DV_U_DU_U_DW_U_$P($T(@("X"_DQ))," ",2,99) Q
Y I '$D(DE(DQ)) D O G RD:"@"'[X,A:DV'["R"&(X="@"),X:X="@" S X=Y G N
PR S DG=DV,Y=DE(DQ),X=DU I $D(DQ(DQ,2)) X DQ(DQ,2) G RP
R I DG["P",@("$D(^"_X_"0))") S X=+$P(^(0),U,2) G RP:'$D(^(Y,0)) S Y=$P(^(0),U),X=$P(^DD(X,.01,0),U,3),DG=$P(^(0),U,2) G R
 I DG["V",+Y,$P(Y,";",2)["(",$D(@(U_$P(Y,";",2)_"0)")) S X=+$P(^(0),U,2) G RP:'$D(^(+Y,0)) S Y=$P(^(0),U) I $D(^DD(+X,.01,0)) S DG=$P(^(0),U,2),X=$P(^(0),U,3) G R
 X:DG["D" ^DD("DD") I DG["S" S %=$P($P(";"_X,";"_Y_":",2),";") I %]"" S Y=$S($G(DUZ("LANG"))'>1:%,'DIFLD:%,1:$$SET^DIQ(DP,DIFLD,Y))
RP D O I X="" S X=DE(DQ) G A:'DV,A:DC<2,N^DIE17
I I DV'["I",DV'["#" G RD
 D E^DIE0 G RD:$D(X),PR
 Q
SAVEVALS S @DIEZTMP@("V",DP,DIIENS,DIFLD,"O")=$G(DE(DQ)) S:$D(^("F"))[0 ^("F")=$G(DE(DQ))
 I $D(DE(DW,"4/")) S @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")=""
 E  K @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")
 Q
NKEY W:'$D(ZTQUEUED) "??  Required key field" S X="?BAD" G QS
KEYCHK() Q:$G(DE(DW,"KEY"))="" 1 Q @DE(DW,"KEY")
BEGIN S DNM="RACTRG2",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=1 D X1 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X1 S RACN=X,RACNI=DA
 Q
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 S RACMTHOD=$P(^RA(79.1,+$P(RAMLC,"^"),0),"^",21)
 Q
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 D X3 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X3 S RACMTHOD=$S(RACMTHOD]"":RACMTHOD,1:0)
 Q
4 S DW="0;26",DV="S",DU="",DIFLD=26,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="0:Regular Credit;1:Interpretation Only;2:No Credit;3:Technical Component Only;"
 S X=RACMTHOD
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X4 Q
5 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=5 D X5 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X5 I $$USESSAN^RAHLRU1()'=1 S Y=81
 Q
6 S DW="0;31",DV="RFI",DU="",DIFLD=31,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C6^RACTRG2",DE(DW,"INDEX")=1
 S X=$$ACCNUM^RAAPI($G(DA(2)),$G(DA(1)),$G(DA))
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C6 G C6S:$D(DE(6))[0 K DB
C6S S X="" G:DG(DQ)=X C6F1 K DB
C6F1 N X,X1,X2 S DIXR=914 D C6X1(U) K X2 M X2=X D C6X1("O") K X1 M X1=X
 I $G(X(1))]"" D
 . K ^RADPT("ADC1",$E(X,1,30),DA(2),DA(1),DA)
 K X M X=X2 I $G(X(1))]"" D
 . S ^RADPT("ADC1",$E(X,1,30),DA(2),DA(1),DA)=""
 G C6F2
C6X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",70.03,DIIENS,31,DION),$P($G(^RADPT(DA(2),"DT",DA(1),"P",DA,0)),U,31))
 S X=$G(X(1))
 Q
C6F2 Q
X6 Q
7 D:$D(DG)>9 F^DIE17,DE S DQ=7,DW="SIUID;E1,240",DV="F",DU="",DIFLD=81,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C7^RACTRG2",DE(DW,"INDEX")=1
 S X=$$SIUID^RAAPI()
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C7 G C7S:$D(DE(7))[0 K DB
C7S S X="" G:DG(DQ)=X C7F1 K DB
C7F1 N X,X1,X2 S DIXR=915 D C7X1(U) K X2 M X2=X D C7X1("O") K X1 M X1=X
 I $G(X(1))]"" D
 . K ^RADPT("ASIUID",$E(X,1,240),DA(2),DA(1),DA)
 K X M X=X2 I $G(X(1))]"" D
 . S ^RADPT("ASIUID",$E(X,1,240),DA(2),DA(1),DA)=""
 G C7F2
C7X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",70.03,DIIENS,81,DION),$E($G(^RADPT(DA(2),"DT",DA(1),"P",DA,"SIUID")),1,240))
 S X=$G(X(1))
 Q
C7F2 Q
X7 Q
8 D:$D(DG)>9 F^DIE17,DE S DQ=8,DW="0;3",DV="R*P72'X",DU="",DIFLD=3,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C8^RACTRG2",DE(DW,"INDEX")=1
 S DU="RA(72,"
 S X=$O(^RA(72,"AA",RAIMGTY,1,0))
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C8 G C8S:$D(DE(8))[0 K DB
C8S S X="" G:DG(DQ)=X C8F1 K DB
C8F1 N X,X1,X2 S DIXR=1529 D C8X1(U) K X2 M X2=X D C8X1("O") K X1 M X1=X
 I $G(X(1))]"" D
 . D AEKILL^RADD2(.DA)
 K X M X=X2 I $G(X(1))]"" D
 . D AEASSET^RADD2(X,.DA,"AE")
 G C8F2
C8X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",70.03,DIIENS,3,DION),$P($G(^RADPT(DA(2),"DT",DA(1),"P",DA,0)),U,3))
 S X=$G(X(1))
 Q
C8F2 S DIXR=1530 D C8X2(U) K X2 M X2=X D C8X2("O") K X1 M X1=X
 I $G(X(1))]"" D
 . K ^RADPT("AS",$E(X,1,30),DA(2),DA(1),DA)
 K X M X=X2 I $G(X(1))]"" D
 . D AEASSET^RADD2(X,.DA,"AS")
 G C8F3
C8X2(DION) K X
 S X(1)=$G(@DIEZTMP@("V",70.03,DIIENS,3,DION),$P($G(^RADPT(DA(2),"DT",DA(1),"P",DA,0)),U,3))
 S X=$G(X(1))
 Q
C8F3 Q
X8 Q
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 S RASTI=X
 Q
10 S DQ=11 ;@3
11 D:$D(DG)>9 F^DIE17,DE S DQ=11,DW="0;2",DV="*P71'XR",DU="",DIFLD=2,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C11^RACTRG2",DE(DW,"INDEX")=1
 S DU="RAMIS(71,"
 S X=$S($D(RAPRC):RAPRC,1:"")
 S Y=X
 G Y
C11 G C11S:$D(DE(11))[0 K DB
 S X=DE(11),DIC=DIE
 K ^RADPT(DA(2),"DT","AP",$E(X,1,30),DA(1),DA)
 S X=DE(11),DIC=DIE
 D DW^RACPTMSC
C11S S X="" G:DG(DQ)=X C11F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^RADPT(DA(2),"DT","AP",$E(X,1,30),DA(1),DA)=""
 S X=DG(DQ),DIC=DIE
 ;
C11F1 S DIEZRXR(70.03,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=463 S DIEZRXR(70.03,DIXR)=""
 Q
X11 S DIC("S")="I $$ACTC^RACPTCSV" X ^DD(70.03,2,9.2)
 Q
 ;
12 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=12 D X12 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X12 S RAPRI=X
 Q
13 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=13 D X13 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X13 S RAPRI(0)=$G(^RAMIS(71,+RAPRI,0))
 Q
14 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=14 D X14 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X14 I $P(RAMDV,U,7),($P(RAPRI(0),U,6)="B") S Y="@3000"
 Q
15 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=15 D X15 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X15 S:$P($G(^RA(79,+$$DIVSION^RAUTL6(DT,+$P($G(^RAO(75.1,+RAOIFN,0)),"^",22)),.1)),"^",7)="N"!($P(RAPRI(0),"^",6)'="B") Y="@4"
 Q
16 S DQ=17 ;@3000
17 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=17 D X17 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X17 W !?3,$C(7),"A 'detailed' procedure or a 'series' of procedures is required!"
 Q
18 D:$D(DG)>9 F^DIE17,DE S DQ=18,DW="0;2",DV="*P71'X",DU="",DIFLD=2,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C18^RACTRG2",DE(DW,"INDEX")=1
 S DU="RAMIS(71,"
 S Y="@"
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C18 G C18S:$D(DE(18))[0 K DB
 S X=DE(18),DIC=DIE
 K ^RADPT(DA(2),"DT","AP",$E(X,1,30),DA(1),DA)
 S X=DE(18),DIC=DIE
 D DW^RACPTMSC
C18S S X="" G:DG(DQ)=X C18F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^RADPT(DA(2),"DT","AP",$E(X,1,30),DA(1),DA)=""
 S X=DG(DQ),DIC=DIE
 ;
C18F1 S DIEZRXR(70.03,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=463 S DIEZRXR(70.03,DIXR)=""
 Q
X18 S DIC("S")="I $$ACTC^RACPTCSV" X ^DD(70.03,2,9.2)
 Q
 ;
19 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=19 D X19 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X19 S Y="@3"
 Q
20 S DQ=21 ;@4
21 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=21 D X21 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X21 S RAPX(RACNI)=RACN_"^"_^RAMIS(71,RAPRI,0)
 Q
22 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=22 D X22 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X22 S REM="don't copy proc mods for Series and Broad, 9/24/1999"
 Q
23 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=23 D X23 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X23 S:$P(RAPX(RACNI),U,7)="S" Y="@7"
 Q
24 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=24 D X24 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X24 S:$P(RAPX(RACNI),U,7)="B" Y="@8"
 Q
25 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=25 D X25 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X25 S RAI=0,Y=$S('$D(RAPRC):"@6",RAPRC'=$P(RAPX(RACNI),U,2):"@6",1:"@5")
 Q
26 S DQ=27 ;@5
27 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=27 D X27 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X27 S RAI=$O(^RAO(75.1,+RAOIFN,"M","B",RAI)) S:'RAI Y="@6"
 Q
28 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=28 D X28 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X28 S RAMOD=$S($D(^RAMIS(71.2,RAI,0)):$P(^(0),U),1:-1) S:RAMOD<0 Y="@6"
 Q
29 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=29 D X29 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X29 S:'$D(^RAMIS(71.2,"AB",+$$ITYPE^RASITE(+$G(RAPRI)),RAI)) Y="@5"
 Q
30 D:$D(DG)>9 F^DIE17,DE S DQ=30,D=0 K DE(1) ;125
 S DIFLD=125,DGO="^RACTRG3",DC="1^70.1P^M^",DV="70.1M*P71.2'X",DW="0;1",DOW=$$LABEL^DIALOGZ(DP,DIFLD),DLB=$P($$EZBLD^DIALOG(8042,DOW),": ") S:D DC=DC_D
 S DU="RAMIS(71.2,"
 G RE:D I $D(DSC(70.1))#2,$P(DSC(70.1),"I $D(^UTILITY(",1)="" X DSC(70.1) S D=$O(^(0)) S:D="" D=-1 G M30
 S D=$S($D(^RADPT(D0,"DT",D1,"P",DA,"M",0)):$P(^(0),U,3,4),$O(^(0))'="":$O(^(0)),1:-1)
M30 I D>0 S DC=DC_D I $D(^RADPT(D0,"DT",D1,"P",DA,"M",+D,0)) S DE(30)=$P(^(0),U,1)
 S X=RAMOD
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
R30 D DE
 G A
 ;
31 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=31 D X31 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X31 S Y="@5"
 Q
32 S DQ=33 ;@6
33 S D=0 K DE(1) ;125
 S DIFLD=125,DGO="^RACTRG4",DC="1^70.1P^M^",DV="70.1M*P71.2'X",DW="0;1",DOW=$$LABEL^DIALOGZ(DP,DIFLD),DLB=$P($$EZBLD^DIALOG(8042,DOW),": ") S:D DC=DC_D
 S DU="RAMIS(71.2,"
 G RE:D I $D(DSC(70.1))#2,$P(DSC(70.1),"I $D(^UTILITY(",1)="" X DSC(70.1) S D=$O(^(0)) S:D="" D=-1 G M33
 S D=$S($D(^RADPT(D0,"DT",D1,"P",DA,"M",0)):$P(^(0),U,3,4),$O(^(0))'="":$O(^(0)),1:-1)
M33 I D>0 S DC=DC_D I $D(^RADPT(D0,"DT",D1,"P",DA,"M",+D,0)) S DE(33)=$P(^(0),U,1)
 G RE
R33 D DE
 S D=$S($D(^RADPT(D0,"DT",D1,"P",DA,"M",0)):$P(^(0),U,3,4),1:1) G 33+1
 ;
34 S DQ=35 ;@7
35 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=35 D X35 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X35 D:$T(SETDEFS^RACPTMSC)]"" SETDEFS^RACPTMSC
 Q
36 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=36 D X36 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X36 S REM="don't ask cpt mods after stuffing"
 Q
37 S DQ=38 ;@8
38 S DW="0;11",DV="P75.1'",DU="",DIFLD=11,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C38^RACTRG2"
 S DU="RAO(75.1,"
 S X=RAOIFN
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C38 G C38S:$D(DE(38))[0 K DB
 S X=DE(38),DIC=DIE
 K ^RADPT("AO",$E(X,1,30),DA(2),DA(1),DA)
C38S S X="" G:DG(DQ)=X C38F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^RADPT("AO",$E(X,1,30),DA(2),DA(1),DA)=""
C38F1 Q
X38 Q
39 D:$D(DG)>9 F^DIE17,DE S DQ=39,DW="0;14",DV="R*P200'X",DU="",DIFLD=14,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="VA(200,"
 S X=$S($D(RAPIFN):RAPIFN,1:"")
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X39 Q
40 S DW="0;18",DV="*P78.6'",DU="",DIFLD=18,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="RA(78.6,"
 S X=$S($P(RAPX(RACNI),U,15)]"":$P(RAPX(RACNI),U,15),1:"")
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X40 Q
41 S DQ=42 ;@20
42 S DW="0;4",DV="RSX",DU="",DIFLD=4,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="I:INPATIENT;O:OUTPATIENT;C:CONTRACT;S:SHARING;E:EMPLOYEE;R:RESEARCH;"
 S X=RACAT
 S Y=X
 G Y
X42 I $D(X),$E(X)="I" S DFN=DA(2),VAINDT=9999999.9999-DA(1) D ADM^VADPT2 I 'VADMVT K X W !?3,"Patient not an inpatient at registration time.",!
 Q
 ;
43 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=43 D X43 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X43 S RAX=$E(X),Y=$S(RAX="I":"@60",RAX="E":"@45",RAX="R":"@30","CS"[RAX:"@40",1:"@50") K RAX
 Q
44 S DQ=45 ;@30
45 S DW="R;1",DV="FR",DU="",DIFLD=9.5,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S X=$S($D(RARSH):RARSH,1:"")
 S Y=X
 G Y
X45 K:$L(X)>40!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
46 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=46 D X46 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X46 S Y=$S($D(RAWARD):"@60",1:"@50")
 Q
47 S DQ=48 ;@40
48 S DW="0;9",DV="*P34'R",DU="",DIFLD=9,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="DIC(34,"
 S X=$S($D(RASHA):RASHA,1:"")
 S Y=X
 G Y
X48 S DIC("S")="I $S('$D(^(""I"")):1,'^(""I""):1,DT'>^(""I""):1,1:0)" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
49 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=49 D X49 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X49 S Y="@100"
 Q
50 S DQ=51 ;@45
51 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=51 D X51 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X51 S:$D(RAWARD) Y="@60"
 Q
52 S DQ=53 ;@50
53 S DW="0;8",DV="*P44'R",DU="",DIFLD=8,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="SC("
 S X=$S($D(RACLNC):RACLNC,1:"")
 S Y=X
 G Y
X53 S DIC("S")="I $P(^(0),U,3)=""C""" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
54 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=54 D X54 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X54 S RACLNC=$P(^SC(X,0),U)
 Q
55 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=55 D X55 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X55 S Y="@100"
 Q
56 S DQ=57 ;@60
57 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=57 D X57 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X57 S:'$D(RAWARD) RAWARD="Unknown" S:'$D(RASER) RASER="Unknown" S:'$D(RABED) RABED="Unknown"
 Q
58 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=58 D X58 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X58 W !?5,"Ward: ",RAWARD,"   Service: ",RASER,"  Bedsection: ",RABED
 Q
59 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=59 D X59 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X59 I RAWARD'="Unknown" S Y="@66"
 Q
60 S DW="0;6",DV="P42'R",DU="",DIFLD=6,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="DIC(42,"
 G RE
X60 Q
61 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=61 D X61 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X61 S Y="@68"
 Q
62 S DQ=63 ;@66
63 S DW="0;6",DV="P42'",DU="",DIFLD=6,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="DIC(42,"
 S X=RAWARD
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
X63 Q
64 S DQ=65 ;@68
65 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=65 D X65 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X65 I RASER'="Unknown" S Y="@80"
 Q
66 S DW="0;7",DV="P49'R",DU="",DIFLD=7,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="DIC(49,"
 G RE
X66 Q
67 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=67 D X67 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X67 S Y="@85"
 Q
68 S DQ=69 ;@80
69 S DW="0;7",DV="P49'",DU="",DIFLD=7,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="DIC(49,"
 S X=RASER
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
X69 Q
70 S DQ=71 ;@85
71 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=71 D X71 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X71 I RABED'="Unknown" S Y="@95"
 Q
72 S DW="0;19",DV="P42.4'R",DU="",DIFLD=19,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="DIC(42.4,"
 G RE
X72 Q
73 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=73 D X73 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X73 S Y="@100"
 Q
74 S DQ=75 ;@95
75 S DW="0;19",DV="P42.4'",DU="",DIFLD=19,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="DIC(42.4,"
 S X=RABED
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
X75 Q
76 S DQ=77 ;@100
77 S DW="0;21",DV="D",DU="",DIFLD=21,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S X=$S($D(RARDTE):RARDTE,1:"")
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X77 Q
78 S DW="0;22",DV="P44'",DU="",DIFLD=22,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="SC("
 S X=$S($D(RALIFN):RALIFN,1:"")
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X78 Q
79 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=79 D X79 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X79 I '$D(^RAMIS(71,RAPRI,"F",0)) S Y="@300"
 Q
80 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=80 D X80 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X80 S RAI=0
 Q
81 S DQ=82 ;@200
82 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=82 D X82 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X82 S RAI=$O(^RAMIS(71,RAPRI,"F",RAI)) S:RAI'>0!('$D(^(+RAI,0))) Y="@300"
 Q
83 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=83 D X83 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X83 S RAFM(1)=+^RAMIS(71,RAPRI,"F",RAI,0),RAFM1=+$P(^(0),U,2),RAFM=$S($D(^RA(78.4,RAFM(1),0)):$P(^(0),U),1:-1),RAFM=$S('$D(^("I")):RAFM,'^("I"):RAFM,1:-1) S:RAFM<0 Y="@200"
 Q
84 D:$D(DG)>9 F^DIE17 G ^RACTRG5
