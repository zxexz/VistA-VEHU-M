DVBAB6 ;ALB/DJS - CAPRI PENDING 2507 REQUEST REPORT ; 02-27-2013
 ;;2.7;AMIE;**35,90,108,168,185,190,192**;Apr 10, 1995;Build 15
 ;
STRT(MSG,DVBCSORT,RSTAT,ERDAYS,OLDAYS,ADIVNUM,ELTYP,DVBADLMTR,ROFILTER) ;
 I ADIVNUM'="" S X=$O(^DG(40.8,"C",ADIVNUM,"")) S:X]"" ADIVNUM=X
 S DVBADLMTR=$S(DVBADLMTR=1:",",1:0),ROFILTER=$S($G(ROFILTER)'=0:ROFILTER,1:0)
SETUP K ^TMP($J),^TMP("CAPRI")
 S DVBCDT(0)=$$FMTE^XLFDT(DT,"5DZ"),PG=1,DVBCCNT=0,DONE="NO",MSGCNT=1,TRNSFIN=""
 S DVBCHDR="Sorted by "_$S(DVBCSORT="V":"VETERAN NAME",DVBCSORT="R":"Routing location",DVBCSORT="S":"Status",DVBCSORT="A":"Age of request",1:"Unknown")
HEAD S HEAD="Pending 2507 Requests for "_$S($D(^DVB(396.1,1,0)):$P(^(0),U,1),1:"Unknown site"),PROCDT="Processed on: "_DVBCDT(0),NODATA=0
 I $G(DVBADLMTR)'="," D HEADRND G DATA
 I $G(DVBADLMTR)="," D HEADRD G DATA
 Q
HEADRND ; Print non-delimited output header
 ;
 S ^TMP("CAPRI",MSGCNT)=HEAD_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)=PROCDT_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="^",MSGCNT=MSGCNT+1
 S $P(^TMP("CAPRI",MSGCNT),"=",75)="=^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="",MSGCNT=MSGCNT+1
 Q
