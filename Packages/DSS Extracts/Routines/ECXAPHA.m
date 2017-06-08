ECXAPHA ;ALB/TMD-Pharmacy Extracts Unusual Volumes/Costs Report ;3/4/15  11:52
 ;;3.0;DSS EXTRACTS;**40,49,66,104,109,113,136,144,154**;Dec 22, 1997;Build 13
 ;
EN ; entry point
 N X,Y,DATE,ECRUN,ECXOPT,ECXDESC,ECXSAVE,ECXTL,ECTHLD,ECSD
 N ECSD1,ECSTART,ECED,ECEND,ECXERR,QFLG,ECXISIG,FYVER,ECXBCM,ECXPORT,CNT ;144
 S QFLG=0
 ; get today's date
 D NOW^%DTC S DATE=X,Y=$E(%,1,12) D DD^%DT S ECRUN=$P(Y,"@") K %DT
 D BEGIN Q:QFLG
 D SELECT Q:QFLG!($G(FYVER)=-1)  ;144 Quit if selections not made for report
 I '$G(ECXCOST) I ECXOPT=2 I FYVER'="" D @(FYVER) Q  ;144 Run previous version of routine and quit if it's the volume report
 S ECXPORT=$$EXPORT^ECXUTL1 Q:ECXPORT=-1  I ECXPORT D  Q  ;144
 .K ^TMP($J) ;144
 .S ^TMP($J,"ECXPORT",0)="NAME^SSN^DAY^GENERIC NAME^FEEDER KEY^"_$S(ECXOPT=1!(ECXOPT=3):"QUANTITY",ECXOPT=2:"TOTAL DOSES PER DAY",1:"COMPONENT DOSE GIVEN")_"^TOTAL COST"_$S(ECXOPT=1:"^DAYS SUPPLY",ECXISIG:"^SIG",1:"") ;144
 .S CNT=1 ;144
 .D PROCESS ;144
 .D EXPDISP^ECXUTL1 ;144
 .D AUDIT^ECXKILL ;144
 S ECXDESC=ECXTL_" Extract Unusual"_$S($G(ECXCOST):" Cost",1:" Volume")_" Report" ;144
 S ECXSAVE("EC*")=""
 W !!,"This report requires 132-column format."
 D EN^XUTMDEVQ("PROCESS^ECXAPHA",ECXDESC,.ECXSAVE)
 I POP W !!,"No device selected...exiting.",! Q
 I IO'=IO(0) D ^%ZISC
 D HOME^%ZIS
 D AUDIT^ECXKILL
 Q
 ;
