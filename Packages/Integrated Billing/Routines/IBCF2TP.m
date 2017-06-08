IBCF2TP ;ALB/RLW - HCFA 1500 12-90 TEST PATTERN ; 1-JAN-92
 ;;2.0;INTEGRATED BILLING;**488**;21-MAR-94;Build 184
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
ZIS ;
 ;***
 ;S XRTL=$ZU(0),XRTN="IBCF2TP-1" D T0^%ZOSV ;start rt clock
 ;S DGPGM="PRINT^IBCF2TP",DGVAR="^" D ZIS^DGUTQ I POP G Q
 S %ZIS="QM" D ^%ZIS G:POP Q
 I $D(IO("Q")) K IO("Q") S ZTRTN="PRINT^IBCF2TP",ZTDESC="IB - TEST HCFA 1500 PRINT" D ^%ZTLOAD K ZTSK D HOME^%ZIS G Q
 U IO
 D PRINT
Q K DGPGM,DGVAR,POP,IBADDM
 ;***
 ;I $D(XRT0) S:'$D(XRTN) XRTN="IBCF2TP" D T1^%ZOSV ;stop rt clock
 Q
PRINT ; print test pattern
 ;***
 ;I $D(XRT0) S:'$D(XRTN) XRTN="IBCF2TP" D T1^%ZOSV ;stop rt clock
 ;S XRTL=$ZU(0),XRTN="IBCF2TP-2" D T0^%ZOSV ;start rt clock
 N X S X=""
CARRIER ;
 S IBADDM=+$P($G(^IBE(350.9,1,1)),U,27)
 W:$E(IOST,1,2)["C-" @IOF W !,?IBADDM,"INSURANCE CARRIER NAME",!?IBADDM,"CARRIER ADDRESS LINE 1",!?IBADDM,"CARRIER ADDRESS LINE 2",!?IBADDM,"CARRIER ADDRESS LINE 3",!?IBADDM,"CARRIER CITY, STATE ZIP"
LINE2 W !!!,X,?7,X,?14,X,?23,X,?30,X,?38,X,?44,X,?49,"SUBSCRIBER ID#"
LINE4 W !!,"PATIENT NAME",?30,"MM DD YY",?41,X,?46,X,?49,"INSURED'S NAME"
LINE6 W !!,"PATIENT ADDRESS STREET",?32,X,?37,X,?41,X,?46,X,?49,"INSURED'S ADDRESS STREET"
LINE8 W !!,"PATIENT ADDRESS CITY",?25,"ST",?49,"INSURED'S ADDRESS CITY",?73,"ST"
LINE10 W !!,"PT ZIP CODE",?14,"999",?18,"999-9999",?49,"INS ZIP CODE",?64,"999",?68,"999-9999"
LINE12 W !!,"OTHER INSURED'S NAME",?49,"INSURED'S POLICY GROUP"
LINE14 W !!,?34,X,?40,X,?53,"MM DD YY",?67,X,?74,X
LINE16 W !!,?1,"MM DD YY",?17,X,?23,X,?34,X,?40,X,?44,"ST",?49,"INSURED'S EMPLOYER"
LINE18 W !!,?34,X,?40,X,?49,"Y4  PROP/CASUALTY #"
LINE20 W !!,"OTHER'S INSURANCE PLAN",?51,X,?56,X
LINE26 W !!!!!!,?1,"MM DD YY",?36,"MM DD YY",?53,"MM DD YY",?67,"MM DD YY"
LINE28 W !!,"XX",?4,"REFERRING PHYSICIAN",?27,"PHYSICIAN ID",?53,"MM DD YY",?67,"MM DD YY"
LINE31 W !,?40,9
LINE32 W !,?2,"X99999",?15,"X99999",?28,"X99999",?40,"X99999"
LINE34 W !,?2,"X99999",?15,"X99999",?28,"X99999",?40,"X99999"
LINE35 W !,?2,"X99999",?15,"X99999",?28,"X99999",?40,"X99999"
LINE38 ;lines 38,40,42,44,46,48 all the same
 W !!
 F I=1:1:6 W !!,"MM DD YY",?9,"MM DD YY",?18,X,?21,X,?25,"CPT",?32,"MODIF",?41,"DIAG",?50,"9999.99",?58,X,?61,X,?64,X,?67,X,?70,"BC/BS#"
LINE50 W !!,"FEDERAL TAX ID",?18,X,?22,"PAT ACCT#",?37,X,?42,X,?52,"9999.99",?62,"9999.99"
LINE52 W !!,?22,"VAMC",?49,"AGENT CASHIER  (999) 999-9999"
LINE53 W !,?22,"STREET ADDRESS",?49,"STREET ADDRESS"
LINE54 W !,?22,"CITY, STATE ZIP",?49,"CITY, STATE ZIP"
 I $D(ZTQUEUED) S ZTREQ="@" Q
 D ^%ZISC
 ;***
 ;I $D(XRT0) S:'$D(XRTN) XRTN="IBCF2TP" D T1^%ZOSV ;stop rt clock
 Q
