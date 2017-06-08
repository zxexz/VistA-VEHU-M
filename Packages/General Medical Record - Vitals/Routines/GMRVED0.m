GMRVED0 ;HIRMFO/RM,YH,FT-VITAL SIGNS EDIT SHORT FORM ;6/13/01  15:44
 ;;4.0;Vitals/Measurements;**7,9,13**;Apr 25, 1997
 ;
 ; This routine uses the following IAs:
 ; #1380   ^DG(405.4        (controlled)
 ; #10035  ^DPT("CN"        (supported)
 ; #10039  ^DIC(42          (supported)
 ; #10040  ^SC(             (supported)
 ; #10061  ^VADPT APIs      (supported)
 ;
EN2 ; DETERMINE VITALS SITE
 Q:GMRENTY<1!(GMRENTY>21)  K GMRTMP S GMROUT=0,GMRVIDT(0)=0 I $D(GMRVDBA) S GMRVIDT=$P(GMRVDBA,U,2),GMROUT=$P(GMRVDBA,U)
 I '($D(GMRVIDT)#2) S GMRVIDT(0)=1 D DATE^GMRVED0 I GMROUT K GMROUT Q
 S GMROUT=0,GMRVWLOC=1,GDT(1)=GMRVIDT D WARDPAT G:GMROUT Q
A2 ;
 I $G(GMRSTR)="" D
 . S GMRSTR=$S(GMRENTY=1:"T;P;R;PN;",GMRENTY=2:"T;P;R;BP;PN;",GMRENTY=3:"T;P;R;BP;HT;WT;PN;",1:"")
 . I GMRSTR="" S GMRSTR=$S(GMRENTY=4:"T;P;R;BP;WT;PN;",GMRENTY=5:"T;P;R;BP;",GMRENTY=6:"BP;P;",GMRENTY=7:"P;",GMRENTY=8:"WT;",GMRENTY=19:"CG;",GMRENTY=20:"PO2;",GMRENTY=21:"CVP;",1:"")
 I GMRENTY=18 S GMRSTR="PN"
 Q:GMRSTR=""