HEADRD ; Print delimited output header
 ;
 S ^TMP("CAPRI",MSGCNT)=HEAD_$C(13),MSGCNT=MSGCNT+1,^TMP("CAPRI",MSGCNT)=PROCDT_$C(13),MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)=$S($G(ROFILTER)'=0:"RO #"_DVBADLMTR,1:"")_"Division"_DVBADLMTR_"Status"_DVBADLMTR_"Veteran Name"_DVBADLMTR_"SSN"_DVBADLMTR_"Claim No."_DVBADLMTR_"Request Date"_DVBADLMTR
 S ^TMP("CAPRI",MSGCNT)=^TMP("CAPRI",MSGCNT)_"Elapsed Days"_DVBADLMTR_"Transferred in from"_DVBADLMTR_"Requested by Name"_DVBADLMTR_"Requested by Division"_DVBADLMTR_"Exams Requested"_DVBADLMTR_"Exam Status"_DVBADLMTR
 S ^TMP("CAPRI",MSGCNT)=^TMP("CAPRI",MSGCNT)_"Cell Phone"_DVBADLMTR_"Email Address"_DVBADLMTR_"Claim Type"_DVBADLMTR_"Special Consideration(s)"_$C(13)
 S MSGCNT=MSGCNT+1
 Q
 ;
DATA ; Sort data records
 ;
 S DFN="" F  S DFN=$O(^DVB(396.3,"B",DFN)) Q:DFN=""  F REQDA=0:0 S REQDA=$O(^DVB(396.3,"B",DFN,REQDA)) Q:REQDA=""  D SORT^DVBAB5
 N EXAMRECRD
 I DVBCSORT="V" S PNAM="" F  S PNAM=$O(^TMP($J,PNAM)) Q:PNAM=""  F DFN=0:0 S DFN=$O(^TMP($J,PNAM,DFN)) Q:'DFN  F DA(1)=0:0 S DA(1)=$O(^TMP($J,PNAM,DFN,DA(1))) Q:'DA(1)  D PRINT I $D(OUT) S DA(1)=999999999,PNAM="ZZZ",DONE="YES" Q
 I DVBCSORT="R"!(DVBCSORT="A")!(DVBCSORT="S") D
 . S JX="" F  S JX=$O(^TMP($J,JX)) Q:JX=""  D
 .. S PNAM="" F  S PNAM=$O(^TMP($J,JX,PNAM)) Q:PNAM=""  D
 ... F DFN=0:0 S DFN=$O(^TMP($J,JX,PNAM,DFN)) Q:'DFN  D NXT
 I DVBCCNT>0 S ^TMP("CAPRI",MSGCNT)="Total pending: "_DVBCCNT,DONE="YES"
 ;
EXIT I NODATA=0 S ^TMP("CAPRI",MSGCNT)="No pending request found for select parameters.",MSG=$NA(^TMP("CAPRI"))
 I DONE="YES" S MSG=$NA(^TMP("CAPRI"))
 K ^TMP($J),ADIV,CNUM,NODATA,STATUS,TST,TSTA1,STSAT,PG,PRTNM,RDATE,RDATE1,REQDA,SSN,RONAME,JX,TRNSFIN,PROCDT,REQSTR,MSGCNT,TSTAT
 K DA,DFN,DONE,DVBCCNT,DVBCDT,DVBCHDR,X,XX,ZS,ZZZ,HEAD,HEAD2,OUT,OWNDOM,EDAYS,PNAM,DVBADLMTR,EXAMRECRD,ROFILTER,RONUM,VADM(1),VADM(2)
 K DVBAA,DVBCELL,DVBCNT,DVBCTW,DVBEMA,DVBSC,DVBSCN,DVBSCNS,DVBSCW,DVBSCWA,DVBX
 Q
 ;
PRINT ; print 2507 request data
 ;
 S ADIV=$S($D(^DVB(396.3,DA(1),1)):$P(^(1),U,4),1:"") Q:ADIV'=ADIVNUM&(DVBCSORT="R")  I ADIV]"" S ADIV=$S($D(^DG(40.8,+ADIV,0)):$P(^(0),U,1),1:"Unknown Division")
 S RDATE1=$P(^DVB(396.3,DA(1),0),U,2),RDATE=$P(^(0),U,5)
 S SSN=$P($G(^DPT(DFN,0)),U,9) S:SSN="" SSN="Unknown"
 S DVBCELL=$P($G(^DPT(DFN,.13)),U,4)
 S DVBEMA=$P($G(^DPT(DFN,.13)),U,3)
 S CNUM=$P($G(^DPT(DFN,.31)),U,3) S:CNUM="" CNUM="Unknown"
 S OWNDOM=$P(^DVB(396.3,DA(1),0),U,22) I OWNDOM]"" S TRNSFIN=$S($D(^DIC(4.2,+OWNDOM,0)):$P(^(0),U,1),1:"Unknown Site") I $G(DVBADLMTR)=0 S ^TMP("CAPRI",MSGCNT)="Transferred in from "_TRNSFIN_"^",MSGCNT=MSGCNT+1
 D ELAPSED^DVBAB5
 S STATUS="Unknown",XX=$P(^DVB(396.3,DA(1),0),U,18),STATUS=$S(XX="N":"New",XX="P":"Pending, reported",XX="S":"Pending, scheduled",XX="R":"Released to RO, not printed",1:"")
 I STATUS="",$D(XX) S STATUS=$S(XX="C":"Completed, printed by RO",XX="X":"Cancelled by RO",XX="T":"Transcribed",XX="NT":"New,Transferred in",XX="CT":"Completed, Transferred out",1:"Unknown")
 I $G(DVBADLMTR)="," D PRINTD,ITEMS Q
 S ^TMP("CAPRI",MSGCNT)="Division: "_ADIV_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="Status: "_STATUS_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)=PNAM_" ^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="SSN: "_SSN_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="Cell no.: "_DVBCELL_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="Email: "_DVBEMA_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="Claim no: "_CNUM_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="Request Date: "_$$FMTE^XLFDT(RDATE1,"5DZ")_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="Elapsed days: "_EDAYS_"^",MSGCNT=MSGCNT+1
 S X=$S($D(^DVB(396.3,DA(1),4)):^(4),1:"")
 D CLAIMTYP,SPEC
 S ^TMP("CAPRI",MSGCNT)="Claim Type: "_DVBCTW_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="Special Consideration(s): "_DVBSCWA_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="Exams requested:"_"^",MSGCNT=MSGCNT+1
 ;
