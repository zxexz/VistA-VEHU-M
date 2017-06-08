PXBDPL ;ISL/JVS - DISPLAY PROBLEM LIST ENTRIES ;5/21/96  11:30
 ;;1.0;PCE PATIENT CARE ENCOUNTER;;Aug 12, 1996
 ;
 ;
EN1 ;-FIRST Entry Point
 N OK,RDATA,QUIT
 N PXBSAMPL,PXBKYPL,PXBSKYPL
 D PL^PXBGPL(PATIENT),EN0
ENA ;--
 S QUIT=0
 I PXBCNTPL'>10 G ENB
 I PXBCNTPL>10 D
 .D LOC^PXBCC(15,1)
 .W !!,"Enter a '+' for NEXT page or '-' for PREVIOUS page."
 .W !,"Select a DIAGNOSIS from the Active PROBLEM lIST: "
 .R OK:DTIME
 .I OK["?" D WIN17^PXBCC(PXBCNTPL),HELP^PXBUTL0("PL1")
 .I OK]"","+-"[OK D DPOV4(OK)
 .I OK]"","+-"'[OK,OK?.N,OK>0,OK<(PXBCNTPL+(1)) S RDATA=PXBSAMPL(OK) S QUIT=1
 .I "^"[OK S QUIT=1 S DATA="" Q
 I QUIT=1 G ENXIT
 G ENA
 Q
ENB ;---
 I PXBCNTPL'>10 D
 .W !!,"Select a DIAGNOSIS from the Active PROBLEM lIST: "
 .R OK:DTIME
 .I OK["?" D WIN17^PXBCC(PXBCNTPL),HELP^PXBUTL0("PL11")
 .I OK]"",OK?.N,OK>0,OK<(PXBCNTPL+(1)) S RDATA=PXBSAMPL(OK) S QUIT=1
 .I "^"[OK S QUIT=1 S DATA="" Q
 I QUIT=1 G ENXIT
 G ENB
ENXIT ;EXIT
 K PXBPLA
 I $D(RDATA),$G(RDATA) S (DATA,EDATA)=$P(RDATA,"^",1)
 ;--Go Back to the POV list
 D LOC^PXBCC(3,1) W IOEDEOP D POV^PXBGPOV(PXBVST),EN0^PXBDPOV W !!
 Q
 ;
 ;
 ;
EN0 ;---Main entry point
 ;
 D DPOV4("BEGIN")
 Q
 ;
 ;
DIS ;----DISPLAY
 ;--NOT CURRENTLY USED BUT IS HERE IF IT NEEDS TO BE REINSTATED
 Q
 I $D(PXBPMT("POV",$P($P(ENTRY,"^",1),"*"))) W:PXBCNT>11 IORVON W ?37," --Clinic Associated--",IORVOFF
 Q
 ;
 ;
DPOV4(SIGN) ;--Display the PROVIDER Data
 ;
 ;SIGN=
 ; '+' add 10 to the starting point in ^TMP("PXBDPOV",$J)
 ; '-' subtract 10 from the starting point but not less that 0
 ; 'BEGIN' start at the beginning
 ; 'SAME' start stays where it's at
 ; '3'--any number set start to that number
 ;
 N PXBSTART
 I SIGN="BEGIN" S ^TMP("PXBDPL",$J,"START")=0,PXBSTART=0
 I SIGN="SAME" S PXBSTART=^TMP("PXBDPL",$J,"START")
 I SIGN="+" S PXBSTART=($G(^TMP("PXBDPL",$J,"START"))+(10)) S:PXBSTART'<PXBCNTPL PXBSTART=(PXBCNTPL-(10)) S ^TMP("PXBDPL",$J,"START")=PXBSTART
 I SIGN="-" S PXBSTART=$G(^TMP("PXBDPL",$J,"START"))-10,^TMP("PXBDPL",$J,"START")=PXBSTART I PXBSTART<0 S PXBSTART=0 S ^TMP("PXBDPL",$J,"START")=0
 I +SIGN>0&(SIGN#10) S PXBSTART=$P((SIGN/10),".")*10 S:PXBSTART<10 PXBSTART=0  Q:^TMP("PXBDPL",$J,"START")=PXBSTART  S ^TMP("PXBDPL",$J,"START")=PXBSTART
 I +SIGN>0&'(SIGN#10) S PXBSTART=(($P((SIGN/10),".")*10)-10) S:PXBSTART<10 PXBSTART=0 Q:^TMP("PXBDPL",$J,"START")=PXBSTART  S ^TMP("PXBDPL",$J,"START")=PXBSTART
 ;
 ;
 I SIGN'="BEGIN" D LOC^PXBCC(3,0) W IOEDEOP
 ;
 ;
 N ENTRY,J,HEAD
 S HEAD="- - P A T I E N T   P R O B L E M   L I S T - -"
 D LOC^PXBCC(3,10) W !,IOEDEOP,?(IOM-$L(HEAD))\2,IOINHI,HEAD,IOINLOW
 D UNDON^PXBCC
 W !,"No.",?4,"ICD",?13,"DESCRIPTION"
 F I=1:1:40 W $C(32)
 W IOEDEOP
 D UNDOFF^PXBCC
 ;
 ;
 S J=PXBSTART F  S J=$O(PXBSAMPL(J)) Q:J=""  Q:J=(PXBSTART+(11))  D
 .S ENTRY=$G(PXBSAMPL(J)) I $D(PXBNPOV($P(ENTRY,"^",1))) S $P(ENTRY,"^",1)=$P(ENTRY,"^",1)_"*"
 .W !,J,?4,$J($P($P(ENTRY,"^",1),".",1),4),".",$P($P(ENTRY,"^",1),".",2),?13,$E($P(ENTRY,"^",2),1,30)
 .D DIS
 Q
 ;