A3 ;
 I "P1p"[GMREDB S GDT=GMRVIDT D EN1^GMRVADM G:GMROUT Q S GMRDT0=GMRVIDT D EN2^GMRVED3 G:GMROUT!(GMREDB="P1") Q D MULTIVM W !! S GMRVIDT=GDT(1) D PATDAT G Q:GMROUT,A3
 I "Aa"[GMREDB D EN1^GMRVED2,EN2^GMRVED2 G Q
 I "Ss"[GMREDB D EN3^GMRVED6,EN1^GMRVED2,EN2^GMRVED2 G Q
 Q
EN3 ; CALL IF DFN TO EDIT SINGLE PATIENT VITALS WHERE
 ; INPUT : DFN= PT FILE PTR.
 ;                  GMRSTR=STRING OF VITALS TO EDIT
 ;                  where T=Temp, P=Pulse, R=Resp, B=BP,H=Ht., W=Wt.
 ;                  GMRVHLOC=HOSP. LOCATION (PTR TO FILE 44)
 ;                  GMRVIDT=DATE/TIME VITALS TAKEN
 ; OUPTUT : GMRVIEN(GMRVTY)=120.5 ENTRY^GMRVREAD^GMRVSITE
 ;                   where GMRVTY is the vital type see codes above
 ;                   GMRVREAD = READING FOR THIS VITAL TYPE
 ;                   GMRVSITE = PTR TO GMR VITALS SITE FILE
 ;                   GMROUT WILL BE 1 IF ABNORMAL EXIT, ELSE 0
 Q:'$D(DFN)!'$D(GMRSTR)!'$D(GMRVIDT)
 S GMROUT=0,GMRTMP=1 I GMROUT S GMROUT=$S(GMROUT=2:0,1:1) G Q3
 S GMREDB="P1" D A3
 Q:$D(GNUROP)
Q3 D Q1 K GMREDB,GMRENTY,GMRTMP Q
DATE ; CALL TO SET GMRVIDT (WHEN THE VITALS WERE TAKEN)
 ; ALSO RETURNS GMROUT=1 IF TIMEOUT OR UPARROW OUT.
 S X=U,%DT("A")="ENTER DATE (TIME Required) VITALS WERE TAKEN: ",%DT="XAPETR" D ^%DT K %DT
 I Y<0!(X=U) S GMROUT=$S(X=U:1,1:2) Q
 D NOW^%DTC I Y>% W !,?3,$C(7),"Cannot enter future dates" G DATE
 I Y<$$FMADD^XLFDT(DT,-365) W !,?3,$C(7),"Sorry, you cannot enter a date more than 1 year old." G DATE
 S GMRVIDT=Y K POP
 Q
Q ;
 G:$D(GMRTMP) Q1
 K GMRVIDT
 K ^TMP($J),DFN,GMREDB,GMRENTY,GMROUT,GMRSTR,GMRVHLOC
Q1 ;
 K %,%T,%DT,%H,DA,DIE,DIC,DQ,DR,GMRDAT,GMRDATE,GMRHELP,GMRI,GMRINPTR,GMRLEN,GMRMSL,GMRNAM,GMRPRMT,GMRRET,GMRRMBD,GMRRMST,GMRROOM,GMRS,GMRSCR,GMRSITE,GMRTO,GMRTY,GMRVIT,GMRVITY,GMRVWLOC,GMRWARD,GMRX,GMRVX,GMRY,POP,GDT,GENTR,GMROK,GMRTMP
 D KVAR^VADPT K VA,DIPGM,GMROV,GMRP,GMRTYPE,GMRQUAL,GCT,GDA,GDATA,GLAST,GTYPE,GMRDT0
 Q
WARDPAT ; SELECT EDIT BY 1. UNIT, 2. SELECTED ROOMS ON UNIT, 3. PATIENT
 W !,"Vitals by (A)ll patients on a unit, (S)elected Rooms on unit, or (P)atient? " R GMREDB:DTIME S:'$T GMREDB=U I U[GMREDB S GMROUT=1 Q
 I "Aa"[GMREDB!("Ss"[GMREDB)!("P1p"[GMREDB) G WP1
 I GMREDB?1"?".E S XQH="GMRV WARD/PAT SEL" D EN^XQH K XQH G WARDPAT
 W !,$C(7),?5,"INVALID ENTRY ??" G WARDPAT
WP1 ;
 I "Aa"[GMREDB!("Ss"[GMREDB) D WARDSEL Q:GMROUT  Q:"Ss"'[GMREDB!("Ss"[GMREDB&$D(^DG(405.4,"W",GMRWARD)))  S XQH="GMRV NO ROOM" D EN^XQH K XQH G WARDPAT
 D PATDAT
 Q
WARDSEL ; SELECT SEARCH WARD
 S DIC="^DIC(42,",DIC(0)="AEQMZ",DIC("S")="I '$$INACT42^GMRVUT2(+Y)"
 D ^DIC K DIC I X=U!(+Y'>0) S GMROUT=1 Q
 S GMRWARD=+Y,GMRWARD(1)=$P(Y(0),U),DFN=$O(^DPT("CN",GMRWARD(1),0))
 I DFN="" W !,*7,"**** NO PATIENTS REGISTERED ON UNIT ",$P(^DIC(42,GMRWARD,0),U)," ****" S GMROUT=1 Q
 S GMRVHLOC=$S($D(^DIC(42,GMRWARD,44)):$P(^(44),U),1:"")
 Q
PATDAT ;
 S DIC(0)="AEQMZ",DIC="^DPT(" D ^DIC K DIC S DFN=+Y
 I DFN'>0 S GMROUT=1 Q
 D INP^VADPT S GMRWARD(1)=$P(VAIN(4),U,2),GMRWARD=$P(VAIN(4),U) D KVAR^VADPT K VA
 I ('$D(GMRWARD)!(GMRWARD'>0)),"P1p"[GMREDB,$D(GMRVIDT) S GENTR=2,GDT=GMRVIDT D ADM^GMRVADM Q:GMROUT  S:GMRWARD=0 GMROUT=1 Q:GMROUT
 Q:'GMRVWLOC
 S DIC("A")="Select Hospital Location: ",DIC("B")=$S('$D(^DIC(42,+GMRWARD,44)):"",$D(^SC(+$P(^DIC(42,+GMRWARD,44),U),0)):$P(^(0),U),1:""),DIC=44,DIC(0)="AEMQ",DIC("S")="I $P(^(0),U,3)'=""Z""" D ^DIC K DIC
 I +Y'>0 W !,"Hospital location is required",! S GMROUT=1 Q
 S GMRVHLOC=+Y Q
MULTIVM Q:GMROUT  W !!,"Do you want to enter other V/M data for this patient" S %=2 D YN^DICN W:%=0 !!,"Select YES if you want to enter another V/M record at a different",!,"date/time for the same patient.",! G:%=0 MULTIVM Q:%'=1
 D DATE I 'GMROUT S GMRDT0=GMRVIDT D EN2^GMRVED3 G MULTIVM
 S GMROUT=0 Q
