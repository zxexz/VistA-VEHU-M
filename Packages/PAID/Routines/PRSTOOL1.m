PRSTOOL1 ;HISC/FPT - PAID 2.5 VS 3.0 OUTPUT ;3/29/93  13:23
 ;;3.5;PAID;;Jan 26, 1995
 W !!,"This routine compares 8B data coded under PAID versions 2.5 and 3.0.",!!
 ; select pay period
 K ^TMP($J),DIC S DIC="^PRST(458,",DIC(0)="AEMQZ" D ^DIC I Y<1 D KILL Q
 S PPI458=+Y,PPE458=$P(^PRST(458,PPI458,0),"^",1),PPI455="2"_$E(PPE458,1,2)_$E(PPE458,4,5)
 I '$D(^PRST(455,PPI455,0)) D KILL Q
 ; select device
 K %ZIS S %ZIS="MQ" D ^%ZIS I POP D KILL Q
 I $D(IO("Q")) S ZTDESC="COMPARE PAID V2.5 & V3.0 OUTPUT",ZTRTN="START^PRSTOOL1",ZTSAVE("PPI458")="",ZTSAVE("PPE458")="",ZTSAVE("PPI455")="" D ^%ZTLOAD D KILL,^%ZISC Q
 U IO D START U IO(0) D ^%ZISC,KILL
 Q
 ;
START ;
 ; Set variables T0 and T1 with 8B code list
 S T0="AN SK WD NO AU RT CE CU UN NA NB SP DA SA SB SC OA OB OC OK DB OM RA RB RC HA HB HC HD PT PA ON VC EA EB AL SL WP NP AB RL",N1=53
 S T1="CT CO US NR NS DC TF SE SF SG OE OF OG OS TA OU RE RF RG HL HM HN HO PH PB CL VS EC ED NL DW IN TL LU LN LD TO LA ML CA PC TC CY RR SQ FF DE DF YA DG TG YD YE TB DT YH TD",N2=57
 I $E(IOST)="C" D WAIT^DICD
 S (ALLCNT,ERRCNT,IEN,TCNT)=0,YN="" F  S IEN=$O(^PRST(458,PPI458,"E",IEN)) Q:IEN<1  I $D(^PRST(455,PPI455,1,IEN,0)) D COMPARE W:$E(IOST)="C" "."
 S PAGE=0,TL="" D HEADER
 I ERRCNT<1 W !!,"No discrepancies found",!! Q
 ; display discrepancies
 F  S TL=$O(^TMP($J,TL)) Q:TL=""!(YN["^")  S NAME="" F  S NAME=$O(^TMP($J,TL,NAME)) Q:NAME=""!(YN["^")  S IEN=0 F  S IEN=$O(^TMP($J,TL,NAME,IEN)) Q:IEN<1!(YN["^")  D
 .W !!,TL,?5,NAME,?35,$E($G(^PRST(458,PPI458,"E",IEN,5)),1,31)
 .S TYPE=""  F  S TYPE=$O(^TMP($J,TL,NAME,IEN,TYPE)) Q:TYPE=""!(YN["^")  D
 ..I $Y>(IOSL-4) D:$E(IOST)="C" SCROLL D HEADER
 ..S VALUE=^TMP($J,TL,NAME,IEN,TYPE)
 ..W !,?5,TYPE,?12,$P(VALUE,"^",1),?20,$P(VALUE,"^",2)
 ; display totals
 W !!,"NUMBER OF 8B RECORDS WITH DISCREPANCIES: ",TCNT
 W !,"NUMBER OF DISCREPANCIES: ",ERRCNT
 W !,"TOTAL NUMBER OF RECORDS CHECKED: ",ALLCNT
 Q
COMPARE ; compare data values
 S Z0=^PRST(455,PPI455,1,IEN,0),Z1=$G(^PRST(455,PPI455,1,IEN,1)),CNT=0,NAME=$P($G(^PRSPC(IEN,0)),"^",1) S:NAME="" NAME=IEN
 S TL=$P(Z0,"^",7) Q:TL=""
 S TLI=$O(^PRST(455.5,"B",TL,0)) Q:TLI<1
 Q:$P(^PRST(455.5,TLI,0),"^",9)=1
 D STUB Q:STOP=1
 F PIECE=13:1:N1 I +$P(Z0,"^",PIECE)'=+$P(C0,"^",PIECE) S CNT=CNT+1,^TMP($J,TL,NAME,IEN,$P(T0," ",PIECE-12))=$P(Z0,"^",PIECE)_"^"_$P(C0,"^",PIECE)
 F PIECE=1:1:N2 I +$P(Z1,"^",PIECE)'=+$P(C1,"^",PIECE) S CNT=CNT+1,^TMP($J,TL,NAME,IEN,$P(T1," ",PIECE))=$P(Z1,"^",PIECE)_"^"_$P(C1,"^",PIECE)
 I CNT>0 S ERRCNT=ERRCNT+CNT,TCNT=TCNT+1
 Q
KILL ; kill variables
 K ^TMP($J),%,ALLCNT,C0,C1,CNT,DIC,DTOUT,DUOUT,ERRCNT,IEN,N1,N2,NAME,PAGE,PIECE,POP,PPE458,PPI455,PPI458,RECORD,STOP,STUB,T0,T1,TCNT,TL,TLI,TYPE,VALUE,X,Y,YN,Z,Z0,Z1,ZTDESC,ZTRTN,ZTSAVE
 Q
HEADER ; report header
 W:$Y>0 @IOF
 S PAGE=PAGE+1
 D NOW^%DTC S Y=% D DD^%DT W ?63,Y,!
 W "PAID V2.5 & 3.0 8B COMPARISON",?70,"PAGE: ",PAGE
 W !,?5,"CODE",?12,"V2.5",?20,"V3.0",!
 Q
SCROLL ; screen hold
 K DIR,DIROUT,DIRUT,DTOUT,DUOUT
 W ! S DIR(0)="E" D ^DIR
 S:$D(DIRUT)!(Y=0) YN="^"
 K DIR,DIROUT,DIRUT,DTOUT,DUOUT
 Q
STUB ; get 'stub' from 8b record
 S RECORD=$G(^PRST(458,PPI458,"E",IEN,5)),STOP=0 I $L(RECORD)<32 S STOP=1 Q
 S ALLCNT=ALLCNT+1,(C0,C1)="",STUB=$E(RECORD,1,31),RECORD=$E(RECORD,32,$L(RECORD))
TYPE ; parse out type of time from 8b record
 K LOOP,MATCH,TYPE,VALUE
 S TYPE=$E(RECORD,1,2)
 Q:TYPE="CD"!(TYPE'?2U)
 F LOOP=3:1:$L(RECORD) Q:$E(RECORD,LOOP)?1U
 S VALUE=$S(LOOP=$L(RECORD):$E(RECORD,3,LOOP),1:$E(RECORD,3,LOOP-1))
 S RECORD=$E(RECORD,LOOP,$L(RECORD))
 S MATCH=0
 S Z=$F(T0,TYPE)
 I Z>2 S $P(C0,"^",(Z/3)+12)=VALUE,MATCH=1
 G:MATCH=1 TYPE
 S Z=$F(T1,TYPE)
 I Z>2 S $P(C1,"^",Z/3)=VALUE
 G TYPE