BEGIN ; display report description
 W @IOF
 W !,"This report prints a listing of unusual ",$S('$G(ECXCOST):"volumes",1:"costs")," that would be" ;144
 W !,"generated by the pharmacy extracts (PRE, IVP"_$S('$G(ECXCOST):", UDP and BCM)",1:" and UDP)")_" as" ;154 Don't show BCM if cost report
 W !,"determined by a user defined threshold value.  It should be run" ;144 Corrected spelling of should
 W !,"prior to the generation of the actual extract(s) to identify and"
 W !,"fix as necessary any ",$S('$G(ECXCOST):"volumes",1:"costs")," determined to be erroneous." ;144
 I '$G(ECXCOST) D  ;144
 .W !!,"Unusual volumes are defined as follows:" ;144
 .W !!,"PRE Extract:  Quantity field greater than the threshold value." ;144
 .W !,"IVP Extract:  Total Doses Per Day field greater than the threshold" ;144
 .W !,?14,"or less than the negative of the threshold value." ;144
 .W !,"UDP Extract:  Quantity field greater than threshold value." ;144
 .W !,"BCM Extract:  Component Dose Given field greater than threshold value." ;144
 W !!,"Note: The threshold can be set after a report is selected."
 W !!,"Run times for this report will vary depending upon the size of"
 W !,"the extract and could take as long as 30 minutes or more to"
 W !,"complete.  This report has no effect on the actual extracts and"
 W !,"can be run as needed."
 W !!,"The report is sorted by Feeder Key, Descending ",$S('$G(ECXCOST):"Volume",1:"Cost"),", and SSN."
 S DIR(0)="E" W ! D ^DIR K DIR I 'Y S QFLG=1 Q
 W:$Y!($E(IOST)="C") @IOF,!!
 Q
 ;
SELECT ; user inputs for report option, threshold volume/cost and date range
 N DONE,OUT,DIR,X,Y,DTOUT,DUOUT,DIRUT,DIROUT ;144
 S ECXISIG=0,ECXBCM="" ;144
 ; allow user to select report option (PRE,IVP,UDP or BCM if volume report)
 W "Choose the report you would like to run."
 S DIR(0)="S^1:PRE;2:IVP;3:UDP"_$S('$G(ECXCOST):";4:BCM",1:""),DIR("A")="Selection",DIR("B")=1 D ^DIR K DIR S ECXOPT=Y I X["^" S QFLG=1 Q  ;154 Only show BCM if volume report
 I '$G(ECXCOST) I ECXOPT=2 S FYVER=$$REPORTFY^ECXUTL1("RXUNVOL") Q:FYVER=-1  ;144 Which version of report should be run for volume report?
 I ECXOPT=4 D  Q:$G(QFLG)  ;144
 .S DIR(0)="S^I:IV;N:NON-IV",DIR("A")="Select type of BCM record",DIR("?",1)="BCM contains both IV and NON-IV records.  Select which type of",DIR("?")="record to check against the threshold." ;144
 .D ^DIR S:$D(DIRUT) QFLG=1 I '$G(QFLG) S ECXBCM=Y ;144
 S ECXTL=$S(ECXOPT=1:"Prescription",ECXOPT=2:"IV Detail",ECXOPT=3:"Unit Dose Local",ECXOPT=4:"BCM-"_$S(ECXBCM="N":"NON ",1:"")_"IV Entries",1:"") ;144
 ; allow user to set threshold volume/cost
 I '$G(ECXCOST) S ECTHLD=$S(ECXOPT=2!(ECXOPT=4&(ECXBCM="I")):1000,ECXOPT=4&(ECXBCM="N"):5,1:500) ;144
 I $G(ECXCOST) S ECTHLD=$S(ECXOPT=2!(ECXOPT=4&(ECXBCM="I")):100,ECXOPT=3!(ECXOPT=4&(ECXBCM="N")):20,1:50) ;144
 W !!,"The default threshold ",$S('$G(ECXCOST):"volume",1:"cost")," for the ",ECXTL," extract is ",$S($G(ECXCOST):"$",1:""),ECTHLD,"." ;144
 S DIR(0)="Y",DIR("A")="Would you like to change the threshold",DIR("B")="NO" D ^DIR K DIR I X["^" S QFLG=1 Q
 I Y D
 .I '$G(ECXCOST) W !!,$S(ECXOPT=2:"threshold > Total Doses Per Day < -threshold",ECXOPT=4:"Component Dose Give > Threshold",1:"Quantity > threshold") ;144
 .S DIR(0)="N^0:100000:0",DIR("A")="Enter the new threshold "_$S('$G(ECXCOST):"volume",1:"cost") D ^DIR K DIR S ECTHLD=Y I X["^" S QFLG=1 Q  ;144
 ; check to see if SIG should be place on the sec line of rpt cvw - *136 
 I ECXOPT=3!(ECXOPT=4&(ECXBCM="N")) S DIR(0)="Y",DIR("A")="Include SIG/Order Direction on line 2 of report",DIR("B")="NO" D ^DIR K DIR S:Y ECXISIG=1 I X["^" S QFLG=1 Q  ;144
 ; get date range from user
 W !!,"Enter the date range for which you would like to scan the ",ECXTL,!,"Extract records."
 S DONE=0 F  S (ECED,ECSD)="" D  Q:QFLG!DONE
 .K %DT S %DT="AEX",%DT("A")="Starting with Date: ",%DT(0)=-DATE D ^%DT
 .I Y<0 S QFLG=1 Q
 .S ECSD=Y,ECSD1=ECSD-.1
 .D DD^%DT S ECSTART=Y
 .K %DT S %DT="AEX",%DT("A")="Ending with Date: ",%DT(0)=-DATE D ^%DT
 .I Y<0 S QFLG=1 Q
 .I Y<ECSD D  Q
 ..W !!,"The ending date cannot be earlier than the starting date."
 ..W !,"Please try again.",!!
 .I $E(Y,1,5)'=$E(ECSD,1,5) D  Q
 ..W !!,"Beginning and ending dates must be in the same month and year."
 ..W !,"Please try again.",!!
 .S ECED=Y
 .D DD^%DT S ECEND=Y
 .S DONE=1
 Q
 ;
PROCESS ; entry point for queued report
 S ZTREQ="@"
 S ECXERR=0 D EN^ECXAPHA2 Q:ECXERR
 S QFLG=0 D PRINT
 Q
 ;
PRINT ; process temp file and print report
 N PG,QFLG,GTOT,LN,COUNT,FKEY,QTY,SSN,REC,EDAY,ECXCOUNT
 U IO
 I $D(ZTQUEUED),$$S^%ZTLOAD S ZTSTOP=1 K ZTREQ Q
 S (PG,QFLG,GTOT)=0,$P(LN,"-",132)=""
 I '$G(ECXPORT) D HEADER Q:QFLG  ;144
 S COUNT=0,FKEY="" F  S FKEY=$O(^TMP($J,FKEY)) Q:FKEY=""!QFLG!(FKEY="ECXPORT")  D  ;144
 .S QTY="" F  S QTY=$O(^TMP($J,FKEY,QTY)) Q:QTY=""!QFLG  D
 ..S EDAY="" F  S EDAY=$O(^TMP($J,FKEY,QTY,EDAY)) Q:EDAY=""!QFLG  D
 ...S ECXCOUNT="" F  S ECXCOUNT=$O(^TMP($J,FKEY,QTY,EDAY,ECXCOUNT)) Q:ECXCOUNT=""!QFLG  D
 ....S SSN=""
 ....F  S SSN=$O(^TMP($J,FKEY,QTY,EDAY,ECXCOUNT,SSN)) Q:SSN=""!QFLG  S REC=^(SSN)  D
 .....I $G(ECXPORT) D  Q  ;144
 ......S ^TMP($J,"ECXPORT",CNT)=$P(REC,U)_U_$P(REC,U,2)_U_$P(REC,U,3)_U_$P(REC,U,4)_U_$P(REC,U,5)_U_$P(REC,U,6)_" "_$P(REC,U,7)_U_$P(REC,U,8)_$S(ECXOPT=1:(U_$P(REC,U,9)),ECXISIG:(U_$S($P(REC,U,10)="":"N/A",1:$P(REC,U,10))),1:"") ;144
 ......S CNT=CNT+1 ;144
 .....S COUNT=COUNT+1
 .....I $Y+3>IOSL D HEADER Q:QFLG
 .....W !,$P(REC,U),?8,$P(REC,U,2),?20,$P(REC,U,3),?29,$E($P(REC,U,4),1,40)
 .....W ?71,$P(REC,U,5),?89,$$RJ^XLFSTR($P(REC,U,6),9)_" "_$E($P(REC,U,7),1,7)
 .....I ECXOPT=1 D
 ......W ?108,$$RJ^XLFSTR($P(REC,U,8),12),?125,$$RJ^XLFSTR($P(REC,U,9),3)
 .....I ECXOPT'=1 D
 ......W ?116,$$RJ^XLFSTR($P(REC,U,8),14)
 .....I $G(ECXISIG) D  ;144
 ......W !,?5,"SIG: ",$S($P(REC,U,10)="":"N/A",1:$P(REC,U,10)),! ;136
 Q:QFLG!($G(ECXPORT))  ;144
 I COUNT=0 W !!,?8,"No unusual ",$S('$G(ECXCOST):"volumes",1:"costs")," to report for this extract" ;144
CLOSE ;
 I $E(IOST)="C",'QFLG D
 .S SS=22-$Y F JJ=1:1:SS W !
 .S DIR(0)="E" W ! D ^DIR K DIR
 Q
 ;
HEADER ;header and page control
 N SS,JJ
 I $E(IOST)="C" D
 .S SS=22-$Y F JJ=1:1:SS W !
 .I PG>0 S DIR(0)="E" W ! D ^DIR K DIR S:'Y QFLG=1
 Q:QFLG
 W:$Y!($E(IOST)="C") @IOF S PG=PG+1
 W !,ECXTL_" Extract Unusual ",$S('$G(ECXCOST):"Volume",1:"Cost")," Report",?124,"Page: "_PG ;144
 W !,"Start Date: ",ECSTART,?97,"Report Run Date/Time:  "_ECRUN
 W !,"End Date:   ",ECEND,?97,"Threshold Value = ",$S($G(ECXCOST):"$",1:""),ECTHLD ;144
 W !!,"Name",?11,"SSN",?21,"Day",?29,"Generic Name",?71,"Feeder Key"
 I ECXOPT=1 W ?95,"Quantity",?109,"Total Cost",?120,"Days Supply" ;144 Combined lines
 I ECXOPT=2 W ?93,"Total Doses",?121,"Total Cost",!,?95,"Per Day" ;144
 I ECXOPT=3 W ?96,"Quantity",?121,"Total Cost" ;144
 I ECXOPT=4 W ?89,"Component Dose Given",?121,"Total Cost" ;144
 W !,LN,!
 Q
 ;
SIG(ORDNO,PATNO) ;Get ordering instructions for unit dose order.  API added in patch 136
 N DATA,RECNO,I,SIG
 S SIG=""
 I ORDNO=""!(PATNO="") Q SIG
 S RECNO=ORDNO_","_PATNO_","
 D GETS^DIQ(55.06,RECNO,"26;120;121","E","DATA")
 F I=120,121,26 S SIG=$G(SIG)_$S($L(SIG)>0:" ",1:"")_$G(DATA(55.06,RECNO,I,"E"))
 Q SIG
 ;
COST ;Section added in 144, entry point for unusual cost report
 N ECXCOST
 S ECXCOST=1
 D EN
 Q
