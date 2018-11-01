A4AMIN1 ;HINES-CIOFO/JJM - REPORT 1 ; 7/30/98 14:15
 ;;1.0;**** CLASS III ****;;JUN 30, 1998
 ; DEBTOR MUST BE DEFINED TO COMPUTE TOTAL FOR ACTIVE & OPEN BILLS
 ;
START ;
 S:'$D(FLAG1) FLAG1=1 ; DEFAULT
 ; FLAG1 = 1 TO LIST ONLY INCORRECT BILLS
 ; FLAG1 = 0 TO LIST ALL BILLS
PRTRPT1 ;
 D SETUP
 K ^XTMP("A4AARPT",$J)
 S ^XTMP("A4AARPT",$J,0)=%
 W:IOT="VTRM" @IOF
 U IO
 D PRTHDR1
 S BILL=""
 F  S BILL=$O(^PRCA(430,"C",DEBTOR,BILL)) Q:('BILL)!($G(END))  D
    . D:FLAG1=0 PBILL
    . D:FLAG1=1 PBILLS
 Q:END
 D HDR1
 W !,"TOTAL OF ACTIVE & OPEN BILLS: ",$J(TAO,10,2)
 S A4ATOA=TAO
ENDRPT1 ;
 D:IOT="VTRM" PAUSE^A4AARPT3
 W @IOF
 K AB,BAL,C,CA,CC,CS,EP,FLAG1,IB,ITF,LINE,MF,NAF,NATOTAL,PB,PFLAG,PRCA4307,RBAL,RFLAG,SC,STATUS,TAMT,TDATE,TIME1,TIME2,TRANS,TYPE
EOR1 ;
 QUIT
SETUP ;
 D NOW^%DTC
 D SETUP^A4AARPT
 S RBAL=0,NATOTAL=0,TAO=0,SRBAL=0,ECNT1=0,ECNT2=0,ECNT3=0
 S (LST1,LST2,LST3,LST4,LST5,LST6,SRBAL)=0
 QUIT
PBILL1 ;
 ; VALID ENTRY POINT WHEN BILL = IEN OF RECORD IN FILE 430 TO DISPLAY A BILL
 D SETUP
 D PBILL
 K DATE1,DATE2,DATE3,LST1,LST2,LST3,LST4,LST5,LST6,NAME,PAT,PG,SDAY,SRBAL
 K SSN,U1N4,X,DATE,F433N0,F433N1,F433N8,SFLAG,XDATE,BN
 QUIT
PBILL ;
 Q:'$G(BILL)
 S:'$D(DEBTOR) DEBTOR=+$P($G(^PRCA(430,BILL,0)),U,9)
 S FLAG1=0
 D PRTBILL
 QUIT
PBILLS1 ;
 ; VALID ENTRY POINT WHEN BILL = IEN OF RECORD IN FILE 430 TO DISPLAY AN
 ; INCORRECT BILL
 D SETUP
 D PBILLS
 K DATE1,DATE2,DATE3,LST1,LST2,LST3,LST4,LST5,LST6,NAME,PAT,PG,SDAY,SRBAL
 K SSN,U1N4,X,DATE,F433N0,F433N1,F433N8,SFLAG,XDATE,BN
 QUIT
CHKBILL ;
 Q:'$G(BILL)
 S FLAG1=1
 D ^A4AMIN7
 ; W !,"CHKBILL",$J(DEBTOR,10),$J(BILL,12),$J(BAL,12,2),$J(RBAL,12,2),$J(CS,4)
 I ((BAL'=RBAL)&(CS'=23))!((BAL'=0)&(CS=39))!((RBAL<0)&(CAT'=26))!((RBAL'=0)&(CS=23)) D
   . S FLAG1=0,ERRFLAG=1,ECNT1=ECNT1+1
   . W !,?40,"****  INCORRECT BILL BALANCE  ****",!,$J(DEBTOR,12),?18,$J(BILL,12),$J(CS,10),$J(BAL,10,2),$J(RBAL,10,2)
   IF CS=44 W !,?40,"****  BILL IN REFUND REVIEW  ****",!,$J(DEBTOR,12),?18,$J(BILL,12),$J(CS,10),$J(BAL,10,2),$J(RBAL,10,2) S ECNT2=ECNT2+1
   IF (CS=19)!(CS=40) W !,?40,"****  BILL IN SUSPENCE  ****",!,$J(DEBTOR,12),?18,$J(BILL,12),$J(CS,10),$J(BAL,10,2),$J(RBAL,10,2) S ECNT3=ECNT3+1
 QUIT
PBILLS ;
 Q:'$G(BILL)
 S FLAG1=1
 D ^A4AMIN7
 I ((BAL'=RBAL)&(CS'=23))!(CS=40)!((BAL'=0)&(CS=39))!((RBAL<0)&(CAT'=26))!((RBAL'=0)&(CS=23) D
   . ; S FLAG1=0
   . W !,"****  INCORRECT BILL BALANCE  ****  ",BILL,$J(DEBTOR,10),$J(BAL,12,2),$J(RBAL,12,2),$J(CS,4)
 I CS=44 W !,"****  REFUND REVIEW  ****  ",BILL,$J(DEBTOR,10),$J(BAL,12,2),$J(RBAL,12,2),$J(CS,4)