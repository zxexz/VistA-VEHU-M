PXBSTOR ;ISL/JVS - PASSING THE DATA TO THE V FILES ;3/21/05 1:35pm
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**73,88,149,124,164,203,199**;Aug 12, 1996;Build 52
 ;
 ;  VARIABLE LIST
 ;  PIECE   1        2     3     4      5     6       7       8       9
 ;  REQ*=PROVDER^PRIMARY^CPT^QUANTITY^POV^PRIMARY^PRV IEN^CPT IEN^POV IEN
 ;  PIECE   10       11        12  13  14  15  16  17  18  19     20    21  22
 ;  REQ  STOPCODE^STOPCODE IEN^DX1^DX2^DX3^DX4^DX5^DX6^DX7^DX8^DEPT CODE^^OrdPrv
 ;                             (DX5 - DX10 for future use)
 ;  REQ(1,MODIFIER)*=""
 ;  REQ("IEN")=V CPT file IEN
 ;  REQI=Internal Values
 ;  REQE=External Values
 ;  PXBVST=Visit Ien
 ;  PRVIEN=Provider IEN in V Provider file
 ;  CPTIEN=CPT IEN in V CPT file
 ;  POVIEN=POV IEN in V POV file
 ;  patient is defined from the visit
 ;
EN0(PXBVST,PATIENT,REQI,REQ) ;--Main Entry point
EN1 ;
 Q:'$D(REQI)!$G(PXBVST)<1
 K ^TMP("PXK",$J) ;--MUST BE MOVED TO AFTER THE EVENT
 N CPRNARR,CPTAF812,CPTAFT,CPTAFT1,CPTAFT12,CPTBEF,CPTBEF1,CPTBEF12
 N CPTBF812,CPTIEN,CTR,POVAF800,POVAF812,POVAFT,POVAFT12,POVBEF
 N POVBEF12,POVBF800,POVBF812,POVI,POVIEN,PPRNARR,PRVAF812,PRVAFT
 N PRVAFT12,PRVBEF,PRVBEF12,PRVBF812,PRVIEN,SEQ
 ;
SET ;--SET TEMP GLOBALS
 S SEQ=$$SET^PXBSTOR1
 I $G(IDATE)="" S IDATE=+^AUPNVSIT(PXBVST,0)
 D:$P(REQI,"^",1) PRV S SEQ=SEQ+1
 D:$P(REQI,"^",3) CPT S SEQ=SEQ+1
 D:$P(REQI,"^",5) POV S SEQ=SEQ+1
 F CTR=12:1:19 D:$P(REQI,U,CTR) DX S SEQ=SEQ+1
 S ^TMP("PXBSTOR",$J,"SEQ")=SEQ+1
 Q
PRV ;--PROVIDER PIECE 1 AND 2
 S PRVAFT=PRVBEF,PRVAFT12=PRVBEF12,PRVAF812=PRVBF812
 I $D(DELM),$P(DELM,"^",1)=1 S (PRVAFT,PRVAFT12)="" G PRV1
 S $P(PRVAFT,"^",1)=$P(REQI,"^",1) ;--PROVIDER IEN
 S $P(PRVAFT,"^",4)=$P(REQI,"^",2) ;--PRIMARY/SECONDARY
 S $P(PRVAFT,"^",2)=PATIENT ;--PATIENT
 S $P(PRVAFT,"^",3)=PXBVST ;--VISIT POINTER
 I PRVBF812']"" D
 .;-***POPULATE VERIFIED FIELD IN FUTURE
 .S $P(PRVAF812,"^",2)=$G(PXBPKG)
 .S $P(PRVAF812,"^",3)=$G(PXBSOURC)
PRV1 S ^TMP("PXK",$J,"PRV",SEQ,0,"AFTER")=PRVAFT
 S ^TMP("PXK",$J,"PRV",SEQ,0,"BEFORE")=PRVBEF
 S ^TMP("PXK",$J,"PRV",SEQ,12,"AFTER")=PRVAFT12
 S ^TMP("PXK",$J,"PRV",SEQ,12,"BEFORE")=PRVBEF12
 S ^TMP("PXK",$J,"PRV",SEQ,812,"AFTER")=PRVAF812
 S ^TMP("PXK",$J,"PRV",SEQ,812,"BEFORE")=PRVBF812
 S ^TMP("PXK",$J,"PRV",SEQ,"IEN")=PRVIEN
 Q
 ;
