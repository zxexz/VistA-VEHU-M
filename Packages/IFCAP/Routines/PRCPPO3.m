PRCPPO3 ;WISC/RFJ-primary receive issue books ;17 July 91
 ;;4.0;IFCAP;;9/23/93
 Q
 ;
 ;
TOP ;     |-> start receiving
 ;     |-> check items and quantities to post for all or exception
 N %,CONV,DATA2237,DRUGACCT,ITEMDA,ITEMDATA,LINEDA,PRCPID,PRIMORD,PRCPPO3,QTY,TOTCOST,TOTITEMS,X,XH,XP
 I PRCPOPT=1!(PRCPOPT=2) W !!,"checking items for receiving..." F %=0:0 S %=$O(^PRCS(410,PRCPDA,"IT",%)) Q:'%  I '$D(^TMP($J,"NOPOST",%)),$D(^PRCS(410,PRCPDA,"IT",%,0)) S X=^(0) D
 .   S QTY=$P(X,"^",2)-$P(X,"^",13) S:QTY<0 QTY=0 I 'QTY!($D(^TMP($J,"POST",%))) Q
 .   I +$P(X,"^",5),'$D(^PRCP(445,PRCP("I"),1,+$P(X,"^",5),0)) W !,"ITEM NUMBER '",$P(X,"^",5),"' NOT STORED IN THE INVENTORY POINT AND WILL NOT BE RECEIVED." Q
 .   S ^TMP($J,"POST",%)=QTY
 ;
 S PRCPREPT(1)="BEFORE RECEIVING" I PRCPREPT=2!(PRCPREPT=4) D:'$D(IO("Q"))&(IO=IO(0)) R^PRCPU4 D QUE^PRCPWPOR
 I $O(^TMP($J,"POST",0))="" W !,"***** NO INVENTORY ITEMS TO RECEIVE *****" Q
 S XP="READY TO START RECEIVING",XH="ENTER 'YES' TO START RECEIVING, 'NO' OR '^' TO EXIT.",%=1 W ! D YN^PRCPU4 Q:%'=1  W !!,"*** STARTING TO RECEIVE INVENTORY ITEMS ..."
 S PRIMORD=$$ORDERNO^PRCPUTR(PRCP("I"))
 ;     |-> special inventory point type
 I $G(PRIMORD),$P($G(^PRCP(445,PRCP("I"),0)),"^",20)="D" S X="PSAGIP" I $D(^%ZOSF("TEST")) X ^%ZOSF("TEST") I $T S DRUGACCT=1 W !?5,"Note: Primary is set up for drug accountability."
 W !!,"LN #",?7,"NSN",?25,"#MI",?32,$J("QTY",8),$J("UNITCOST",10),$J("CONV",6),$J("QTY REC",10)
 S (LINEDA,TOTITEMS)=0 F  S LINEDA=$O(^TMP($J,"POST",LINEDA)) Q:'LINEDA  S QTY=^(LINEDA) I QTY,'$D(^TMP($J,"NOPOST",LINEDA)),$D(^PRCS(410,PRCPDA,"IT",LINEDA,0)) S DATA2237=^(0) D
 .   S ITEMDA=+$P(DATA2237,"^",5),ITEMDATA=$G(^PRCP(445,PRCP("I"),1,ITEMDA,0))
 .   S TOTCOST=$J(QTY*$P(DATA2237,"^",7),0,2)
 .   S $P(DATA2237,"^",13)=$P(DATA2237,"^",13)+QTY,^PRCS(410,PRCPDA,"IT",LINEDA,0)=DATA2237
 .   ;     |-> update primary
 .   S CONV=$P($$GETVEN^PRCPUVEN(PRCP("I"),ITEMDA,+$O(^PRC(440,"AC","S",0))_";PRC(440,",1),"^",4)
 .   K PRCPPO3 S PRCPPO3("QTY")=QTY*CONV
 .   W !,"LN ",LINEDA,?7,$$NSN^PRCPUX1(ITEMDA)," (#",ITEMDA,")",?32,$J(QTY,8),$J($P(DATA2237,"^",7),10,3),$J(CONV,6),$J(PRCPPO3("QTY"),10)
 .   S PRCPPO3("INVVAL")=TOTCOST,PRCPPO3("SELVAL")=TOTCOST,PRCPPO3("2237PO")=PRCPTRAN,PRCPPO3("REF")=PRIMORD,PRCPPO3("TRANDA")=PRCPDA,PRCPPO3("REASON")="0:receipt by primary",PRCPPO3("OTHERPT")=WHSE
 .   I $G(DRUGACCT) S PRCPPO3("DRUGACCT")=1
 .   D ITEM^PRCPUUIW(PRCP("I"),ITEMDA,"RC",PRIMORD,.PRCPPO3)
 .   S TOTITEMS=TOTITEMS+1 I (TOTITEMS#18)=0 D R^PRCPU4 S TOTITEMS=0
 ;
 I $G(DRUGACCT) D EX^PSAGIP
 W !!,"*** FINISHED!" W:$O(^TMP($J,"POST",0))'="" !!,"*************************************",!,"***** RECEIVING HAS BEEN POSTED *****",!,"*************************************"
 Q:PRCPREPT=1!(PRCPREPT=2)  S PRCPREPT(1)="AFTER RECEIVING" S PRCPREPT=3 D:'$D(IO("Q"))&(IO=IO(0)) R^PRCPU4 D QUE^PRCPWPOR Q
