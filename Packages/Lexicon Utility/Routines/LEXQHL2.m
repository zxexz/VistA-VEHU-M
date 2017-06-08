LEXQHL2 ;ISL/KER - Query History - ICD-9/10 Procedure Extract ;12/19/2014
 ;;2.0;LEXICON UTILITY;**62,80,86**;Sep 23, 1996;Build 1
 ;           
 ; Global Variables
 ;    ^ICM(               ICR   4488
 ;    ^TMP("LEXQHL")      SACC 2.3.2.5.1
 ;               
 ; External References
 ;    $$CODEC^ICDEX       ICR   5747
 ;    $$ICDOP^ICDEX       ICR   5747
 ;    $$ROOT^ICDEX        ICR   5747
 ;    $$CODEABA^ICDEX     ICR   5747
 ;    $$UP^XLFSTR         ICR  10104
 ;               
 Q
EN(X,Y) ; ICD Procedure File
 N LEXIEN,LEXTIEN,LEXDISP,LEXIA,LEXEF,LEXCT,LEXC,LEXSYS,LEXTMP S LEXIEN=$G(X),LEXDISP=$G(Y),LEXIA="" Q:+LEXIEN'>0
 S LEXC=$$CODEC^ICDEX(80.1,+LEXIEN) Q:'$L(LEXC)  S LEXSYS=0 S LEXTIEN=$$CODEABA^ICDEX(LEXC,80.1,2) I LEXTIEN>0 S LEXSYS=2 Q:LEXTIEN'=LEXIEN
 I LEXSYS'>0 S LEXTIEN=$$CODEABA^ICDEX(LEXC,80.1,31) I LEXTIEN>0 S LEXSYS=31 Q:LEXTIEN'=LEXIEN
 Q:+($G(LEXSYS))'>0  K ^TMP("LEXQHL",$J) S ^TMP("LEXQHL",$J,"IEN")=LEXIEN,^TMP("LEXQHL",$J,"CODE")=LEXC
 S LEXTMP=$$ICDOP^ICDEX(LEXIEN,,LEXSYS,"I"),^TMP("LEXQHL",$J,"NAME")=$P(LEXTMP,U,5)
 S:'$L(LEXDISP) LEXDISP="SB" D ST,OP,DS,MD D:$L($G(LEXDISP)) DP K ^TMP("LEXQHL",$J)
 Q
ST ;   1  Status
 N LEXCT,LEXD,LEXE,LEXEF,LEXH,LEXMS,LEXN,LEXS,LEXT,LEXRT,LEXARY S LEXRT=$$ROOT^ICDEX(80.1)
 M LEXARY=@(LEXRT_+LEXIEN_",66)") S LEXCT=0,LEXEF="" F  S LEXEF=$O(LEXARY("B",LEXEF)) Q:'$L(LEXEF)  D
 . N LEXH S LEXH=0 F  S LEXH=$O(LEXARY("B",LEXEF,LEXH)) Q:+LEXH'>0  D
 . . N LEXN,LEXS,LEXE,LEXT,LEXD,LEXMS S LEXN=$G(LEXARY(+LEXH,0)),LEXE=$P(LEXN,U,1),LEXS=$P(LEXN,U,2)
 . . Q:+LEXS'>0&(LEXCT'>0)  S LEXCT=LEXCT+1,LEXMS=$$MS^LEXQHLM(LEXE,0),LEXT=$S(+LEXS>0:"Activation",1:"Inactivation")
 . . S:+LEXS>0&(LEXCT=1) LEXT="Initial Activation"_LEXMS,LEXIA=LEXE
 . . S:$O(LEXARY("B",LEXEF))=""&(LEXCT>1) LEXT=LEXT_" (final status change)"
 . . S LEXD=$$SD^LEXQHLM(LEXE) S ^TMP("LEXQHL",$J,LEXEF,1,1)=LEXD_U_LEXT
 Q