ITEMS S NODATA=1,REQSTR=+$P(^DVB(396.3,DA(1),0),U,4)
 S ZZZ="Requested by: "_$S($D(^VA(200,+REQSTR,0)):$P(^(0),U,1),1:" (Not specified) ")_" at "
 S RONAME=$P(^DVB(396.3,DA(1),0),U,3),RONAME=$S(RONAME]"":$P(^DIC(4,+RONAME,0),U,1),1:"")
 I $G(DVBADLMTR)'="," D ITEMSND Q
 I $G(DVBADLMTR)="," D ITEMSD Q
ITEMSND D TST S ^TMP("CAPRI",MSGCNT)="^"_ZZZ_$S(RONAME]"":RONAME,1:" (Not specified) ")_"^",MSGCNT=MSGCNT+1
 S ^TMP("CAPRI",MSGCNT)="^",MSGCNT=MSGCNT+1
 S $P(^TMP("CAPRI",MSGCNT),"-",75)="-^",MSGCNT=MSGCNT+1
 S DVBCCNT=DVBCCNT+1
 Q
ITEMSD S ZZZ=$S($D(^VA(200,+REQSTR,0)):$P(^(0),U,1),1:" (Not specified) ")
 S EXAMRECRD=EXAMRECRD_""""_ZZZ_""""_DVBADLMTR_""""_RONAME_""""_DVBADLMTR
 D TST S DVBCCNT=DVBCCNT+1
 Q
 ;
PRINTD ; Print delimited format output on report
 ;
 I OWNDOM']"" S TRNSFIN=""
 S RONUM=$P(^DVB(396.3,DA(1),0),U,3)
 D DEM^VADPT I $G(VADM(1))'="" S SSN=$S(DVBADLMTR=",":$P($G(VADM(2)),U,2),1:$P($G(VADM(2)),U,1))
 S EXAMRECRD=$S($G(ROFILTER)'=0:RONUM_DVBADLMTR,1:"")_""""_ADIV_""""_DVBADLMTR_""""_STATUS_""""_DVBADLMTR_""""_PNAM_""""_DVBADLMTR
 S EXAMRECRD=EXAMRECRD_SSN_DVBADLMTR_$C(160)_CNUM_DVBADLMTR_$$FMTE^XLFDT(RDATE1,"5DZ")_DVBADLMTR_EDAYS_DVBADLMTR_TRNSFIN_DVBADLMTR
 Q
 ;
NXT F DA(1)=0:0 S DA(1)=$O(^TMP($J,JX,PNAM,DFN,DA(1))) Q:DA(1)=""  D PRINT I $D(OUT) S DA(1)="",PNAM="ZZZZ",JX=$S($A(JX)>57:PNAM,1:9999999),DONE="YES"
 Q
TST F DA=0:0 S DA=$O(^DVB(396.4,"C",DA(1),DA)) Q:DA=""  K PRINT S TSTAT=$P(^DVB(396.4,DA,0),U,4),TST=$P(^DVB(396.4,DA,0),U,3),PRTNM=$S($D(^DVB(396.6,TST,0)):$P(^(0),U,2),1:"") D TST1
 Q
TST1 S TSTA1=""
 I $D(^DVB(396.4,DA,"CAN")) S TSTA1=$P(^DVB(396.4,DA,"CAN"),U,3)
 I $D(^DVB(396.4,DA,"TRAN")) S X=$P(^DVB(396.4,DA,"TRAN"),U,3)
 S:TSTA1]"" TSTA1=$P(^DVB(396.5,TSTA1,0),U,1)
 I $G(DVBADLMTR)'="," D
 . S ^TMP("CAPRI",MSGCNT)=$S(PRTNM]"":PRTNM,1:"Missing exam name")
 . S ^TMP("CAPRI",MSGCNT)=^TMP("CAPRI",MSGCNT)_$S(TSTA1]"":" - cancelled ("_TSTA1_")",TSTAT="T":" - Transferred",TSTAT]"":" - "_$$EXTERNAL^DILFD(396.4,.04,,TSTAT),TSTAT="":" (Unknown status)",1:"")_"^"
 . S MSGCNT=MSGCNT+1
 . I TSTAT="T" S X=$S($D(^DIC(4.2,+X,0)):$P(^(0),U,1),1:"unknown site") S ^TMP("CAPRI",MSGCNT)=" to "_$P(X,".",1),MSGCNT=MSGCNT+1
 . Q
 I $G(DVBADLMTR)="," D
 . D CLAIMTYP,SPEC
 . S PRTNM=$S(PRTNM]"":PRTNM,1:"Missing exam name"),TSTAT=$S(TSTA1]"":"Cancelled ("_TSTA1_")",TSTAT="T":"Transferred",TSTAT]"":$$EXTERNAL^DILFD(396.4,.04,,TSTAT),TSTAT="":" (Unknown status)",1:"")
 . S ^TMP("CAPRI",MSGCNT)=EXAMRECRD_""""_PRTNM_""""_DVBADLMTR_""""_TSTAT_""""_DVBADLMTR_""""_DVBCELL_""""_DVBADLMTR_""""_DVBEMA_""""_DVBADLMTR_""""_DVBCTW_""""_DVBADLMTR_""""_DVBSCWA_""""
 . I TSTAT="T" S X=$S($D(^DIC(4.2,+X,0)):$P(^(0),U,1),1:"unknown site") S ^TMP("CAPRI",MSGCNT)=^TMP("CAPRI",MSGCNT)_" to "_$P(X,".",1)
 . S ^TMP("CAPRI",MSGCNT)=^TMP("CAPRI",MSGCNT)_$C(13)
 S MSGCNT=MSGCNT+1
 Q
