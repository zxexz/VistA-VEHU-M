PSJBCMA2 ;BIR/MV-RETURN INPATIENT ACTIVITY LOG ;16 Mar 99 / 11:43 AM
 ;;5.0;INPATIENT MEDICATIONS;**32,41,54,56,81,267**;16 DEC 97;Build 158
 ;
 ;Reference to ^PS(55 is supported by DBIA 2191
 ;
EN(DFN,ON,PSJTMP)         ;
 NEW X,Y
 S PSJINX=0
 S PSJTMP=$S($G(PSJTMP)=1:"PSJ2",1:"PSJ")
 I $G(ON)["U",$D(^PS(55,+$G(DFN),5,+ON)) D UD
 I $G(ON)["V",$D(^PS(55,+$G(DFN),"IV",+ON)) D IV
 I '$D(^TMP(PSJTMP,$J,0)) S ^(0)=-1
 K PSJINX
 Q
UD ;Get Activity Log for Unit Dose order.
 N PSJVFDTM
 F PSJAL=0:0 S PSJAL=$O(^PS(55,DFN,5,+ON,9,PSJAL)) Q:'PSJAL  D
 . S X=$G(^PS(55,DFN,5,+ON,9,PSJAL,0))
 . S PSJ("DATE")=$P(X,U)
 . S (PSJ("USER"),PSJ("UIEN"))=$P(X,U,2),PSJ("FIELD")=$P(X,U,4)
 . S PSJ("OLD DATA")=$P(X,U,5)
 . S PSJ("ACTION")=$P($G(^PS(53.3,+$P(X,U,3),0)),U)
 . I PSJ("ACTION")="VERIFIED BY PHARMACIST" S PSJVFDTM=PSJ("DATE")
 . I PSJ("FIELD")="SPECIAL INSTRUCTIONS",PSJ("ACTION")="EDITED" Q:PSJ("DATE")=$G(PSJVFDTM)
 . D TMP K PSJ
 K PSJAL
 Q
IV ;Get Activity Log for IV order.
 F PSJAL=0:0 S PSJAL=$O(^PS(55,DFN,"IV",+ON,"A",PSJAL)) Q:'PSJAL  D
 . K PSJ,PSJDD
 . S X=$G(^PS(55,DFN,"IV",+ON,"A",PSJAL,0))
 . S PSJ("DATE")=$P(X,U,5)
 . S PSJ("ACTION")=$P(X,U,2) Q:PSJ("ACTION")="F"
 . S PSJ("USER")=$P(X,U,3)
 . S PSJ("REASON")=$P(X,U,4)
 . S PSJ("ACTION")=$$CODES^PSIVUTL(PSJ("ACTION"),55.04,.02)
 . S PSJ("UIEN")=$P(X,U,6)
 . I PSJAL=1,($G(^PS(55,DFN,"IV",+ON,"A",PSJAL,1,1,0))["OTHER PRINT INFO") Q
 . I $O(^PS(55,DFN,"IV",+ON,"A",PSJAL,1,0))="" D TMP
 . F PSJFC=0:0 S PSJFC=$O(^PS(55,DFN,"IV",+ON,"A",PSJAL,1,PSJFC)) Q:'PSJFC  D
 .. S X=$G(^PS(55,DFN,"IV",+ON,"A",PSJAL,1,PSJFC,0))
 .. K PSJ("FIELD"),PSJ("OLD DATA")
 .. S PSJ("FIELD")=$P(X,U)
 .. S PSJ("OLD DATA")=$P(X,U,2)
 .. D TMP
 K PSJ,PSJAL,PSJFC
 Q
TMP ;Setup ^TMP
 S PSJINX=PSJINX+1
 I +PSJ("USER") D NAME^PSJBCMA1(+PSJ("USER"),.X,"") S PSJ("USER")=X
 S ^TMP(PSJTMP,$J,0)=DFN_U_+ON_U_ON_U_PSJINX
 S ^TMP(PSJTMP,$J,PSJINX,1)=PSJ("DATE")_U_PSJ("USER")_U_$G(PSJ("FIELD"))_U_PSJ("ACTION")_U_$G(PSJ("UIEN"))
 S:$G(PSJ("OLD DATA"))]"" ^TMP(PSJTMP,$J,PSJINX,2)=PSJ("OLD DATA")
 S:$G(PSJ("REASON"))]"" ^TMP(PSJTMP,$J,PSJINX,3)=PSJ("REASON")
 Q
GETFLD  ;
 N X D FIELD^DID(55.04,.02,"","POINTER","PSJDD") Q
 Q
 ;
FILESI(DFN,PSJORD) ; File special instructions
 I PSJORD["U" S LN=0 D
 .K ^PS(55,DFN,5,+PSJORD,15) I ($G(^PS(53.45,+$G(PSJSYSP),5,0))<0) S ^PS(55,DFN,5,+PSJORD,6)="" Q
 .I '$D(^PS(55,DFN,5,+PSJORD,15,1,0)),($O(^PS(53.45,+$G(PSJSYSP),5," "),-1)=1) Q:($TR(^PS(53.45,PSJSYSP,5,1,0)," ")="")
 .S LNCNT=0,LN=9999 F  S LN=$O(^PS(53.45,+$G(PSJSYSP),5,LN),-1) Q:'LN  D
 ..I 'LNCNT,($G(^PS(53.45,+$G(PSJSYSP),5,LN,0))="") Q
 ..I $D(^PS(53.45,+$G(PSJSYSP),5,LN,0)) S ^PS(55,+DFN,5,+PSJORD,15,LN,0)=^PS(53.45,+$G(PSJSYSP),5,LN,0) S LNCNT=LNCNT+1
 .I $G(LNCNT) S ^PS(55,+DFN,5,+PSJORD,15,0)="^55.6135^"_+LNCNT_"^"_+LNCNT D
 ..N TXT,SIMSG S SIMSG="Instructions too long. See Order View or BCMA for full text."
 ..S PSJTMPTX="",PSJOVRMX=0 S TMPLIN=0 F  S TMPLIN=$O(^PS(55,+DFN,5,+PSJORD,15,TMPLIN)) Q:'TMPLIN!(PSJOVRMX)  D
 ...S:($L(PSJTMPTX)+$L($G(^PS(55,+DFN,5,+PSJORD,15,TMPLIN,0))))>180 PSJOVRMX=1 Q:$G(PSJOVRMX)  S PSJTMPTX=$G(PSJTMPTX)_$S($G(PSJTMPTX)]"":" ",1:"")_$G(^PS(55,+DFN,5,+PSJORD,15,TMPLIN,0))
 ..S TXT=$S($G(PSJOVRMX):SIMSG,1:PSJTMPTX)
 ..I $G(DFN) I $D(^PS(55,DFN,5,+PSJORD,0)) S ^PS(55,DFN,5,+PSJORD,6)=TXT_"^"_$S($G(PSGSIF):1,1:"")
 .N LSTLNUM,LSTLNTXT S LSTLNUM=$O(^PS(55,+DFN,5,+PSJORD,15,""),-1) I LSTLNUM>1 S LSTLNTXT=$G(^PS(55,+DFN,5,+PSJORD,15,LSTLNUM,0)) I $TR(LSTLNTXT," ")="" D
 ..K ^PS(55,+DFN,5,+PSJORD,15,LSTLNUM,0)
 I PSJORD["P" S LN=0 D
 .N PSGSIF S PSGSIF=+$P($G(^PS(53.1,+PSJORD,6)),"^",2)
 .K ^PS(53.1,+PSJORD,15) I ($G(^PS(53.45,+$G(PSJSYSP),5,0))<0) S ^PS(53.1,+PSJORD,6)="",^PS(53.1,+PSJORD,15,0)="^53.1135^0^0" Q
 .I '$D(^PS(53.1,+PSJORD,15,1,0)),($O(^PS(53.45,+$G(PSJSYSP),5," "),-1)=1) Q:($TR(^PS(53.45,PSJSYSP,5,1,0)," ")="")
 .S LNCNT=0,LN=9999 F  S LN=$O(^PS(53.45,+$G(PSJSYSP),5,LN),-1) Q:'LN  D
 ..I 'LNCNT,($G(^PS(53.45,+$G(PSJSYSP),5,LN,0))="") Q
 ..I $D(^PS(53.45,+$G(PSJSYSP),5,LN,0)) S ^PS(53.1,+PSJORD,15,LN,0)=^PS(53.45,+$G(PSJSYSP),5,LN,0) S LNCNT=LNCNT+1
 .I $G(LNCNT) S ^PS(53.1,+PSJORD,15,0)="^53.1135^"_+LNCNT_"^"_+LNCNT D
 ..N TXT,SIMSG S SIMSG="Instructions too long. See Order View or BCMA for full text."
 ..S PSJTMPTX="",PSJOVRMX=0 S TMPLIN=0 F  S TMPLIN=$O(^PS(53.1,+PSJORD,15,TMPLIN)) Q:'TMPLIN!(PSJOVRMX)  D
 ...S:($L(PSJTMPTX)+$L($G(^PS(53.1,+PSJORD,15,TMPLIN,0))))>180 PSJOVRMX=1 Q:$G(PSJOVRMX)  S PSJTMPTX=$G(PSJTMPTX)_$S($G(PSJTMPTX)]"":" ",1:"")_$G(^PS(53.1,+PSJORD,15,TMPLIN,0))
 ..S TXT=$S($G(PSJOVRMX):SIMSG,1:PSJTMPTX)
 ..I $D(^PS(53.1,+$G(PSJORD),0)) S ^PS(53.1,+PSJORD,6)=TXT_"^"_$S($G(PSGSIF):1,1:"")
 .N LSTLNUM,LSTLNTXT S LSTLNUM=$O(^PS(53.1,+PSJORD,""),-1) I LSTLNUM>1 S LSTLNTXT=$G(^PS(53.1,+PSJORD,15,LSTLNUM,0)) I $TR(LSTLNTXT," ")="" D
 ..K ^PS(53.1,+PSJORD,15,LSTLNUM,0)
 Q
FILEOPI(DFN,ORDER) ; File other print info
 I PSJORD["V" S LN=0 D
 .D LOGOPI^PSIVORFB(DFN,ORDER)
 .K ^PS(55,+DFN,"IV",+PSJORD,10) S ^PS(55,+DFN,"IV",+PSJORD,3)="" I '$D(^PS(53.45,+$G(PSJSYSP),6,2,0))&(($G(^PS(53.45,+$G(PSJSYSP),6,1,0))=-1)!($G(^PS(53.45,+$G(PSJSYSP),6,0))=-1)) D  Q
 ..S ^PS(55,+DFN,"IV",+PSJORD,10,0)="^55.1154^1^1",^PS(55,+DFN,"IV",PSJORD,10,1,0)=""
 .I '$D(^PS(55,DFN,"IV",+PSJORD,10,1,0)),($O(^PS(53.45,+$G(PSJSYSP),6," "),-1)=1) I ($TR(^PS(53.45,PSJSYSP,6,1,0)," ")="") D  Q
 ..S ^PS(55,+DFN,"IV",+PSJORD,10,0)="^55.1154^1^1",^PS(55,+DFN,"IV",+PSJORD,10,1,0)=""
 .S LNCNT=0,LN=9999 F  S LN=$O(^PS(53.45,+$G(PSJSYSP),6,LN),-1) Q:'LN  D
 ..I 'LNCNT,($G(^PS(53.45,+$G(PSJSYSP),6,LN,0))="") Q
 ..I $D(^PS(53.45,+$G(PSJSYSP),6,LN,0)) S ^PS(55,+DFN,"IV",+PSJORD,10,LN,0)=^PS(53.45,+$G(PSJSYSP),6,LN,0) S LNCNT=LNCNT+1
 .I LNCNT S ^PS(55,+DFN,"IV",+PSJORD,10,0)="^55.1154^"_+LNCNT_"^"_+LNCNT D
 ..N TXT,DIE,DA,OPIMSG S OPIMSG="Instructions too long. See Order View or BCMA for full text."
 ..S PSJTMPTX="",PSJOVRMX=0 S TMPLIN=0 F  S TMPLIN=$O(^PS(55,+DFN,"IV",+PSJORD,10,TMPLIN)) Q:'TMPLIN!(PSJOVRMX)  D
 ...S:($L(PSJTMPTX)+$L($G(^PS(55,DFN,"IV",+PSJORD,10,TMPLIN,0))))>60 PSJOVRMX=1 Q:$G(PSJOVRMX)  S PSJTMPTX=$G(PSJTMPTX)_$S($G(PSJTMPTX)]"":" ",1:"")_$G(^PS(55,DFN,"IV",+PSJORD,10,TMPLIN,0))
 ..S TXT=$S($G(PSJOVRMX):OPIMSG,1:$G(PSJTMPTX))
 ..I $TR(TXT,"^ ")="" S ^PS(55,DFN,"IV",+PSJORD,3)="" Q
 ..S ^PS(55,DFN,"IV",+PSJORD,3)=TXT_"^"_$P($G(P("OPI")),"^",2)
 I PSJORD["P" D
 .I $D(^PS(53.1,+PSJORD,16)),$$DIFFOPI^PSJBCMA5(DFN,PSJORD) D
 ..N SIARRAY,PSJALORD M SIARRAY=^PS(53.1,+PSJORD,16),PSJALORD=PSJORD I '$D(SIARRAY) S SIARRAY(0)="^^1^1",SIARRAY(1,0)=" "
 ..D NEWNVAL^PSGAL5(PSJORD,6000,"OTHER PRINT INFO",,.SIARRAY)
 .K ^PS(53.1,+PSJORD,16) I ('$D(^PS(53.45,+$G(PSJSYSP),6,2,0))&($TR($G(^PS(53.45,+$G(PSJSYSP),6,1,0)),"^ ")=""))!+($G(^PS(53.45,+$G(PSJSYSP),6,0))=-1) D  Q
 ..S ^PS(53.1,+PSJORD,9)="",^PS(53.1,+PSJORD,16,0)="^53.1136^1^1",^PS(53.1,+PSJORD,16,1,0)=""
 .I '$D(^PS(53.1,+PSJORD,16,1,0)),($O(^PS(53.45,+$G(PSJSYSP),6," "),-1)=1) I ($TR(^PS(53.45,PSJSYSP,6,1,0)," ")="") D  Q
 ..S ^PS(53.1,+PSJORD,9)="",^PS(53.1,+PSJORD,16,0)="^53.1136^1^1",^PS(53.1,+PSJORD,16,1,0)=""
 .S LNCNT=0,LN=9999 F  S LN=$O(^PS(53.45,+PSJSYSP,6,LN),-1) Q:'LN  D
 ..I 'LNCNT,($G(^PS(53.45,+PSJSYSP,6,LN,0))="") Q
 ..I $D(^PS(53.45,+PSJSYSP,6,LN,0)) S ^PS(53.1,+PSJORD,16,LN,0)=^PS(53.45,+PSJSYSP,6,LN,0) S LNCNT=LNCNT+1
 .I $G(LNCNT) S ^PS(53.1,+PSJORD,16,0)="^53.1136^"_+LNCNT_"^"_+LNCNT D
 ..N TXT,DIE,DA,OPIMSG S OPIMSG="Instructions too long. See Order View or BCMA for full text."
 ..S PSJTMPTX="",PSJOVRMX=0 S TMPLIN=0 F  S TMPLIN=$O(^PS(53.1,+PSJORD,16,TMPLIN)) Q:'TMPLIN!(PSJOVRMX)  D
 ...S:($L(PSJTMPTX)+$L($G(^PS(53.1,+PSJORD,16,TMPLIN,0))))>60 PSJOVRMX=1 Q:$G(PSJOVRMX)  S PSJTMPTX=$G(PSJTMPTX)_$S($G(PSJTMPTX)]"":" ",1:"")_$G(^PS(53.1,+PSJORD,16,TMPLIN,0))
 ..S TXT=$S($G(PSJOVRMX):OPIMSG,1:$G(PSJTMPTX))
 ..S $P(^PS(53.1,+PSJORD,9),"^",2)=TXT,$P(^PS(53.1,+PSJORD,9),"^",3)=$P($G(P("OPI")),"^",2)
 Q