OP ;   2  Operation/Procedure
 N LEX,LEXC,LEXCT,LEXD,LEXE,LEXEF,LEXH,LEXI,LEXN,LEXS,LEXT,LEXRT,LEXARY S LEXRT=$$ROOT^ICDEX(80.1)
 M LEXARY=@(LEXRT_+LEXIEN_",67)") S LEXCT=0,LEXEF="" F  S LEXEF=$O(LEXARY("B",LEXEF)) Q:'$L(LEXEF)  D
 . N LEXH S LEXH=0 F  S LEXH=$O(LEXARY("B",LEXEF,LEXH)) Q:+LEXH'>0  D
 . . N LEXN,LEXS,LEXE,LEXT,LEXD,LEX,LEXI S LEXN=$G(LEXARY(+LEXH,0)),LEXE=$P(LEXN,U,1),LEXT=$$UP^XLFSTR($P(LEXN,U,2))
 . . S LEXCT=LEXCT+1,LEX(1)=LEXT D PR^LEXQHLM(.LEX,63)
 . . S LEXS=$S(+LEXCT=1:"Initial Operation/Procedure",+LEXCT>1:"Updated Operation/Procedure",1:"Operation/Procedure")
 . . S:$O(LEXARY("B",LEXEF))=""&(LEXCT>1) LEXT=LEXT_" (final operation/procedure change)"
 . . S LEXD=$$SD^LEXQHLM(LEXE) S ^TMP("LEXQHL",$J,LEXEF,2,1)=LEXD_U_LEXS
 . . S LEXI=0 F  S LEXI=$O(LEX(LEXI)) Q:+LEXI'>0  D
 . . . N LEXC S LEXT=$G(LEX(LEXI)) Q:'$L(LEXT)  S LEXC=$O(^TMP("LEXQHL",$J,LEXEF,2," "),-1)+1
 . . . S ^TMP("LEXQHL",$J,LEXEF,2,LEXC)=U_LEXT
 Q
DS ;   3  Description
 N LEX,LEXC,LEXCT,LEXD,LEXE,LEXEF,LEXH,LEXI,LEXN,LEXS,LEXT,LEXRT,LEXARY S LEXRT=$$ROOT^ICDEX(80.1)
 M LEXARY=@(LEXRT_+LEXIEN_",68)") S LEXCT=0,LEXEF="" F  S LEXEF=$O(LEXARY("B",LEXEF)) Q:'$L(LEXEF)  D
 . N LEXH S LEXH=0 F  S LEXH=$O(LEXARY("B",LEXEF,LEXH)) Q:+LEXH'>0  D
 . . N LEXN,LEXS,LEXE,LEXT,LEXD,LEX,LEXI S LEXN=$G(LEXARY(+LEXH,0))
 . . S LEXE=$P(LEXN,U,1),LEXT=$$UP^XLFSTR($G(LEXARY(+LEXH,1)))
 . . S LEXCT=LEXCT+1,LEX(1)=LEXT D PR^LEXQHLM(.LEX,63)
 . . S LEXS=$S(+LEXCT=1:"Initial Description",+LEXCT>1:"Updated Description",1:"Description")
 . . S:$O(LEXARY("B",LEXEF))=""&(LEXCT>1) LEXT=LEXT_" (final description change)"
 . . S LEXD=$$SD^LEXQHLM(LEXE) S ^TMP("LEXQHL",$J,LEXEF,3,1)=LEXD_U_LEXS
 . . S LEXI=0 F  S LEXI=$O(LEX(LEXI)) Q:+LEXI'>0  D
 . . . N LEXC S LEXT=$G(LEX(LEXI)) Q:'$L(LEXT)  S LEXC=$O(^TMP("LEXQHL",$J,LEXEF,3," "),-1)+1
 . . . S ^TMP("LEXQHL",$J,LEXEF,3,LEXC)=U_LEXT
 Q
