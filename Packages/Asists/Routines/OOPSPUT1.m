OOPSPUT1 ;HIRMFO/YH-ACCIDENT FORM UTILITIES ;4/24/98
 ;;1.0;ASISTS;**4,10**;Jun 01, 1998
WDATE(OOPSDT,OOPSLC1,OOPSLC2,OOPSLC3) ;PRINT MONTH,DAY,YEAR
 ;OOPSDT - FILEMAN DATE
 ;OOPSLC1 - (X,Y) LOCATION OF MONTH
 ;OOPSLC2 - (X,Y) LOCATION OF DAY
 ;OOPSLC3 - (X,Y) LOCATION OF YEAR
 Q:OOPSDT=""  N DL S DL=$S(FORM="CA-1":"#",FORM="CA-2":"@",1:"") Q:DL=""
 W !,"PU"_OOPSLC1_";LB"_$E(OOPSDT,4,5)_DL_";PU"_OOPSLC2_";LB"_$E(OOPSDT,6,7)_DL_";PU"_OOPSLC3_";LB"_$E(OOPSDT,2,3)_DL_";"
 Q
WTIME(OOPSTM,OOPSAM,OOPSPM,OOPSLC1,OOPSLC2) ;PRINT TIME
 ;OOPSTM - TIME TO BE PRINTED
 ;OOPSAM - (X,Y) LOCATION OF AM BOX
 ;OOPSPM - (X,Y) LOCATION OF PM BOX
 ;OOPSLC1 - (X,Y) LOCATION OF HOURS
 ;OOPSLC2 - (X,Y) LOCATION OF MINUTES
 Q:+OOPSTM'>0  N DL S DL=$S(FORM="CA-1":"#",FORM="CA-2":"@",1:"") Q:DL=""
 N OOPSHR,AMPM S OOPSHR=+$E(OOPSTM,1,2)
 S AMPM=$S(OOPSHR=24:"AM",OOPSHR<12:"AM",1:"PM")
 S OOPSHR=$S(OOPSHR=24:12,OOPSHR<13:OOPSHR,1:OOPSHR-12)
 I AMPM="PM" W !,"PU"_OOPSPM_";LBX"_DL_";"
 I AMPM="AM" W !,"PU"_OOPSAM_";LBX"_DL_";"
 W !,"PU"_OOPSLC1_";LB"_OOPSHR_DL_";PU"_OOPSLC2_";LB"_$E(OOPSTM,3,4)_DL_";"
 Q
WPHONE(OOPSPHON,OOPSLC1,OOPSLC2) ;PRINT HOME PHONE
 ;OOPSPHON - PHONE TO BE PRINTED
 ;OOPSLC1 - (X,Y) LOCATION FOR AREA CODE
 ;OOPSLC1 - (X,Y) LOCATION FOR PHONE NUMBER
 Q:OOPSPHON=""  N DL S DL=$S(FORM="CA-1":"#",FORM="CA-2":"@",1:"") Q:DL=""
 I $L(OOPSPHON,"-")>1 W !,"PU"_OOPSLC1_";LB"_$P(OOPSPHON,"-")_DL_";PU"_OOPSLC2_";LB"_$P(OOPSPHON,"-",2,9)_DL_";"
 E  W !,"PU"_OOPSLC1_";LB"_$E(OOPSPHON,1,3)_DL_";PU"_OOPSLC2_";LB"_$E(OOPSPHON,4,18)_DL_";"
 Q
WKSCHDUL(SCHEDL,SUN,MON,TUE,WED,THU,FRI,SAT) ;PRINT WORK SCHEDULE
 ;SCHEDL: WORK SCHEDULE
 ;SUN - SAT: BOX (X,Y) LOCATION
 Q:SCHEDL=""  N DL S DL=$S(FORM="CA-1":"#",FORM="CA-2":"@",1:"") Q:DL=""
 N II,JJ,KK,WKDAY
 Q:SCHEDL=""  F II=1:1:7 S WKDAY(II)=0
 F II=1:1:$L(SCHEDL,",") D
 . S JJ=$P(SCHEDL,",",II) Q:+JJ'>0  D
 . . I JJ["-" D
 . . . F KK=+$P(JJ,"-"):1:+$P(JJ,"-",2) S WKDAY(KK)=1
 . . E  S WKDAY(+JJ)=1
 F II=1:1:7 I WKDAY(II)=1 D
 . W !,$S(II=1:"PU"_SUN_";LBX"_DL_";",II=2:"PU"_MON_";LBX"_DL_";",II=3:"PU"_TUE_";LBX"_DL_";",II=4:"PU"_WED_";LBX"_DL_";",II=5:"PU"_THU_";LBX"_DL_";",II=6:"PU"_FRI_";LBX"_DL_";",II=7:"PU"_SAT_";LBX"_DL_";",1:"")
 Q
