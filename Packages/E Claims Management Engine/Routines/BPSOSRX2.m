BPSOSRX2 ;ALB/SS - ECME REQUESTS ;30-NOV-07
 ;;1.0;E CLAIMS MGMT ENGINE;**7,8,10,11**;JUN 2004;Build 27
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 ;Store insurer data in BPS INSURER DATA file
 ; KEY1 - First Key of the Request file 
 ; KEY2 - Second Key of the Request file
 ; MOREDATA - Array of data needed for transaction/claim
 ; BPCOBIND - "active" COB indicator (the one is processed currently) COB
 ; BPIEN77 - BPS REQUEST ien (request for which the BPS INSURER DATA record is created)
 ;
 ; 
INSURER(KEY1,KEY2,MOREDATA,BPCOBIND) ;
 N BPIEN78,BPIEN59,REL,PERCD
 ;IBDATA
 ;Create a new record with .01 field only
 S BPIEN59=$$IEN59^BPSOSRX(KEY1,KEY2,BPCOBIND)
 S BPIEN78=+$$INSITEM^BPSUTIL2(9002313.78,"",BPIEN59,"","") ;BPS Transaction IEN
 I BPIEN78<1 Q "0^Cannot create a record in BPS INSURER DATA"
 ;
 ; Check for proper payer sheets
 I $G(MOREDATA("RX ACTION"))'="ELIG",$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,16)="" Q "0^Billing payer sheet is missing"
 I $G(MOREDATA("RX ACTION"))'="ELIG",$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,17)="" Q "0^Reversal payer sheet is missing"
 I $G(MOREDATA("RX ACTION"))="ELIG",$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,19)="" Q "0^Eligibility payer sheet is missing"
 ;
 ; Populate remaining fields
 I $$FILLFLDS^BPSUTIL2(9002313.78,".02",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,16)) ; Billing Payer Sheet IEN
 I $$FILLFLDS^BPSUTIL2(9002313.78,".03",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,17)) ; Reversal Payer Sheet IEN
 I $$FILLFLDS^BPSUTIL2(9002313.78,".04",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,18)) ; Rebill Payer Sheet IEN
 I $$FILLFLDS^BPSUTIL2(9002313.78,".07",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,14))
 I $$FILLFLDS^BPSUTIL2(9002313.78,".08",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,1))
 I $$FILLFLDS^BPSUTIL2(9002313.78,".09",BPIEN78,BPCOBIND)
 I $$FILLFLDS^BPSUTIL2(9002313.78,".1",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,19)) ; Eligibility Payer Sheet IEN
 I $$FILLFLDS^BPSUTIL2(9002313.78,".11",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,3)),U,7))
 ;
 I $$FILLFLDS^BPSUTIL2(9002313.78,"1.01",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,2))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"1.02",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,3))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"1.03",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,5))
 I $P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,6)'="" I $$FILLFLDS^BPSUTIL2(9002313.78,"1.04",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,6))
 S REL=$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,7)
 I $$FILLFLDS^BPSUTIL2(9002313.78,"1.05",BPIEN78,$S(REL>4:4,1:+REL))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"1.06",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,8))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"1.07",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,9))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"1.08",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,10))
 S PERCD=$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,20)
 I PERCD="" S PERCD=$S(REL=1:"01",REL=2:"02",REL=3:"03",1:"")
 I $$FILLFLDS^BPSUTIL2(9002313.78,"1.09",BPIEN78,PERCD)
 ;
 I $$FILLFLDS^BPSUTIL2(9002313.78,"2.01",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,2)),U,1))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"2.02",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,2)),U,2))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"2.03",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,2)),U,7))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"2.04",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,2)),U,4))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"2.05",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,2)),U,5))
 I $P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,13)'="" I $$FILLFLDS^BPSUTIL2(9002313.78,"2.06",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,13))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"2.07",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,3)),U,8))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"2.08",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,2)),U,6))
 ;
 I $$FILLFLDS^BPSUTIL2(9002313.78,"3.01",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,3)),U,1))
 I $P($G(MOREDATA("IBDATA",BPCOBIND,3)),U,2)'="" I $$FILLFLDS^BPSUTIL2(9002313.78,"3.02",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,3)),U,2))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"3.03",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,3)),U,3))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"3.04",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,3)),U,4))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"3.05",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,3)),U,5))
 I $$FILLFLDS^BPSUTIL2(9002313.78,"3.06",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,3)),U,6))
 ;
 I $$FILLFLDS^BPSUTIL2(9002313.78,"4.01",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,4)) ; Billing Payer Sheet Name
 I $$FILLFLDS^BPSUTIL2(9002313.78,"4.02",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,11)) ; Reversal Payer Sheet Name
 I $P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,12)'="" I $$FILLFLDS^BPSUTIL2(9002313.78,"4.03",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,12)) ; Rebill Payer Sheet Name
 I $P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,15)'="" I $$FILLFLDS^BPSUTIL2(9002313.78,"4.04",BPIEN78,$P($G(MOREDATA("IBDATA",BPCOBIND,1)),U,15)) ; Eligibility Payer Sheet Name
 ;
 I $$FILLFLDS^BPSUTIL2(9002313.78,"5.01",BPIEN78,+DUZ)
 I $$FILLFLDS^BPSUTIL2(9002313.78,"5.02",BPIEN78,DT)
 ;
 Q "1^"_BPIEN78
 ;
ERRFIELD(BP78,BPFIELD) ;
 N DIK,DA
 S DIK="^BPS(9002313.78,"
 S DA=BP78
 D ^DIK ;delete incomplete record
 ;return the error message
 Q $$FIELDMSG(0,"",9002313.78,$G(BPFIELD))
 ;
 ;Store MOREDATA("IBDATA") in BPS INSURER DATA file
 ;  KEY1 - First key of the BPS Request File
 ;  KEY2 - Second Key of the BPS Request File
 ;  MOREDATA - Array of data needed for transaction/claim
 ;  BPINSUR(COB,IEN78) = array to return back BPS INSURERE DATA iens created 
 ;  return value:
 ;  1 = success
 ;  0^message = if one of the records wasn't created
MKINSUR(KEY1,KEY2,MOREDATA,BPINSUR) ;
 N BPQ,BPCOB,BPERRMSG
 S BPERRMSG=""
 S BPQ=0,BPCOB=0
 F  S BPCOB=$O(MOREDATA("IBDATA",BPCOB)) Q:+BPCOB=0!(BPQ=1)  D
 . S BPIEN78=$$INSURER(KEY1,KEY2,.MOREDATA,BPCOB)
 . I BPIEN78<1 S BPERRMSG="Missing data for the file #9002313.78, "_$P(BPIEN78,U,2),BPQ=1 Q
 . S BPINSUR(BPCOB)=+$P(BPIEN78,U,2)
 I BPQ=1 Q "0^"_BPERRMSG
 Q 1
 ;add field name to the message
 ;BPRFILE - if 1 then add file # to the message
 ;BPMESS,BPFILENO,BPFLDNO - message text, file # and field #
FIELDMSG(BPRFILE,BPMESS,BPFILENO,BPFLDNO) ;
 N BPFLDNM
 I ('$G(BPFILENO))!('$G(BPFLDNO)) Q $G(BPMESS)
 D FIELD^DID(BPFILENO,BPFLDNO,"","LABEL","BPFLDNM")
 Q $G(BPMESS)_$S($G(BPRFILE)=1:"file #"_BPFILENO_",",1:"")_"field #"_BPFLDNO_" ("_$G(BPFLDNM("LABEL"))_")"
 ;BPSOSRX2