MD ;   4  MDC/DRG Groups
 N LEX1,LEX2,LEX,LEXC1,LEXC2,LEXCMD,LEXCT,LEXD,LEXDG,LEXDI,LEXDR,LEXDRG,LEXE,LEXEF,LEXG
 N EXH,LEXI,LEXM,LEXMC,LEXMCI,LEXMCT,LEXMD,LEXMDG,LEXMDRG,LEXN,LEXNMD,LEXOMD,LEXP,LEXS
 N LEXT,LEXUN,LEXUND,LEXVT,LEXRT,LEXARY S LEXRT=$$ROOT^ICDEX(80.1)
 S:$G(LEXIA)'?7N LEXIA=$$IA(+LEXIEN) S LEXUND="",LEXUN=1,(LEXMCT,LEXMC)=0 K LEXMCI
 M LEXARY=@(LEXRT_+LEXIEN_",2)") S (LEXMCT,LEXCT)=0,(LEXP,LEXEF)=""
 F  S LEXEF=$O(LEXARY("B",LEXEF)) Q:'$L(LEXEF)  D
 . N LEXH S LEXH=0 F  S LEXH=$O(LEXARY("B",LEXEF,LEXH)) Q:+LEXH'>0  D
 . . N LEXN,LEXS,LEXE,LEXT,LEXD,LEX,LEXI S LEXN=$G(LEXARY(+LEXH,0)),LEXE=$P(LEXN,U,1) Q:LEXE'?7N  S:LEXE=$G(LEXIA) LEXUN=0
 . . S LEXMC=0 F  S LEXMC=$O(LEXARY(+LEXH,1,LEXMC))  Q:+LEXMC'>0  D
 . . . N LEXDG,LEXDRG,LEXN,LEXM S LEXN=$G(LEXARY(+LEXH,1,LEXMC,0)),LEXM=$P(LEXN,U,1)
 . . . Q:+LEXM'>0  S LEXM=$$UP^XLFSTR($P($G(^ICM(+LEXM,0)),U,1)) Q:'$L(LEXM)
 . . . S LEXDRG="",LEXDG=0 F  S LEXDG=$O(LEXARY(+LEXH,1,LEXMC,1,LEXDG))  Q:+LEXDG'>0  D
 . . . . S LEXN=$G(LEXARY(+LEXH,1,LEXMC,1,LEXDG,0)),LEXD=$P(LEXN,U,1) Q:'$L(LEXD)
 . . . . S:$E(LEXDRG,1,$L(LEXD))'=LEXD&(LEXDRG'[(" "_LEXD)) LEXDRG=$G(LEXDRG)_", "_LEXD
 . . . S LEXDRG=$$TM^LEXQHLM($$AND^LEXQHLM($$CS^LEXQHLM(LEXDRG))) S:$L(LEXDRG) LEXDRG="DRG "_LEXDRG Q:'$L(LEXDRG)
 . . . S LEXMCT=+($G(LEXMCT))+1 S LEXNMD(LEXE,LEXMCT,1)=LEXM,LEXNMD(LEXE,LEXMCT,2)=LEXDRG
 K LEXCMD S LEXEF="",(LEXC1,LEXC2)=0 I LEXIA?7N,+($G(LEXUN))>0 F  S LEXEF=$O(LEXOMD(LEXEF)) Q:'$L(LEXEF)  D
 . K LEXNMD(LEXEF) S LEX1=0 F  S LEX1=$O(LEXOMD(LEXEF,LEX1)) Q:+LEX1'>0  S LEXC1=LEXC1+1,LEX2=0 F  S LEX2=$O(LEXOMD(LEXEF,LEX1,LEX2)) Q:+LEX2'>0  D
 . . S LEXC2=LEXC2+1 S:LEX2=1 LEXCMD(+LEXC1,1)=LEXEF_U_$G(LEXOMD(LEXEF,LEX1,LEX2)) S:LEX2=2 LEXCMD(+LEXC1,2)=$G(LEXOMD(LEXEF,LEX1,LEX2))
 S LEXEF="" F  S LEXEF=$O(LEXNMD(LEXEF)) Q:'$L(LEXEF)  D
 . S LEX1=0 F  S LEX1=$O(LEXNMD(LEXEF,LEX1)) Q:+LEX1'>0  S LEXC1=LEXC1+1,LEX2=0,LEXC2=0 F  S LEX2=$O(LEXNMD(LEXEF,LEX1,LEX2)) Q:+LEX2'>0  D
 . . S LEXC2=LEXC2+1 S:LEX2=1 LEXCMD(+LEXC1,1)=LEXEF_U_$G(LEXNMD(LEXEF,LEX1,LEX2)) S:LEX2=2 LEXCMD(+LEXC1,2)=$G(LEXNMD(LEXEF,LEX1,LEX2))
 S (LEXCT,LEXVT,LEXMC,LEX1)=0,LEXP="" F  S LEX1=$O(LEXCMD(LEX1)) Q:+LEX1'>0  D
 . N LEXS S LEXN=$G(LEXCMD(LEX1,1)) S LEXE=$P(LEXN,U,1),LEXM=$P(LEXN,U,2) Q:LEXE'?7N  Q:'$L(LEXM)  S LEXG=$G(LEXCMD(LEX1,2)) Q:'$L(LEXG)
 . I LEXE'=LEXP S LEXCT=LEXCT+1 S:LEXE'=LEXIA LEXVT=LEXVT+1
 . S LEXMC=0,LEXMC=LEXMC+1 I +($G(LEXUN))'>0,LEXE=LEXIA S LEXS="Initial Unversioned Major Diagnostic Category/DRG Groups"
 . I +($G(LEXUN))>0,LEXE'=LEXIA,LEXVT=1 S LEXS="Initial Versioned Major Diagnostic Category/DRG Groups"
 . I LEXCT>1 S LEXS="Updated Major Diagnostic Category/DRG Groups"
 . S LEXD=$$SD^LEXQHLM(LEXE),^TMP("LEXQHL",$J,LEXE,4,LEX1,1)=LEXD_U_LEXS,^TMP("LEXQHL",$J,LEXE,4,LEX1,2)=U_LEXM,^TMP("LEXQHL",$J,LEXE,4,LEX1,3)=U_("  "_LEXG)
 . S LEXP=LEXE
 Q
 ;     
