IB20P418 ;ALB/CXW - IB*2*418 POST INIT: ADD TORT/INTERAGENCY RATES JULY 2011;07-11-2011
 ;;2.0;INTEGRATED BILLING;**418**;21-MAR-94;Build 16
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ; 
 ;
 ; Add JULY 2011 Tort and Interagency Charges to the Charge Master, 68 Charge Items
 Q
POST ;
 N IBEFFDT
 D MSG("    IB*2*418 Post-Install .....")
 S IBEFFDT=3110711 ; effective date of Tort July 11th, 2011
 D ADDBS           ; add Billable Events (399.1, .21)
 D ADDCS           ; add Charge Sets (363.1)
 D ADDCI(IBEFFDT)  ; add Charge Items (363.2) with new Tort Liable and Interagency charges or and Reasonable Charges
 D ADDRS           ; add Rate Schedules (363)
 ;
 D MSG("    IB*2*418 Post-Install Complete")
 D MSG("")
 Q
 ;
ADDBS ; Add new bedsections (399.1, .12)
 N IBA,IBCNT,IBI,IBLN,IBRB,IBFN,DD,DO,DLAYGO,DIC,DIE,DA,DR,X,Y
 S IBCNT=0
 ;
 F IBI=1:1 S IBLN=$P($T(BSF+IBI),";;",2) Q:+IBLN!(IBLN="")  I $E(IBLN)?1A D
 . ;
 . I +$$MCCRUTL($P(IBLN,U,1),5) Q
 . ;
 . S IBRB=$P(IBLN,U,3) I IBRB'="" S IBRB=$$MCCRUTL(IBRB,13) D  Q:'IBRB
 .. I 'IBRB D MSG("         *** Billable Service "_$P(IBLN,U,3)_" not defined, BS "_$P(IBLN,U,1)_" not created")
 . ;
 . K DD,DO S DLAYGO=399.1,DIC="^DGCR(399.1,",DIC(0)="L",X=$P(IBLN,U,1) D FILE^DICN K DIC I Y<1 K X,Y Q
 . S IBFN=+Y,IBCNT=IBCNT+1
 . ;
 . S DR=".03///"_$P(IBLN,U,2)_";.12///"_1 I +IBRB S DR=DR_";.25///"_IBRB
 . S DIE="^DGCR(399.1,",DA=+IBFN D ^DIE K DIE,DA,DR,X,Y
 . ;
 ;
BSQ D MSG("      >> "_IBCNT_" Bedsection added (399.1).")
 D MSG("")
 Q
 ;
ADDCS ; Add Charge Sets (363.1)
 N IBA,IBCNT,IBI,IBLN,IBFN,IBBR,IBBE,IBRVCD,DD,DO,DLAYGO,DIC,DIE,DA,DR,X,Y S IBCNT=0
 ;
 F IBI=1:1 S IBLN=$P($T(CSF+IBI),";;",2) Q:+IBLN!(IBLN="")  I $E(IBLN)?1A D
 . ;
 . I $O(^IBE(363.1,"B",$P(IBLN,U,1),0)) Q
 . S IBBR=$P(IBLN,U,2),IBBR=$O(^IBE(363.3,"B",IBBR,0)) I 'IBBR Q
 . S IBBE=$$MCCRUTL($P(IBLN,U,3),14) Q:'IBBE
 . S IBRVCD=$$RVCD($P(IBLN,U,5))
 . ;
 . K DD,DO S DLAYGO=363.1,DIC="^IBE(363.1,",DIC(0)="L",X=$P(IBLN,U,1) D FILE^DICN K DIC I Y<1 K X,Y Q
 . S IBFN=+Y,IBCNT=IBCNT+1
 . ;
 . S DR=".02///"_IBBR_";.03///"_IBBE
 . I +$P(IBLN,U,4) S DR=DR_";.04///"_$P(IBLN,U,4)
 . I +IBRVCD S DR=DR_";.05///"_IBRVCD
 . S DIE="^IBE(363.1,",DA=+IBFN D ^DIE K DIE,DA,DR,X,Y
 ;
CSQ D MSG("      >> "_IBCNT_" Charge Sets added (363.1).")
 D MSG("")
 Q
 ;
 ;
