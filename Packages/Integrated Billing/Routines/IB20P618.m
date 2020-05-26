IB20P618 ;SAB/Albany - IB*2.0*618 POST INSTALL;12/11/17 2:10pm
 ;;2.0;Integrated Billing;**618**;Mar 20, 1995;Build 61
 ;Per VA Directive 6402, this routine should not be modified.
 Q
 ;
POSTINIT ;Post Install for IB*2.0*618
 D BMES^XPDUTL(" >>  Starting the Post-Initialization routine for IB*2.0*618 ")
 ; Adding AR CATEGORIES and REVENUE SOURCE CODES
 D RTADD
 D RTUPD
 D ADDRS
 D IBUPD^IBP618A
 D ADDACT^IBP618A
 D UPDACT^IBP618B
 D ADDACTCH^IBP618B
 D BMES^XPDUTL(" >>  End of the Post-Initialization routine for IB*2.0*618")
 Q
 ;
RTADD ;Add New rate types to the Rate type File
 ;
 N LOOP,FDA,FDAIEN,DATA,BRF,ARCAT,CHK
 ;
 D MES^XPDUTL("     -> Adding new Rate Type entries to file 399.3 ...")
 ; Add new Rate Types
 F LOOP=2:1 S DATA=$T(RTDATA+LOOP) Q:$P(DATA,";",3)="END"  D
 . ;Clear the array
 . K FDA
 . ;Check to insure that the rate type doesn't exist already
 . S CHK=""  ; Initialized the check variable
 . S CHK=$O(^DGCR(399.3,"B",$P(DATA,";",3),""))
 . Q:CHK'=""
 . ;Store in array for adding to the file (#399.3).
 . S FDA(399.3,"+1,",.01)=$P(DATA,";",3)   ;Rate Type Name
 . S FDA(399.3,"+1,",.02)=$P(DATA,";",4)   ;Bill Name
 . S FDA(399.3,"+1,",.03)=$P(DATA,";",5)   ;Inactive Flag
 . S FDA(399.3,"+1,",.04)=$P(DATA,";",6)   ;Abbreviation
 . S FDA(399.3,"+1,",.05)=$P(DATA,";",7)   ;Third Party?
 . S ARCAT=$P(DATA,";",8)                  ;AR Cat
 . S:ARCAT'="" ARCAT=$O(^PRCA(430.2,"AC",ARCAT,""))  ;Find local IEN for AR Cat
 . S FDA(399.3,"+1,",.06)=ARCAT            ;AR Cat
 . S FDA(399.3,"+1,",.07)=$P(DATA,";",9)   ;Responsible?
 . S FDA(399.3,"+1,",.08)=$P(DATA,";",10)  ;Reimbursable
 . S FDA(399.3,"+1,",.09)=$P(DATA,";",11)  ;NSC Statement
 . S FDA(399.3,"+1,",.1)=$P(DATA,";",12)   ;Electronic Transmit
 . S BRF=$P(DATA,";",13)                   ;Bill Resulting From (BRF) (430.6)
 . S:BRF'="" BRF=$O(^PRCA(430.6,"B",BRF,""))  ;Find local IEN for BRF
 . S FDA(399.3,"+1,",.11)=BRF
 . S FDA(399.3,"+1,",.12)=$P(DATA,";",14)  ;Collect?
 . ;Add to the file.
 . D UPDATE^DIE(,"FDA","FDAIEN")
 . S FDAIEN=FDAIEN(1) K FDAIEN(1)
 D MES^XPDUTL("        New Rate Types added.")
 Q
 ;
RTDATA ; New RATE TYPE data. (Internal data format
 ;;name;billname;inactive; abbreviation;thirdparty;AR Cat #;resp;reimb;nsc;etransmit;billfrom;collect?
 ;;CC WORKERS' COMP;CC WORKERS' COMP;;CC WC;1;59;i;1;1;1;;
 ;;CC NO-FAULT AUTO;CC NO-FAULT AUTO;;CC NF;1;60;i;1;1;1;;
 ;;CC TORT FEASOR;CC TORT FEASOR;;CC TF;1;61;i;1;1;1;;
 ;;CHOICE WORKERS' COMP;CHOICE WORKERS' COMP;;CCC WC;1;62;i;1;1;1;;
 ;;CHOICE NO-FAULT AUTO;CHOICE NO-FAULT AUTO;;CCC NF;1;54;i;1;1;1;;
 ;;CHOICE TORT FEASOR;CHOICE TORT FEASOR;;CCC TF;1;55;i;1;1;1;;
 ;;CCN WORKERS' COMP;CCN WORKERS' COMP;;CCN WC;1;56;i;1;1;1;;
 ;;CCN NO-FAULT AUTO;CCN NO-FAULT AUTO;;CCN NF;1;57;i;1;1;1;;
 ;;CCN TORT FEASOR;CCN TORT FEASOR;;CCN TF;1;58;i;1;1;1;;
 ;;CHOICE REIMB INS;CHOICE REIMB INS;;CCC REIM;1;50;i;1;1;1;HI;1
 ;;CC REIMB INS;CC REIMB INS;;CC REIM;1;51;i;1;1;1;HI;1
 ;;CCN REIMB INS;CCN REIMB INS;;CCN REIM;1;52;i;1;1;1;HI;1
 ;;CC MTF REIMB INS;CC MTF REIMB INS;;CCD REIM;1;53;i;1;1;1;HI;1
 ;;DOD DISABILITY EVALUATION;DOD DISABILITY EVALUATION;;TR IDES;1;77;i;1;1;1;HI;1
 ;;DOD SPINAL CORD INJURY;DOD SPINAL CORD INJURY;;TRSPINAL;1;78;i;1;1;1;HI;1
 ;;DOD TRAUMATIC BRAIN INJURY;DOD TRAUMATIC BRAIN INJURY;;TR TBI;1;79;i;1;1;1;HI;1
 ;;DOD BLIND REHABILITATION;DOD BLIND REHABILITATION;;TRREHAB;1;80;i;1;1;1;HI;1
 ;;TRICARE DENTAL;TRICARE DENTAL;;TR DENTAL;1;81;i;1;1;1;HI;1
 ;;TRICARE PHARMACY;TRICARE PHARMACY;;TR RX;1;82;i;1;1;1;HI;1
 ;;END
 ;
RTUPD ; Update the FEE REIMB INS entry in the Rate Type File (399.3) to inactivate
 N LIEN,X,Y,DIE,DA,DR,DTOUT,DATA
 ;
 D MES^XPDUTL("     -> Inactivating the FEE REIMB INS Rate Type...")
 S LIEN=$O(^DGCR(399.3,"B","FEE REIMB INS",""))
 Q:'LIEN
 ; File the update
 S DR=".03////1;"
 S DIE="^DGCR(399.3,",DA=LIEN
 D ^DIE
 ;
 Q
ADDRS ; Add Rate Schedules (363) for FEE REIMB INS
 D MES^XPDUTL("     -> Adding new Rate Schedules to file 363 ...")
 N IBA,IBCNT,IBI,IBLN,IBFN,IBRT,IBBS,IBCNTCS,IBDISP,IBJ,IBLNCS,IBCS,IBCSFN,IBADMIN,DD,DO
 N DLAYGO,DIC,DIE,DA,DR,RXDT,X,Y,IBCPNM,IBEDT
 S IBCNT=0
 F IBI=2:1 S IBLN=$P($T(RSF+IBI),";;",2) Q:IBLN="END"  I $E(IBLN)?1A D
 . ;Check for problems
 . S IBBS=$P(IBLN,U,4) I IBBS'="" S IBBS=$$MCCRUTL(IBBS,13) Q:'IBBS  ;Billable service invalid
 . S IBRT=$P(IBLN,U,2),IBRT=$O(^DGCR(399.3,"B",IBRT,0)) D  Q:'IBRT
 .. I 'IBRT D MSG("         **** Rate Type "_$P(IBLN,U,2)_" not defined, RS "_$P(IBLN,U,1)_" not created")
 .. I +$P($G(^DGCR(399.3,+IBRT,0)),U,3) S IBRT=0 D MSG("         **** Rate Type "_$P(IBLN,U,2)_" not Active, RS "_$P(IBLN,U,1)_" not created")
 . ;No problems found, so create entry
 . K DD,DO
 . S DLAYGO=363,DIC="^IBE(363,",DIC(0)="L",X=$P(IBLN,U,1)
 . D FILE^DICN K DIC,DINUM,DLAYGO
 . I Y<1 K X,Y Q
 . S IBFN=+Y,IBCNT=IBCNT+1
 . S IBCPNM=$P(IBLN,U,5),IBEDT=$P(IBLN,U,6)
 . S RXDT=$$RXDT(IBCPNM,IBEDT)
 . S DR=".02////"_IBRT_";.03////"_$P(IBLN,U,3) I +IBBS S DR=DR_";.04////"_IBBS
 . S DR=DR_";.05////"_$P(RXDT,U)
 . I $P(RXDT,U,2) S DR=DR_";.06////"_$P(RXDT,U,2)
 . I ($P(IBLN,U,1)["RX"),($G(IBDISP)]"") S DR=DR_";1.01///"_IBDISP
 . I ($P(IBLN,U,1)["RX"),($G(IBADMIN)]"") S DR=DR_";1.02////"_IBADMIN
 . S DIE="^IBE(363,",DA=+Y D ^DIE K DIE,DA,DR,X,Y
 . S IBCNTCS=0
 . ; Retrieve name of Charge Set to copy
 . I IBRT="" D MSG("         **** Rate Type "_$P(IBLN,U,2)_" missing Charge Set Information, RS "_$P(IBLN,U,1)_" not created") Q
 . ; add all Reasonable Charges Charge Sets to the Rate Schedule.
 . S IBCNTCS=$$RSCS(IBFN,IBCPNM,$P(RXDT,U))
 . D MES^XPDUTL("        Total Reasonable Charge Set"_$S(IBCNTCS=1:" ",1:"s ")_IBCNTCS_" added to Rate Schedule "_$P(IBLN,U,1)_".")
 D MES^XPDUTL("        Rate Schedules completed.")
 Q  ;ADDRS
 ;
RSCS(IBFN,IBCPNM,RXDT) ; add existing Charge Sets to FR
 ; copy the Charge Sets from the corresponding RI RS (v2)
 ; IBFN - Rate Schedule IEN
 ; IBCPNM - Charge Set to copy
 ; RXDT - last effective date of charge set being copied.
 N IBCNT,IBNRS,IBRSNM,IBTY,IBVDT,IBCOPY,IBCS,IBCS0,IBXFN,IBCSFN,IBCSNM,IBCSAA,IBNAME
 S (IBCNT,IBCOPY)=0
 S IBNRS=$G(^IBE(363,+$G(IBFN),0)),IBRSNM=$P(IBNRS,"^",1)
 S IBTY=$P(IBNRS,"^",3)
 S IBVDT=RXDT
 Q:IBVDT="" 0
 S IBCOPY=+$$RSEXISTS(IBVDT,IBCPNM)
 I 'IBCOPY G RSCSQ
 I +$P($G(^IBE(363,+IBCOPY,0)),U,3)=IBTY D
 . S IBXFN=0 F  S IBXFN=$O(^IBE(363,IBCOPY,11,IBXFN)) Q:'IBXFN  D
 .. S IBCS=$G(^IBE(363,IBCOPY,11,IBXFN,0)),IBCSFN=+IBCS
 .. I +$$RSCSFILE(IBFN,$P($G(^IBE(363.1,IBCSFN,0)),U,1),$P(IBCS,U,2)) S IBCNT=IBCNT+1
RSCSQ Q IBCNT
 ;
 ;
RSCSFILE(IBFN,IBCSNM,IBCSAA) ; Add Charge Set to a Rate Schedule
 N IBX,DD,DO,DLAYGO,DIC,DA,DR,X,Y,IBCSFN S IBX=0
 I $G(^IBE(363,+$G(IBFN),0))="" G RSCSFQ
 I $G(IBCSNM)="" G RSCSFQ
 S IBCSFN=$O(^IBE(363.1,"B",IBCSNM,0)) I 'IBCSFN G RSCSFQ
 I $O(^IBE(363,IBFN,11,"B",IBCSFN,0)) G RSCSFQ
 S DLAYGO=363,DA(1)=+IBFN,DIC="^IBE(363,"_DA(1)_",11,",DIC(0)="L"
 S X=IBCSNM,DIC("DR")=".02///"_$G(IBCSAA),DIC("P")="363.0011P"
 D ^DIC S:+Y IBX=1
RSCSFQ Q IBX
 ;
 ;
RSEXISTS(IBVDT,IBNAME) ; return RS IFN if Rate Schedule exists for Effective Date
 N IBX,IBRSFN,IBRS0 S IBX=0
 S IBRSFN=0 F  S IBRSFN=$O(^IBE(363,IBRSFN))  Q:'IBRSFN  D  I IBX Q
 . S IBRS0=$G(^IBE(363,IBRSFN,0))
 . I $P(IBRS0,U,1)=IBNAME,$P(IBRS0,U,5)=IBVDT S IBX=IBRSFN
 Q IBX
 ;
MSG(X) ;
 N IBX S IBX=$O(IBA(999999),-1) S:'IBX IBX=1 S IBX=IBX+1
 S IBA(IBX)=$G(X)
 Q  ;MSG
 ;
MCCRUTL(X,P) ; returns IFN of item in 399.1 if Name is found and piece P is true
 N IBX,IBY S IBY=""
 I $G(X)'="" S IBX=0 F  S IBX=$O(^DGCR(399.1,"B",X,IBX)) Q:'IBX  I $P($G(^DGCR(399.1,IBX,0)),U,+$G(P)) S IBY=IBX
 Q IBY
 ;
RXDT(IBCPNM,IBEDT) ;Copy the active charge schedule from charge set being copied. 
 ; update Fee information if Pharmacy.
 N IBEFLG,IBD
 S IBEDT=$G(IBEDT)  ; Set to NULL if not passed in
 S IBCS=""
 ;If no Effective Date sent, get the latest entry.
 I IBEDT="" S IBCS=$O(^IBE(363,"B",IBCPNM,IBCS),-1)
 ;If Effective date sent, loop through the entries to find the entry
 ;  with the correct effective date.
 I IBEDT'="" D
 . S IBEFLG=0
 . F  S IBCS=$O(^IBE(363,"B",IBCPNM,IBCS),-1) Q:'IBCS  D  Q:IBEFLG
 .. S IBD=$G(^IBE(363,IBCS,0))
 .. I $P(IBD,U,5)=IBEDT S IBEFLG=1
 Q:IBCS="" ""
 S IBCS0=^IBE(363,IBCS,0)
 I IBCPNM["RX" S IBDISP=$P($G(^IBE(363,IBCS,1)),U,1),IBADMIN=$G(^IBE(363,IBCS,10))
 Q $P(IBCS0,U,5,6)   ;return effective and end dates
 ;
RSF ;Rate Schedules (363) for the new Community Care Rate Types.
 ;;Rate Schedule Name^Rate Type^Bill Type^Billable Service^Rate Schedule to copy for Charge Sets
 ;;CCC-NF-INPT^CHOICE NO-FAULT AUTO^1^^NF-INPT
 ;;CCC-NF-SNF^CHOICE NO-FAULT AUTO^1^SKILLED NURSING^NF-SNF
 ;;CCC-NF-OPT^CHOICE NO-FAULT AUTO^3^^NF-OPT
 ;;CCC-NF-RX^CHOICE NO-FAULT AUTO^3^^NF-RX^3140101
 ;;CCC-NF-RX^CHOICE NO-FAULT AUTO^3^^NF-RX^3150101
 ;;CCC-NF-RX^CHOICE NO-FAULT AUTO^3^^NF-RX^3160101
 ;;CCC-NF-RX^CHOICE NO-FAULT AUTO^3^^NF-RX^3170101
 ;;CCC-NF-RX^CHOICE NO-FAULT AUTO^3^^NF-RX^3180101
 ;;CC-NF-INPT^CC NO-FAULT AUTO^1^^NF-INPT
 ;;CC-NF-SNF^CC NO-FAULT AUTO^1^SKILLED NURSING^NF-SNF
 ;;CC-NF-OPT^CC NO-FAULT AUTO^3^^NF-OPT
 ;;CC-NF-RX^CC NO-FAULT AUTO^3^^NF-RX^3140101
 ;;CC-NF-RX^CC NO-FAULT AUTO^3^^NF-RX^3150101
 ;;CC-NF-RX^CC NO-FAULT AUTO^3^^NF-RX^3160101
 ;;CC-NF-RX^CC NO-FAULT AUTO^3^^NF-RX^3170101
 ;;CC-NF-RX^CC NO-FAULT AUTO^3^^NF-RX^3180101
 ;;CCN-NF-INPT^CCN NO-FAULT AUTO^1^^NF-INPT
 ;;CCN-NF-SNF^CCN NO-FAULT AUTO^1^SKILLED NURSING^NF-SNF
 ;;CCN-NF-OPT^CCN NO-FAULT AUTO^3^^NF-OPT
 ;;CCN-NF-RX^CCN NO-FAULT AUTO^3^^NF-RX^3140101
 ;;CCN-NF-RX^CCN NO-FAULT AUTO^3^^NF-RX^3150101
 ;;CCN-NF-RX^CCN NO-FAULT AUTO^3^^NF-RX^3160101
 ;;CCN-NF-RX^CCN NO-FAULT AUTO^3^^NF-RX^3170101
 ;;CCN-NF-RX^CCN NO-FAULT AUTO^3^^NF-RX^3180101
 ;;CCC-RI-INPT^CHOICE REIMB INS^1^^RI-INPT
 ;;CCC-RI-SNF^CHOICE REIMB INS^1^SKILLED NURSING^RI-SNF
 ;;CCC-RI-OPT^CHOICE REIMB INS^3^^RI-OPT
 ;;CCC-RI-RX^CHOICE REIMB INS^3^^RI-RX^3140101
 ;;CCC-RI-RX^CHOICE REIMB INS^3^^RI-RX^3150101
 ;;CCC-RI-RX^CHOICE REIMB INS^3^^RI-RX^3160101
 ;;CCC-RI-RX^CHOICE REIMB INS^3^^RI-RX^3170101
 ;;CCC-RI-RX^CHOICE REIMB INS^3^^RI-RX^3180101
 ;;CC-RI-INPT^CC REIMB INS^1^^RI-INPT
 ;;CC-RI-SNF^CC REIMB INS^1^SKILLED NURSING^RI-SNF
 ;;CC-RI-OPT^CC REIMB INS^3^^RI-OPT
 ;;CC-RI-RX^CC REIMB INS^3^^RI-RX^3140101
 ;;CC-RI-RX^CC REIMB INS^3^^RI-RX^3150101
 ;;CC-RI-RX^CC REIMB INS^3^^RI-RX^3160101
 ;;CC-RI-RX^CC REIMB INS^3^^RI-RX^3170101
 ;;CC-RI-RX^CC REIMB INS^3^^RI-RX^3180101
 ;;CCN-RI-INPT^CCN REIMB INS^1^^RI-INPT
 ;;CCN-RI-SNF^CCN REIMB INS^1^SKILLED NURSING^RI-SNF
 ;;CCN-RI-OPT^CCN REIMB INS^3^^RI-OPT
 ;;CCN-RI-RX^CCN REIMB INS^3^^RI-RX^3140101
 ;;CCN-RI-RX^CCN REIMB INS^3^^RI-RX^3150101
 ;;CCN-RI-RX^CCN REIMB INS^3^^RI-RX^3160101
 ;;CCN-RI-RX^CCN REIMB INS^3^^RI-RX^3170101
 ;;CCN-RI-RX^CCN REIMB INS^3^^RI-RX^3180101
 ;;CC-DOD-INPT^CC MTF REIMB INS^1^INPATIENT^RI-INPT
 ;;CC-DOD-SNF^CC MTF REIMB INS^1^SKILLED NURSING^RI-SNF
 ;;CC-DOD-OPT^CC MTF REIMB INS^3^OUTPATIENT VISIT^RI-OPT
 ;;CC-DOD-RX^CC MTF REIMB INS^3^^RI-RX^3140101
 ;;CC-DOD-RX^CC MTF REIMB INS^3^^RI-RX^3150101
 ;;CC-DOD-RX^CC MTF REIMB INS^3^^RI-RX^3160101
 ;;CC-DOD-RX^CC MTF REIMB INS^3^^RI-RX^3170101
 ;;CC-DOD-RX^CC MTF REIMB INS^3^^RI-RX^3180101
 ;;CCC-TF-INPT^CHOICE TORT FEASOR^1^^TF-INPT
 ;;CCC-TF-SNF^CHOICE TORT FEASOR^1^SKILLED NURSING^TF-SNF
 ;;CCC-TF-OPT^CHOICE TORT FEASOR^3^^TF-OPT
 ;;CCC-TF-RX^CHOICE TORT FEASOR^3^^TF-RX^3140101
 ;;CCC-TF-RX^CHOICE TORT FEASOR^3^^TF-RX^3150101
 ;;CCC-TF-RX^CHOICE TORT FEASOR^3^^TF-RX^3160101
 ;;CCC-TF-RX^CHOICE TORT FEASOR^3^^TF-RX^3170101
 ;;CCC-TF-RX^CHOICE TORT FEASOR^3^^TF-RX^3180101
 ;;CC-TF-INPT^CC TORT FEASOR^1^^TF-INPT
 ;;CC-TF-SNF^CC TORT FEASOR^1^SKILLED NURSING^TF-SNF
 ;;CC-TF-OPT^CC TORT FEASOR^3^^TF-OPT
 ;;CC-TF-RX^CC TORT FEASOR^3^^TF-RX^3140101
 ;;CC-TF-RX^CC TORT FEASOR^3^^TF-RX^3150101
 ;;CC-TF-RX^CC TORT FEASOR^3^^TF-RX^3160101
 ;;CC-TF-RX^CC TORT FEASOR^3^^TF-RX^3170101
 ;;CC-TF-RX^CC TORT FEASOR^3^^TF-RX^3180101
 ;;CCN-TF-INPT^CCN TORT FEASOR^1^^TF-INPT
 ;;CCN-TF-SNF^CCN TORT FEASOR^1^SKILLED NURSING^TF-SNF
 ;;CCN-TF-OPT^CCN TORT FEASOR^3^^TF-OPT
 ;;CCN-TF-RX^CCN TORT FEASOR^3^^TF-RX^3140101
 ;;CCN-TF-RX^CCN TORT FEASOR^3^^TF-RX^3150101
 ;;CCN-TF-RX^CCN TORT FEASOR^3^^TF-RX^3160101
 ;;CCN-TF-RX^CCN TORT FEASOR^3^^TF-RX^3170101
 ;;CCN-TF-RX^CCN TORT FEASOR^3^^TF-RX^3180101
 ;;CCC-WC-INPT^CHOICE WORKERS' COMP^1^^WC-INPT
 ;;CCC-WC-SNF^CHOICE WORKERS' COMP^1^SKILLED NURSING^WC-SNF
 ;;CCC-WC-OPT^CHOICE WORKERS' COMP^3^^WC-OPT
 ;;CCC-WC-RX^CHOICE WORKERS' COMP^3^^WC-RX^3140101
 ;;CCC-WC-RX^CHOICE WORKERS' COMP^3^^WC-RX^3150101
 ;;CCC-WC-RX^CHOICE WORKERS' COMP^3^^WC-RX^3160101
 ;;CCC-WC-RX^CHOICE WORKERS' COMP^3^^WC-RX^3170101
 ;;CCC-WC-RX^CHOICE WORKERS' COMP^3^^WC-RX^3180101
 ;;CC-WC-INPT^CC WORKERS' COMP^1^^WC-INPT
 ;;CC-WC-SNF^CC WORKERS' COMP^1^SKILLED NURSING^WC-SNF
 ;;CC-WC-OPT^CC WORKERS' COMP^3^^WC-OPT
 ;;CC-WC-RX^CC WORKERS' COMP^3^^WC-RX^3140101
 ;;CC-WC-RX^CC WORKERS' COMP^3^^WC-RX^3150101
 ;;CC-WC-RX^CC WORKERS' COMP^3^^WC-RX^3160101
 ;;CC-WC-RX^CC WORKERS' COMP^3^^WC-RX^3170101
 ;;CC-WC-RX^CC WORKERS' COMP^3^^WC-RX^3180101
 ;;CCN-WC-INPT^CCN WORKERS' COMP^1^^WC-INPT
 ;;CCN-WC-SNF^CCN WORKERS' COMP^1^SKILLED NURSING^WC-SNF
 ;;CCN-WC-OPT^CCN WORKERS' COMP^3^^WC-OPT
 ;;CCN-WC-RX^CCN WORKERS' COMP^3^^WC-RX^3140101
 ;;CCN-WC-RX^CCN WORKERS' COMP^3^^WC-RX^3150101
 ;;CCN-WC-RX^CCN WORKERS' COMP^3^^WC-RX^3160101
 ;;CCN-WC-RX^CCN WORKERS' COMP^3^^WC-RX^3170101
 ;;CCN-WC-RX^CCN WORKERS' COMP^3^^WC-RX^3180101
 ;;DOD-DIS EXAM-OPT^DOD DISABILITY EVALUATION^3^OUTPATIENT VISIT^RI-OPT
 ;;DOD-SCI-INPT^DOD SPINAL CORD INJURY^1^INPATIENT^RI-INPT
 ;;DOD-SCI-OPT^DOD SPINAL CORD INJURY^3^OUTPATIENT VISIT^RI-OPT
 ;;DOD-SCI-SNF^DOD SPINAL CORD INJURY^1^SKILLED NURSING^RI-SNF
 ;;DOD-TBI-INPT^DOD TRAUMATIC BRAIN INJURY^1^INPATIENT^RI-INPT
 ;;DOD-TBI-OPT^DOD TRAUMATIC BRAIN INJURY^3^OUTPATIENT VISIT^RI-OPT
 ;;DOD-TBI-SNF^DOD TRAUMATIC BRAIN INJURY^1^SKILLED NURSING^RI-SNF
 ;;DOD-BR-INPT^DOD BLIND REHABILITATION^1^INPATIENT^RI-INPT
 ;;DOD-BR-OPT^DOD BLIND REHABILITATION^3^OUTPATIENT VISIT^RI-OPT
 ;;DOD-BR-SNF^DOD BLIND REHABILITATION^1^SKILLED NURSING^RI-SNF
 ;;TR-DENTAL^TRICARE DENTAL^3^OUTPATIENT VISIT^RI-OPT
 ;;TR-PHARM^TRICARE PHARMACY^3^^RI-RX^3140101
 ;;TR-PHARM^TRICARE PHARMACY^3^^RI-RX^3150101
 ;;TR-PHARM^TRICARE PHARMACY^3^^RI-RX^3160101
 ;;TR-PHARM^TRICARE PHARMACY^3^^RI-RX^3170101
 ;;TR-PHARM^TRICARE PHARMACY^3^^RI-RX^3180101
 ;;END
 ;