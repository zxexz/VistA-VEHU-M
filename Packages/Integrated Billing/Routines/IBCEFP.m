IBCEFP ;ALB/TAZ - Provider ID functions ;28-OCT-10
 ;;2.0;INTEGRATED BILLING;**432,447,473,516,592**;21-MAR-94;Build 58
 ;;Per VA Directive 6402, this routine should not be modified.
 ;
 Q
 ;
ALLIDS(IBIFN,IBXSAVE,IBSTRIP,SEG) ; Return all of the Provider IDS
 I '$D(IBSTRIP) S IBSTRIP=0
 I '$D(SEG) S SEG=""
 N IBXIEN,ARINFO,ARID,ARQ,IBFRMTYP,ARIEN,ARINS,Z0,DAT,I,SORT1,SORT2,SORT3,COB,IBCCOB,IBCARE,IBCURR,IBXDATA,NPI,CUROTH
 ;JWS;IB*2.0*592;US131
 S IBFRMTYP=$$FT^IBCEF(IBIFN),IBFRMTYP=$S(IBFRMTYP=2:2,IBFRMTYP=3:1,IBFRMTYP=7:7,1:0)
 S IBCARE=$S($$ISRX^IBCEF1(IBIFN):3,1:0) ;if an Rx refill bill
 S:IBCARE=0 IBCARE=$$INPAT^IBCEF(IBIFN,1) S:'IBCARE IBCARE=2 ;1-inp,2-out
 S IBCURR=$$COB^IBCEF(IBIFN) ;current bill payer sequence
 ;don't create anything if form type not CMS-1500 or UB or J430D
 I IBFRMTYP,'+$G(IBXSAVE("PROVINF",IBIFN)) D
 . N IBZ,CUROTH
 . ;JWS;IB*2.0*592;US131
 . I IBFRMTYP=2!(IBFRMTYP=7) D OUTPT^IBCEF11(IBIFN,0)
 . I IBFRMTYP=1 D HOS^IBCEF22(IBIFN)
 . ; START IB*2.0*447 BI
 . I IBCURR="A" D  Q
 .. N IBRESARR
 .. S IBLIMIT=5
 .. D PROVINF(IBIFN,1,.IBRESARR,1,"C",IBFRMTYP,IBCARE,IBLIMIT,IBCURR,.IBXDATA)
 .. M IBXSAVE=IBRESARR
 .. S IBXSAVE("PROVINF",IBIFN)=IBIFN
 . ; END IB*2.0*447 BI
 . F CUROTH="C","O" D PROVIDER(IBIFN,CUROTH,.IBZ,IBFRMTYP,IBCARE,IBCURR,.IBXDATA) M IBXSAVE=IBZ
 . S IBXSAVE("PROVINF",IBIFN)=IBIFN
 . Q
 ;
 D LFIDS^IBCEF76(IBIFN,.IBXSAVE,IBSTRIP,SEG)   ; Get the Lab/Facility IDs
 S NPI=$P($$ORGNPI^IBCEF73A(IBIFN),U,1)
 F CUROTH="C","O" D
 . S IBXSAVE("LAB/FAC",IBIFN,CUROTH,1,0)=$S(NPI]"":"XX",1:"")_U_NPI
 ;
 S IBFRMTYP=$$FT^IBCEF(IBIFN)
 S ARIEN=$S(IBFRMTYP=2:3,1:4)
 S IBCCOB=$$COBN^IBCEF(IBIFN)  ; Current Insurance
 F COB=1:1:3 D
 . S SORT1=$S(COB=IBCCOB:"C",1:"O")
 . S SORT2=$S(SORT1="C":1,COB=1:1,COB=2&(IBCCOB=1):1,1:2)
 . S ARINFO=$G(IBXSAVE("PROVINF",IBIFN,SORT1,SORT2,ARIEN,1))
 . ;
 . D BPIDS^IBCEF75(IBIFN,.IBXSAVE,SORT1,SORT2,COB,IBSTRIP,SEG)
 ;
 D EN^IBCEF81(.IBXSAVE)
 ;
 I SEG="OPR1" D
 . I '$D(IBXSAVE("PROVINF",IBIFN,"C",1,3)) D  G ALLIDSQ
 .. N SLC,CRED S SLC=0
 .. F  S SLC=$O(IBXSAVE("L-PROV",IBIFN,SLC)) Q:'SLC  D  I $D(IBXSAVE("PROVINF",IBIFN,"C",1,3,"NAME")) Q
 ... S CRED=$P($G(IBXSAVE("L-PROV",IBIFN,SLC,"C",1,3,"NAME")),U,4)
 ... I CRED]"" S $P(IBXSAVE("PROVINF",IBIFN,"C",1,3,"NAME"),U,4)=CRED
 ;
 I SEG="LPUR"!(SEG="LPUR1"),$$SUB1OK^IBCEP8A(IBIFN),$G(IBXSAVE("SLC")) D  G ALLIDSQ
 . N IBCNT,OUT
 . ;IB*2.0*473/TAZ - Moved ID lookup into seperate function.
 . D PSID(IBIFN,.IBXSAVE,.IDS)
 . ;IB*2.0*473/TAZ - END
 . S $P(OUT,U,6)=IDS(0)
 . S $P(OUT,U,7,8)=IDS(1) ; secondary id (1) ^ secondary id qualifier(1)
 . F IBCNT=1:1:IBXSAVE("SLC") S IBXSAVE("SLPRV",IBCNT)=OUT,IBXSAVE("SLPRV",IBCNT,"SLC")=IBCNT
 ;
 I SEG="LOPE" D SLPRV(IBIFN,.IBXSAVE,2) G ALLIDSQ
 I SEG="LOP1" D SLPRV(IBIFN,.IBXSAVE,9) G ALLIDSQ
 I SEG="LREN" D SLPRV(IBIFN,.IBXSAVE,3) G ALLIDSQ
 I SEG="LSUP" D SLPRV(IBIFN,.IBXSAVE,5) G ALLIDSQ
 I SEG="LREF" D SLPRV(IBIFN,.IBXSAVE,1) G ALLIDSQ
 ;JWS;IB*2.0*592;US131
 I SEG="LSUR" D SLPRV(IBIFN,.IBXSAVE,6) G ALLIDSQ
 I SEG="LSR1" D SLPRV(IBIFN,.IBXSAVE,6) G ALLIDSQ
 ;