DP ; Display
 S LEXDISP=$G(LEXDISP) Q:$L(LEXDISP)>8  Q:$L(LEXDISP)<2  Q:LEXDISP["^"  N LEXL S LEXL=$T(@LEXDISP+0) Q:'$L(LEXL)
 D @LEXDISP
 Q
SB ;   Subjective
 N LEX1,LEX2,LEX3,LEXC,LEXCT,LEXD,LEXE,LEXEC,LEXG,LEXHDR,LEXI,LEXID,LEXM,LEXN,LEXN1,LEXN2,LEXN3,LEXO1,LEXO2,LEXO3,LEXP,LEXS,LEXT
 S LEXC=$G(^TMP("LEXQHL",$J,"CODE")),LEXI=$G(^TMP("LEXQHL",$J,"IEN")),LEXN=$G(^TMP("LEXQHL",$J,"NAME"))
 S LEXT="Code:  "_LEXC,LEXT=LEXT_$J(" ",(16-$L(LEXT)))_LEXN D TL^LEXQHLM(LEXT) S LEXT="",LEXT=LEXT_$J(" ",(16-$L(LEXT)))_"IEN:  "_LEXI D TL^LEXQHLM(LEXT)
 F LEXID=1:1:4 D
 . N LEXHDR,LEXCT,LEXEC S (LEXEC,LEXCT)=0,LEXHDR=$$HD(LEXID) Q:'$L(LEXHDR)  S LEXP="",LEX1=0 F  S LEX1=$O(^TMP("LEXQHL",$J,LEX1)) Q:+LEX1'>0  D
 . . S LEXEC=LEXEC+1 I LEXID=1 D  Q
 . . . S LEXN=$G(^TMP("LEXQHL",$J,LEX1,LEXID,1)) Q:'$L(LEXN)  S LEXE=$P(LEXN,U,1),LEXS=$P(LEXN,U,2) Q:'$L(LEXE)  Q:'$L(LEXS)  S LEXCT=LEXCT+1
 . . . D:LEXCT=1 BL^LEXQHLM,TL^LEXQHLM((" "_LEXHDR)) S LEXT=LEXE,LEXT=LEXT_$J(" ",(11-$L(LEXT)))_"  "_LEXS,LEXT="   "_LEXT D TL^LEXQHLM(LEXT)
 . . I LEXID=4 D  Q
 . . . N LEX2,LEXHDR,LEXC,LEXP,LEXO1,LEXO2,LEXO3 S LEXHDR=$$HD(4),(LEXC,LEX2)=0,LEXP="" F  S LEX2=$O(^TMP("LEXQHL",$J,LEX1,4,LEX2)) Q:+LEX2'>0  D
 . . . . N LEXN1,LEXN2,LEXN3,LEXD,LEXS,LEXM,LEXG
 . . . . S LEXN1=$G(^TMP("LEXQHL",$J,LEX1,4,LEX2,1)) S LEXD=$P(LEXN1,U,1),LEXS=$P(LEXN1,U,2) Q:'$L(LEXD)  Q:'$L(LEXS)
 . . . . S LEXN2=$G(^TMP("LEXQHL",$J,LEX1,4,LEX2,2)) S LEXM=$P(LEXN2,U,2) Q:'$L(LEXM)
 . . . . S LEXN3=$G(^TMP("LEXQHL",$J,LEX1,4,LEX2,3)) S LEXG=$P(LEXN3,U,2) Q:'$L(LEXG)
 . . . . S LEXO1=$G(LEXD),LEXO1=LEXO1_$J(" ",(11-$L(LEXO1)))_"  "_LEXS,LEXO1="   "_LEXO1
 . . . . S LEXO2=$J(" ",11)_"  "_LEXM,LEXO2="   "_LEXO2
 . . . . S LEXO3=$J(" ",11)_"  "_LEXG,LEXO3="   "_LEXO3
 . . . . S LEXC=LEXC+1 I LEXEC=1,LEXC=1 D BL^LEXQHLM,TL^LEXQHLM((" "_LEXHDR))
 . . . . D:LEXP'=LEXD TL^LEXQHLM(LEXO1) D TL^LEXQHLM(LEXO2),TL^LEXQHLM(LEXO3)
 . . . . S LEXP=LEXD
 . . N LEX2 S LEX2=0,LEXE="" F  S LEX2=$O(^TMP("LEXQHL",$J,LEX1,LEXID,LEX2)) Q:+LEX2'>0  D
 . . . S LEXN=$G(^TMP("LEXQHL",$J,LEX1,LEXID,LEX2)) S:LEX2=1 LEXE=$P(LEXN,U,1) Q:LEX2=1  Q:'$L(LEXE)
 . . . I LEX2=2 D  Q
 . . . . S LEXCT=LEXCT+1,LEXT=$G(LEXE),LEXS=$P(LEXN,U,2),LEXT=LEXT_$J(" ",(11-$L(LEXT)))_"  "_LEXS,LEXT="   "_LEXT
 . . . . D:LEXCT=1 BL^LEXQHLM,TL^LEXQHLM((" "_LEXHDR)) D TL^LEXQHLM(LEXT)
 . . . I LEX2>2 D  Q
 . . . . S LEXCT=LEXCT+1,LEXT="",LEXS=$P(LEXN,U,2),LEXT=LEXT_$J(" ",(11-$L(LEXT)))_"  "_LEXS,LEXT="   "_LEXT
 . . . . D:LEXCT=1 BL^LEXQHLM,TL^LEXQHLM((" "_LEXHDR)) D TL^LEXQHLM(LEXT)
 Q
CH ;   Chronological
 N LEX1,LEX2,LEX3,LEXC,LEXD,LEXDC,LEXI,LEXL1,LEXL2,LEXL3,LEXN,LEXP,LEXS,LEXT,LEXT1,LEXT2,LEXT3
 S LEXC=$G(^TMP("LEXQHL",$J,"CODE")),LEXI=$G(^TMP("LEXQHL",$J,"IEN")),LEXN=$G(^TMP("LEXQHL",$J,"NAME"))
 S LEXT="Code:  "_LEXC,LEXT=LEXT_$J(" ",(16-$L(LEXT)))_LEXN D TL^LEXQHLM(LEXT) S LEXT="",LEXT=LEXT_$J(" ",(16-$L(LEXT)))_"IEN:  "_LEXI D TL^LEXQHLM(LEXT)
 S LEXP="",LEX1=0 F  S LEX1=$O(^TMP("LEXQHL",$J,LEX1)) Q:+LEX1'>0  D
 . D BL^LEXQHLM N LEX2,LEXDC S (LEXDC,LEX2)=0 F  S LEX2=$O(^TMP("LEXQHL",$J,LEX1,LEX2)) Q:+LEX2'>0  D
 . . I LEX2=4 D  Q
 . . . N LEX3 S LEX3=0 F  S LEX3=$O(^TMP("LEXQHL",$J,LEX1,LEX2,LEX3)) Q:+LEX3'>0  D
 . . . . S LEXL1=$G(^TMP("LEXQHL",$J,LEX1,LEX2,LEX3,1))
 . . . . S LEXD=$P(LEXL1,U,1),LEXS=$P(LEXL1,U,2) Q:'$L(LEXD)  Q:'$L(LEXS)
 . . . . S LEXL2=$P($G(^TMP("LEXQHL",$J,LEX1,LEX2,LEX3,2)),U,2) Q:'$L(LEXL2)
 . . . . S LEXL3=$P($G(^TMP("LEXQHL",$J,LEX1,LEX2,LEX3,3)),U,2) Q:'$L(LEXL3)
 . . . . S LEXT1=$S(LEXD'=LEXP:LEXD,1:""),LEXT1=LEXT1_$J(" ",(11-$L(LEXT1)))_$S($L(LEXD):"- ",1:"  ")_LEXS
 . . . . S LEXDC=LEXDC+1,LEXT1="   "_LEXT1 D:LEXDC=1 TL^LEXQHLM(LEXT1)
 . . . . S LEXT2=$J(" ",16)_LEXL2 D TL^LEXQHLM(LEXT2)
 . . . . S LEXT3=$J(" ",16)_LEXL3 D TL^LEXQHLM(LEXT3)
 . . . . S:LEXD'="" LEXP=LEXD
 . . N LEX3 S LEX3=0 F  S LEX3=$O(^TMP("LEXQHL",$J,LEX1,LEX2,LEX3)) Q:+LEX3'>0  D
 . . . N LEXN,LEXD,LEXS S LEXN=$G(^TMP("LEXQHL",$J,LEX1,LEX2,LEX3)),LEXD=$P(LEXN,U,1),LEXS=$P(LEXN,U,2)
 . . . S LEXT=$S(LEXD'=LEXP:LEXD,1:""),LEXT=LEXT_$J(" ",(11-$L(LEXT)))_$S($L(LEXD):"- ",1:"  ")_LEXS S LEXT="   "_LEXT D TL^LEXQHLM(LEXT)
 . . . S:LEXD'="" LEXP=LEXD
 Q
 ; 
 ; Miscellaneous
IA(X) ;   Initial Activation
 N LEXEF,LEXH,LEXN,LEXS,LEXE,LEXIEN,LEXRT,LEXARY S LEXIEN=+($G(X)),LEXE="" Q:+LEXIEN'>0 ""
 S LEXRT=$$ROOT^ICDEX(80.1) M LEXARY=@(LEXRT_+LEXIEN_",66)") Q:'$D(LEXARY(0)) ""
 S LEXEF="" F  S LEXEF=$O(LEXARY("B",LEXEF)) Q:'$L(LEXEF)  D  Q:$G(LEXE)?7N
 . S LEXH=0 F  S LEXH=$O(LEXARY("B",LEXEF,LEXH)) Q:+LEXH'>0  D
 . . S LEXN=$G(LEXARY(+LEXH,0)) S:+($P(LEXN,U,2))>0 LEXE=$P(LEXN,U,1) Q:$G(LEXE)?7N
 S X="" S:$G(LEXE)?7N X=$G(LEXE)
 Q X
HD(X) ;   Header
 Q:+($G(X))=1 "Status"  Q:+($G(X))=2 "Operation/Procedure"  Q:+($G(X))=3 "Description"  Q:+($G(X))=4 "Major Diagnostic Category/DRG Groups"
 Q ""
