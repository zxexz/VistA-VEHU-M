SDMM ;SF/GFT,MAN/GRR - MULTIPLE APPOINTMENTS ; 2/7/05 12:51pm  ; Compiled September 25, 2006 13:33:14
 ;;5.3;Scheduling;**26,32,167,241,327,446**;Aug 13, 1993;Build 3
 N SDHX,SDAPDT S SDMM=1 D ^SDM K SDMM Q
RDTY K ^TMP($J,"APPT"),^TMP($J,"SDAMA301") ;SD/327
 R !,"WANT TO MAKE DAILY OR WEEKLY APPOINTMENTS?: WEEKLY// ",SDTYP:DTIME Q:SDTYP["^"!('$T)  S:SDTYP="" SDTYP="W" S SDTYP=$$UP^XLFSTR($E(SDTYP)) I "WD"'[SDTYP W !,"ENTER 'D' FOR DAILY OR PRESS RETURN" G RDTY
RD22 I SDTYP["D" S %=2 W !,"WANT APPOINTMENTS MADE ON SATURDAYS AND SUNDAYS" D YN^DICN S SDWE=$S(%<0:"^",%=2:"N",%=1:"Y",1:"?") Q:SDWE["^"  G:SDWE["?" HLP22
ADT K SDERRFT S CCX=""
 S X=$G(SDSDATE) S:X SDHX=X\1 K SDSDATE
 W:X#1 !,"APPOINTMENT DATE/TIME REQUESTED: "
 I '(X#1) R !,"DATE/TIME: ",X:DTIME I "^"[X K X,SD Q
 I X="M"!(X="m") D MORDIS G ADT
 I X="D"!(X="d") S X=$$REDDT^SDM1() D:X>0 MORD2 W:X="" $C(7),"  ??",! G ADT
 I X?1"?".E D HLP1 G ADT
 I X=" ",$G(SDAPDT) S Y=SDAPDT D AT^SDUTL W Y S Y=SDAPDT G OVR
 I $E($P(X,"@",2),1,4)?1.4"0" K %DT S X=$P(X,"@"),X=$S($L(X):X,1:"T"),%DT="XF" D ^%DT G ADT:Y'>0 S X1=Y,X2=-1 D C^%DTC S X=X_.24
 K %DT S %DT="TXEF" D ^%DT
 I $P(Y,".",2)=24 S X1=$P(Y,"."),X2=1 D C^%DTC S Y=X_".000001"
 S SDSOH=$S('$D(^SC(+SC,"SL")):0,$P(^("SL"),"^",8)']"":0,1:1)
OVR S SDY1=$P(Y,".") I $D(^HOLIDAY(SDY1,0)),'SDSOH W *7,?50,$P(^(0),U,2),"??" G ADT
 I $D(SDINA),SDY1'<SDINA,$S('$D(SDRE):1,SDRE>SDY1!('SDRE):1,1:0) S SDY=Y,Y=SDINA D DTS^SDUTL W !,*7,"Clinic is scheduled to be inactivated on ",Y S Y=SDRE D:Y DTS^SDUTL W $S(SDRE:" and reactivated on "_Y,1:"") S Y=SDY K SDY G ADT
 I Y#1=0 G ADT
 D SDFT I $P(Y,".")'<SDEDT W !,*7,"EXCEEDS MAXIMUM DAYS FOR FUTURE APPOINTMENT!!",*7 G ADT
LEN I $P(SL,U,2)]"" W !,"LENGTH OF APPOINTMENTS (IN MINUTES): ",+SL,"// " R S:DTIME I S]"" G:$L(S)>3 LEN Q:U[S  S POP=0 D L^SDM1 G LEN:POP I S\5*5=S,S'>360,S'<5 S SL=S_U_$P(SL,U,2,99)
 S SDOT=Y#1,SDDAT=$P(Y,"."),X=Y D DOW^SDM0
RDC W !,"FOR HOW MANY CONSECUTIVE ",$S(SDTYP["W":$P($T(DAY),"^",Y+2)_"DAY'S",1:"DAYS")," DO YOU WANT APPOINTMENTS SCHEDULED",!,"   AT " S X=SDOT D TM W X,"?: "
 R SDCN:DTIME G:SDCN=""!(SDCN="^") ADT G HLP:SDCN'?.N,HLP:SDCN<1,HLP:SDCN>60
 S Y=SDDAT_SDOT,SDMCNT=0,SDMADE=0
OTHER R !,"  OTHER INFO: ",D:DTIME I D["^" W !,*7,"'^' not allowed - hit return if no 'OTHER INFO' is to be entered" G OTHER
 I $L(D)>150 D MSG G OTHER
 I D]"",D?."?"!(D'?.ANP) W "  ENTER LAB, SCAN, ETC." G OTHER
 I $L(D)+$L(SDW)>250 D MSG G OTHER
BEGIN S SDZM=1,SDZY=Y,SDX9=X,SDM9=D D SDMM^SDM1A K SDZM S Y=SDZY,X=SDX9,D=SDM9
 F SDZ=1:1:SDCN D MAKE^SDMM1 Q:$D(SDERRFT)  D  Q:POP
 .S:SDMADE SDMCNT=SDMCNT+1 I SDMADE,SDZ=1 S SDAPDT=SD
 .S SDMADE=0,POP=0 D GETNEX:SDTYP["W",GETNXD:SDTYP["D"
 .Q
 G:$D(SDERRFT) ADT
END W !,SDMCNT," APPOINTMENTS MADE",!
 ;display all created appointments
 I $D(^TMP($J,"APPT")) N SDEV D EN^SDWLEVAL(DFN,.SDEV) I SDEV,$L(SDEV(1))>0 D
 .K ^TMP("SDWLPL",$J),^TMP($J,"SDWLPL")
 .D INIT^SDWLPL(DFN,"M")
 .Q:'$D(^TMP($J,"SDWLPL"))  ;
 .;D LIST^SDWLPL("M",DFN) ;display EWL entries
 .F  Q:'$D(^TMP($J,"SDWLPL"))  D LIST^SDWLPL("M",DFN) N SDR D ANSW^SDWLEVAL(1,.SDR) I 'SDR D  ;D LIST^SDWLPL("M",DFN) D
 ..F  N SDR  D ANSW^SDWLEVAL(0,.SDR) Q:'$D(^TMP($J,"SDWLPL"))  I 'SDR W !,"MUST ENTER A REASON NOT TO DISPOSITION MATCHED EWL ENTRY",!
 I $D(^TMP($J,"APPT")) N SDEV D EN^SDWLEVAL(DFN,.SDEV) I SDEV,$L(SDEV(1))>0 D
 .;N SDTC D EWLANS^SDWLEVAL(.SDTC) ;user may reject EWL; 446/;
 .;ask for selection of EWL to display
 .;ASKS - returned answer (A/C/S/^)
 .;    ^TMP("SDWLPL",$J) and ^TMP($J,"SDWLPL") are used
 .;      to generate EWL open entries
 .;I SDTC N SDCTN S SDCTN=0 F  N ASKS K ^TMP("SDWLPL",$J),^TMP($J,"SDWLPL") D ANS2^SDWLPL(DFN,.ASKS) Q:ASKS="^"  D  Q:SDCTN  ;446/;
 .Q:'$D(^TMP($J,"SDWLPL"))  D ASKREM^SDWLEVAL S SDCTN=1 ;display and process selected open EWL entries  ;446/;
 .;I 'SDTC Q  ;no EWL evaluation per user's decision
 .Q
 ;
 K CCX,COLLAT,COV,D,I,POP,S,SC,SD,SDAPTYP,SDEDT,SDEMP,SDINA,SDLOCK,SDM9,SDMES,SDNOT,SDRE,SDSOH,SDW,SDWEE,SDX3,SDX7,SDX9,SDY1,SDYC,SDZ,SDZY,SDMES,SDCN,SDDAT,SDMADE,SDMCNT,SDOT,SDPL,SDRT,SDSC,SDTTM,SDTYP
 K SDALLE,SDATD,SDAV,SDDECOD,SDEC,SDHX,SDIN,SDINP,SDOEL,SDT,SDY,%H,%T,C,DISYS,SDW,SDWE,SDX3,SDX7,SDX9,SDY1,SDYC,SDZY,SI,SL,SM,SS,X1,X2,Y,SDXF,% Q
GETNEX I SDDAT#100<22 S SDDAT=SDDAT+7 S POP=0 D INACT Q:POP  G:$D(^HOLIDAY(SDDAT,0))&('SDSOH) GETNEX S Y=SDDAT_SDOT Q
 S X1=SDDAT,X2=7 D C^%DTC S POP=0 D INACT Q:POP  S SDDAT=X G:$D(^HOLIDAY(SDDAT,0))&('SDSOH) GETNEX S Y=SDDAT_SDOT
 Q
GETNXD I SDDAT#100<28 S SDDAT=SDDAT+1 S POP=0 D INACT Q:POP  G:$D(^HOLIDAY(SDDAT,0))&('SDSOH) GETNXD S X=SDDAT D DOW^SDM0 S:SDWE["Y" Y=SDDAT_SDOT Q:SDWE["Y"  G:Y=0!(Y=6) GETNXD S Y=SDDAT_SDOT Q
 S X1=SDDAT,X2=1 D C^%DTC S POP=0 D INACT Q:POP  S SDDAT=X G:$D(^HOLIDAY(SDDAT,0))&('SDSOH) GETNXD S X=SDDAT D DOW^SDM0 S:SDWE["Y" Y=SDDAT_SDOT Q:SDWE["Y"  G:Y=0!(Y=6) GETNXD S Y=SDDAT_SDOT
 Q
DAY ;;^SUN^MON^TUES^WEDNES^THURS^FRI^SATUR
 ;
TM S X=$E($P(X,".",2)_"0000",1,4),%=X>1159 S:X>1259 X=X-1200 S X=X\100_":"_$E(X#100+100,2,3)_" "_$E("AP",%+1)_"M" Q
HLP W !,"Enter the number of appointments you want made (between 1 and 60)." G RDC
HLP22 W !,"ENTER 'YES' IF YOU WANT THE SYSTEM TO TRY TO MAKE APPOINTMENTS ON SATURDAYS AND SUNDAYS" G RD22
INACT I $D(SDINA),SDINA'>SDDAT,SDRE>SDDAT!('SDRE) W !,*7,"Appointments can't be made while clinic is inactivated" S POP=1
 Q
HLP1 W !,"Enter a date/time for the appointment"
 W:$D(SD) " or a space to choose the same date/time",!,"as the patient you have just previously scheduled into this clinic"
 W ".",!,"You may also select 'M' to display the next month's availability or"
 W !,"'D' to specify an earlier or later date to begin the availability display."
 Q
SDFT S X1=DT,SDEDT=$S($D(^SC(SC,"SDP")):$P(^("SDP"),U,2),1:365) S:'SDEDT SDEDT=365 S X2=SDEDT D C^%DTC S SDEDT=X Q
MSG W !!?5,"Text entered at OTHER INFO prompt was too long.  Please re-enter.",! Q
 ;
MORDIS I '$D(SDHX) W *7," ??" G ADT
 S SDXF=0,X1=SDHX,X2=1 D C^%DTC
MORD2 I $D(SDINA),SDINA'>X,SDRE>X!('SDRE) S SDHY=$S($D(Y):Y,1:""),Y=SDINA D DTS^SDUTL W *7,!,"Clinic is inactivated as of ",Y S Y=SDHY K SDHY G ADT
EN S:$L(X)=1 X=$TR(X,"tnN","TTT") S:X="NOW" X="T" I X?.A!(+X=X),X<13,X'?1"T".E S X=X_" 1"
 D  Q:Y<1
 .N %DT
 .S %DT="T" D ^%DT
 .I Y<1 W !!,"Unable to evaluate date value """_X_""".",!
 .Q
 S:$S($D(DUZ)'[0:1,1:0) ^DISV(DUZ_U_+SC)=Y
DISP S IOF=$S('$D(IOF):"!#",IOF']"":"!#",1:IOF) W @IOF S SDSOH=$S('$D(^SC(+SC,"SL")):0,$P(^("SL"),"^",8)']"":0,1:1),SDAV=0
 I $D(SDINA),Y'<SDINA,SDRE>Y!('SDRE) S SDHY=Y,Y=SDINA D DTS^SDUTL W !,*7,"Clinic is inactive ",$S(SDRE:"from ",1:"as of "),Y S Y=SDRE D:Y DTS^SDUTL W $S(SDRE:" to "_Y,1:"") S Y=SDHY K SDHY Q:'SDRE
 S:Y#100=0 Y=Y+1 S X=Y D D^SDM0:$E(X,4,5) S (SDX,X1)=X,X2=1 D C^%DTC S X=SDX K SDX Q