ADDCI(IBEFFDT) ; Add Charge Items (363.2) needs Charge Sets, pass in the effective date of the new charges
 N IBA,IBCNT,IBCNT1,IBI,IBLN,IBFN,IBCS,IBXRF,IBCI,IBRVCD,IBCHG,DD,DO,DLAYGO,DIC,DIE,DA,DR,X,Y,IBX,IBZ,IBDFLTDT,IBDT S (IBCNT,IBCNT1)=0
 ;
 S IBDFLTDT=+$G(IBEFFDT) I 'IBDFLTDT D MSG("** Error: No Date, No Charges Added") G CIQ
 ;
 F IBI=1:1 S IBLN=$P($T(CIF+IBI),";;",2) Q:+IBLN!(IBLN="")  I $E(IBLN)?1A D SETCI
 ;
 I +IBCNT1 D MSG(IBCNT1_" Duplicate Charge Items already exist, not re-added")
 ;
CIQ D MSG("      >> "_IBCNT_" Tort/Interagency Charge Items added (363.2).")
 D MSG("")
 Q
 ;
SETCI ; set Charge Item (duplicates based on item, CS, eff dt, rev cd)
 ;
 S IBCS=$P(IBLN,U,2),IBCS=+$O(^IBE(363.1,"B",IBCS,0)) I 'IBCS D MSG("** Error: CS "_$P(IBLN,U,2)_" undefined") Q
 S IBCI=+$$MCCRUTL($P(IBLN,U,1),5) I 'IBCI D MSG("** Error: BS "_$P(IBLN,U,1)_" undefined") Q
 S IBDT=IBDFLTDT I +$P(IBLN,U,3) S IBDT=+$P(IBLN,U,3)
 S IBRVCD=$$RVCD($P(IBLN,U,4))
 S IBCHG=+$P(IBLN,U,5)
 S IBXRF="AIVDTS"_IBCS
 ;
 S IBX=0 F  S IBX=$O(^IBA(363.2,IBXRF,IBCI,-IBDT,IBX)) Q:'IBX  S IBZ=$G(^IBA(363.2,IBX,0)) I $P(IBZ,U,6)=IBRVCD D
 . S IBCI=0,IBCNT1=IBCNT1+1 I +$P(IBZ,U,5)'=IBCHG D MSG("** Error: Item exists, wrong charge: "_IBLN)
 Q:'IBCI
 ;
 K DD,DO S DLAYGO=363.2,DIC="^IBA(363.2,",DIC(0)="L",X=IBCI_";DGCR(399.1," D FILE^DICN K DIC I Y<1 K X,Y Q
 S IBFN=+Y,IBCNT=IBCNT+1
 ;
 S DR=".02///"_IBCS_";.03///"_IBDT_";.05///"_IBCHG I +IBRVCD S DR=DR_";.06///"_IBRVCD
 S DIE="^IBA(363.2,",DA=+IBFN D ^DIE K DIE,DA,DR,X,Y
 Q
 ;
ADDRS ; add Rate Schedules (363)
 ; add new charge sets to the link if TL/IA-OPT VST exists
 N IBCSFN,IBI,IBJ,IBK,IBCNT,IBLN,IBOTH,IBTLIA,IBRSC,IBRSN,DLAYGO,DIC,DIE,DA,DR,X,Y
 S IBI="",IBCNT=0
 F  S IBI=$O(^IBE(363,"B",IBI)) Q:IBI=""  I IBI["OPT" D
 . ; the latest entry
 . S IBRSN=$O(^IBE(363,"B",IBI,99999),-1)
 . ; no CS added if inactive
 . I $P($G(^IBE(363,+IBRSN,0)),U,6)'="" Q
 . S IBTLIA=""
 . ; 
A . S IBRSC=0 F  S IBRSC=$O(^IBE(363,IBRSN,11,IBRSC)) Q:'IBRSC!(IBTLIA'="")  D
 .. S IBLN=+$G(^IBE(363,IBRSN,11,IBRSC,0))
 .. S IBOTH=$P(^IBE(363.1,IBLN,0),U)
 .. S:IBOTH="TL-OPT VST" IBTLIA="TL-OPT VST PM&RS;TL-OPT VST POLYTRAUMA"
 .. S:IBOTH="IA-OPT VST" IBTLIA="IA-OPT VST PM&RS;IA-OPT VST POLYTRAUMA"
 .. Q:IBTLIA=""
 .. ; charge sets (multiple)
 .. F IBJ=1:1 S IBK=$P(IBTLIA,";",IBJ) Q:IBK=""  D 
 ... S IBCSFN=$O(^IBE(363.1,"B",IBK,0)) Q:'IBCSFN
 ... I $O(^IBE(363,IBRSN,11,"B",IBCSFN,0)) Q
 ... K DD,DO S DLAYGO=363,DA(1)=IBRSN,DIC="^IBE(363,"_DA(1)_",11,",DIC(0)="L",X=IBCSFN D FILE^DICN K X,DD,DO,DLAYGO,DIC
 ... ; S DIC("DR")=".02///"_1 ;no auto added
 ... S:IBJ=1 IBCNT=IBCNT+1
 ;
