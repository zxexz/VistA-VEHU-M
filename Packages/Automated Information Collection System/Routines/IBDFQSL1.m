IBDFQSL1 ;ALB/CJM/AAS/MAF - ENCOUNTER FORM - Quick selection edit (cont.) ;06/12/95
 ;;3.0;AUTOMATED INFO COLLECTION SYS;**63**;APR 24, 1997;Build 81
 ;
 ;
EN ; -- main entry point for IBDF QUICK SELECTION EDIT
 D EN^VALM("IBDF QUICK SELECTION EDIT")
 Q
 ;
HDR ; -- header code
 S VALMHDR(1)="This screen displays the selection list for ' "_$P(^IBE(357.1,IBBLK,0),"^",1)_" '"
 S VALMHDR(2)="on Encounter Form ' "_$P(^IBE(357,IBFORM,0),"^",1)_" '"
 Q
 ;
INIT ; -- init variables and list array
 N IBDCNT,IBDCNT1
 W !,"Please wait while I build the list..."
 K ^TMP("SEL",$J),^TMP("SELIDX",$J),IBDFHDR D KILL^VALM10()
 S (IBDCNT,IBDCNT1,VALMCNT)=0
 I '$D(^TMP("IBDF DELETE SELECTION OPTION",$J)) S ^TMP("IBDF DELETE SELECTION OPTION",$J)=0
 S IBDLSTNM=$P(^IBE(357.2,IBLIST,0),"^",1) D INTER D
 .S IBLSNODE=$G(^IBE(357.2,IBLIST,0))
 .;User added selections and then deleted without saving (empty block scenario). Keep track so that history fields are not updated.
 .I ^TMP("IBDF DELETE SELECTION OPTION",$J)=1,'$O(^IBE(357.3,"C",IBLIST,"")) S ^TMP("IBDF DELETED ALL SELECTIONS",$J)=1
 .I $D(IBDFAR) F IBDFX=0:0 S IBDFX=$O(@(IBDFAR_"("_IBDFX_")")) Q:'IBDFX  S IBDFARR=$G(@(IBDFAR_"("_IBDFX_")")) D:$P(IBDFARR,"^",1)="" HEADER D:$P(IBDFARR,"^",1)]"" SETARR
 Q:$$LSTDESCR^IBDFU1(.IBLIST) 1
 S IBRTN=IBLIST("RTN")
 D RTNDSCR^IBDFU1B(.IBRTN)
 I '$D(^TMP("SEL",$J)) D NUL
 Q
 ;
SETARR ;  -- Set up Listman array
 N IBDFNODE
 W "."
 S IBDFNODE=IBDFARR
 S IBDFSEL=$P(IBDFNODE,"^",4)
 S IBDCNT1=IBDCNT1+1
 S IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S X=""
 S IBDFVAL=$J(IBDCNT1_")",5)
 S X=$$SETSTR^VALM1(IBDFVAL,X,1,5)
 S IBDFVAL=$P(IBDFNODE,"^",1)
 S X=$$SETSTR^VALM1(IBDFVAL,X,7,8)
 S IBDFVAL=$P(IBDFNODE,"^",6)
 S X=$$SETSTR^VALM1(IBDFVAL,X,16,5)
 S IBDFVAL=$P(IBDFNODE,"^",2)
 S X=$$SETSTR^VALM1(IBDFVAL,X,23,55)
 ;S IBDFVAL=$P(^IBE(357.4,$P(IBDFNODE,"^",5),0),"^",1) ;Remove per SME's for ICD-10 project IBD*3.0*63
 ;S X=$$SETSTR^VALM1(IBDFVAL,X,64,15)
 I $D(^IBE(357.3,$P(IBDFNODE,"^",4),2)) D
 .S IBDFVAL=$P(^IBE(357.3,$P(IBDFNODE,"^",4),2),"^")
 .S X=$$SETSTR^VALM1(IBDFVAL,X,81,26)
 .S IBDFVAL=$P(^IBE(357.3,$P(IBDFNODE,"^",4),2),"^",2)
 .I $D(^LEX(757.01)) S IBDFVAL=$P($G(^LEX(757.01,+IBDFVAL,0)),"^")
 .E  S IBDFVAL=$P($G(^GMP(757.01,+IBDFVAL,0)),"^")
 .S X=$$SETSTR^VALM1(IBDFVAL,X,109,23)
TMP ; -- Set up TMP Array
 S ^TMP("SEL",$J,IBDCNT,0)=X,^TMP("SEL",$J,"IDX",VALMCNT,IBDCNT1)=IBDFSEL
 S ^TMP("SELIDX",$J,IBDCNT1)=VALMCNT_"^"_$P(IBDFARR,"^",3)_"^"_$P(IBDFARR,"^",4)_"^"_$P(IBDFARR,"^",5) ;_"^"_IBDFX_"^"_$P(IBDFTMP,"^",4)_"^"_$P(IBDFTMP,"^",5)_"^"_$P(IBDFTMP,"^",1)_"^"_$P(IBDFTMP,"^",2)
 Q
HEADER ;  -- Set up header line for the display
 S IBDCNT1=IBDCNT1+1
 S IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S X=""
 S IBDVAL=$S($P(IBDFARR,"^",2)]"":$P(IBDFARR,"^",2),1:"BLANK")
 S IBDFHDR(IBDVAL)=IBDCNT_"^"_$P(IBDFARR,"^",5)
 S IBDFSEL=$P(IBDFARR,"^",5)
 S X=$$SETSTR^VALM1(" ",X,1,3) D TMP
 S X="",IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S IBDVAL=$P(IBDFARR,"^",6)
 S X=$$SETSTR^VALM1(IBDVAL,X,16,5)
 S IBDVAL=$P(IBDFARR,"^",2)
 S IBDVAL1=$L(IBDVAL) S IBDVAL1=(80-IBDVAL1)/2 S IBDVAL1=IBDVAL1\1 S X=$$SETSTR^VALM1(" ",X,22,IBDVAL1)
 S X=$$SETSTR^VALM1(IBDVAL,X,IBDVAL1,25) D TMP,CNTRL^VALM10(VALMCNT,1,80,IOINHI,IOINORM,0)
 S X="",IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S X=$$SETSTR^VALM1(" ",X,1,3) D TMP
 S IBDCNT1=IBDCNT1-1
 Q
INTER ;  -- Find Package interface for selection list
 K IBARRY S IBDFAR="IBARRY",IBDFINT=$P($G(^IBE(357.2,IBLIST,0)),"^",11),IBDFINT(1)=$P(^IBE(357.6,IBDFINT,0),"^",1) D GETLST^IBDFQSL2(IBFORM,IBBLK,IBLIST,.IBDFINT,"IBARRY",1)
 Q
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 K IBARRY,IBDFAR,IBDFARR,IBDFHDR,IBDFINT,IBDFSEL,IBDFVAL,IBDFX,IBDLSTNM,IBDVAL,IBDVAL1,IBLIST,IBRTN,IEN,IBLSNODE,DIC,IBGRP,NODE
 K ^TMP("SEL",$J),^TMP("SELIDX",$J)
 Q
 ;
EXPND ; -- expand code
 Q
 ;
NUL ;  -- Null message
 S ^TMP("SEL",$J,1,0)=" ",^TMP("SEL",$J,2,0)="There are no selection lists for this block.",^TMP("SELIDX",$J,1)=1,^TMP("SELIDX",$J,2)=2
 Q