CLAIMTYP ;THE CLAIM TYPE OF A 2507 REQUEST
 S DVBCTW=""
 Q:'$D(^DVB(396.3,DA(1),9,0))
 ;DVBIEN is the 2507 REQUEST FILE IEN
 ;DVBCTW is the string /name of the CLAIM TYPE
 D GETS^DIQ(396.3,DA(1)_",","9.1*","E","MSG","ERR")
 S DVBCTW=MSG("396.32","1,"_DA(1)_",",".01","E")
 Q
 ;
SPEC ;SPECIAL CONSIDERATION(S) FOR A 2507 REQUEST
 K DVBSCW
 S DVBSCWA=""
 Q:'$D(^DVB(396.3,DA(1),8))
 ;DA(1) is the 2507 REQUEST FILE IEN
 ;DVBSC is a the SPECIAL CONSIDERATION entry for the 2507 REQUEST
 ;DVBSCN is the pointer number to the SPECIAL CONSIDERATION file 396.25
 ;DVBSCW is the string /name of the SPECIAL CONSIDERATION
 S DVBAA=$P(^DVB(396.3,DA(1),8,0),U,4)
 S (DVBSC,DVBCNT)=0 F  S DVBSC=$O(^DVB(396.3,DA(1),8,DVBSC)) Q:'DVBSC  D
 .S DVBSCN=$P(^DVB(396.3,DA(1),8,DVBSC,0),U,1)
 .S DVBSCW(DVBSC)=$G(^DVB(396.25,DVBSCN,0))
 .S DVBCNT=DVBCNT+1
 .I (DVBCNT'=DVBAA) S:$D(DVBSCW(DVBSC)) DVBSCW(DVBSC)=DVBSCW(DVBSC)_","
 S DVBX="" F  S DVBX=$O(DVBSCW(DVBX)) Q:'DVBX  S DVBSCWA=DVBSCWA_DVBSCW(DVBX)
 Q
