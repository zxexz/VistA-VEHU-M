PXBGPOV ;ISL/JVS,ESW - GATHER POV (DIAGNOSIS) ;8/10/04 1:30pm
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**11,112,149,124,168,199**;Aug 12, 1996;Build 52
 ;
POV(VISIT) ;--Gather the entries in the V POV file
 ;
 N DA,DIC,DIQ,DR,GROUP,I,IEN,PKG,POV,POVI,PRIM,PROBLEM,PROVIDER,PXBC
 N PXBPL,PXBPLA,PXCI,PXDXDATE,QUANTITY,SNARR,SOURC
 ;
 K ^TMP("PXBU",$J),POV,PXBKY,PXBSAM,PXBSKY,PXDIGNS,NOPLLIST
 K ^UTILITY("DIQ1",$J)
 S FPRI="",PROBLEM=""
 I $D(^AUPNVPOV("AD",VISIT)) D
 .S IEN=0 F  S IEN=$O(^AUPNVPOV("AD",VISIT,IEN)) Q:IEN'>0  D
 ..S ^TMP("PXBU",$J,"POV",IEN)=""
 ;
A ;--Set array with DIAGNOSIS codes
 ;
 D PL^PXBGPL(PATIENT)
 I $D(^TMP("PXBU",$J,"POV")) D
 .S IEN=0 F  S IEN=$O(^TMP("PXBU",$J,"POV",IEN)) Q:IEN'>0  D
 ..S DIC=9000010.07,DR=".01;1204;.04;.12;.17;81202;81203;80001:80008",DA=IEN,DIQ(0)="IE" D EN^DIQ1
 ..S PROVIDER=$G(^UTILITY("DIQ1",$J,9000010.07,DA,"1204","E"))
 ..S LNARR=$G(^UTILITY("DIQ1",$J,9000010.07,DA,".04","E"))
 ..S POV=$G(^UTILITY("DIQ1",$J,9000010.07,DA,".01","E"))
 ..S PROBLEM="" S:$D(^TMP("PXBKYPL",$J,POV)) PROBLEM="YES"
 ..S POVI=$G(^UTILITY("DIQ1",$J,9000010.07,DA,".01","I"))
 ..S PRIM=$G(^UTILITY("DIQ1",$J,9000010.07,DA,".12","E"))
 ..S ORDER=$G(^UTILITY("DIQ1",$J,9000010.07,DA,".17","E"))
 ..S PKG=$G(^UTILITY("DIQ1",$J,9000010.07,DA,"81202","I"))
 ..I PKG']"" S PKG="NONE"
 ..S SOURC=$G(^UTILITY("DIQ1",$J,9000010.07,DA,"81203","I"))
 ..I SOURC']"" S SOURC="NONE"
 ..S PXDXDATE=$$CSDATE^PXDXUTL(VISIT)
 ..S SNARR=$P($$ICDDATA^ICDXCODE("DIAG",POVI,PXDXDATE,"I"),U,4)
 ..I $L(LNARR)'>30 S LNARR=$$DXNARR^PXUTL1(POVI,PXDXDATE)
 ..S FPRI=FPRI_$E(PRIM,1,3) ;--Creating flag for Primary prompt
 ..S GROUP=POV_"^"_PROVIDER_"^"_SNARR_"^"_PRIM_"^"_PROBLEM_"^"_LNARR_"^"_ORDER
 ..;        1        2            3        4          5          6         7
 ..I PRIM["PRI" S PXDIGNS("PRIMARY")=POV
 ..S ^TMP("PXBPOV",$J,POV,IEN)=GROUP
 ..S ^TMP("PXBGPOVMATCH",$J,POVI,IEN)=""
 ..I $P(GROUP,"^",5)'["YES" S NOPLLIST=1
 ..S GROUP=$G(^UTILITY("DIQ1",$J,9000010.07,IEN,80001,"I"))
 ..F I=2:1:8 S GROUP=GROUP_U_$G(^UTILITY("DIQ1",$J,9000010.07,IEN,80000+I,"I"))
 ..S PXCI(IEN)=GROUP,PXBREQ(POVI,"I")=GROUP
 ;
B ;--Add line numbers
 ;
 I $D(^TMP("PXBPOV",$J)) D
 .S PXBC=0,POV="" F  S POV=$O(^TMP("PXBPOV",$J,POV)) Q:POV=""  Q:PXBC>40  D
 ..S IEN=0 F  S IEN=$O(^TMP("PXBPOV",$J,POV,IEN)) Q:IEN=""  S PXBC=PXBC+1 D
 ...S PXBKY(POV,PXBC)=$G(^TMP("PXBPOV",$J,POV,IEN)),PXBSAM(PXBC)=$G(^TMP("PXBPOV",$J,POV,IEN))
 ...S PXBSKY(PXBC,IEN)=""
 ...S PXBSAM(PXBC,"LNARR")=$P(PXBSAM(PXBC),U,6)
 ...S PXBSAM(PXBC,"I")=PXCI(IEN)
FINISG ;--finish up some variables
 ;--FPRI=0 NO PRIMARY
 S:FPRI'["PRI" FPRI=0 S:FPRI["PRI" FPRI=1
EXIT ;--KILL
 K ^TMP("PXBU",$J),^TMP("PXBKYPL",$J),^TMP("PXBSAMPL",$J),PXBSKYPL
 K ^TMP("PXBPOV",$J),^UTILITY("DIQ1",$J)
 S PXBCNT=+$G(PXBC)
 Q
 ;
XLATE(VST,DX) ;Translate DX into POV from VST
 Q:'$G(VST)!'$G(DX) ""  Q:'$D(^AUPNVPOV("AD",VST)) ""
 S DX=+$$ICDDATA^ICDXCODE("DIAG",DX,$$CSDATE^PXDXUTL(VST),"I") Q:DX<0 ""
 N IEN,ANS,VAL S (IEN,ANS,VAL)=""
 F  Q:ANS  D
 .S IEN=$O(^AUPNVPOV("AD",VST,IEN)) I 'IEN S ANS=1 Q
 .S VAL=$G(^AUPNVPOV(IEN,0)),ANS=($P(VAL,U)=DX)
 S ANS=IEN_U_DX_U_$P(VAL,U,12) S:IEN ANS=ANS_U_$G(^AUPNVPOV(IEN,800))
 Q ANS
 ;
