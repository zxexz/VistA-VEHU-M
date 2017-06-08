LEX2087A ;ISL/KER - LEX*2.0*87 Pre/Post Install Check ;06/14/2014
 ;;2.0;LEXICON UTILITY;**87**;Sep 23, 1996;Build 1
 ;               
 ; Global Variables 
 ;    ^LEX(              N/A
 ;    ^ICD9(             ICR  4485
 ;    ^ICD0(             ICR  4486
 ;    ^ICDS(             ICR  5755
 ;               
 ; External References
 ;               
 Q
POST ; Check
 Q:$$DT^XLFDT>3140930  K ^TMP("LEX2087A",$J)
 N LEXT,LEXCK,LEXOK,LEXBEG,LEXEND,LEXDO,LEXDN,LEXELP,LEXOT,LEXNT S (LEXOT,LEXNT)=0
 S LEXDO=3141001,LEXDN=3151001
 S LEXBEG=$$NOW^XLFDT D BMES^XPDUTL(" Running Post-Install Environment Check:   2-5 minutes")
 S LEXT=$J(" ",43)_"ICD Effective Dates" D T2("   "),T2(LEXT)
 S LEXT="   File Name/Number" S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J("10/01/2014",10)
 S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J("10/01/2015",10) D T2(LEXT)
 S LEXT="   ---------------------------------    ----------     ----------" D T2(LEXT)
 S LEXCK=1,LEXOK=$G(LEXOK)+($$F75702)
 S LEXCK=2,LEXOK=$G(LEXOK)+($$F75703)
 S LEXCK=3,LEXOK=$G(LEXOK)+($$F757033)
 S LEXCK=4,LEXOK=$G(LEXOK)+($$F80)
 S LEXCK=5,LEXOK=$G(LEXOK)+($$F801)
 S LEXCK=6,LEXOK=$G(LEXOK)+($$F802)
 S LEXCK=7,LEXOK=$G(LEXOK)+($$F804)
 S LEXCK=8,LEXOK=$G(LEXOK)+($$F805)
 I (LEXOT+LEXNT)>0 D
 . S LEXT="   Totals"
 . S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J($FN(LEXOT,","),10)
 . S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J($FN(LEXNT,","),10)
 . D T2(LEXT)
 D:+($G(LEXCK))=+($G(LEXOK)) EOK D:+($G(LEXCK))'=+($G(LEXOK)) ENOK
 S LEXEND=$$NOW^XLFDT
 S LEXELP=$$FMDIFF^XLFDT(LEXEND,LEXBEG,3)
 S:LEXELP[" "&($L(LEXELP," ")=2) LEXELP=$TR(LEXELP," ","0")
 S LEXT="   Start:   "_$TR($$FMTE^XLFDT(LEXBEG,"5Z"),"@"," ") W:$D(TEST) !!,LEXT
 S LEXT="   Finish:  "_$TR($$FMTE^XLFDT(LEXEND,"5Z"),"@"," ") W:$D(TEST) !,LEXT
 S LEXT="   Elapsed: "_LEXELP W:$D(TEST) !,LEXT
 S LEXT=" Post-Install Environment Check Complete:  "_$$FMTE^XLFDT(LEXEND)
 D MES^XPDUTL(" "),MES^XPDUTL(LEXT),MES^XPDUTL(" ") D BM D:$O(^TMP("LEX2087A",$J,"MSG",0))>0 MAIL
 Q
F75702(X) ;
 N LEXCD,LEXDN,LEXDO,LEXDTS,LEXEFF,LEXF,LEXHIEN,LEXIX,LEXN,LEXN0,LEXND
 N LEXO,LEXOD,LEXR,LEXSAB,LEXSIEN,LEXSR,LEXSTA,LEXT
 S LEXDO=3141001,LEXDN=3151001
 F LEXSAB="ICD","ICP","10D","10P" D
 . N LEXSIEN S LEXSIEN=0 F  S LEXSIEN=$O(^LEX(757.02,"ASRC",LEXSAB,LEXSIEN)) Q:+LEXSIEN'>0  D
 . . N LEXHIEN,LEXEFF,LEXND,LEXN0,LEXCD,LEXIX,LEXSR,LEXSTA
 . . S LEXN0=$G(^LEX(757.02,+LEXSIEN,0)),LEXCD=$P(LEXN0,"^",2),LEXSR=$P(LEXN0,"^",3)
 . . S LEXHIEN=0 F  S LEXHIEN=$O(^LEX(757.02,LEXSIEN,4,LEXHIEN)) Q:+LEXHIEN'>0  D
 . . . S LEXND=$G(^LEX(757.02,LEXSIEN,4,LEXHIEN,0)),LEXEFF=$P(LEXND,"^",1)
 . . . S:LEXEFF=LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . . . S:LEXEFF=LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 . . S LEXEFF="" F  S LEXEFF=$O(^LEX(757.02,LEXSIEN,4,"B",LEXEFF)) Q:'$L(LEXEFF)  D
 . . . S:LEXEFF=LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . . . S:LEXEFF=LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 . . ; ACT
 . . S LEXSTA=0 F  S LEXSTA=$O(^LEX(757.02,"ACT",(LEXCD_" "),LEXSTA)) Q:+LEXSTA'>0  D
 . . . N LEXEFF S LEXEFF="" F  S LEXEFF=$O(^LEX(757.02,"ACT",(LEXCD_" "),LEXSTA,LEXEFF)) Q:'$L(LEXEFF)  D
 . . . . S:LEXEFF=LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . . . . S:LEXEFF=LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 . . F LEXIX="ADX","APR" D
 . . . N LEXEFF S LEXEFF="" F  S LEXEFF=$O(^LEX(757.02,LEXIX,(LEXCD_" "),LEXEFF)) Q:'$L(LEXEFF)  D
 . . . . S:LEXEFF=LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . . . . S:LEXEFF=LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 . S LEXEFF="" F  S LEXEFF=$O(^LEX(757.02,"AUPD",LEXSAB,LEXEFF)) Q:'$L(LEXEFF)  D
 . . S:LEXEFF=LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . . S:LEXEFF=LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXO=+($G(LEXDTS(LEXDO))),LEXOD=$$FMTE^XLFDT(LEXDO,"5Z")
 S LEXN=+($G(LEXDTS(LEXDN))),LEXND=$$FMTE^XLFDT(LEXDN,"5Z")
 S LEXT="CODE",LEXF=757.02,LEXR="^LEX(757.02,"
 S LEXT="   "_LEXT_" file #"_LEXF
 S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J($FN(LEXO,","),10)
 S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J($FN(LEXN,","),10)
 D T2(LEXT)
 S LEXOT=+($G(LEXOT))+($G(LEXO)),LEXNT=+($G(LEXNT))+($G(LEXN))
 S X=0 S:+($G(LEXO))'>0&(+($G(LEXN))>0) X=1
 Q X
F75703(X) ;
 N LEXDN,LEXDO,LEXDTS,LEXEFF,LEXF,LEXN,LEXND,LEXO,LEXOD,LEXR,LEXT
 S LEXDO=3141001,LEXDN=3151001
 S LEXEFF=$P($G(^LEX(757.03,30,2)),"^",1)
 S:LEXEFF=LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 S:LEXEFF=LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXEFF=$P($G(^LEX(757.03,31,2)),"^",1)
 S:LEXEFF=LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 S:LEXEFF=LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXO=+($G(LEXDTS(LEXDO))),LEXOD=$$FMTE^XLFDT(LEXDO,"5Z")
 S LEXN=+($G(LEXDTS(LEXDN))),LEXND=$$FMTE^XLFDT(LEXDN,"5Z")
 S LEXT="CODING SYSTEMS",LEXF=757.03,LEXR="^LEX(757.03,"
 S LEXT="   "_LEXT_" file #"_LEXF
 S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J($FN(LEXO,","),10)
 S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J($FN(LEXN,","),10)
 D T2(LEXT)
 S LEXOT=+($G(LEXOT))+($G(LEXO)),LEXNT=+($G(LEXNT))+($G(LEXN))
 S X=0 S:+($G(LEXO))'>0&(+($G(LEXN))>0) X=1
 Q X
F757033(X) ;
 N LEXDN,LEXDO,LEXDTS,LEXF,LEXN,LEXNC,LEXND,LEXNN,LEXO,LEXOD
 N LEXR,LEXT S LEXDO=3141001,LEXDN=3151001
 S LEXNN="^LEX(757.033)",LEXNC="^LEX(757.033,"
 F  S LEXNN=$Q(@LEXNN) Q:'$L(LEXNN)!(LEXNN'[LEXNC)  D
 . N LEXND S LEXND=$G(@LEXNN)
 . S:LEXND[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXND[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 . S:LEXNN[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXNN[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXO=+($G(LEXDTS(LEXDO))),LEXOD=$$FMTE^XLFDT(LEXDO,"5Z")
 S LEXN=+($G(LEXDTS(LEXDN))),LEXND=$$FMTE^XLFDT(LEXDN,"5Z")
 S LEXT="CHARACTER POSITIONS",LEXF=757.033,LEXR="^LEX(757.033,"
 S LEXT="   "_LEXT_" file #"_LEXF
 S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J($FN(LEXO,","),10)
 S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J($FN(LEXN,","),10)
 D T2(LEXT)
 S LEXOT=+($G(LEXOT))+($G(LEXO)),LEXNT=+($G(LEXNT))+($G(LEXN))
 S X=0 S:+($G(LEXO))'>0&(+($G(LEXN))>0) X=1
 Q X
F80(X) ;
 N LEXDN,LEXDO,LEXDTS,LEXF,LEXN,LEXNC,LEXND,LEXNN,LEXO,LEXOD
 N LEXR,LEXT S LEXDO=3141001,LEXDN=3151001
 S LEXNN="^ICD9",LEXNC="^ICD9("
 F  S LEXNN=$Q(@LEXNN) Q:'$L(LEXNN)!(LEXNN'[LEXNC)  D
 . N LEXND S LEXND=$G(@LEXNN)
 . S:LEXND[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXND[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 . S:LEXNN[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXNN[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXO=+($G(LEXDTS(LEXDO))),LEXOD=$$FMTE^XLFDT(LEXDO,"5Z")
 S LEXN=+($G(LEXDTS(LEXDN))),LEXND=$$FMTE^XLFDT(LEXDN,"5Z")
 S LEXT="ICD DIAGNOSIS",LEXF=80,LEXR="^ICD9("
 S LEXT="   "_LEXT_" file #"_LEXF
 S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J($FN(LEXO,","),10)
 S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J($FN(LEXN,","),10)
 D T2(LEXT)
 S LEXOT=+($G(LEXOT))+($G(LEXO)),LEXNT=+($G(LEXNT))+($G(LEXN))
 S X=0 S:+($G(LEXO))'>0&(+($G(LEXN))>0) X=1
 Q X
F801(X) ;
 N LEXDN,LEXDO,LEXDTS,LEXF,LEXN,LEXNC,LEXND,LEXNN,LEXO,LEXOD
 N LEXR,LEXT S LEXDO=3141001,LEXDN=3151001
 S LEXNN="^ICD0",LEXNC="^ICD0("
 F  S LEXNN=$Q(@LEXNN) Q:'$L(LEXNN)!(LEXNN'[LEXNC)  D
 . N LEXND S LEXND=$G(@LEXNN)
 . S:LEXND[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXND[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 . S:LEXNN[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXNN[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXO=+($G(LEXDTS(LEXDO))),LEXOD=$$FMTE^XLFDT(LEXDO,"5Z")
 S LEXN=+($G(LEXDTS(LEXDN))),LEXND=$$FMTE^XLFDT(LEXDN,"5Z")
 S LEXT="ICD OPERATION/PROCEDURE",LEXF=80.1,LEXR="^ICD0("
 S LEXT="   "_LEXT_" file #"_LEXF
 S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J($FN(LEXO,","),10)
 S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J($FN(LEXN,","),10)
 D T2(LEXT)
 S LEXOT=+($G(LEXOT))+($G(LEXO)),LEXNT=+($G(LEXNT))+($G(LEXN))
 S X=0 S:+($G(LEXO))'>0&(+($G(LEXN))>0) X=1
 Q X
F804(X) ;
 N LEXDN,LEXDO,LEXDTS,LEXEFF,LEXF,LEXN,LEXND,LEXO,LEXOD,LEXR,LEXT
 S LEXDO=3141001,LEXDN=3151001
 S LEXEFF=$P($G(^ICDS(30,0)),"^",4)
 S:LEXEFF=LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 S:LEXEFF=LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXEFF=$P($G(^ICDS(31,0)),"^",4)
 S:LEXEFF=LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 S:LEXEFF=LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXO=+($G(LEXDTS(LEXDO))),LEXOD=$$FMTE^XLFDT(LEXDO,"5Z")
 S LEXN=+($G(LEXDTS(LEXDN))),LEXND=$$FMTE^XLFDT(LEXDN,"5Z")
 S LEXT="ICD CODING SYSTEMS",LEXF=80.4,LEXR="^ICDS("
 S LEXT="   "_LEXT_" file #"_LEXF
 S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J($FN(LEXO,","),10)
 S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J($FN(LEXN,","),10)
 D T2(LEXT)
 S LEXOT=+($G(LEXOT))+($G(LEXO)),LEXNT=+($G(LEXNT))+($G(LEXN))
 S X=0 S:+($G(LEXO))'>0&(+($G(LEXN))>0) X=1
 Q X
F802(X) ; ICD global
 N LEXDN,LEXDO,LEXDTS,LEXF,LEXN,LEXNC,LEXND,LEXNN,LEXO,LEXOD
 N LEXR,LEXT S LEXDO=3141001,LEXDN=3151001
 S LEXNN="^ICD",LEXNC="^ICD("
 F  S LEXNN=$Q(@LEXNN) Q:'$L(LEXNN)!(LEXNN'[LEXNC)  D
 . N LEXND S LEXND=$G(@LEXNN)
 . S:LEXND[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXND[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 . S:LEXNN[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXNN[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXO=+($G(LEXDTS(LEXDO))),LEXOD=$$FMTE^XLFDT(LEXDO,"5Z")
 S LEXN=+($G(LEXDTS(LEXDN))),LEXND=$$FMTE^XLFDT(LEXDN,"5Z")
 S LEXT="DRG",LEXF=80.2,LEXR="^ICD("
 S LEXT="   "_LEXT_" file #"_LEXF
 S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J($FN(LEXO,","),10)
 S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J($FN(LEXN,","),10)
 D T2(LEXT)
 S LEXOT=+($G(LEXOT))+($G(LEXO)),LEXNT=+($G(LEXNT))+($G(LEXN))
 S X=0 S:+($G(LEXO))'>0&(+($G(LEXN))>0) X=1
 Q X
F805(X) ;
 N LEXDN,LEXDO,LEXDTS,LEXF,LEXN,LEXNC,LEXND,LEXNN,LEXO,LEXOD
 N LEXR,LEXT S LEXDO=3141001,LEXDN=3151001
 S LEXNN="^ICDRS",LEXNC="^ICDRS("
 F  S LEXNN=$Q(@LEXNN) Q:'$L(LEXNN)!(LEXNN'[LEXNC)  D
 . N LEXND S LEXND=$G(@LEXNN)
 . S:LEXND[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXND[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 . S:LEXNN[LEXDO LEXDTS(LEXDO)=+($G(LEXDTS(LEXDO)))+1
 . S:LEXNN[LEXDN LEXDTS(LEXDN)=+($G(LEXDTS(LEXDN)))+1
 S LEXO=+($G(LEXDTS(LEXDO))),LEXOD=$$FMTE^XLFDT(LEXDO,"5Z")
 S LEXN=+($G(LEXDTS(LEXDN))),LEXND=$$FMTE^XLFDT(LEXDN,"5Z")
 S LEXT="DRG SURGICAL HIERARCHY",LEXF=80.5,LEXR="^ICDRS("
 S LEXT="   "_LEXT_" file #"_LEXF
 S LEXT=LEXT_$J(" ",(40-$L(LEXT)))_$J($FN(LEXO,","),10)
 S LEXT=LEXT_$J(" ",(55-$L(LEXT)))_$J($FN(LEXN,","),10)
 D T2(LEXT)
 S LEXOT=+($G(LEXOT))+($G(LEXO)),LEXNT=+($G(LEXNT))+($G(LEXN))
 S X=0 S:+($G(LEXO))'>0&(+($G(LEXN))>0) X=1
 Q X
EOK ; Environment is OK
 N LEXT I $G(LEXDO)'?7N!($G(LEXDN)'?7N) S LEXT="   Environment is ok." D T1(" "),T1(LEXT)
 I $G(LEXDO)?7N,$G(LEXDN)?7N D
 . D T1(" ") S LEXT="   Environment is ok.  All Effective dates of "_$$FMTE^XLFDT($G(LEXDO),"5Z")_" have"
 . D T1(LEXT) S LEXT="   been changed to "_$$FMTE^XLFDT($G(LEXDN),"5Z") D T1(LEXT)
 Q
ENOK ; Environment is not OK
 N LEXT I $G(LEXDO)'?7N!($G(LEXDN)'?7N) S LEXT="   Environment is not ok." D T1(" "),T1(LEXT)
 I $G(LEXDO)?7N,$G(LEXDN)?7N D
 . D T1(" ") S LEXT="   Environment is not ok.  Some effective dates of "_$$FMTE^XLFDT($G(LEXDO),"5Z")_" have"
 . D T1(LEXT) S LEXT="   not been changed to "_$$FMTE^XLFDT($G(LEXDN),"5Z") D T1(LEXT)
 Q
BM ; Build Message
 K ^TMP("LEX2087A",$J,"MSG") Q:$O(^TMP("LEX2087A",$J,1,0))'>0  Q:$O(^TMP("LEX2087A",$J,2,0))'>0
 N LEXS F LEXS=1,2 D
 . N LEXI S LEXI=0 F  S LEXI=$O(^TMP("LEX2087A",$J,LEXS,LEXI)) Q:+LEXI'>0  D
 . . N LEXT S LEXT=$G(^TMP("LEX2087A",$J,LEXS,LEXI)) D T3(LEXT)
 Q 
MAIL ; Mail Message
 N DIFROM,LEXPRI,LEXADR,LEXI,LEXM,XCNP,XMDUZ,XMDUN,XMSCR,XMSUB,XMTEXT,XMY,XMZ
 K ^TMP("LEXMSG",$J) S XMSUB="ICD-10 Date Change - Oct 1, 2015"
 S LEXPRI=$$ADR G:'$L(LEXPRI) MAILQ S LEXPRI="G.LEXINS@"_LEXPRI
 S LEXADR=$$GET1^DIQ(200,+($G(DUZ)),.01) G:'$L(LEXADR) MAILQ
 S U="^" S LEXI=0 F  S LEXI=$O(^TMP("LEX2087A",$J,"MSG",LEXI)) Q:+LEXI=0  D
 . S LEXM=+($O(^TMP("LEXMSG",$J," "),-1))+1
 . S ^TMP("LEXMSG",$J,LEXM,0)=$E($G(^TMP("LEX2087A",$J,"MSG",LEXI)),1,79)
 . S ^TMP("LEXMSG",$J,0)=LEXM
 K ^TMP("LEX2087A",$J,"MSG") G:+($G(^TMP("LEXMSG",$J,0)))'>0 MAILQ
 S XMY(LEXPRI)="",XMY(LEXADR)="",XMTEXT="^TMP(""LEXMSG"",$J,",XMDUZ=.5 D ^XMD
MAILQ ; Quit Mail
 K XCNP,XMSCR,XMDUZ,XMY,XMZ,XMSUB,XMY,XMTEXT,XMDUZ K ^TMP("LEXMSG",$J),^TMP("LEX2087A",$J)
 Q
ADR(LEX) ; Mailing Address
 N DIC,DTOUT,DUOUT,X,Y S DIC="^DIC(4.2,",DIC(0)="M",(LEX,X)="DOMAIN.EXT" D ^DIC Q:+Y>0 LEX
 S DIC="^DIC(4.2,",DIC(0)="M",(LEX,X)="ISC-SLC.DOMAIN.EXT" D ^DIC Q:+Y>0 LEX
 Q "ISC-SLC.DOMAIN.EXT"
ST ; Show Text
 N LEXS F LEXS=1,2,3 D
 . N LEXI S LEXI=0 F  S LEXI=$O(^TMP("LEX2087A",$J,LEXS,LEXI)) Q:+LEXI'>0  D
 . . W !,$G(^TMP("LEX2087A",$J,LEXS,LEXI))
 Q
T1(X) ; Text 1
 N LEXI S LEXI=$O(^TMP("LEX2087A",$J,1," "),-1)+1
 S ^TMP("LEX2087A",$J,1,LEXI)=$G(X) D MES^XPDUTL($G(X))
 Q
T2(X) ; Text 2
 N LEXI S LEXI=$O(^TMP("LEX2087A",$J,2," "),-1)+1
 S ^TMP("LEX2087A",$J,2,LEXI)=$G(X) D MES^XPDUTL($G(X))
 Q
T3(X) ; Text 3
 N LEXI S LEXI=$O(^TMP("LEX2087A",$J,"MSG"," "),-1)+1
 S ^TMP("LEX2087A",$J,"MSG",LEXI)=$G(X)
 Q
