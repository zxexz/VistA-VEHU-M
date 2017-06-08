MBAAWLAP ;OIT-PD/CBR - WAIT LIST API;08/27/2014
 ;;1.0;Scheduling Calendar View;;Aug 27, 2014;Build 52
 ;Associated ICRs:
 ;  ICR#
 ;  6051 MBAA SDWLE6 API
 ;  6063 MBAA RPC REGISTRATION
 ;
LOCK(RETURN,IEN) ;LOCK ^SDWL GLOBAL MBAA RPC: MBAA REMOVE FROM EWL
 S RETURN=0
 I '+$G(IEN) D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","IEN")
 S RETURN=$$LOCK^MBAAWLDA(IEN)
 Q:RETURN 1
 D ERRX^MBAAAPIE(.RETURN,"FILELOCK")
 Q 0
 ;
UNLOCK(IEN) ; MBAA RPC: MBAA REMOVE FROM EWL
 Q:'+$G(IEN) 0
 Q $$UNLOCK^MBAAWLDA(IEN)
 ;code below is not being used in the initial release of MBAA. It will be released at a later date in a future release of MBAA
 ;HASENTRY(RETURN,DFN) ;PATIENT HAS EWL ENTRIES?
 ; S RETURN=0
 ; I '+$G(DFN) D  Q 0
 ; . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","DFN")
 ; S RETURN=$$HASENTRY^MBAAWLDA(DFN)
 ; Q 1
 ; ;
 ;LIST(RETURN,DFN,STATUS,BEGIN,END) ;LIST PATIENT EWL ENTRIES
 ; N PATOK
 ; S RETURN=0
 ; I '+$G(DFN) D  Q 0
 ; . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","DFN")
 ; I '$$HASENTRY(.PATOK,DFN)!'PATOK D  Q 0
 ; . D ERRX^MBAAAPIE(.RETURN,"PATNFND")
 ; S STATUS=$E($G(STATUS))
 ; S BEGIN=$G(BEGIN)
 ; S END=$G(END)
 ; D LIST^MBAAWLDA(.RETURN,DFN,STATUS,BEGIN,END)
 ; Q 1
 ;
DETAIL(RETURN,IEN) ; MBAA RPC: MBAA REMOVE FROM EWL
 I '+$G(IEN) D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","IEN")
 K RETURN
 D DETAIL^MBAAWLDA(.RETURN,IEN)
 Q 1
 ;
 ;TRNDET(RETURN,SDWLIEN) ; Get transfer details for Electronic Wait List internal entry number
 ; ; Input:   SDWLIEN:   EWL IEN
 ; ; Output:  RETURN("ACTIVE"): 0: no active transfer, 1: active transfer
 ; ;          RETURN("INSTITUTION"): Institution name
 ; ;          RETURN("STATION"):  Station Number
 ; N HASENTRY
 ; S RETURN("ACTIVE")=0
 ; I '+$G(SDWLIEN) D  Q 0
 ; . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","SDWLIEN")
 ; I '$$TRFRQACT^MBAAWLDA(SDWLIEN) Q 1
 ; S RETURN("ACTIVE")=1
 ; Q $$TRFRQDET^MBAAWLDA(.RETURN,SDWLIEN)
 ; Q 1
 ;
DISP(RETURN,SDWLDFN,SDWLIEN,SDWLDISP,SDWLAPPT) ;UPDATE DISPOSITION MBAA RPC: MBAA REMOVE FROM EWL
 N DA,DIE,SDWLDUZ
 S RETURN=0
 I '+$G(SDWLIEN) D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","SDWLIEN")
 I ($G(SDWLDISP)="")!("^D^NC^SA^CC^NN^ER^TR^CL^"'["^"_$G(SDWLDISP)) D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","SDWLDISP")
 S RETURN=$$DISP^MBAAWLDA(SDWLDFN,SDWLIEN,SDWLDISP,.SDWLAPPT)
 ;; OG ; SD*5.3*446 Inter-facility transfer.
 I SDWLDISP'="SA" D DIS^SDWLE6(SDWLIEN)  ;ICR#: 6051 MBAA SDWLE6 API
 Q RETURN
 ;
NEW(RETURN,SDWLD) ;CREATE NEW EWL ENTRY MBAA RPC: MBAA EWL NEW
 ;RETURN: RETURNS NEW ENTRY IEN
 N PAT,TYP
 K RETURN
 S RETURN=0
 I '$D(SDWLD) D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","SDWLD")
 I +$G(SDWLD("PATIENT"))'>0 D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","PATIENT")
 I '$$PATDET^MBAALEXT(.PAT,+SDWLD("PATIENT")) D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"PATNFND")
 I +$G(SDWLD("INSTITUTION"))'>0 D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","INSTITUTION")
 S TYP=+$G(SDWLD("WLTYPE"))
 I TYP'>0,TYP'<5  D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","WLTYPE")
 I (TYP=3)!(TYP=4),'$D(SDWLD("PRIORITY")) D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","PRIORITY")
 I (TYP=3)!(TYP=4),'$D(SDWLD("REQBY")) D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","REQBY")
 I (TYP=3)!(TYP=4),'$D(SDWLD("DSRDDT")) D  Q 0
 . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","DSRDDT")
 Q $$NEW^MBAAWLDA(.RETURN,.SDWLD)
 ;code below is not being used in the initial release of MBAA. It will be released at a later date in a future release of MBAA
 ;UPDATE(RETURN,SDWLIEN,SDWLD) ;
 ; K RETURN
 ; S RETURN=0
 ; I +$G(SDWLIEN)'>0 D  Q 0
 ; . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","SDWLIEN")
 ; I '+$D(SDWLD) D  Q 0
 ; . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","SDWLD")
 ; Q $$UPDATE^MBAAWLDA(.RETURN,SDWLIEN,.SDWLD)
 ; ;
 ;DELETE(RETURN,SDWLIEN) ;DELETE EWL ENTRY
 ; K RETURN
 ; S RETURN=0
 ; I +$G(SDWLIEN)'>0 D  Q 0
 ; . D ERRX^MBAAAPIE(.RETURN,"INVPARAM","SDWLIEN")
 ; Q $$DELETE^MBAAWLDA(.RETURN,SDWLIEN)
 ; ;
