ECXUPRO ;ALB/TJL-Prosthetic Extract Unusual Cost Report ;4/15/15  15:54
 ;;3.0;DSS EXTRACTS;**49,111,144,148,149,154**;Dec 22, 1997;Build 13
 ;
EN ; entry point
 N X,Y,DATE,ECRUN,ECXDESC,ECXSAVE,ECXTL,ECTHLD,ECXPORT,CNT ;144
 N ECINST,ECSD,ECSD1,ECSTART,ECED,ECEND,ECXERR,QFLG
 S QFLG=0
 S ECINST=$$PDIV^ECXPUTL
 ; get today's date
 D NOW^%DTC S DATE=X,Y=$E(%,1,12) D DD^%DT S ECRUN=$P(Y,"@") K %DT
 D BEGIN Q:QFLG
 D SELECT Q:QFLG
 S ECXPORT=$$EXPORT^ECXUTL1 Q:ECXPORT=-1  I ECXPORT D  Q  ;144
 .K ^TMP($J) ;144
 .S ^TMP($J,"ECXPORT",0)="NAME^SSN^DATE OF SERVICE^FORM^FORM DESCRIPTION^PSAS HCPCS CODE^FEEDER KEY^QUANTITY^COST OF TRANSACTION^TRANSACTION TYPE" ;144,149,154
 .S CNT=1 ;144
 .D PROCESS ;144
 .D EXPDISP^ECXUTL1 ;144
 ;device selection
 S ECXDESC="Prosthetic Extract Unusual Cost Report"
 S ECXSAVE("EC*")=""
 W !!,"This report requires 132-column format."
 D EN^XUTMDEVQ("PROCESS^ECXUPRO",ECXDESC,.ECXSAVE)
 I POP W !!,"No device selected...exiting.",! Q
 I IO'=IO(0) D ^%ZISC
 D HOME^%ZIS
 D AUDIT^ECXKILL
 Q
 ;
BEGIN ; display report description
 W @IOF
 W !,"This report prints a listing of unusual costs that would be"
 W !,"generated by the Prosthetic extract (PRO) as determined by a"
 W !,"user-defined threshold value.  It should be run prior to the"
 W !,"generation of the actual extract(s) to identify and fix, as"
 W !,"necessary, any costs determined to be erroneous."
 W !!,"Unusual costs are those where the Cost of Transaction is"
 W !,"greater than the threshold value."
 W !!,"Note: The threshold can be set after a report is selected."
 W !!,"Run times for this report will vary depending upon the size of"
 W !,"the extract and could take as long as 30 minutes or more to"
 W !,"complete.  This report has no effect on the actual extracts and"
 W !,"can be run as needed."
 W !!,"The report is sorted by Feeder Key, then by descending Cost of"
 W !,"Transaction and SSN."
 W !!,"**NOTE: The feeder key on this report will match what appears in DSS.",!,"However, the feeder key on the report will be different than the feeder",!,"key on the PRO extract." ;149
 S DIR(0)="E" W ! D ^DIR K DIR I 'Y S QFLG=1 Q
 W:$Y!($E(IOST)="C") @IOF,!!
 Q
 ;
SELECT ; user inputs for threshold cost and date range
 N DONE,OUT
 ; allow user to set threshold cost
 S ECTHLD=500
 W !!,"The default threshold cost for the Prosthetic extract is $"_ECTHLD_".00."
 S DIR(0)="Y",DIR("A")="Would you like to change the threshold?",DIR("B")="NO" D ^DIR K DIR I X["^" S QFLG=1 Q
 I Y D
 .W !!,"Cost > threshold"
 .S DIR(0)="N^0:999999",DIR("A")="Enter the new threshold cost" D ^DIR K DIR S ECTHLD=Y I X["^" S QFLG=1 Q
 ; get date range from user
 W !!,"Enter the date range for which you would like to scan the Prosthetic",!,"Extract records.",!
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
 S ECXERR=0 D EN^ECXUPRO1 Q:ECXERR
 S QFLG=0 D PRINT
 Q
 ;
PRINT ; process temp file and print report
 N PG,QFLG,GTOT,LN,COUNT,FKEY,COST,SSN,REC,SDAY,I ;144
 U IO
 I $D(ZTQUEUED),$$S^%ZTLOAD S ZTSTOP=1 K ZTREQ Q
 S (PG,QFLG,GTOT)=0,$P(LN,"-",132)=""
 I '$G(ECXPORT) D HEADER Q:QFLG  ;144
 S COUNT=0,FKEY=""
 F  S FKEY=$O(^TMP($J,FKEY)) Q:FKEY=""!QFLG  D
 .S COST="" F  S COST=$O(^TMP($J,FKEY,COST)) Q:COST=""!QFLG  D
 .. S SDAY="" F  S SDAY=$O(^TMP($J,FKEY,COST,SDAY)) Q:SDAY=""!QFLG  D
 ...S SSN="" F  S SSN=$O(^TMP($J,FKEY,COST,SDAY,SSN)) Q:SSN=""!QFLG  S REC=^(SSN)  D
 ....I $G(ECXPORT) S ^TMP($J,"ECXPORT",CNT)=REC,CNT=CNT+1 Q  ;144
 ....S COUNT=COUNT+1
 ....I $Y+3>IOSL D HEADER Q:QFLG
 ....W !,$P(REC,U),?8,$P(REC,U,2),?21,$P(REC,U,3),?39,$P(REC,U,4),?45,$P(REC,U,5),?70,$P(REC,U,6),?93,$$RJ^XLFSTR($P(REC,U,7),8),?110,$$RJ^XLFSTR($P(REC,U,8),11),?127,$P(REC,U,9) ;149,154
 Q:QFLG!($G(ECXPORT))  ;144
 I COUNT=0 W !!,?8,"No unusual costs to report for this extract"
 I COUNT W ! D FOOTER^ECXPROCT ;154 Print key to forms if report had data
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
 W !,"Prosthetic Extract Unusual Cost Report",?124,"Page: "_PG
 W !,"Start Date: ",ECSTART,?97,"Report Run Date/Time: "_ECRUN
 W !,"  End Date: ",ECEND,?97,"     Threshold Value: ",ECTHLD
 W !!,?21,"Date of",?45,"PSAS",?112,"Cost of",?126,"Tran" ;149,154
 W !,"Name",?11,"SSN",?21,"Service",?39,"FORM",?45,"HCPCS CODE" ;149,154
 W ?70,"Feeder Key",?93,"Quantity",?110,"Transaction",?126,"Type" ;149
 W !,LN,!
 Q
 ;
