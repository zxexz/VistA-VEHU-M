GMTSPXXP ; SLC/SBW,KER,PKR - PCE Examination Comp ; 02/08/2019
 ;;2.7;Health Summary;**8,10,28,56,122**;Oct 20, 1995;Build 71
 ;
 ; External References
 ;   DBIA  3063  EXAM^PXRHS05
 ;   DBIA 10011  ^DIWP
 ;   DBIA  6225  UCUMCODE^LEXMUCUM
 ;                    
MRE ; Most Recent Examination
 K ^TMP("PXE",$J)
 N MAX S MAX=1
 ;                    
 ;   This routine could be expanded to included
 ;   occurrence limits by setting max to GMTSNDM
 ;   and enabling occurrence limit for the 
 ;   component. Component name would have to 
 ;   change also.
 ;                    
 D EXAM^PXRHS05(DFN,GMTSEND,GMTSBEG,MAX) Q:'$D(^TMP("PXE",$J))
 N COMMENT,EXAM,GMDT,GMEXAM,GMICL,GMIFN,GMN0,GMN1,GMSITE
 N GMTAB,GMTSDATE,GMTSLN,RESULT,TEXT,X,WDATE
 D CKP^GMTSUP Q:$D(GMTSQIT)  D:GMTSNPG HDR
 S GMDT=0
 F  S GMDT=+$O(^TMP("PXE",$J,GMDT)) Q:GMDT=0  D  Q:$D(GMTSQIT)
 . S GMEXAM="",WDATE=1
 . F  S GMEXAM=$O(^TMP("PXE",$J,GMDT,GMEXAM)) Q:GMEXAM=""  D  Q:$D(GMTSQIT)
 .. S GMIFN=0
 .. F  S GMIFN=$O(^TMP("PXE",$J,GMDT,GMEXAM,GMIFN)) Q:GMIFN'>0  D EXAMDSP(WDATE) S WDATE=0 Q:$D(GMTSQIT)
 K ^TMP("PXE",$J)
 Q
 ;
HDR ; Header
 W "Event/Visit",?12,"Facility",?25,"Exam - Result"
 W !,?3,"Date",!!
 Q
 ;
EXAMDSP(WDATE) ; Display Exam Data
 S GMN0=$G(^TMP("PXE",$J,GMDT,GMEXAM,GMIFN,0)) Q:GMN0']""
 S GMN1=$G(^TMP("PXE",$J,GMDT,GMEXAM,GMIFN,1))
 S GMSITE=$S($P(GMN1,U,3)]"":$E($P(GMN1,U,3),1,10),$P(GMN1,U,4)]"":$E($P(GMN1,U,4),1,10),1:"No Site")
 D CKP^GMTSUP Q:$D(GMTSQIT)  D:GMTSNPG HDR
 S X=$P(GMN0,U,2) D REGDT4^GMTSU S GMTSDATE=X
 S EXAM=$P(GMN0,U,1),RESULT=$P(GMN0,U,4)
 I RESULT'="" S RESULT=" - "_RESULT
 S TEXT=EXAM_RESULT
 I (WDATE=1) W GMTSDATE
 W ?12,GMSITE
 I $L(TEXT)<56 W ?25,TEXT,!
 E  D LONGTEXT(TEXT)
 I $G(^TMP("PXE",$J,GMDT,GMEXAM,GMIFN,"MEASUREMENT"))'="" D
 . N MEAS
 . S MEAS=^TMP("PXE",$J,GMDT,GMEXAM,GMIFN,"MEASUREMENT")
 . S TEXT="  Measurement: "_$P(MEAS,U,1)
 . I $P(MEAS,U,2)'="" S TEXT=TEXT_" "_$$UCUMCODE^LEXMUCUM($P(MEAS,U,2))
 . I $L(TEXT)<56 W ?25,TEXT,!
 . E  D LONGTEXT(TEXT)
 S COMMENT=$P($G(^TMP("PXE",$J,GMDT,GMEXAM,GMIFN,"COM")),U,1)
 I COMMENT]"" S GMICL=26,GMTAB=2 D FORMAT I $D(^UTILITY($J,"W")) D
 . F GMTSLN=1:1:^UTILITY($J,"W",DIWL) D LINE Q:$D(GMTSQIT)
 Q
 ;
FORMAT ; Format Line
 N DIWR,DIWF,X S DIWL=3,DIWR=80-(GMICL+GMTAB) K ^UTILITY($J,"W")
 S X=COMMENT D ^DIWP
 Q
 ;
LINE ; Write Line
 D CKP^GMTSUP Q:$D(GMTSQIT)  W ?26,^UTILITY($J,"W",DIWL,GMTSLN,0),!
 Q
 ;
LONGTEXT(TEXT) ;
 N BPT,IND
 S BPT=55
 F IND=55:-1  Q:(BPT<55)!(IND=1)  I $E(TEXT,IND)=" " S BPT=IND
 W ?25,$E(TEXT,1,BPT),!
 W ?25,$E(TEXT,(BPT+1),$L(TEXT)),!
 Q
 ;