RSQ ;
 D MSG("      >> "_IBCNT_" Tort/Interagency Rate Schedules linked (#363) to Reasonable Charges updated.")
 D MSG("")
 Q
 ;
MCCRUTL(X,P) ; returns IFN of item in 399.1 if Name is found and piece P is true
 N IBX,IBY S IBY=""
 I $G(X)'="" S IBX=0 F  S IBX=$O(^DGCR(399.1,"B",X,IBX)) Q:'IBX  I $P($G(^DGCR(399.1,IBX,0)),U,+$G(P)) S IBY=IBX
 Q IBY
 ;
RVCD(RVCD) ; returns IFN if revenue code is valid and active
 N IBX,IBY S IBY=""
 I +$G(RVCD) S IBX=$G(^DGCR(399.2,+RVCD,0)) I +$P(IBX,U,3) S IBY=+RVCD
 Q IBY
 ;
MSG(X) ;
 D MES^XPDUTL(X)
 Q
 ;
 ;
BSF ; Bedsections (399.1, .12): Name ^ Abbreviation
 ;;POLYTRAUMA INPATIENT^POYLTRAUMA INPT
 ;;PM&RS OUTPATIENT VISIT^PM&RS OPT VISIT
 ;;POLYTRAUMA OUTPATIENT VISIT^OPT POLYTRI/TBI
 ;
 ;
CSF ; Charge Sets (363.1): Name ^ Billing Rate ^ Billable Event ^^ Default Revenue Code
 ;;TL-OPT VST PM&RS^TORTIOUSLY LIABLE^OUTPATIENT VISIT DATE^^500
 ;;TL-OPT VST POLYTRAUMA^TORTIOUSLY LIABLE^OUTPATIENT VISIT DATE^^500
 ;;IA-OPT VST PM&RS^INTERAGENCY^OUTPATIENT VISIT DATE^^500
 ;;IA-OPT VST POLYTRAUMA^INTERAGENCY^OUTPATIENT VISIT DATE^^500
 ;
 ;
CIF ; Charge Items (363.2): Bedsection ^ Charge Set ^Effective Date ^ Revenue Code ^ Charge
 ;;     
