ORWDPS5 ;SLC/JLI - CPRS Orders Utility ; 8/15/2002 11AM
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**149,190**;Dec 17, 1997
LESGRP(ORY,ORLES) ;Return all of the orders' display groups LES checked
 ;LES will check the orders belonging to the following display group
 ; 1.  LAB/LABORATORY  ORDERS
 ; 2.  BLOOD BANK      ORDERS
 ; 3.  CHEMISTRY       ORDERS
 N LABID,BLDBKID,CHMID
 S (LABID,BLDBKID,CHMID,ORY)=0
 S:$D(^ORD(100.98,"B","LAB")) LABID=$O(^ORD(100.98,"B","LAB",0))
 I 'LABID S:$D(^ORD(100.98,"B","LABORATORY")) LABID=$O(^ORD(100.98,"B","LABORATORY",0))
 S:$D(^ORD(100.98,"B","BLOOD BANK")) BLDBKID=$O(^ORD(100.98,"B","BLOOD BANK",0))
 S:$D(^ORD(100.98,"B","CHEMISTRY")) CHMID=$O(^ORD(100.98,"B","CHEMISTRY",0))
 I ('LABID)!('BLDBKID!('CHMID)) Q
 S ORY=LABID_U_BLDBKID_U_CHMID
 Q
 ;
LESAPI(ORY,FLDS) ;Call LES Api from inside CPRS for validating changed lab order
 ; FLDS = DFN^TEST^ORL^ORNP^ORDT
 ; DFN:  Patient DFN (pointer to #2)
 ; TEST: Lab Test IFN (pointer to #101.43)
 ; ORL:  Patient Location (pointer to #44)
 ; ORNP: Provider IEN (pointer to #200)
 ; ORDT: Collection date/time (fileman format)
 N DFNL,TESTL,ORLOCL,ORNPL,ORDTL,HAVELES
 S (DFNL,TESTL,ORLOCL,ORNPL,ORDTL,HAVELES)=""
 S DFNL=$P(FLDS,U,1)
 S TESTL=$P(FLDS,U,2)
 S ORLOCL=$P(FLDS,U,3)
 S ORNPL=$P(FLDS,U,4)
 S ORDTL=$P(FLDS,U,5)
 S HAVELES=$TEXT(COM^AVJLES)
 I $L(HAVELES) D COM^AVJLES(.ORY,DFNL,TESTL,ORLOCL,ORNPL,ORDTL)
 S ORY(1)=""
 Q
 ;
ISVTP(ORY,ODIEN) ;True: is verbal or telephoned or policy order
 S ORY=0
 Q:'$D(^OR(100,+ODIEN,0))
 N VERB,TEL,POL,LSTACT,NATR
 S (VERB,TEL,POL,LSTACT)=0,NATR=""
 S VERB=$O(^ORD(100.02,"B","VERBAL",0))
 S TEL=$O(^ORD(100.02,"B","TELEPHONED",0))
 S POL=$O(^ORD(100.02,"B","POLICY",0))
 S LSTACT=$O(^OR(100,+ODIEN,8,"?"),-1)
 S NATR=$P(^OR(100,+ODIEN,8,LSTACT,0),U,12)
 I (NATR=VERB)!(NATR=TEL)!(NATR=POL) S ORY=1
 Q
