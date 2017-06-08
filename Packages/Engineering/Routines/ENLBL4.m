ENLBL4 ;(WASH ISC)/DH-Print Bar Coded Location Labels ;10.10.97
 ;;7.0;ENGINEERING;**12,35,42,45,90**;Aug 17, 1993;Build 25
WING ;Print an entire WING from Space File (6928)
 S ENERR=0 D STA^ENLBL3 G:ENEQSTA="^" QUIT^ENLBL3
 N DIC,DIE,DA,DR,FR,TO,X,X1,X2,I,J,K,I1
 W @IOF R !!,"Select WING: ",X:DTIME G:X="^"!(X="") EXIT1^ENLBL8 I "?"[X D WHELP1^ENLBL8
 I X["??" D WHELP2^ENLBL8
 I X]"",$D(^ENG("SP","C",X)) D WING1 G EXIT1^ENLBL8
 I X]"" W " ??",!,*7,"Invalid entry. Press <RETURN> to continue, '^' to exit, or ""?"" for help..." R X:DTIME D:X["?" WHELP1^ENLBL8 G:X="^" EXIT1^ENLBL8
 S X="" G WING
WING1 K ENEQC S ENEQC=X W !!,"For all rooms in WING: ",ENEQC S %=1 D YN^DICN G:%<0 EXIT1^ENLBL8 G:%<1 WING1 D:%=2 FLOOR^ENLBL8
 K IO("Q") S %ZIS("A")="Select BARCODE PRINTER: ",%ZIS="Q",%ZIS("B")="" D ^%ZIS K %ZIS("A"),%ZIS("B") G:POP EXIT1^ENLBL8
 S ENBCIO=IO,ENBCIOSL=IOSL,ENBCIOF=IOF,ENBCION=ION,ENBCIOST=IOST,ENBCIOST(0)=IOST(0),ENBCIOS=IOS S:$D(IO("S")) ENBCIO("S")=IO("S")
 I $D(IO("Q")) K IO("Q") S ZTIO=ION,ZTRTN="WING2^ENLBL4",ZTSAVE("EN*")="",ZTDESC="Location Barcode Labels (WING)" D ^%ZTLOAD K ZTSK D HOME^%ZIS G EXIT1^ENLBL8
WING2 K ^TMP($J) S ENBCIO=IO U ENBCIO D FORMAT  ;HD308658
 F DA=0:0 S DA=$O(^ENG("SP","C",ENEQC,DA)) Q:DA=""  S ENEQB=$P(^ENG("SP",DA,0),U,1) I ENEQB]"" D SORT D:'(DA#20) DOTS^ENLBL3
 I $D(^TMP($J)) S J=0 F  S J=$O(^TMP($J,J)) Q:J=""  S DA=$O(^TMP($J,J,0)) I DA>0 S ENEQB=^(DA) U ENBCIO D LOCPRT I ENEQB'["E" D:'(+ENEQB#10) DOTS^ENLBL3
 Q
 ;
BLDG ;Print labels for all rooms in specified building
 S ENERR=0 D STA^ENLBL3 G:ENEQSTA="^" QUIT^ENLBL3
 N DIC,DIE,DA,DR,X,X1,X2,I,J,K,I1
 S DIC="^ENG(6928.3,",DIC(0)="AEQM" D ^DIC G:Y'>0 EXIT1^ENLBL8 S X=$P(^ENG(6928.3,+Y,0),U),ENBLDG=$P(X,"-",1),ENDIV=$P(X,"-",2)
 S %ZIS("A")="Select BARCODE PRINTER: ",%ZIS="Q",%ZIS("B")="" K IO("Q") D ^%ZIS K %ZIS("A"),%ZIS("B") G:POP EXIT1^ENLBL8
 S ENBCIO=IO,ENBCIOSL=IOSL,ENBCIOF=IOF,ENBCION=ION,ENBCIOST=IOST,ENBCIOST(0)=IOST(0),ENBCIOS=IOS S:$D(IO("S")) ENBCIO("S")=IO("S")
 I $D(IO("Q")) K IO("Q") S ZTIO=ION,ZTRTN="BLDG1^ENLBL4",ZTSAVE("EN*")="",ZTDESC="Location Barcode Labels (BUILDING)" D ^%ZTLOAD K ZTSK D HOME^%ZIS G EXIT1^ENLBL8
BLDG1 K ^TMP($J) S ENBCIO=IO   ;HD308658
 F DA=0:0 S DA=$O(^ENG("SP","E",ENBLDG,DA)) Q:DA'>0  D CKDIV D:'(+DA#20) DOTS^ENLBL3
 I $D(^TMP($J)) D
 . U ENBCIO D FORMAT
 . S J=0 F  S J=$O(^TMP($J,J)) Q:J=""  S DA=$O(^TMP($J,J,0)) I DA>0 S ENEQB=^(DA) U ENBCIO D LOCPRT D:'(DA#10) DOTS^ENLBL3
 G EXIT1^ENLBL8
CKDIV Q:'$D(^ENG("SP",DA,0))  S ENEQB=$P(^(0),U,1) I $D(ENDIV),$P(ENEQB,"-",3)'=ENDIV Q
 D SORT
 Q
 ;
RM ;Print a single room label
 S ENERR=0 D STA^ENLBL3 G:ENEQSTA="^" QUIT^ENLBL3
 N DIC,DIE,DA,DR,X,X1,X2,I,J,K,I1
RM0 S DIC="^ENG(""SP"",",DIC(0)="AEQMZ" D ^DIC G:Y'>0 EXIT1^ENLBL8 S ENEQB=Y(0,0),DA=+Y
 K IO("Q") S %ZIS("A")="Select BARCODE PRINTER: ",%ZIS="Q",%ZIS("B")="" D ^%ZIS K %ZIS("A"),%ZIS("B") G:POP EXIT1^ENLBL8
 S ENBCIO=IO,ENBCIOSL=IOSL,ENBCIOF=IOF,ENBCION=ION,ENBCIOST=IOST,ENBCIOST(0)=IOST(0),ENBCIOS=IOS S:$D(IO("S")) ENBCIO("S")=IO("S")
 I $D(IO("Q")) K IO("Q") S ZTIO=ION,ZTRTN="RM1^ENLBL4",ZTSAVE("EN*")="",ZTSAVE("DA")="",ZTDESC="Location Barcode Label (ROOM)" D ^%ZTLOAD K ZTSK D ^%ZISC G RM0
RM1 S ENBCIO=IO U ENBCIO D FORMAT  ;HD308658
 D LOCPRT
 G:$D(ZTQUEUED) EXIT1^ENLBL8
 D ^%ZISC G RM0
 ;
ALL ;Print a location label for every record in the SPACE file
 S ENERR=0 D STA^ENLBL3 G:ENEQSTA="^" QUIT^ENLBL3
 N DIC,DIE,DA,DR,X,X1,X2,I,J,K,I1
 K IO("Q") S %ZIS="Q",%ZIS("A")="Select BARCODE PRINTER: ",%ZIS("B")="" D ^%ZIS K %ZIS("A") G:POP EXIT1^ENLBL8
 S ENBCIO=IO,ENBCIOSL=IOSL,ENBCIOF=IOF,ENBCION=ION,ENBCIOST=IOST,ENBCIOST(0)=IOST(0),ENBCIOS=IOS S:$D(IO("S")) ENBCIO("S")=IO("S")
 I $D(IO("Q")) K IO("Q") S ZTIO=ION,ZTRTN="ALL1^ENLBL4",ZTSAVE("EN*")="",ZTDESC="Location Barcode Labels (ALL)" D ^%ZTLOAD K ZTSK D HOME^%ZIS G EXIT1^ENLBL8
ALL1 K ^TMP($J) S ENBCIO=IO U ENBCIO D FORMAT  ;HD308658
 F DA=0:0 S DA=$O(^ENG("SP",DA)) Q:DA'>0  I $D(^(DA,0)) S ENEQB=$P(^(0),U) I ENEQB]"" D SORT D:'(DA#20) DOTS^ENLBL3
 I $D(^TMP($J)) S J=0 F  S J=$O(^TMP($J,J)) Q:J=""  S DA=$O(^TMP($J,J,0)) I DA>0 S ENEQB=^(DA) U ENBCIO D LOCPRT D:'(DA#10) DOTS^ENLBL3
 G EXIT1^ENLBL8
 ;
SORT I $D(ENEQC("FR")) I ENEQC("FR")]ENEQB!(ENEQB]ENEQC("TO")) Q
 I $D(^ENG("SP",DA,9)) S X=$P(^(9),U),^TMP($J,X,DA)=ENEQB Q
 F I=1:1:3 S X(I)=$P(ENEQB,"-",I)
 S X=X(3)_":"_X(2)_":"_X(1),^TMP($J,X,DA)=ENEQB
 Q
 ;
LOCPRT ;Actual print
 I ENEQB["e" S ENEQB=$TR(ENEQB,"e","E")
 I ENEQB'?.NUP D WARN^ENLBL8 Q
 S ENEQBC="SP"_ENEQB
 I ENBAR("LOCATION DATA")]"" X ENBAR("LOCATION DATA") Q
 W *2,*27,"E3",!,*24
 N ENX S ENX="*  LOCATION   LABEL  *" I $D(^DIC(6910,1,0)),$P(^(0),U,9)=1,$D(^ENG("SP",DA,4)) S X=$P(^(4),U) I X]"",$D(^ENG(6928.1,X,0)) S X1=$P(^(0),U),ENX=$E(X1,1,20)
 W ENX,!,ENEQBC,!,ENEQSTAN
 W *23,*3
 Q
 ;
FORMAT ;Location labels
 K ENBAR S (ENBAR("LOCATION FORMAT"),ENBAR("LOCATION DATA"))=""
 S ENBCIOS(0)=$O(^DIC(6910.1,"B",ENBCIOS,0)) D:ENBCIOS(0)
 . S ENBAR("LOCATION FORMAT")=$G(^DIC(6910.1,ENBCIOS(0),2))
 . S ENBAR("LOCATION DATA")=$G(^DIC(6910.1,ENBCIOS(0),4))
 I ENBAR("LOCATION FORMAT")]"" X ENBAR("LOCATION FORMAT") Q
 D FORMAT1^ENLBL7
 Q
 ;ENLBL4
