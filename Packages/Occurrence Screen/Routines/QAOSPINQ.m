QAOSPINQ ;HISC/DAD-OCCURRENCE SCREEN PATIENT INQUIRE ;6/11/93  15:52
 ;;3.0;Occurrence Screen;;09/14/1993
 S QAQDIC="^QA(741,",QAQDIC(0)="AEMNQZ",QAQDIC("A")="Select PATIENT: "
 S QAQUTIL="QAOSPINQ" D ^QAQSELCT G:QAQQUIT EXIT
 K %ZIS,IOP S %ZIS="MNQ" W ! D ^%ZIS G:POP EXIT
 I $D(IO("Q")) K IO("Q") D  G EXIT
 . S ZTRTN="ENTSK^QAOSPINQ",ZTDESC="Occurrence Screen Patient Inquire"
 . S ZTSAVE("^UTILITY($J,")="" D ^%ZTLOAD
 . Q
ENTSK ; TASKED ENTRY POINT
 S QAOSQUIT=0,QAOSNAME="",QAOSIOST=IOST
 S QAOSIOP=ION_";"_IOST_";"_IOM_";"_IOSL
 S %X="^UTILITY($J,""QAOSPINQ"",",%Y="^TMP($J,""QAOSPINQ""," D %XY^%RCR
 F  S QAOSNAME=$O(^TMP($J,"QAOSPINQ",QAOSNAME)) Q:QAOSNAME=""!QAOSQUIT  F QAOSD0=0:0 S QAOSD0=$O(^TMP($J,"QAOSPINQ",QAOSNAME,QAOSD0)) Q:QAOSD0'>0!QAOSQUIT  D
 . S DIC="^QA(741,",BY="@NUMBER",(FR,TO)=QAOSD0,FLDS="[CAPTIONED]",L=0
 . S IOP=QAOSIOP D EN1^DIP
 . I $E(QAOSIOST)="C" K DIR S DIR(0)="E" D ^DIR S QAOSQUIT=$S(Y'>0:1,1:0)
 . Q
EXIT ;
 K %ZIS,BY,DIC,DIR,FLDS,FR,P,POP,QAOSD0,QAOSIOP,QAOSQUIT,QAQDIC,QAQQUIT
 K QAOSIOST,QAOSNAME,QAQUTIL,TO,Y,ZTDESC,ZTRTN,ZTSAVEE
 K ^TMP($J,"QAOSPINQ"),^UTILITY($J,"QAOSPINQ")
 D HOME^%ZIS S:$D(ZTQUEUED) ZTREQ="@"
 Q