CPT ;--CPT PROCDEURE PIECE 3 AND 4
 N PXMODIEN
 S CPTAFT=CPTBEF,CPTAFT12=CPTBEF12,CPTAF812=CPTBF812
 I $D(DELM),$P(DELM,"^",2)=1 S (CPTAFT,CPTAFT12)="" G CPT1
 S $P(CPTAFT,"^",1)=$P(REQI,"^",3) ;--PROCEDURE IEN 
 S $P(CPTAFT,"^",2)=PATIENT ;--PATIENT
 S $P(CPTAFT,"^",3)=PXBVST ;--VISIT POINTER
 S $P(CPTAFT12,"^",4)=$P(REQI,"^",1) ;--PROVIDER POINTER
 S $P(CPTAFT12,"^",2)=$P(REQI,"^",22) ;--ORDERING PROVIDER POINTER
 S CPRNARR=$P($$CPT^ICPTCOD($P(REQI,"^",3),$G(IDATE)),U,3) ;--TEXT PROV NARR
 S $P(CPTAFT,"^",4)=+$$PROVNARR^PXAPI($G(CPRNARR),9000010.18) ;--PROV NAR
 S $P(CPTAFT,"^",16)=$P(REQI,"^",4) ;--QUANTITY
 S $P(CPTAFT,"^",5)=$P(REQI,"^",12) ;DX1 (REQUIRED)
 S $P(REQI,U,19)=$P(REQI,U,19) ;INSURE AT LEAST 19 PIECES IN REQI
 S $P(CPTAFT,"^",9,15)=$P(REQI,"^",13,19) ;DX2 - DX4, DX5 - DX8
 I $$SWSTAT^IBBAPI() D  ;DEPARTMENT CODE
 . I $P(CPTAFT,U,19)="",$G(^AUPNVSIT(PXBVST,0)),$P(^AUPNVSIT(PXBVST,0),"^",8) S $P(CPTAFT,U,19)=$P($G(^DIC(40.7,$P(^AUPNVSIT(PXBVST,0),"^",8),0)),"^",2)
 I $P(REQI,"^",4)=0 S (CPTAFT,CPTAFT12)=""
 I $P(REQI,"^",4)="@" S (CPTAFT,CPTAFT12)=""
 ;--------------------
 ;I $G(CPTIEN),$D(^AUPNVCPT(CPTIEN,12)),$P(REQI,"^",1)'=$P(^AUPNVCPT(CPTIEN,12),"^",4),'$D(DELM) S (CPTIEN,CPTBEF,CPTBEF12)=""
 ;---------------
 I CPTBF812']"" D
 .;-***POPULATE VERIFIED FIELD IN FUTURE
 .S $P(CPTAF812,"^",2)=$G(PXBPKG)
 .S $P(CPTAF812,"^",3)=$G(PXBSOURC)
 S PXMODIEN=""
 F  S PXMODIEN=$O(REQ(1,PXMODIEN)) Q:PXMODIEN=""  D
 .S CPTAFT1(PXMODIEN)=REQ(1,PXMODIEN)
CPT1 ;
 S ^TMP("PXK",$J,"CPT",SEQ,0,"AFTER")=CPTAFT
 S ^TMP("PXK",$J,"CPT",SEQ,0,"BEFORE")=CPTBEF
 S ^TMP("PXK",$J,"CPT",SEQ,12,"AFTER")=CPTAFT12
 S ^TMP("PXK",$J,"CPT",SEQ,12,"BEFORE")=CPTBEF12
 S ^TMP("PXK",$J,"CPT",SEQ,812,"AFTER")=CPTAF812
 S ^TMP("PXK",$J,"CPT",SEQ,812,"BEFORE")=CPTBF812
 S ^TMP("PXK",$J,"CPT",SEQ,"IEN")=CPTIEN
 ;Set modifiers into ^TMP
 S PXMODIEN=""
 F  S PXMODIEN=$O(CPTAFT1(PXMODIEN)) Q:PXMODIEN=""  D
 .S ^TMP("PXK",$J,"CPT",SEQ,1,PXMODIEN,"AFTER")=CPTAFT1(PXMODIEN)
 S PXMODIEN=""
 F  S PXMODIEN=$O(CPTBEF1(PXMODIEN)) Q:PXMODIEN=""  D
 .S ^TMP("PXK",$J,"CPT",SEQ,1,PXMODIEN,"BEFORE")=CPTBEF1(PXMODIEN)
 ;Set ^TMP file with V CPT IEN
 I $G(REQ)]"" D
 . S ^TMP("PXK",$J,"CPT",SEQ,"IEN")=REQ
 Q
 ;
