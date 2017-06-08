PXBDCPT ;ISL/JVS,ESW - DISPLAY CPT ;24 May 2013  10:44 AM
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**11,73,89,108,121,124,199**;Aug 12, 1996;Build 52
 ;
 ; Reference to LD^ICDEX supported by ICR #5747
 ;
EN0 ;---Main entry point
 ;
 ;
HEAD ;--HEADER ON LIST
 S HEAD="- - E N C O U N T E R  P R O C E D U R E S (CPT CODES) - -"
 W IOINHI,!,IOCUU,?(IOM-$L(HEAD))\2,HEAD,IOINLOW
 W IOELEOL K HEAD
 ;
 I $D(CLINIC) D PRV^PXBUTL2(CLINIC)
 ;
 ;I PXBCNT<11 D DISCPT1^PXBDCPT
 ;I PXBCNT<21&(PXBCNT>10) D DISCPT2^PXBDCPT
 ;I PXBCNT>20&(PXBCNT<31) D DISCPT3^PXBDCPT
 ;I PXBCNT>30&('$D(PXBNCPT))
 D DISCPT4^PXBDCPT("BEGIN")
 ;I PXBCNT>30&($D(PXBNCPT)) D DISCPT4^PXBDCPT("SAME")
 Q
 ;
 ;
 ;
ARRAY ;Set all CPT codes and modifiers into ^TMP("PXBDCPT",$J,"DSP"
 ;for display
 ;
 N PXSQ,ENTRY,PXMD,PXDESC,PX124,PXC,PXD,PXDXDATE
 S PXTMP="^TMP(""PXBDCPT"""_","_$J_","_"""DSP"")"
 K @PXTMP
 S (PXTLNS,PXSQ)=0
 F  S PXSQ=$O(PXBSAM(PXSQ)) Q:'PXSQ  D
 .S PXTLNS=PXTLNS+1
 .S ENTRY=PXBSAM(PXSQ)
 .S PXBSAM(PXSQ,"LINE")=PXTLNS
 .I $D(PXBNCPT($P(ENTRY,U))) D
 ..;I PXBNCPT($P(ENTRY,U))]"",'$D(PXBSKY(PXSQ,PXBNCPT($P(ENTRY,U)))) Q
 ..Q:'$D(PXBNCPT($P(ENTRY,U),$O(PXBSKY(PXSQ,0))))
 ..S $P(ENTRY,U)=$P(ENTRY,U)_"*"
 .S @PXTMP@(PXTLNS,0)=PXSQ_U_$P(ENTRY,U)_U_$P(ENTRY,U,2)_U_$P(ENTRY,U,4)_U_$E($P(ENTRY,U,3),1,24)
 .S PXMD=""
 .F  S PXMD=$O(PXBSAM(PXSQ,"MOD",PXMD)) Q:'PXMD  D
 ..S PXTLNS=PXTLNS+1
 ..S PXMOD=PXBSAM(PXSQ,"MOD",PXMD)
 ..S PXDESC=$P($$MODP^ICPTMOD($E(ENTRY,1,5),PXMOD,"E",IDATE),U,2) ;PX*108
 ..S @PXTMP@(PXTLNS,0)=0_U_PXMOD_U_$E(PXDESC,1,54)
 .S PXTLNS=PXTLNS+1
 .S @PXTMP@(PXTLNS,0)="-22^"_$P(ENTRY,U,22)
 .S PXDXDATE=$$CSDATE^PXDXUTL(PXBVST)
 .F PX124=5:1:12 D
 ..S PXC=$P(ENTRY,U,PX124) Q:PXC=""
 ..S PXD=$$ICDDATA^ICDXCODE("DIAG",PXC,PXDXDATE,"E") Q:PXD<1
 ..I $P(PXD,U,20)'=30 D
 ...S PXC=PXC_"    "_$P(PXD,U,4)
 ...S PXTLNS=PXTLNS+1,@PXTMP@(PXTLNS,0)=-PX124_U_PXC
 ..I $P(PXD,U,20)=30 D
 ...N PXENTRY S PXENTRY(1)=$$SENTENCE^XLFSTR($$LD^ICDEX(80,$P(PXD,U,1),PXDXDATE))
 ...D PR^PXSELDS(.PXENTRY,50)
 ...N PXLENGTH,PXLONG,PXSPACES S PXSPACES="     ",PXLENGTH=$L(PXC)-5
 ...I PXLENGTH>0 S PXSPACES=$E(PXSPACES,1,5-PXLENGTH)
 ...S PXLONG=PXC_PXSPACES_PXENTRY(1)
 ...S PXTLNS=PXTLNS+1,@PXTMP@(PXTLNS,0)=-PX124_U_PXLONG
 ...N PXNUMBR F PXNUMBR=2:1:PXENTRY D
 ....S PXTLNS=PXTLNS+1,@PXTMP@(PXTLNS,0)=-PX124_U_PXENTRY(PXNUMBR)_U_"NEXTLONG"
 ..I $G(PXBREQ(+PXD,"I"))="" S PXBREQ(+PXD,"I")=$P($$XLATE^PXBGPOV(PXBVST,+PXD),U,4,20)
 ..S PXTLNS=PXTLNS+1,@PXTMP@(PXTLNS,0)="I^"_PXBREQ(+PXD,"I")
 Q
DISCPT1 ;--Display the CPT Data
 ;
 N ENTRY,J
 D UNDON^PXBCC
 W !,"No.",?4,"CPT CODE",?14,"QUANTITY",?25,"DESCRIPTION",?55,"PROVIDER",?75,$C(32)
 W IOEDEOP
 D UNDOFF^PXBCC
 ;
 ;
 S J=0
 F  S J=$O(PXBSAM(J)) Q:J=""  D
 .S ENTRY=$G(PXBSAM(J))
 .I $D(PXBNCPT($P(ENTRY,U,1))) S $P(ENTRY,U,1)=$P(ENTRY,U,1)_"*"
 .W !,J,?4,$P(ENTRY,U,1),?15,$P(ENTRY,U,2)
 .W ?25,$P(ENTRY,U,4),?55,$E($P(ENTRY,U,3),1,24)
 .;---Display associated modifiers
 .S PXSIEN=""
 .F  S PXSIEN=$O(PXBSAM(J,"MOD",PXSIEN)) Q:PXSIEN=""  D
 ..N PXWRAP,PXMOD,PXDESC,PXLN
 ..S PXMOD=PXBSAM(J,"MOD",PXSIEN)
 ..S PXDESC=$P($$MOD^ICPTMOD(PXMOD,"E",IDATE),U,3)
 ..D WRAP^PXCEVFI4(PXDESC,58,.PXWRAP)
 ..F PXLN=1:1 Q:$G(PXWRAP(PXLN))=""  D
 ...W:PXLN=1 !,?4,"CPT Modifier: "_PXMOD
 ...W:PXLN>1 !
 ...W ?22,PXWRAP(PXLN)
 ;---Write no entries if none exist
 I '$D(PXBSAM) D NONE^PXBUTL(2)
 Q
 ;
DISCPT2 ;--display of cpt data two columns if more than 10 entries.
 ;
 N ENTRY,J,PXA
 D GSET^%ZISS
 D UNDON^PXBCC W IOG1
 W !,"NO",?4,"CPT",?10,"QUA",?14,"DESCRIPTION",?39,IOVL
 W ?40,"NO",?44,"CPT",?50,"QUA",?54,"NARRATIVE"
 W IOEDEOP
 D UNDOFF^PXBCC
 ;
 ;
 ;
 S J=0 F  S J=$O(PXBSAM(J)) Q:J=""  D
 .S ENTRY(J)=$G(PXBSAM(J)) I $D(PXBNCPT($P(ENTRY(J),U,1))) S $P(ENTRY(J),U,1)=$P(ENTRY(J),U,1)_"*"
 F J=1:1:10 D
 .W !,J,?4,$P(ENTRY(J),U,1),?11,$P(ENTRY(J),U,2),?14,$E($P(ENTRY(J),U,4),1,24)
 .D BAWRITE(ENTRY(J))
 .I $D(ENTRY(J+10)) D
 ..W ?39,IOVL,(J+10),?44,$P(ENTRY(J+10),U,1),?51,$P(ENTRY(J+10),U,2),?54,$E($P(ENTRY(J+10),U,4),1,24)
 ..D BAWRITE(ENTRY(J))
 W IOG0
 Q
 ;
DISCPT3 ;--display of cpt data three columns if more than 20 entries.
 N ENTRY,J,PXA
 D GSET^%ZISS
 D UNDON^PXBCC W IOG1
 W !,"NO",?4,"CPT",?10,"QUA",?14,"NARRATIVE",?25,IOVL
 W ?26,"NO",?30,"CPT",?36,"QUA",?40,"NARRATIVE",?51,IOVL
 W ?52,"NO",?56,"CPT",?62,"QUA",?66,"NARRATIVE"
 W IOEDEOP
 D UNDOFF^PXBCC
 ;
 S J=0 F  S J=$O(PXBSAM(J)) Q:J=""  D
 .S ENTRY(J)=$G(PXBSAM(J)) I $D(PXBNCPT($P(ENTRY(J),U,1))) S $P(ENTRY(J),U,1)=$P(ENTRY(J),U,1)_"*"
 F J=1:1:10 D
 .W !,J,?4,$P(ENTRY(J),U,1),?11,$P(ENTRY(J),U,2),?14,$E($P(ENTRY(J),U,4),1,10)
 .D BAWRITE(ENTRY(J))
 .I $D(ENTRY(J+10)) D
 ..W ?25,IOVL,(J+10),?30,$P(ENTRY(J+10),U,1),?37,$P(ENTRY(J+10),U,2),?40,$E($P(ENTRY(J+10),U,4),1,10)
 ..D BAWRITE(ENTRY(J+10))
 .I $D(ENTRY(J+20)) D
 ..W ?51,IOVL,(J+20),?56,$P(ENTRY(J+20),U,1),?63,$P(ENTRY(J+20),U,2),?66,$E($P(ENTRY(J+20),U,4),1,10)
 ..D BAWRITE(ENTRY(J+20))
 W IOG0
 Q
 ;
DISCPT4(SIGN) ;--Display the CPT Data
 ;
 ;SIGN=
 ; '+' add 10 to the starting point in ^TMP("PXBDCPT",$J)
 ; '-' subtract 10 from the starting point but not less than 0
 ; 'BEGIN' start at the beginning
 ; 'SAME' start stays where it's at
 ; '3'--any number set start to that number
 ;
 N PXBSTART,PXTMP
 D ARRAY
 I SIGN="BEGIN" S ^TMP("PXBDCPT",$J,"START")=0,PXBSTART=0
 I SIGN="SAME" S PXBSTART=^TMP("PXBDCPT",$J,"START")
 I SIGN="+" D
 .S PXBSTART=($G(^TMP("PXBDCPT",$J,"START"))+10)
 .I PXBSTART'<PXTLNS S PXBSTART=PXBSTART-10
 .S ^TMP("PXBDCPT",$J,"START")=PXBSTART
 I SIGN="-" D
 .S PXBSTART=$G(^TMP("PXBDCPT",$J,"START"))-10
 .S ^TMP("PXBDCPT",$J,"START")=PXBSTART
 .I PXBSTART<0 S PXBSTART=0 S ^TMP("PXBDCPT",$J,"START")=0
 I +SIGN>0&(SIGN#10) D  Q:^TMP("PXBDCPT",$J,"START")=PXBSTART  S ^TMP("PXBDCPT",$J,"START")=PXBSTART
 .S PXBSTART=$P((SIGN/10),".")*10
 .S:PXBSTART<10 PXBSTART=0
 I +SIGN>0&'(SIGN#10) D  Q:^TMP("PXBDCPT",$J,"START")=PXBSTART  S ^TMP("PXBDCPT",$J,"START")=PXBSTART
 .S PXBSTART=(($P((SIGN/10),".")*10)-10)
 .S:PXBSTART<10 PXBSTART=0
 ;
 ;
 I SIGN'="BEGIN" D LOC^PXBCC(3,0) W IOEDEOP
 ;
HEAD4 ;--HEADER ON LIST
 S HEAD="- - E N C O U N T E R  P R O C E D U R E S (CPT CODES) - -"
 W IOINHI,!,IOCUU,?(IOM-$L(HEAD))\2,HEAD,IOINLOW
 W IOELEOL K HEAD
 ;
 ;
 N ENTRY,J
 D UNDON^PXBCC
 W !,"No.",?4,"CPT CODE",?14,"QUANTITY",?25,"DESCRIPTION",?55,"PROVIDER",?75,$C(32)
 W IOEDEOP
 D UNDOFF^PXBCC
 ;
 ;
 N PXSIEN,PXDESC,PXMOD,PXQ,PXLNS,PX,PL
 S J=PXBSTART,PXQ=""
 S PXLNS=0
 F  S J=$O(@PXTMP@(J)) Q:J=""  D  Q:PXQ
 .S PXLNS=PXLNS+1
 .I '(PXLNS#11) D  Q
 ..S ^TMP("PXBDCPT",$J,"START")=PXBSTART
 ..S PXQ=1
 .I +@PXTMP@(J,0)>0 D  Q
 ..W !,$P(^(0),U),?4,$P(^(0),U,2),?15,$P(^(0),U,3)
 ..W ?25,$P(^(0),U,4),?55,$P(^(0),U,5)
 .I +@PXTMP@(J,0)<0 D  Q
 ..S PX=-$P(^(0),U,1)
 ..I PX=22 W !?4,"Ordering Provider:  ",$P(^(0),U,2) Q
 ..I PX<20,$P(^(0),U,3)'="NEXTLONG" W !?4,"Diagnosis "_(PX-4)_":  ",$P(^(0),U,2) Q
 ..I PX<20,$P(^(0),U,3)="NEXTLONG" W !?28,$P(^(0),U,2)
 .I $P(@PXTMP@(J,0),U)="I" D CIA^PXBDPOV($P(^(0),U,2,16)) Q
 .I $P(@PXTMP@(J,0),U)=0 D
 ..W !?4,"CPT Modifier: "_$P(^(0),U,2)_"  "_$P(^(0),U,3)
 I SIGN'="BEGIN" W !!
 Q
 ;
BAWRITE(PXD) ;WRITE BA INFO
 N PX,PD,PP
 W !?4,"Ordering Provider:  ",$P(PXD,U,22)
 F PX=1:1:8 D
 .S PD=$P(PXD,U,PX+5),PP=$$XLATE^PXBGPOV(PXBVST,PD)
 .Q:'PD!'PP
 .W:PD !?4,"Diagnosis:  ",PD
 .D CIA^PXBDPOV($P(PP,U,4,16))
 Q
 ;