TORT ;; 2011 Tortiously Liable All Inclusive
 ;;        
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (INCLUSIVE)^^^1154
 ;;BLIND REHABILITATION^TL-INPT (INCLUSIVE)^^^1240
 ;;GENERAL MEDICAL CARE^TL-INPT (INCLUSIVE)^^^2384
 ;;INTERMEDIATE CARE^TL-INPT (INCLUSIVE)^^^1920
 ;;NEUROLOGY^TL-INPT (INCLUSIVE)^^^3899
 ;;NURSING HOME CARE^TL-INPT (INCLUSIVE)^^^993
 ;;POLYTRAUMA INPATIENT^TL-INPT (INCLUSIVE)^^^3391
 ;;PRRTP^TL-INPT (INCLUSIVE)^^^577
 ;;PSYCHIATRIC CARE^TL-INPT (INCLUSIVE)^^^801
 ;;REHABILITATION MEDICINE^TL-INPT (INCLUSIVE)^^^2122
 ;;SPINAL CORD INJURY CARE^TL-INPT (INCLUSIVE)^^^1756
 ;;SURGICAL CARE^TL-INPT (INCLUSIVE)^^^4533
 ;;             
 ;; Tortiously Liable Non-Professional
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (NPF)^^101^777
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (NPF)^^240^267
 ;;BLIND REHABILITATION^TL-INPT (NPF)^^101^524
 ;;BLIND REHABILITATION^TL-INPT (NPF)^^240^616
 ;;GENERAL MEDICAL CARE^TL-INPT (NPF)^^101^1478
 ;;GENERAL MEDICAL CARE^TL-INPT (NPF)^^240^621
 ;;INTERMEDIATE CARE^TL-INPT (NPF)^^101^1544
 ;;INTERMEDIATE CARE^TL-INPT (NPF)^^240^282
 ;;NEUROLOGY^TL-INPT (NPF)^^101^2299
 ;;NEUROLOGY^TL-INPT (NPF)^^240^1029
 ;;NURSING HOME CARE^TL-INPT (NPF)^^101^828
 ;;NURSING HOME CARE^TL-INPT (NPF)^^240^134
 ;;POLYTRAUMA INPATIENT^TL-INPT (NPF)^^101^1970
 ;;POLYTRAUMA INPATIENT^TL-INPT (NPF)^^240^1036
 ;;PRRTP^TL-INPT (NPF)^^101^480
 ;;PRRTP^TL-INPT (NPF)^^240^61
 ;;PSYCHIATRIC CARE^TL-INPT (NPF)^^101^599
 ;;PSYCHIATRIC CARE^TL-INPT (NPF)^^240^126
 ;;REHABILITATION MEDICINE^TL-INPT (NPF)^^101^1233
 ;;REHABILITATION MEDICINE^TL-INPT (NPF)^^240^648
 ;;SPINAL CORD INJURY CARE^TL-INPT (NPF)^^101^1096
 ;;SPINAL CORD INJURY CARE^TL-INPT (NPF)^^240^442
 ;;SURGICAL CARE^TL-INPT (NPF)^^101^2658
 ;;SURGICAL CARE^TL-INPT (NPF)^^240^1375
 ;;              
 ;; Tortiously Liable Professional
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (PF)^^^110
 ;;BLIND REHABILITATION^TL-INPT (PF)^^^100
 ;;GENERAL MEDICAL CARE^TL-INPT (PF)^^^285
 ;;INTERMEDIATE CARE^TL-INPT (PF)^^^94
 ;;NEUROLOGY^TL-INPT (PF)^^^571
 ;;NURSING HOME CARE^TL-INPT (PF)^^^31
 ;;POLYTRAUMA INPATIENT^TL-INPT (PF)^^^385
 ;;PRRTP^TL-INPT (PF)^^^36
 ;;PSYCHIATRIC CARE^TL-INPT (PF)^^^76
 ;;REHABILITATION MEDICINE^TL-INPT (PF)^^^241
 ;;SPINAL CORD INJURY CARE^TL-INPT (PF)^^^218
 ;;SURGICAL CARE^TL-INPT (PF)^^^500
 ;;                    
 ;; Tortiously Liable Other
 ;;OUTPATIENT VISIT^TL-OPT VST^^^231
 ;;OUTPATIENT DENTAL^TL-OPT DENTAL^^^487
 ;;PM&RS OUTPATIENT VISIT^TL-OPT VST PM&RS^^^430
 ;;POLYTRAUMA OUTPATIENT VISIT^TL-OPT VST POLYTRAUMA^^^573
 ;;          
 ;;         
IA ;; 2011 Interagency
 ;;            
 ;;ALCOHOL AND DRUG TREATMENT^IA-INPT^^^1081
 ;;BLIND REHABILITATION^IA-INPT^^^1161
 ;;GENERAL MEDICAL CARE^IA-INPT^^^2232
 ;;INTERMEDIATE CARE^IA-INPT^^^1796
 ;;NEUROLOGY^IA-INPT^^^3648
 ;;NURSING HOME CARE^IA-INPT^^^929
 ;;POLYTRAUMA INPATIENT^IA-INPT^^^3197
 ;;PRRTP^IA-INPT^^^540
 ;;PSYCHIATRIC CARE^IA-INPT^^^749
 ;;REHABILITATION MEDICINE^IA-INPT^^^1992
 ;;SPINAL CORD INJURY CARE^IA-INPT^^^1644
 ;;SURGICAL CARE^IA-INPT^^^4248
 ;;            
 ;;OUTPATIENT VISIT^IA-OPT VST^^^214
 ;;OUTPATIENT DENTAL^IA-OPT DENTAL^^^416
 ;;PM&RS OUTPATIENT VISIT^IA-OPT VST PM&RS^^^401
 ;;POLYTRAUMA OUTPATIENT VISIT^IA-OPT VST POLYTRAUMA^^^535
 ;;
 Q
