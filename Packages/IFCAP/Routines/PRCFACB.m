PRCFACB ;WISC/CTB/CLH-BACKGROUND BATCH PRINT CODE SHEETS ;7/14/93  08:17
V ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 N %DT,I,%,DIC,DIE,DR,DA,PRX,X,N,PBA,PBAT,PBATN,PDATE,PMO,PSN,PTR,PTECH,PTRN,PTYP,PYR,T,T1,Y,PRIOP,PMOTYP,PCOUNT,PRIO,%H,%I,B,PRCFLN,TCH,ERROR,A,C,D,D0,DI,DQ,ZTREQ
 D NOW^%DTC S PRCFKEY=%_"-"_DUZ
 S PRIOP=$O(^PRC(411,PRC("SITE"),2,"AC","S","")) D NOW^%DTC S (T2,T)=X,PMO=$E(X,1,5)_"00",PYR=$E(PMO,2,3),U="^",N=0 K ^TMP("PRCF-BATCH",$J)
 S X=PRCFASYS_" BATCH/TRANSMIT" D LOCK^PRCFALCK G:'% QUE
TRANS S (X,PRX)=PRC("SITE")_"-"_$E(PRCFASYS,1,3)_"-"_PYR D COUNTER^PRCFACP Q:Y<0  S X=PRX_"-"_$E("000"_Y,$L(Y),10) K PRX
 S (DLAYGO,DIC)=421.2,DIC(0)="MXL" D ^DIC K DLAYGO Q:Y<0  G:$P(Y,U,3)'=1 TRANS S (DA,PTRN,PRCF("TRNM"))=+Y,PTR=$P(Y,"^",2) D NOW^%DTC S DIE=DIC,DR=".5////T;.7////"_%_";.8////"_DUZ D ^DIE
 F  S N=$O(^PRCF(423,"AP",1,N)) Q:N=""  D
 .I '$D(^PRCF(423,N)) K ^PRCF(423,"AC","N",N),^PRCF(423,"AP",1,N) Q
 .I '$D(^PRCF(423,N,0)) S X=1 D ERR Q
 .S PRCF(0)=^PRCF(423,N,0) I PRCFASYS'[$P(PRCF(0),"^",10) D KILL Q
 .S PSN=$P(PRCF(0),U,2)
 .I $S('$D(PSN):1,PSN="":1,1:0) S X=5 D ERR Q
 .I PSN'=PRC("SITE") D KILL Q
 .I '$D(^PRCF(423,N,"TRANS")) S X=2 D ERR Q
 .S PRCF("T")=^PRCF(423,N,"TRANS") I $P(PRCF("T"),U,3)>T D KILL Q
 .S PMO=$P(PRCF(0),U,5)
 .I PMO="" S X=3 D ERR Q
 .S PMO="2"_$E(PMO,5,6)_$E(PMO,1,2)_"00",PTYP=$P(PRCF("T"),U,4)
 .I $S('$D(PTYP):1,PTYP="":1,1:0) S X=6 D ERR Q
 .S:$P(PRCF("T"),U,6)="" $P(PRCF("T"),U,6)="3" S PRIO=$P(PRCF("T"),U,6)
 .S ^TMP("PRCF-BATCH",$J,PMO_"-"_PTYP,PRIO,N)=""
 .S $P(PRCF("T"),"^",8)=PTR,$P(PRCF("T"),"^",10)=PRCFKEY,^PRCF(423,N,"TRANS")=PRCF("T"),^PRCF(423,"AJ",PRCFKEY,N)="" K PRCF("T")
 .K PRIO,PMO,PSN,PTYP,PBA,PBAT
 .Q
 D
 .S PMOTYP=0 F  S PMOTYP=$O(^TMP("PRCF-BATCH",$J,PMOTYP)) Q:'PMOTYP  S PMO=$P(PMOTYP,"-"),PTYP=$P(PMOTYP,"-",2) D
 ..K PRCF(PMOTYP) D BATCH^PRCFACP2 S PRCF("BTCH")=PBAT
 ..S PRCF(PMOTYP)=0,PCOUNT=$S($D(^PRCF(423.9,PTYP,0)):$P(^(0),"^",3),1:"") S:+PCOUNT=0 PCOUNT=100
 ..S PRIO=0 F  S PRIO=$O(^TMP("PRCF-BATCH",$J,PMOTYP,PRIO)) Q:'PRIO  D
 ...S DA=0 F  S DA=$O(^TMP("PRCF-BATCH",$J,PMOTYP,PRIO,DA)) Q:'DA  D
 ....S PRCF("CSDA")=DA I $D(PRCF(PMOTYP))[0 S PRCF(PMOTYP)=0 D BATCH^PRCFACP2
 ....I PRCF(PMOTYP)'<PCOUNT D:"2,12"[PTYP CREATE^PRCFACP2 D BATCH^PRCFACP2 S PRCF(PMOTYP)=0
 ....S DA=PRCF("CSDA") K PRCF("CSDA") S X=$P(^PRCF(423,DA,0),"^",5),%DT="",X=$E(X,1,2)_" "_$E(X,3,4)_" "_$E(X,5,6) D ^%DT
 ....S X=Y S:'$D(PDATE) PDATE=0 S:X>PDATE PDATE=X
 ....S PRCF("T")=^PRCF(423,DA,"TRANS"),$P(PRCF("T"),"^",5)=PBAT,$P(PRCF("T"),"^",8)=PTR,^PRCF(423,DA,"TRANS")=PRCF("T"),^PRCF(423,"AD",PBAT,DA)=""
 ....S PRCF(PMOTYP)=PRCF(PMOTYP)+1
 ....Q
 ...K PRCFK
 ...Q
 ..D:"2,12"[PTYP CREATE^PRCFACP2 K PRCFL S PRIO=0
 ..Q
 .K PRCFJ S PMOTYP=0
 .Q
 F  S N=$O(^PRCF(423,"AJ",PRCFKEY,0)) Q:N=""  D
 .S PRCF("T")=$S($D(^PRCF(423,N,"TRANS")):^("TRANS"),1:""),$P(PRCF("T"),"^",1,2)="Y^"_T,$P(PRCF("T"),"^",10)="",$P(PRCF("T"),"^",14)="",^("TRANS")=PRCF("T")
 .K ^PRCF(423,"AJ",PRCFKEY,N),^PRCF(423,"AC","N",N),^PRCF(423,"AP",1,N)
 K PRCF("T")
 D:$G(ERROR) PTE
 K %,%H,%I,DLAYGO,DP,DR,I,IOX,IOY,N,PBA,PBAT,PBATN,PDATE,PMO,PSN,PTR,PTECH,PTRN,PTYP,PYR,T,T1,Y
 F  S N=$O(^PRCF(423,"AL",PRCFKEY,0)) Q:N=""  D
 .S PRCF("T")=$S($D(^PRCF(423,N,"TRANS")):^("TRANS"),1:""),$P(PRCF("T"),"^",1,2)="N"_"^"_T2,$P(PRCF("T"),"^",12)=""
 .S ^PRCF(423,N,"TRANS")=PRCF("T") K ^PRCF(423,"AL",PRCFKEY,N) S (^PRCF(423,"AC","N",N),^PRCF(423,"AP",1,N))=""
 K PRCFKEY,T2
END S ZTREQ="@",X=PRCFASYS_" BATCH/TRANSMIT" D UNLOCK^PRCFALCK
 K ^TMP("PRCF-BATCH",$J) Q
 ;
ERR ;RECORD CODE SHEET WITH ERRORS
 S $P(^PRCF(423,N,"TRANS"),"^",14)=X,$P(^("TRANS"),"^",12)=PRCFKEY,^PRCF(423,"AL",PRCFKEY,N)="",ERROR=1
 Q
KILL ;
 K PRCF(0),PRCF("T"),PMO,PDATE,PTECH,PSN,PTYP
 Q
PTE ;print batch error listing
 S ZTIO=PRIOP,ZTRTN="PTE1^PRCFACB",ZTSAVE("PRC*")="",ZTSAVE("PRIOP")="",ZTDESC="PRINT BACTH LISTING",ZTDTH=$H D ^%ZTLOAD
 K IO("Q") Q
PTE1 S DIC="^PRCF(423,",L=0,(BY,FLDS)="[PRCFA ERROR LIST]",(FR,TO)=PRCFKEY
 S IOP=IO,ZTREQ="@" D EN1^DIP
 Q
 ;
QUE ;requeue
 S ZTSAVE("*")="",ZTRTN="^PRCFACB",ZTDESC="BACKGROUND BATCHING",ZTDTH=$H D ^%ZTLOAD
 Q
