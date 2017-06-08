PXBMPRV ;ISL/JVS,ESW - MAIN ROUTINE PROVIDER ; 10/31/02 12:10pm
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**11,108**;Aug 12, 1996
 ;
 W !,"This is not the entry into this routine" Q
 ;
 ;  VARABLE LIST
 ;
 ;
PRV(PXBVST,FROM) ;-----PROVIDER STAND ALONE
 Q:'$D(^AUPNVSIT(PXBVST))
 ;
 ;--Obtain the correct provider
 ;--Set up
 N PXBCNT,I,J,IDATE,PRIP,PRIPOV,PRISEC,QUA,VISIT,PRI,POV,PRV,PXBENT,SAVE
 N PXBUT,FPRI,ENTRY,PXBSAVE,DATA,NAME,PATIENT,VAR,PROMPT,CYCL
 I '$G(PXBPRBLM) N REQI,REQE
 N PXBNCPT,PXBNPRV,PXBNPOV,FIRST,PXBWIN,CLINIC,PXBPMT,LEAVE,%,PXBNPRVL
 N FROM,NOREV
 S (REQI,REQE)=""
 S CLINIC=$P(^AUPNVSIT(PXBVST,0),"^",22)
 S ^TMP("PXBDPRV",$J,"START")=0,FIRST=1,PROMPT="PRV",PXBEXIT=1
 D HDR^PXBUTL(PXBVST,1)
 D REQ^PXBDREQ(5)
 ;
PP ;--------RECYCLE ENTRY POINT
 D TERM^PXBCC
 D LOC^PXBCC(3,1) W IOEDEOP
 N PXBSKY,PXBKY,PXBSAM,PXBCNT,PRVDR,FPRI ;108
 D PRV^PXBGPRV(PXBVST,.PXBSKY,.PXBKY,.PXBSAM,.PXBCNT,.PRVDR,.FPRI)
 D EN0^PXBDPRV
R D WIN17^PXBCC(PXBCNT),LOC^PXBCC(15,1)
 K ERROR S FROM="PRV" D LOC^PXBCC(15,1),PRV^PXBPPRV G:$G(PXBEXIT)<1 PRVXIT G:$G(ERROR) R
 W IOEDEOP
 I DATA["^P" D RSET^PXBDREQ("PRV") G PP
 I $G(PXBUT)=1,'$D(FIRST) G PRVXIT
 I $G(PXBUT)=1,$D(LEAVE) G PRVXIT
 K FIRST
 I $G(PXBUT)=1 G PRVXIT
 ;
 ;--Prompt for Primary or Secondary Provider
 D PRI^PXBPPRV1
 I $D(DIRUT) D RSET^PXBDREQ("PRV") G PP
 ;
 ;--Store the DATA
 D EN0^PXBSTOR(PXBVST,PATIENT,REQI)
 ;
 ;--Display the Requested Provider
 D PRINT^PXBDREQ(1)
 ;
 ;--File the data into the V files
 D EN1^PXKMAIN
 ;
 ;--IF called from DIAGNOSIS prompts
 I '$G(PXBPRBLM) D RSET^PXBDREQ("PRV")
 I $G(PXBPRBLM) G PRVXIT
 G PP
 ;
PRVXIT ;----EXIT AND CLEAN UP
 D PRIM^PXBUTL
 D FULL0^PXBCC
 D CLEAR1^PXBCC
 K PXBKY,PXBSAM,PXBSKY,PXBVST
 ;
 ;----Do the EVENT to the Protocol
 ;D EVENT^PXKMAIN
 K ^TMP("PXBSTOR",$J),^TMP("PXK",$J),^TMP("PXBDPRV",$J)
 K ^TMP("PXBTOTAL",$J),^TMP("PXBTANA",$J)
 Q
