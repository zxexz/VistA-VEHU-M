PRCPSPE0 ;WISC/AKS-create set packs ;20 Feb 92
 ;;4.0;IFCAP;;9/23/93
 N I,X,Y,PRCPADD,PRCPASBY,PRCPCOST,PRCPDESC,PRCPDTI,PRCPI,PRCPITEM,PRCPMY,PRCPPV,PRCPPVNO,PRCPQ,PRCPQTY,PRCPSET,PRCPITYP,PRCPNSN,PRCPSUB,PRCPPRIV
EN ; ADD, EDIT SETS/PACKS FROM MASTER FILE
 D ^PRCPUSEL G:'$G(PRCP("I")) EXIT W !!!
 S PRCPPRIV=1,DIC="^PRC(441,",DIC(0)="AEQMOLZ",PRCPSET="I $P(^(0),U,6)=""S"" Q:$P(^(0),U,7)=PRCP(""I"")  Q:$D(^PRCP(445,+$P(^(0),U,7),2,PRCP(""I""),0))  I 0"
 S DIC("A")="Select Set/Pack (or ""NEW"" to create a new one): ",DLAYGO=441
 D ^DIC K DIC,DLAYGO G:Y=-1 EXIT S PRCPITEM=+Y,PRCPADD=+$P(Y,U,3) I PRCPADD S $P(^PRC(441,PRCPITEM,0),U,7)=PRCP("I")
 S PRCPASBY=$P(^PRC(441,PRCPITEM,0),U,7)
 I PRCPASBY'=PRCP("I"),'$D(^PRCP(445,+PRCPASBY,1,PRCPITEM,0)) W $C(7),!,"This set/pack does not exist in the inventory for "_$S($D(^PRCP(445,+PRCPASBY,0)):$P($P(^(0),U,1),"-",1),1:"") G EN
 S PRCPPVNO=PRCPASBY_";PRCP(445,",PRCPPV=$P($P(^PRCP(445,+PRCPASBY,0),U,1),"-",2),PRCPCOST=$S($D(^PRCP(445,+PRCPASBY,1,PRCPITEM,0)):$P(^(0),U,15),1:0)
 I PRCPADD S DIE="^PRC(441,",DA=PRCPITEM,DR=.05 S:PRCPADD DR=DR_";.06///S" D ^DIE K DIE,DA,DR G:$D(Y) EXIT
 ; SET DIC("W") TO DISPLAY ITEM DESCRIPTION FROM INVENTORY.  CALLED FROM INPUT TRANSFORM ON FILE 445, FIELD 1, ITEM NO.
 S DIC("W")="S Z=^PRC(441,+Y,0),PRCPDESC=$P(Z,U,2) S:$D(^PRCP(445,DA(1),1,+Y,6)) PRCPDESC=$S($P(^(6),U,1)'="""":$P(^(6),U,1),1:$P(Z,U,2)) D WD^PRCPSPE0"
 S DIC(0)="L",X=PRCPITEM D  G:PRCPITEM=-1 EN
 .   ; LOOK UP OR ADD AN ITEM ON GENERAL INVENTORY FILE (445)
 .   S:'$D(DIC("A")) DIC("A")="Select Item: " S:'$D(PRCPSET) PRCPSET="I 1" I DIC(0)["L" S DLAYGO=445
 .   S:'$D(^PRCP(445,PRCP("I"),1,0)) ^(0)="^445.01IP^^"
 .   S DIC="^PRCP(445,"_PRCP("I")_",1,",DA(1)=PRCP("I") D ^DIC K DIC,DLAYGO,DA,DO,PRCPSET S PRCPITEM=+Y Q:Y=-1  D
 .   .   ; FIND ITEM IN ITEM MASTER FILE, RETURN DESCRIPTION, SUBACCOUNT, NATL.STOCK NO., FLAG INDICATING WHETHER ITEM IS PURCHASEABLE OR A SET/PACK.
 .   .   K PRCPITYP S:'$D(PRCPDESC) PRCPDESC="" S PRCPSUB="",PRCPNSN=""
 .   .   S X=$S($D(^PRC(441,+PRCPITEM,0)):^(0),1:"") Q:'X  S PRCPDESC=$S(PRCPDESC="":$P(X,U,2),1:PRCPDESC),PRCPSUB=+$P(X,U,10),PRCPNSN=$P(X,U,5),PRCPITYP=$S($P(X,U,6)'="":$P(X,U,6),1:"P")
 S DIE="^PRCP(445,",DA=PRCP("I"),DR="[PRCP SET/PACK]",D0=DA D ^DIE G:'$D(^PRCP(445,PRCP("I"),1,+PRCPITEM,0)) EN
 I PRCPASBY=PRCP("I") S PRCPCOST=0 D
 .   F  S I=$O(^PRCP(445,PRCP("I"),1,PRCPITEM,8,I)) Q:'I  S PRCPQTY=+$P(^(I,0),U,2) I $D(^PRCP(445,PRCP("I"),1,I,0)) S X=^(0),X=$S($P(X,U,15)>$P(X,U,22):$P(X,U,15),1:$P(X,U,22)),PRCPCOST=PRCPCOST+(PRCPQTY*X)
 S $P(^PRCP(445,PRCP("I"),1,PRCPITEM,0),U,15)=PRCPCOST,$P(^(0),U,22)=PRCPCOST
 G EN
SETW ;set dic("w") to display item description from inventory.  called from input transform on file 445, field 21, member of set/pack
 S DIC("W")="N %,PRCPDESC S %=$G(^PRC(441,+Y,0)),PRCPDESC=$S($P($G(^PRCP(445,DA(1),1,+Y,6)),U)'="""":$P($G(^(6)),U),1:$P(%,U,2)) W ?9,$E(PRCPDESC,1,30),?45,""NSN: "",$P(%,U,5) W:$E(PRCPDESC,31)'="""" !?9,$E(PRCPDESC,31,60)" Q
EXIT ; quit the option
 K D0,PRCPPRIV QUIT
WD S Z3="",$P(Z3," ",31)=""
 S Z1=$E(PRCPDESC,1,30),Z2=$E(PRCPDESC,31,60) S:$L(Z1)'=30 Z1=Z1_$E(Z3,1,30-$L(Z1))
 W $E("     ",$L(X),5) S ZX=$X+1 W Z1_"     NSN: "_$P(Z,U,5) W:Z2'="" !,?ZX,Z2 K Z,ZX,Z1,Z2,Z3 Q
