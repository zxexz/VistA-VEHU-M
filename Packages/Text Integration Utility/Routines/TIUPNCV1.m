TIUPNCV1 ;SLC/DJP-SF/JLI ;11/24/97  14:31
 ;;1.0;TEXT INTEGRATION UTILITIES;**9**;Jun 20, 1997
SETFIELD ;Sets fields for copy into TIU Document File
 D VISIT,SIGVAR,COSVAR,ADDENDA,FIELDS
 Q
 ;
VISIT ;Sets Visit Tracking data elements
 N DFN,VDT,TIUVSIT
 S DFN=TIU(.02),VDT=TIU(1301)
 D PXAPI^TIUPXAP1(.TIUVSIT,DFN,"",VDT,"E")
 I +$G(TIUVSIT)'>0 S PROBLEM="Progress Note - IFN "_GMRPIFN_":  Unable to create Visit Tracking entry based on entry date."  D ERRORLOG^TIUPNCV3 K PROBLEM Q
 S TIU(.03)=+$G(TIUVSIT)
 Q
 ;
FIELDS ;Individual fields, such as S-O-A-P, are converted as a single document
 S CNT1=0,CNT2=0,RENUM=0
 F GMRPFLD=10,20,21,22,23,30,32,33,34,40,41,42,43,44,45,46,47,48,8 I $D(^GMR(121,GMRPIFN,GMRPFLD)) D WHATSIT^TIUPNCV2
 I RENUM=1 D RENUM^TIUPNCV2 K RENUM
 Q
 ;
SIGVAR ;Sets additional variables for signature block -- 
 ;.05 STATUS
 ;1503 SIGNATURE BLOCK NAME
 ;1504 SIGNATURE BLOCK TITLE
 ;1505 SIGNATURE BLOCK MODE
 I TIU(1502)="",TIU("SIGCHART")="" S TIUSTAT="UNSIGNED",TIU(.05)=$$STATUS^TIUPNCV3(TIUSTAT),TIU(1505)="" K TIUSTAT Q
 S:TIU("SIGCHART")'="" TIU(1502)=TIU(1512)
 S DR=$G(^VA(200,TIU(1502),20)),TIU(1503)=$P(DR,U,2)
 S TIU(1504)=$P(DR,U,3),TIU(1505)=$S(TIU(1512)="":"E",1:"")
 S TIUSTAT="COMPLETED",TIU(.05)=$$STATUS^TIUPNCV3(TIUSTAT)
 I TIU(1512)'="" S TIUSTAT="COMPLETED",TIU(.05)=$$STATUS^TIUPNCV3(TIUSTAT),TIU(1505)="C"
 K DIC,X,Y,DIQ,DR,TIUSTAT,DA Q
 ;
COSVAR ;Sets required variables for cosignature block
 ;.05 STATUS
 ;1509 COSIGNATURE BLOCK NAME
 ;1510 COSIGNATURE BLOCK TITLE
 ;1511 COSIGNATURE BLOCK MODE
 S TIU(1511)="" I TIU(1506)="",TIU(1508)="",TIU("COSCHART")="" Q
 I TIU(1508)="",TIU("COSCHART")="" Q:TIU(1502)=""&(TIU("SIGCHART")="")  S TIUSTAT="UNCOSIGNED",TIU(.05)=$$STATUS^TIUPNCV3(TIUSTAT),TIU(1208)=$G(TIUECS) K TIUSTAT Q
 S:TIU("COSCHART")'="" TIU(1508)=TIU(1513)
 S DR=$G(^VA(200,TIU(1508),20)),TIU(1509)=$P(DR,U,2)
 S TIU(1510)=$P(DR,U,3),TIU(1511)=$S(TIU(1513)="":"E",1:"")
 S TIUSTAT="COMPLETED",TIU(.05)=$$STATUS^TIUPNCV3(TIUSTAT)
 I TIU(1513)'="" S TIUSTAT="COMPLETED",TIU(.05)=$$STATUS^TIUPNCV3(TIUSTAT),TIU(1511)="C"
 K DIC,X,Y,DIQ,DR,TIUSTAT,DA Q
 ;
ADDENDA ;sets the Parent variable for notes that are addenda - .06 PARENT
 Q:TIU("PARENT")=""
 S PARENT=$G(^GMR(121,GMRPIFN,100))
 S TIU("PARENT")=$G(^GMR(121,"CNV",PARENT))
 S TIUNEWTY=+$$WHATITLE^TIUPUTU("ADDENDUM")
 S TIU(.04)=$$DOCCLASS^TIULC1(TIUNEWTY)
 Q
