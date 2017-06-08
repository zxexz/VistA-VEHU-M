PSGWBOA ;BHAM ISC/CML-Print Backorder Report by AOU or Item (ALL Current Backorders) ; 03 Sep 93 / 12:23 PM
 ;;2.3; Automatic Replenishment/Ward Stock ;;4 JAN 94
 W !!,"This option will print a list of ALL Current Backorders.",!
ASK R !,"Do you want to sort by (A)rea of Use or by (I)tem? ",SORT:DTIME S:'$T SORT="^" G:"^"[SORT QUIT I SORT'="A"&(SORT'="I") W *7,!?5,"Enter 'A' to sort by Area of Use, 'I' to sort by Item, or '^' to Exit.",! G ASK
 W !!,"Right margin for this report is 80 columns.",!,"You may queue the report to print at a later time.",!!
DEV K %ZIS,IOP S %ZIS="QM",%ZIS("B")="" D ^%ZIS I POP W !,"NO DEVICE SELECTED OR REPORT PRINTED!" G QUIT
 I $D(IO("Q")) K IO("Q") S PSGWIO=ION,ZTIO="" K ZTSAVE,ZTDTH,ZTSK S ZTRTN="ENQ^PSGWBOA",ZTDESC="Compile data for AOU/ITEM Backorder report",ZTSAVE("PSGWIO")="",ZTSAVE("SORT")="" D ^%ZTLOAD,HOME^%ZIS K ZTSK G QUIT
 U IO
 ;
ENQ ;ENTRY POINT WHEN QUEUED
 K ^TMP("PSGWBOA",$J) F BODA=0:0 S BODA=$O(^PSI(58.3,BODA)) G:'BODA&($D(ZTQUEUED)) PRTQUE G:'BODA PRT1 I $D(^PSI(58.3,BODA,0)) S DRGDA=$P(^(0),"^") D BUILD
 ;
BUILD ;
 Q:'$D(^PSDRUG(DRGDA,0))  I '$O(^PSI(58.3,BODA,0)) S DIK="^PSI(58.3,",DA=BODA D ^DIK K DIK,DA Q
 S DNM=$S($P(^PSDRUG(DRGDA,0),"^")]"":$P(^(0),"^"),1:"UNKNOWN")
 F AOU=0:0 S AOU=$O(^PSI(58.3,BODA,1,AOU)) Q:'AOU  I $D(^(AOU,0)) F BO=0:0 S BO=$O(^PSI(58.3,BODA,1,AOU,1,BO)) Q:'BO  I $D(^(BO,0)),$P(^(0),"^",5)="" S QQ=^(0) D SETGL
 Q
SETGL ;
 S BODT=$P(QQ,"^"),CB=$P(QQ,"^",2),ANM=$S($D(^PSI(58.1,AOU,0)):$P(^(0),"^"),1:"AOU NAME MISSING") I CB>0,$D(^PSI(58.1,AOU,"I")),^("I"),^("I")'>DT S ANM=ANM_" **"
 S LOC="" I $O(^PSI(58.1,AOU,1,"B",DRGDA,0)) S ITMDA=$O(^(0)) I $D(^PSI(58.1,AOU,1,ITMDA,0)) S LOC=$P(^(0),"^",8)
 S:LOC="" LOC="UNKNOWN" I SORT="I" S ^TMP("PSGWBOA",$J,DNM,ANM,BODT)=LOC_"^"_CB Q
 S ^TMP("PSGWBOA",$J,ANM,DNM,BODT)=LOC_"^"_CB Q
 ;
PRTQUE ;AFTER DATA IS COMPILED, QUEUE THE PRINT
 K ZTSAVE,ZTIO S ZTIO=PSGWIO,ZTRTN="PRT1^PSGWBOA",ZTDESC="Print Data for Backorder AOU/Item List",ZTDTH=$H,ZTSAVE("^TMP(""PSGWBOA"",$J,")="",ZTSAVE("SORT")=""
 D ^%ZTLOAD K ^TMP("PSGWBOA",$J) G QUIT
