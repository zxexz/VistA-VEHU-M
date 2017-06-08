PXBPL ;ISL/JVS - ADD DIAGNOSIS TO PROBLEM LIST ;17 Jul 2013  11:21 AM
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**11,94,115,130,168,199**;Aug 12, 1996;Build 52
 ;
 ;
 ;
 W !,"THIS IS NOT AN ENTRY POINT" Q
SET ;--SETUP AND NEW VARIABLES
 N OK,PXBPL,PXPRVLIN,FLAG,DATA,ICDCODE
 S PXPRVLIN=18 D WIN17^PXBCC(PXBCNT)
 I '$G(NOPLLIST) Q
PRMPT ;--Ask if you want to put entries in PL
 D LOC^PXBCC(17,0) S DIR(0)="Y,A,O"
 S DIR("B")="NO"
 I PXBCNT'>1 S DIR("A")="Would you like to add this Diagnosis to the Problem List? "
 I PXBCNT>1 S DIR("A")="Would you like to add any Diagnoses to the Problem List? "
 D ^DIR K DIR
 I Y=0!(Y="^")!(Y="") Q
SELECT ;--Select entries for PL
 W !
 I PXBCNT'>1 S OK=1
 I PXBCNT>1 S PXPRVLIN=PXPRVLIN+2 W !,"Select 1 or several Diagnoses (e.g. 1,3,4,7,3-6,2-5): " R OK:DTIME
 I OK?1.N1"E".NAP S OK=" "_OK
 I OK?24.N S OK=$E(OK,1,24)
 ;
 ;
 I OK["-" D
 .N PIECE,PXBI,PXBJ,PXBK
 .S PIECE="" F PXBI=1:1:$L(OK,",") S PIECE=$P(OK,",",PXBI) I PIECE["-" D
 ..S PXBJ=0 F PXBJ=$P(PIECE,"-",1):1:$P(PIECE,"-",2) S PXBK=","_PXBJ,OK=OK_PXBK
 ;
 ;
 ;
 S PXBLEN=0
 I OK["?" W !,"Enter the ITEM numbers of the entries you wish to add to the PROBLEM LIST." S PXPRVLIN=PXPRVLIN+1 G SELECT
 ;----SPACE BAR---------
 I OK'=" ",OK'["^",OK'="" S ^DISV(DUZ,"PXBPL-2")=OK
 I OK=" ",$D(^DISV(DUZ,"PXBPL-2")) S OK=^DISV(DUZ,"PXBPL-2") W OK
 ;-----------------------
 S PXBLEN=$L(OK,",") F PXI=1:1:PXBLEN S PXBPIECE=$P(OK,",",PXI) D
 .Q:PXBPIECE=""
 .I $D(PXBSAM(PXBPIECE)) D
 ..I PXBCNT>10 D DPOV4^PXBDPOV(PXBSAM(PXBPIECE,"LINE"))
 ..S FLAG=1
 ..D REVPOV^PXBPPOV(PXBPIECE)
 I '$G(FLAG) S DIR(0)="Y^AO",DIR("B")="NO",DIR("A")="INVALID entry. Would you like to try again" D ^DIR K DIR I Y=1 K Y S PXPRVLIN=PXPRVLIN+1 G SELECT
PRV ;--Ask for provider
 I '$G(FLAG) Q
 S FROM="PL" K PXBCNT D PRV^PXBGPRV(PXBVST,,,,.PXBCNT)
 N PXBLANKS S $P(PXBLANKS," ",65)=""
 D LOC^PXBCC(1,10) W PXBLANKS D LOC^PXBCC(PXPRVLIN,0)
R K ERROR S FROM="PL" D PRV^PXBPPRV G:$G(ERROR) R W IOEDEOP
 I DATA["^P" D LOC^PXBCC(3,0),EN0^PXBDPRV,LOC^PXBCC(15,0) G PRV
 D POV^PXBGPOV(PXBVST)
LOOP ;--Loop through diagnoses
 S PXBLEN=$L(OK,",") F PXI=1:1:PXBLEN S PXBPIECE=$P(OK,",",PXI) D
 .I PXBPIECE="" Q
 .I $D(PXBSAM(PXBPIECE)) D
 ..S PXBPL("PATIENT")=PATIENT
 ..S PXBPL("NARRATIVE")=$P($G(PXBSAM(PXBPIECE)),"^",3)
 ..S PXBPL("PROVIDER")=$P(REQI,"^",1)
 ..S PXBPL("DIAGNOSIS")=+^AUPNVPOV($O(PXBSKY(PXBPIECE,0)),0)
 ..S PXBPL("LOCATION")=$P(^AUPNVSIT(PXBVST,0),"^",22)
 ..;PRH - PX*1*115 - Set up Service Conditions
 ..N PXSCSTR,PXII,PXTYP
 ..S PXSCSTR="SC^AO^IR^EC^MST^HNC^CV^SHAD"
 ..F PXII=1:1:8 D
 ...S PXTYP=$P(PXSCSTR,"^",PXII)
 ...S PXBPL(PXTYP)=$P($G(^AUPNVSIT(PXBVST,800)),"^",PXII)
 ..S ICDCODE="",ICDCODE=$P($G(PXBSAM(PXBPIECE)),"^",1)
 ..I ICDCODE'="" D  ; Get Lexicon entry for ICD Code
 ...S PXVDATE=$$CSDATE^PXDXUTL(PXBVST)  ; $P(+^AUPNVSIT(PXBVST,0),".",1)
 ...KILL LEXS D EN^LEXCODE(ICDCODE,PXVDATE)
 ...S PXACSREC=$$ACTDT^PXDXUTL(PXVDATE),PXACSID=$P(PXACSREC,U,1)
 ...I $G(LEXS(PXACSID,0))>0 S PXBPL("LEXICON")=$P($G(LEXS(PXACSID,1)),"^",1)
 ..S PXBPL("DX_DATE_OF_INTEREST")=$$CSDATE^PXDXUTL(PXBVST)
 ..D CREATE^GMPLUTL(.PXBPL,.PXBRES)
 ..D PR
 K NOPLLIST,PXVDATE,PXACSREC,PXACSID
 Q
SEND ;--Entry point to send data to problem list
 N PXBPL,OK,ICDCODE,PXVDATE,PXACSREC,PXACSID
 I '$D(IORVON) D TERM^PXBCC
 S PXBPL("PATIENT")=PATIENT
 S PXBPL("NARRATIVE")=PXBSAM($O(PXBKY($P($P(REQE,"^",5)," ",1),0)),"LNARR")
 S PXBPL("PROVIDER")=$P(REQI,"^",1)
 S PXBPL("DIAGNOSIS")=$P(REQI,"^",5)
 S PXBPL("LOCATION")=$P(^AUPNVSIT(PXBVST,0),"^",22)
 ;PRH - PX*1*115 - Set up Service Conditions
 N PXSCSTR,PXII,PXTYP
 S PXSCSTR="SC^AO^IR^EC^MST^HNC^CV^SHAD"
 F PXII=1:1:6 D
 . S PXTYP=$P(PXSCSTR,"^",PXII)
 . S PXBPL(PXTYP)=$P($G(^AUPNVSIT(PXBVST,800)),"^",PXII)
 S ICDCODE="",ICDCODE=$P($G(PXBSAM($O(PXBKY($P($P(REQE,"^",5)," ",1),0)))),"^",1)
 I ICDCODE'="" D  ; Get Lexicon entry for ICD Code
 .S PXVDATE=$$CSDATE^PXDXUTL(PXBVST)  ; $P(+^AUPNVSIT(PXBVST,0),".",1)
 .KILL LEXS D EN^LEXCODE(ICDCODE,PXVDATE)
 .S PXACSREC=$$ACTDT^PXDXUTL(PXVDATE),PXACSID=$P(PXACSREC,U,1)
 .I $G(LEXS(PXACSID,0))>0 S PXBPL("LEXICON")=$P($G(LEXS(PXACSID,1)),"^",1)
 S PXBPL("DX_DATE_OF_INTEREST")=$$CSDATE^PXDXUTL(PXBVST)
 D CREATE^GMPLUTL(.PXBPL,.PXBRES)
PR ;
 I PXBRES<0 D  Q  ;'Q'uit added for PX*1*115
 .W !,IORVON,"--WARNING-Problem NOT Created because: ",PXBRES(0),IORVOFF
 .D HELP1^PXBUTL1("CON") R OK:DTIME
 ;
 ;PX*1*115 - Add Problem File Pointer to V POV file
 I PXBRES>0 D
 . N DA,DIE,DR,PXBPLARR,PXBPLERR,PXBPLPOV
 . S DA=$O(PXBSKY(PXBPIECE,0))
 . S PXBPLPOV=9000010.07
 . K PXBPLARR,PXBPLERR
 . D GETS^DIQ(PXBPLPOV,(DA_","),.16,"I","PXBPLARR","PXBPLERR")
 . Q:$D(PXBPLERR)
 . I $L($G(PXBPLARR(PXBPLPOV,(DA_","),.16,"I"))) Q
 . ;
 . S DIE="^AUPNVPOV(",DR=".16////"_PXBRES
 . D ^DIE
 ;
 Q
