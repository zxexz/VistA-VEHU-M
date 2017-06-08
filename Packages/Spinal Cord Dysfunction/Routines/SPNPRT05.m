SPNPRT05 ;HIRMFO/WAA- PRINT Possible New SCD/SCI Registrant ;8/29/96  15:41
 ;;2.0;Spinal Cord Dysfunction;;01/02/1997
 ;;
EN1 ; Main Entry Point
 N SPNLEXIT,SPNIO,SPNPAGE,SPNDATE,SPNEDAT,SPNCOU S SPNPAGE=1
 D EN1^SPNCMR
 S ZTSAVE("SPN*")="",ZTSAVE("^TMP($J,""SPNWC"",")=""
 D DEVICE^SPNPRTMT("PRINT^SPNPRT05","Possible new SCD Patients",.ZTSAVE) Q:SPNLEXIT
 I SPNIO="Q" D EXIT Q  ; Print was Queued
 I IO'="" D ENTSK D EXIT Q  ; Print was not Queued
 Q
EXIT ; Exit routine 
 K ^TMP($J,"SPN"),^TMP($J,"SPNPRT","AUTO"),^TMP($J,"SPNPRT","POST")
 K SPNDATE
 Q
ENTSK U IO
 D EN1^SPNCMR2,EN1^SPNCMR3
 S SPNPAGE=1,X="NOW" D ^%DT S SPNPDT=$$FMTE^XLFDT(Y,2)
 D PRINT
 Q
PRINT ; Print main Body
 U IO
 S SPNLEXIT=$G(SPNLEXIT,0) ; Ensure that the exit is set
 S SPNHLOC="" F  S SPNHLOC=$O(^TMP($J,"SPNWC","C",SPNHLOC)) Q:SPNHLOC=""  S SPNX=0 Q:SPNLEXIT  F  S SPNX=$O(^(SPNHLOC,SPNX)) Q:SPNX<1  D  Q:SPNLEXIT
 .S SPN=^TMP($J,"SPNWC",SPNX)
 .S (SPNCOU,SPNNEW)=0
 .D HEAD Q:SPNLEXIT
 .W !!,?10,$S(SPN="W":"WARD",SPN="M":"MODULE",SPN="C":"CLINIC",1:"UNKNOWN"),": ",$P(^SC(SPNX,0),U)
 .S SPNNEW=1
 .S SPNDATE=0 F  S SPNDATE=$O(^TMP($J,"SPNWC",SPNX,SPNDATE))  Q:SPNDATE=""  S (SPNFLG,SPNDFN)=0 F  S SPNDFN=$O(^TMP($J,"SPNWC",SPNX,SPNDATE,SPNDFN)) Q:SPNDFN<1  D  Q:SPNLEXIT
 .. N SPNX
 .. S (SPNLPRT)=0
 .. Q:SPNLEXIT
 .. Q:$G(^DPT(SPNDFN,0))=""  ; No Zero node
 .. S DFN=SPNDFN D DEM^VADPT
 .. I +$$GET^DDSVAL(2,SPNDFN,57.4,"","I")=0 Q  ; The patient is not SCD
 .. I $D(^SPNL(154,SPNDFN,0)) Q  ; Patient is in SCD Database
 .. D HEAD Q:SPNLEXIT
 .. D PATIENT(SPNDFN) Q:SPNLEXIT
 .. Q
 . W !!,?15,SPNCOU," Total Patients for this location."
 . Q
 I $E(IOST,1)="C" N DIR S DIR(0)="E" D ^DIR  K Y
 D CLOSE^SPNPRTMT
 K ^TMP($J,"SPN")
 Q
PATIENT(SPNDFN) ; Print Patient data
 Q:SPNLEXIT
 N SPNETI,SPNZZ
 S DFN=SPNDFN,SPNETI=0,SPNCOU=SPNCOU+1
 D DEM^VADPT
 S DFN=SPNDFN
 D INP^VADPT
 W !,$E(VADM(1),1,24)," ",$P(VADM(2),U,2),?40,$$FMTE^XLFDT($P(VAIN(7),U),"2D"),?54,$E($$GET^DDSVAL(2,.SPNDFN,57.4,"","E"),1,25)
 Q
HEAD ; Header Print
 I SPNNEW Q:$Y<(IOSL-4)
 I $E(IOST,1)="C" D  Q:SPNLEXIT
 .I SPNPAGE=1 W @IOF Q
 .I SPNPAGE'=1 D  Q:SPNLEXIT
 ..N DIR S DIR(0)="E" D ^DIR
 ..I 'Y S SPNLEXIT=1
 ..E  W @IOF
 ..K Y
 ..Q
 .Q
 Q:SPNLEXIT
 W !,$$FMTE^XLFDT($$NOW^XLFDT,1),?70,"Page: ",SPNPAGE
 W !,?18,"Listing of NEW SCD/SCI Patients" W:$D(SPNDATE) " Since ",$$FMTE^XLFDT(SPNDATE,1)
 I SPNSEL["1" S SPNTL="CURRENT INPATIENTS"
 I SPNSEL["2" S SPNTL=$S(SPNTL="":"OUTPATIENTS",1:SPNTL_" / OUTPATIENTS")
 I SPNSEL["3" S SPNTL=$S(SPNTL="":"NEW ADMISSIONS",1:SPNTL_" / NEW ADMISSIONS")
 W !,?(40-($L(SPNTL)/2)),SPNTL
 I (SPNSEL["2"!(SPNSEL["3")) W !,?22,"FROM ",$$FMTE^XLFDT(SPNST,2),?43,"TO ",$$FMTE^XLFDT(SPNED,2)
 W !,"Patient",?35,"Date of ADMISSION",?54,"SCD flag"
 W !,$$REPEAT^XLFSTR("-",79)
 S SPNPAGE=SPNPAGE+1
 I $D(ZTQUEUED) S:$$STPCK^SPNPRTMT SPNLEXIT=1
 Q