PRT1 ;
 S $P(LN,"-",81)="",PG=0,%DT="",(S1,S2,QFLG)="" S HDT=$$PSGWDT^PSGWUTL1 D HDR
 I '$D(^TMP("PSGWBOA",$J)) W !?17,"***** NO DATA AVAILABLE FOR THIS REPORT *****" S QFLG=1 G DONE
 F LL=0:0 S TOT=0,S1=$O(^TMP("PSGWBOA",$J,S1)) Q:S1=""  D:$Y+6>IOSL PRTCHK Q:QFLG  W !!,"=> ",S1 S:S1["**" INACT=1 D PRT2 Q:QFLG
DONE D:'QFLG INACT I $E(IOST)'="C" W @IOF
 I $E(IOST)="C" D:'QFLG SS^PSGWUTL1
QUIT ;
 K %DT,%,%H,%I,BO,BODA,BODT,CB,DIC,SORT,DRGDA,ITMDA,JJ,LOC,TOT,AOU,S1,S2,HDT,INACT,LL,LN,LNS,QQ,PG,X,Y,QFLG,ANS
 K ^TMP("PSGWBOA",$J),PSGWIO,ZTSK,ZTIO,DA,DNM,ANM,HF,IO("Q") D ^%ZISC
 S:$D(ZTQUEUED) ZTREQ="@" Q
PRT2 F LL=0:0 S S2=$O(^TMP("PSGWBOA",$J,S1,S2)) D:SORT="I" TOT Q:QFLG  Q:S2=""  F BODT=0:0 S BODT=$O(^TMP("PSGWBOA",$J,S1,S2,BODT)) Q:'BODT  D DATA Q:QFLG
 Q
DATA ;
 S LOC=$P(^TMP("PSGWBOA",$J,S1,S2,BODT),"^"),CB=$P(^(BODT),"^",2),TOT=TOT+CB Q:CB<1  I $Y+6>IOSL D PRTCHK Q:QFLG
 S Y=$E(BODT,1,12) X ^DD("DD") W !?7,S2
 I SORT="A" W ?53,Y,?73,$J(CB,6),!?17,LOC Q
 W ?40,LOC,?54,Y,?73,$J(CB,6) Q
TOT ;
 S:S2["**" INACT=1 I S2="",'QFLG D:$Y+6>IOSL PRTCHK Q:QFLG  W !?72,"-------",!?66,"TOTAL:",?72,$J(TOT,7) Q
 Q
HDR ;
 S INACT=0 W:$Y @IOF S PG=PG+1
 I SORT="I" W !?25,"PHARMACY BACKORDER LIST BY ITEM",?71,"PAGE: ",PG,!?28,"PRINTED: ",HDT,!!,"=> ","ITEM",?56,"DATE/TIME FOR",?72,"CURRENT",!?12,"AOU",?42,"LOCATION",?58,"BACKORDER",?71,"BACKORDER",!,LN Q
 W !?26,"PHARMACY BACKORDER LIST BY AOU",?71,"PAGE: ",PG,!?28,"PRINTED: ",HDT,!!,"=> ","AOU",!?12,"ITEM",?56,"DATE/TIME FOR",?72,"CURRENT",!?19,"LOCATION",?58,"BACKORDER",?71,"BACKORDER",!,LN
 Q
INACT I INACT F LNS=1:1:((IOSL-$Y)-3) W !
 I  W "** Indicates an Inactive AOU"
 Q
PRTCHK ;
 D INACT I $E(IOST)="C" W !!,"Press <RETURN> to Continue or ""^"" to Exit: " R ANS:DTIME S:'$T ANS="^" D:ANS?1."?" HELP^PSGWUTL1 I ANS="^" S QFLG=1 Q
 D HDR Q