POV ;--POV PIECE 5 AND 6
 S POVAFT=POVBEF,POVAFT12=POVBEF12,POVAF812=POVBF812,POVAF800=POVBF800
 S POVAFT17=POVBEF17
 I $D(DELM),$P(DELM,"^",3)=1 S (POVAFT,POVAFT12,POVAF800)="" G POV1
 S $P(POVAFT,"^",1)=$P(REQI,"^",5) ;--POV IEN 
 S $P(POVAFT,"^",12)=$P(REQI,"^",6) ;--PRI/SECONDARY
 S $P(POVAFT,U,17)=$P(REQI,U,7) ;--ORDERING/RESULTING
 S $P(POVAFT,"^",2)=PATIENT ;--PATIENT
 S $P(POVAFT,"^",3)=PXBVST ;--VISIT POINTER
 S PPRNARR=$$DXNARR^PXUTL1($P(REQI,"^",5),$$CSDATE^PXDXUTL(PXBVST)) ;--TEXT PROV NARR
 S $P(POVAFT,"^",4)=+$$PROVNARR^PXAPI($G(PPRNARR),9000010.07) ;--POI PROV NARR
 I $P($G(REQI),"^",7) S $P(POVAFT12,"^",4)=$P(^AUPNVPRV($P(REQI,"^",7),0),"^",1) ;--PROVIDER
 I $G(PXBRES) S $P(POVAFT,"^",16)=PXBRES ;-PROBLEM LIST ENTRY
 I POVBF812']"" D
 .;-**POPULATE VERIFIED FIELD IN FUTURE
 .S $P(POVAF812,"^",2)=$G(PXBPKG)
 .S $P(POVAF812,"^",3)=$G(PXBSOURC)
 I $D(PXBREQ($P(REQI,U,5))) S POVAF800=$G(PXBREQ($P(REQI,U,5),"I"))
POV1 S ^TMP("PXK",$J,"POV",SEQ,0,"AFTER")=POVAFT
 S ^TMP("PXK",$J,"POV",SEQ,0,"BEFORE")=POVBEF
 S ^TMP("PXK",$J,"POV",SEQ,12,"AFTER")=POVAFT12
 S ^TMP("PXK",$J,"POV",SEQ,12,"BEFORE")=POVBEF12
 S ^TMP("PXK",$J,"POV",SEQ,17,"AFTER")=POVAFT17
 S ^TMP("PXK",$J,"POV",SEQ,17,"BEFORE")=POVBEF17
 S ^TMP("PXK",$J,"POV",SEQ,812,"AFTER")=POVAF812
 S ^TMP("PXK",$J,"POV",SEQ,812,"BEFORE")=POVBF812
 S ^TMP("PXK",$J,"POV",SEQ,800,"AFTER")=POVAF800
 S ^TMP("PXK",$J,"POV",SEQ,800,"BEFORE")=POVBF800
 S ^TMP("PXK",$J,"POV",SEQ,"IEN")=POVIEN
 Q
 ;
DX ;CPT DIAGNOSIS - PX124
 N POVIEN,POVBF800,POVBF812,POVBEF12,POVBEF,POVBEF17,PXBVDT
 N IEN,ANS,POVAF800,POVAF812,POVAFT12,POVAFT,POVAFT17
 S IEN=$P(REQI,U,CTR),ANS=$$XLATE^PXBGPOV(PXBVST,IEN),POVIEN=+ANS
 I POVIEN D
 .S POVBEF=$G(^AUPNVPOV(POVIEN,0)),POVBEF12=$G(^(12)),POVBF812=$G(^(812)),POVBF800=$G(^(800)),POVBEF17=$G(^(17))
 E  S (POVBF800,POVBF812,POVBEF12,POVBEF17,POVBEF)=""
 S POVAFT=POVBEF,POVAFT12=POVBEF12,POVAF812=POVBF812,POVAF800=POVBF800
 S POVAFT17=POVBEF17
 S $P(POVAFT,U,1,3)=IEN_U_PATIENT_U_PXBVST
 S PXBVDT=$$CSDATE^PXDXUTL(PXBVST) ; get visit date
 S PPRNARR=$$DXNARR^PXUTL1(IEN,PXBVDT) ; get diagnosis description
 S $P(POVAFT,U,4)=+$$PROVNARR^PXAPI(PPRNARR,9000010.07)
 S $P(POVAFT,U,12)=$S(IEN=$G(PXBDXPRI):"P",1:"S") ;PRI/SEC
 I $P(REQI,U,7) S $P(POVAFT12,U,4)=$P($G(^AUPNVPRV($P(REQI,U,7),0)),U,1)
 I POVBF812']"" S $P(POVAF812,U,2,3)=$G(PXBPKG)_U_$G(PXBSOURC)
 S POVAF800=$G(PXBREQ(IEN,"I")) S:POVAF800="" POVAF800=$P(ANS,U,4,20)
 D POV1
 Q
