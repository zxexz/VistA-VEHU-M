NURSAGSP ;HIRMFO/MD-GENERIC SORT BY PROMPTS ;7/24/97
 ;;4.0;NURSING SERVICE;**3**;Apr 25, 1997
 ; ROUTINE THAT GIVES VARIOUS SORT BY PROMPTS FOR ADMIN REPORTS.
 ;
EN1 ; ENTRY FOR WARD SELECTION PROMPT
 S NURSZ=$$MDIC^NURSAGS0
 I NURSZ'>0 S NUROUT=1 Q
 Q
EN2 ; ENTRY FOR SERVICE POSITION PROMPT
 S NURSER=0,DIC("A")="Select SERVICE POSITION (Press return for all service positions): " S:$D(NRNS) DIC("S")="I $P(^(0),U,5)=""R"""
 S DIC="^NURSF(211.3,",DIC(0)="AEMQ" D ^DIC K DIC I '$D(DTOUT),X="" S NURSER=1 Q
 I $D(DTOUT)!(+Y'>0) S NUROUT=1 Q
 S NPOS=$P(Y,"^",1)
 Q
EN3 ; ENTRY FOR SERVICE CATEGORY PROMPT
 W ! S NURCAT=0 D EN1^NURSAGP3 I $G(DUOUT)!($G(DTOUT)) S NUROUT=1 Q
 S ZTSAVE("^TMP(""NURSCAT"",$J,")=""
 Q
EN5 ; ENTRY FOR FACILITY/SERVICE SELECTION WITH AUTHORIZATION CHECKS
 ; IF THE USER HOLDS AN AMIS POSITION OF HEAD NURSE OR LOWER
 ; THEY CAN ONLY SEE DATA ASSOCIATED WITH THEIR FACILITY(IES)
 W ! S DIC=213.2,DIC("A")="Select FACILITY"_$S(NURSZAP'>7!('NURSZAP):" (Press return for "_$S(NURSZAP'=7:"all facilities",1:"your facilities")_")",1:"")_": "
 I NURSZAP S:NURSZAP>6 DIC("S")="S YY=+^NURSA(213.2,Y,0) I $D(NURSZFAC($P(^DIC(4,+YY,0),U)))" I NURSZAP>7 S NURFAC("D")=$O(NURSZFAC("")) K DIC("B") S:NURFAC("D")'="" DIC("B")=NURFAC("D")
 S NURFAC=0,DIC="^NURSA(213.2,",DIC(0)="AEQZ" D ^DIC K DIC I '$D(DTOUT),$G(X)="" S NURFAC=1 G PRD
 I '$D(DTOUT),$G(X)="" W:NURSZAP<6 !,$C(7),?5,"PROPER ACCESS REQUIRED TO PRINT ALL LOCATIONS" G:NURSZAP>6 EN5 S NURFAC=1 Q
 I $D(DTOUT)!(+Y'>0) S NUROUT=1 Q
 S NURFAC(1)=$G(Y(0,0))
PRD I $G(NURPLSW) W ! D EN6^NURSAGSP
 Q
EN6 ; ENTRY FOR PRODUCT LINE PROMPT
 S DIC("A")="Select PRODUCT LINE (Press return for all product lines): "
 S NURPROG=0,DIC="^NURSF(212.7,",DIC(0)="AEMQZ"
 I "^0^1^"[("^"_$G(NURPLSCR)_"^") S DIC("S")="I $D(^NURSF("_$S(NURPLSCR:211.4,1:211.3)_",""P"",Y))"
 D ^DIC K DIC I '$D(DTOUT),X="" S NURPROG=1 Q
 I $D(DTOUT)!(+Y'>0) S NUROUT=1 Q
 S NURPROG(1)=Y(0,0)
 Q
EN8 ; ENTRY FOR BASIC FACILITY SELECTION WITH NO AUTHORIZATION CHECKS
 Q:$P($G(^DIC(213.9,1,0)),U,9)'="Y"
 S DIC("A")="Select FACILITY (Press return for all facilities): "
 S NURFAC=0,DIC="^NURSA(213.2," D ^DIC K DIC I '$D(DTOUT),$G(X)="" S NURFAC=1 Q
 I $D(DTOUT)!(+Y'>0) S NUROUT=1 Q
 S NURFAC(1)=$G(Y(0,0))
 Q
EN9 ; CONSOLIDATED FACILITY/MULTIPLE PROGRAM OFFICE CHECKS
 I $D(NURMDSW),$P($G(^DIC(213.9,1,0)),U,9)="Y" S NURMDSW=1
 I $D(NURPLSW),$P($G(^DIC(213.9,1,0)),U,8)="Y" S NURPLSW=1
 Q
EN10 ; STATE FILE LOOK-UP
 K NSTAT S NSTAT=0,DIC("A")="Select STATE (Press return for all states): ",DIC(0)="AEQMZ",DIC="^DIC(5," D ^DIC K DIC I '$D(DTOUT),X="" S NSTAT=1 Q
 I $D(DTOUT)!(+Y'>0) S NUROUT=1 Q
 S NSTAT(1)=+Y
 Q
EN11 ; Summary/Full report selection
 S DIR("A")="Select Reporting Option: ",DIR("A",1)="",DIR("A",2)="1. Summary Report",DIR("A",3)="",DIR("A",4)="2. Full Report.",DIR("A",5)="",DIR(0)="NA^1:2" D ^DIR K DIR I $G(DIRUT) S NUROUT=1 Q
 I X=1 S NURSUMSW=1
 Q
EN12 ; Multi-Divisional Summary/Full report selection
 S DIR("A")="Select Reporting Option: ",DIR("A",1)="",DIR("A",2)="1. Multi-Divisional Summary Report.",DIR("A",3)="",DIR("A",4)="2. Detailed Multi-Divisional Report.",DIR("A",5)="",DIR(0)="NA^1:2" D ^DIR K DIR I $G(DIRUT) S NUROUT=1 Q
 I X=1 S NURSUMSW=1
 Q
EN13 ; Location/Service Category sort selection
 S DIR("A")="Sort By: ",DIR("A",1)="",DIR("A",2)="1. Unit",DIR("A",3)="",DIR("A",4)="2. Service Category",DIR("A",5)="",DIR(0)="NA^1:2" D ^DIR K DIR I $G(DIRUT) S NUROUT=1
 S NURSEL(1)=X
 Q
