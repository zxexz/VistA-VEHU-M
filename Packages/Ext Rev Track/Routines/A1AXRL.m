A1AXRL ;SLL/ALB ISC; FACILITY RECOMMENDATION LIST WITHIN DATE RANGE; 3/11/88
 ;;VERSION 1.0
 ;
 ;DATE RANGE
DATE1 S %DT("A")="BEGINNING REVIEW DATE: ",%DT="AEP" D ^%DT G:X="^" EXIT1 G:Y<0 DATE1
 S A1AXLDT=Y
DATE2 S %DT("A")="ENDING REVIEW DATE:  ",%DT("B")="T" D ^%DT G:X="^" EXIT1 G:Y<0 DATE2
 S A1AXUDT=Y
OPT ;
 I DUZ(2)<999 S A1AXOPT="F" G DEVICE
 I DUZ(2)>999 R !,"CHOOSE- BY (F)ACILITY OR BY (O)RGANIZATION: ",A1AXOPT:DTIME D:A1AXOPT["?" OPT^A1AXUTL G:A1AXOPT["^" EXIT1 G:A1AXOPT'="O"&(A1AXOPT'="F") OPT
DEVICE ;
 S %IS("B")="HOME",%IS="MQF" D ^%ZIS G:POP EXIT1 I '$D(IO("Q")) U IO G DQ
 S ZTRTN="DQ^A1AXRL",ZTIO=ION S ZTSAVE("A1AX*")="" S ZTDESC="EXT REV RECOM LIST" D ^%ZTLOAD W !,"PRINT QUEUED!" X ^%ZIS("C")
 K IO("Q"),ZTRTN,ZTIO,ZTDESC,ZTSAVE,%DT("A"),%DT("B"),A1AXUDT,A1AXLDT,A1AXL,AU,AA,AP,AS,AR,AC,I,J,IJ,A1AXOPT,A1AXO,A1AXF,A1AXDT,A1AX1,A1AX2,A1AXST,A1AXSTOP,A1AXEND,^UTILITY($J,"RL")
 K A1AXP,A1AXS
 K A1AXD,%DAT,%DAT1,%DT,D,K,POP,X,Y,%H,%Z,%Z9,ZTSK
 Q
DQ ;
 D CLOSE^A1AXUTL
 K ^UTILITY($J,"RL")
 D ^A1AXRL1
 Q
EXIT1 ;
 K %DT,D,K,POP,X,Y("A"),%DT,%DT("B"),IO("Q"),A1AXOPT,A1AXUDT,A1AXLDT,%DAT,%DAT1,%DT
 Q