ALLIDSQ ;
 Q
 ;
PSID(IBIFN,IBXPROV,IBXIDS) ; Build array of either the Fac/Lab ID or Rendering Provider IDs
 ;IB*2.0*473/TAZ - Created a function to standardize IDs in LDAT and LPUR
 ; Input:
 ;   IBXIEN - Internal Entry Number of claim
 ;   IBXPROV - Provider Array
 ;   IBXIDS - Array for IDs
 ; Output:
 ;   IBXIDS(0) - Primary ID
 ;   IBXIDS(1) - Secondary ID
 ;
 N LINE,PLINE,PID,SID,SIDQ
 K IBXIDS
 ; Get Lab/Facility IDs
 S (PID,SID,SIDQ)=""
 S PID=$P($G(IBXPROV("LAB/FAC",IBIFN,"C",1,0)),U,2)
 F LINE=1:1 Q:'$D(IBXPROV("LAB/FAC",IBIFN,"C",1,LINE))  D  I SID'="" Q
 . S SIDQ=$P($G(IBXPROV("LAB/FAC",IBIFN,"C",1,LINE)),U) I ",0B,1G,G2,"'[(","_SIDQ_",") S SIDQ="" Q
 . S SID=$P($G(IBXPROV("LAB/FAC",IBIFN,"C",1,LINE)),U,2)
 I $L(PID)!$L(SID) S IBXIDS(0)=PID,IBXIDS(1)=SID_U_SIDQ G PSIDQ
 ; Get Claim Level Rendering Provider IDs
 S PID=$P($G(IBXPROV("PROVINF",IBIFN,"C",1,3,0)),U,4)  ; Get claim level Rendering Provider NPI
 F LINE=1:1 Q:'$D(IBXPROV("PROVINF",IBIFN,"C",1,3,LINE))  D  I SID'="" Q
 . S SIDQ=$P($G(IBXPROV("PROVINF",IBIFN,"C",1,3,LINE)),U,3) I ",0B,1G,G2,"'[(","_SIDQ_",") S SIDQ="" Q
 . S SID=$P($G(IBXPROV("PROVINF",IBIFN,"C",1,3,LINE)),U,4)
 I $L(PID)!$L(SID) S IBXIDS(0)=PID,IBXIDS(1)=SID_U_SIDQ G PSIDQ
 ; Get Line Level Rendering Provider IDs
 F PLINE=1:1 Q:'$D(IBXPROV("L-PROV",IBIFN,PLINE))  D  I $L(PID)!$L(SID) Q
 . S PID=$P($G(IBXPROV("L-PROV",IBIFN,PLINE,"C",1,3,0)),U,4)
 . F LINE=1:1 Q:'$D(IBXPROV("L-PROV",IBIFN,PLINE,"C",1,3,LINE))  D  I SID'="" Q
 .. S SIDQ=$P($G(IBXPROV("L-PROV",IBIFN,PLINE,"C",1,3,LINE)),U,3) I ",0B,1G,G2,"'[(","_SIDQ_",") S SIDQ="" Q
 .. S SID=$P($G(IBXPROV("L-PROV",IBIFN,PLINE,"C",1,3,LINE)),U,4)
 I $L(PID)!$L(SID) S IBXIDS(0)=PID,IBXIDS(1)=SID_U_SIDQ
PSIDQ ;
 Q
 ;
SLPRV(IBXIEN,IBX,PRTYPE) ;Build SLPRV nodes for the line provider type record
 N SLC,DATA,IBCNT,NAME,OUT
 S (SLC,IBCNT)=0
 F  S SLC=$O(IBX("L-PROV",IBXIEN,SLC)) Q:'SLC  D
 . I '$D(IBX("L-PROV",IBXIEN,SLC,"C",1,PRTYPE)) Q
 . S NAME=$G(IBX("L-PROV",IBXIEN,SLC,"C",1,PRTYPE,"NAME"))
 . S OUT=$P(NAME,U,1,3)_U_$P(NAME,U,5)_U_$G(IBX("L-PROV",IBXIEN,SLC,"C",1,PRTYPE,"TAXONOMY"))_U_$P($G(IBX("L-PROV",IBXIEN,SLC,"C",1,PRTYPE,0)),U,4)
 . F IBN=1:1 Q:'$D(IBX("L-PROV",IBXIEN,SLC,"C",1,PRTYPE,IBN))  D
 .. S DATA=$G(IBX("L-PROV",IBXIEN,SLC,"C",1,PRTYPE,IBN))
 .. I ",0B,1G,G2,LU,"[(","_$P(DATA,U,3)_",") S OUT=OUT_U_$P(DATA,U,4)_U_$P(DATA,U,3)
 . S IBCNT=IBCNT+1
 . S IBX("SLPRV",IBCNT)=OUT
 . S IBX("SLPRV",IBCNT,"SLC")=SLC
SLPRVQ ;
 Q
 ;
 ;PROVIDER
 ;Input:
 ; IB399 - ien of #399
 ; IBPROV:
 ;   "C"- to get info for CURRENT provider
 ;   "O"- to get info for all others (in this case the array will contain info fot two providers
 ; IBRES - array for results (by reference)
 ; IBFRMTYP - Form Type
 ; IBCARE - Care Type
 ; IBCURR - current bill payer sequence
 ;
 ;Output:
 ; IBRES - array to get back info (by reference)
 ; IBRES(IBPROV,PRNUM,PRTYPE,SEQ#)=PROV^INSUR^IDTYPE^ID^FORMTYP^CARETYP
 ; where:
 ; IBPROV - see input parameter
 ; PRNUM: 1=primary insurance provider, 2= secondary, 3 -tretiary
 ; PRTYPE: Provider type(FUNCTION) 
 ; SEQ# : sequence number (1st is used for ID1, 2nd - for ID2, etc)
 ; PROV : provider/VARIABLEPTR
 ; INSUR: Insurance PTR #36 or NONE
 ; IDTYPE: ID type
 ; ID: ID 
 ; FORMTYP: Form type 1=UB,2=1500
 ; CARETYP: Care type 0=both inp/outp,1=inpatient, 2=outpatient
PROVIDER(IB399,IBPROV,IBRES,IBFRMTYP,IBCARE,IBCURR,IBXDATA) ;
 N IBZ,IBRESARR,IBLIMIT
 S IBRESARR=""
 Q:IBCURR="A"  ;PATIENT's bill IB*2.0*447 BI Changes IBPROV to IBCURR
 I IBPROV="C" D
 . S IBLIMIT=5
 . D:$$ISINSUR^IBCEF71(IBCURR,IB399) PROVINF(IB399,$S(IBCURR="T":3,IBCURR="S":2,IBCURR="P":1,1:1),.IBRESARR,1,IBPROV,IBFRMTYP,IBCARE,IBLIMIT,IBCURR,.IBXDATA)
 I IBPROV="O" D
 . S IBLIMIT=3
 . I IBCURR="P" D
 .. D:$$ISINSUR^IBCEF71("S",IB399) PROVINF(IB399,2,.IBRESARR,1,IBPROV,IBFRMTYP,IBCARE,IBLIMIT,IBCURR,.IBXDATA)
 .. D:$$ISINSUR^IBCEF71("T",IB399) PROVINF(IB399,3,.IBRESARR,2,IBPROV,IBFRMTYP,IBCARE,IBLIMIT,IBCURR,.IBXDATA)
 . I IBCURR="S" D
 .. D:$$ISINSUR^IBCEF71("P",IB399) PROVINF(IB399,1,.IBRESARR,1,IBPROV,IBFRMTYP,IBCARE,IBLIMIT,IBCURR,.IBXDATA)
 .. D:$$ISINSUR^IBCEF71("T",IB399) PROVINF(IB399,3,.IBRESARR,2,IBPROV,IBFRMTYP,IBCARE,IBLIMIT,IBCURR,.IBXDATA)
 . I IBCURR="T" D
 .. D:$$ISINSUR^IBCEF71("P",IB399) PROVINF(IB399,1,.IBRESARR,1,IBPROV,IBFRMTYP,IBCARE,IBLIMIT,IBCURR,.IBXDATA)
 .. D:$$ISINSUR^IBCEF71("S",IB399) PROVINF(IB399,2,.IBRESARR,2,IBPROV,IBFRMTYP,IBCARE,IBLIMIT,IBCURR,.IBXDATA)
 M IBRES=IBRESARR
 Q
 ;
 ;-- PROVINF --
 ;Create array with prov info
 ;Input:
 ; IB399 - ien #399
 ; IBPRNUM - 1=prim ins, 2= sec, 3 -tert
 ; IBRES - for results
 ; IBSORT - to sort OTHER INSURANCE data 
 ;  if PROVINF is called for "C" mode of PROVIDER subroutine then 
 ;    IBSORT can be any (say 1)
 ;  if PROVINF is called for "O" mode then can be more than set of data
 ;    - need to sort array to use it (like IBXDATA(1) and IBXDATA(2))
 ;    for mode "O" it should be 1 or 2 (see PROVIDER section)
 ;IBINSTP -  "C" -current ins, "O"-other
 ;IBFRMTYP - Form Type
 ;IBCARE - Care Type
 ;IBLIMIT - Limits on Secondary
 ;IBCURR - Current Insurance
 ;IBXDAYA - Revenue Code Array
 ;Output:
 ; IBRES(PRNUM,PRTYPE,SEQ#)=PROV^INSUR^IDTYPE^ID^FORMTYP^CARETYP
 ; where:(see PROVIDER)
PROVINF(IB399,IBPRNUM,IBRES,IBSORT,IBINSTP,IBFRMTYP,IBCARE,IBLIMIT,IBCURR,IBXDATA) ;
 I $G(IB399)="" G PROVINFQ
 I $G(IBINSTP)="" G PROVINFQ
 I +$G(IBSORT)=0 S IBSORT=$G(IBPRNUM)
 N IBPRTYP,IBINSCO,IBPROV,IB35591,IBN,IBEXC
 S IBN=0
 S IBINSCO=+$P($G(^DGCR(399,IB399,"M")),"^",IBPRNUM)
 S IB35591=$$CH35591^IBCEF72(IBINSCO,IBFRMTYP,IBCARE)
 S IBPRTYP=0
 F  S IBPRTYP=$O(^DGCR(399,IB399,"PRV","B",IBPRTYP)) Q:'IBPRTYP  D
 . N Z,IB355OV,IBPROV,IBARR
 . S IBPROV=$$PROVPTR(IB399,IBPRTYP,0),IBEXC=""
 . Q:+IBPROV=0
 . S Z=$O(^DGCR(399,IB399,"PRV","B",IBPRTYP,0)) I Z S Z=$G(^DGCR(399,IB399,"PRV",Z,0))
 . D GETPRV(IBINSCO,IBFRMTYP,IBCARE,IBPROV,.IBARR,IBPRTYP,IBINSTP,Z)
 . M IBRES("PROVINF",IB399,IBINSTP)=IBARR
 I $D(IBRES("PROVINF",IB399,IBINSTP,IBSORT))>1 S IBRES("PROVINF",IB399,IBINSTP,IBSORT)=$S(IBPRNUM=3:"T",IBPRNUM=2:"S",1:"P")
 N SLC,CPLNK
 S SLC=0
 F  S SLC=$O(IBXDATA(SLC)) Q:'SLC   S IBXSAVE("SLC")=+SLC D
 . S CPLNK=$G(IBXDATA(SLC,"CPLNK")) I 'CPLNK Q
 . S IBPRTYP=0
 . F  S IBPRTYP=$O(^DGCR(399,IB399,"CP",CPLNK,"LNPRV","B",IBPRTYP)) Q:'IBPRTYP  D
 .. N Z,IBPROV,IBARR
 .. S IBPROV=$$PROVPTR(IB399,IBPRTYP,CPLNK),IBEXC=""
 .. Q:'+IBPROV
 .. S Z=$O(^DGCR(399,IB399,"CP",CPLNK,"LNPRV","B",IBPRTYP,0)) I Z S Z=$G(^DGCR(399,IB399,"CP",CPLNK,"LNPRV",Z,0))
 .. D GETPRV(IBINSCO,IBFRMTYP,IBCARE,IBPROV,.IBARR,IBPRTYP,IBINSTP,Z)
 .. M IBRES("L-PROV",IB399,SLC,IBINSTP)=IBARR
 . I $D(IBRES("L-PROV",IB399,SLC,IBINSTP,IBSORT))>1 S IBRES("L-PROV",IB399,SLC,IBINSTP,IBSORT)=$S(IBPRNUM=3:"T",IBPRNUM=2:"S",1:"P")
 ;
PROVINFQ ;Exit PROVINF
 Q
 ;
GETPRV(IBINSCO,IBFRMTYP,IBCARE,IBPROV,IBRES,IBPRTYP,IBINSTP,IBD) ;
 I "CO"'[$G(IBINSTP) G GETPRVQ
 N IBRETARR,IBNPI,IBN,IBMRAND,IB355OV S IBRETARR=0,IB355OV=""
 D PRACT^IBCEF71(IBINSCO,IBFRMTYP,IBCARE,IBPROV,.IBRETARR,IBPRTYP,$G(IBINSTP))
 I $P(IBD,U,IBPRNUM+4)'="",$P(IBD,U,IBPRNUM+11)'="" S IB355OV=$P(IBD,U,IBPRNUM+4)_U_$P(IBD,U,IBPRNUM+11)
 S IBN=0,IBMRAND=$$MCRONBIL^IBEFUNC(IB399)
 ;Calculate MEDICARE (WNR) specific provider qualifier and ID for CMS-1500 secondary claims
 I "34"[$G(IBPRTYP),$G(IBFRMTYP)=2,IBMRAND S IB355OV=$$MCR24K^IBCEU3(IB399,IBPROV)_"^12"
 I $P(IB355OV,U,2) D
 . I $$CHCKSEC^IBCEF73(IBFRMTYP,IBPRTYP,$G(IBINSTP),$P($G(^IBE(355.97,+$P(IB355OV,U,2),0)),U,3)) D
 .. S IBEXC=$P(IB355OV,U,2),IBN=IBN+1,IBRES(IBSORT,IBPRTYP,IBN)="OVERRIDE^"_IBINSCO_U_$P($G(^IBE(355.97,+IBEXC,0)),U,3)_U_$P(IB355OV,U)_"^^^^^"_+IBEXC
 I IB35591'="",IBEXC'=$P(IB35591,U,3) I $$CHCKSEC^IBCEF73(IBFRMTYP,IBPRTYP,$G(IBINSTP),$P(IB35591,"^")) D
 . S IBN=IBN+1,IBRES(IBSORT,IBPRTYP,IBN)="DEFAULT^"_IBINSCO_"^"_IB35591_"^^",$P(IBRES(IBSORT,IBPRTYP,IBN),U,9)=$P(IB35591,U,3)
 S IBNPI=$$NPI^IBCEFP1(IBPROV)
 D SORT^IBCEF77(IBSORT,IBPRTYP,IB399,.IBRETARR,.IBRES,IBN,IBEXC,IBPRNUM,IBLIMIT)
 S IBRES(IBSORT,IBPRTYP,0)="PRIMARY"_U_U_$$STRIP^IBCEF76($S(IBNPI]"":"XX",1:"")_U_IBNPI,1,U,IBSTRIP)
 F IBN=1:1 Q:'$D(IBRES(IBSORT,IBPRTYP,IBN))  S $P(IBRES(IBSORT,IBPRTYP,IBN),U,3,4)=$$STRIP^IBCEF76($P(IBRES(IBSORT,IBPRTYP,IBN),U,3,4),1,U,IBSTRIP)
 S IBRES(IBSORT,IBPRTYP,"NAME")=$$NAME^IBCEFP1(IBPROV,IBIFN,$P(IBD,U,3),$P(IBD,U,8))
 S IBRES(IBSORT,IBPRTYP,"ENTITY TYPE")=$S(IBPROV'["355.93,":1,$P($G(^IBA(355.93,+IBPROV,0)),U,2)=2:1,1:2)
 S IBRES(IBSORT,IBPRTYP,"TAXONOMY")=$$TAXON^IBCEFP1(IBPROV,$P(IBD,U,15))
 S IBRES(IBSORT,IBPRTYP,"COBID")=$$COBID^IBCEFP1(IB399,IBPRTYP,IBMRAND,IBD)
 S IBRES(IBSORT,IBPRTYP)=IBPROV
GETPRVQ ;
 Q
 ;
PROVPTR(IBIEN399,IBFUNC,IBCP) ; Retrieve Provider Pointer from appropriate file
 N IBN,RSLT
 S IBCP=+$G(IBCP)
 I 'IBCP D
 . S IBN=$O(^DGCR(399,IBIEN399,"PRV","B",IBFUNC,0))
 . I +IBN=0 S RSLT=0 Q
 . S RSLT=$P($G(^DGCR(399,IBIEN399,"PRV",+IBN,0)),U,2)
 I IBCP D
 . S IBN=$O(^DGCR(399,IBIEN399,"CP",IBCP,"LNPRV","B",IBFUNC,0))
 . I +IBN=0 S RSLT=0 Q
 . S RSLT=$P($G(^DGCR(399,IBIEN399,"CP",IBCP,"LNPRV",+IBN,0)),U,2)
 Q RSLT
 ;
 ;Input:
 ;IBXIEN - Internal Entry Number for the current bill/claim
 ;IBXSAVE - Array for returning the data
 ;
 ;Output:
 ;IBXSAVE - Data Array
AMB(IBXIEN,IBXSAVE) ; Gather Ambulance Data for AMB Record(s) - IB*2.0*447/TAZ
 N NODE,CODE,CNT,IBXDATA
 K IBXSAVE("AMB")
 F NODE="U5","U6","U7" S IBXDATA=$G(^DGCR(399,IBXIEN,NODE)) I $TR(IBXDATA,U)'="" S IBXSAVE("AMB",NODE)=IBXDATA
 S CODE="",CNT=0
 F  S CODE=$O(^DGCR(399,IBXIEN,"U9","B",CODE)) Q:'CODE  D
 . S IBXDATA=$P($G(^IBE(353.5,CODE,0)),U,1) I IBXDATA="" Q
 . S CNT=CNT+1,IBXSAVE("AMB","U9",CNT)=IBXDATA
 Q
 ;
SNDS2(IBXDATA,PIECE) ;Determine if a SUB2 record is necessary.
 ; Input: IBXDATA
 ;       May contain data from field 232 of file 399.
 ; Output: IBXDATA
 ;       Returns Output for piece 2 or 3 or 1 for any other piece (like 1.5)
 ;Any time that ONE of the following criteria is met we should send a SUB2 record
 ; 1. Incoming IBXDATA is not null SEND - Non-VA facility in field 232 of file 399
 ; 2. If the service facility is a VA Institution in file 4 or a non-VA facility in file 355.93 SEND
 ; 3. Not a switchback payer $$SENDSF^IBCEF79(IBXIEN)'=0 SEND
 ;
 ; MRD;IB*2.0*516 - Due to fields being marked for deletion, the
 ; function $$SENDSF^IBCEF79 will always return '1'.  Refer to
 ; that function and INSFLGS^^IBCEF79 for more information.
 ;
 I IBXDATA="" D
 . N Z
 . S Z=$P($$B^IBCEF79(IBXIEN),U,3)
 . ;S Z1=$$SENDSF^IBCEF79(IBXIEN)
 . ;S IBXDATA=$S(Z="":0,'Z1:0,1:1)
 . S IBXDATA=$S(Z="":0,1:1)
 . Q
 I 'IBXDATA S IBXDATA=""
 I IBXDATA'="" S IBXDATA=$S(PIECE=2:77,PIECE=3:2,1:1)
 Q IBXDATA
