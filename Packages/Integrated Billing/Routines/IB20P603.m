IB20P603 ;ALB/CXW - IB*2.0*603 COST-BASED & INTER-AGENCY RATE UPDATE;08/29/17
 ;;2.0;INTEGRATED BILLING;**603**;21-MAR-94;Build 23
 ;;Per VA Directive 6402, this routine should not be modified.
 ; 
 ;
 ; Add CY2017 Cost Based/Interagency Charges to Charge Master 363.2
 Q
POST ;
 N IBEFFDT,IBA,U S U="^"
 D MSG("    IB*2.0*603 Post-Install .....")
 S IBEFFDT=3170829 ; effective date of 08/29/2017
 D ADDCI(IBEFFDT)  ; add Charge Items (363.2) with new rates
 D MSG("    IB*2.0*603 Post-Install Complete")
 Q
 ;
ADDCI(IBEFFDT) ; Add Charge Items (363.2) needs Charge Sets, pass in the effective date of the new charges
 N IBC,IBCHG,IBCNT,IBCNT1,IBCI,IBCS,IBDFLTDT,IBDT,IBFN,IBI,IBLN,IBPE,IBRVCD,IBX,IBXRF,IBZ,DA,DD,DO,DLAYGO,DIC,DIE,DR,X,Y
 ; 
 D MSG("")
 S (IBCNT,IBCNT1)=0,IBDFLTDT=+$G(IBEFFDT)
 I 'IBDFLTDT D MSG("** Error: No Effective Date, No Charges Added") G CIQ
 ;
 F IBI=1:1 S IBLN=$P($T(CIF+IBI),";;",2) Q:+IBLN!(IBLN="")  I $E(IBLN)?1A D SETCI
 ;
 I +IBCNT1 D MSG("       "_IBCNT1_" Duplicate Charge Items already exist, not re-added")
 ;
CIQ D MSG("    >> "_IBCNT_" Cost Based/Interagency Charge Items added (#363.2).")
 D MSG("")
 Q
 ;
SETCI ; set Charge Item (duplicates based on item, CS, eff dt, rev cd)
 ;
 S IBCS=$P(IBLN,U,2),IBCS=+$O(^IBE(363.1,"B",IBCS,0)) I 'IBCS D MSG("** Error: Charge Set "_$P(IBLN,U,2)_" undefined") Q
 S IBCI=+$$MCCRUTL($P(IBLN,U,1),5) I 'IBCI D MSG("** Error: Bed Section "_$P(IBLN,U,1)_" undefined") Q
 S IBDT=IBDFLTDT I +$P(IBLN,U,3) S IBDT=+$P(IBLN,U,3)
 S IBRVCD=$$RVCD($P(IBLN,U,4))
 S IBCHG=+$P(IBLN,U,5)
 S IBXRF="AIVDTS"_IBCS
 ;
 S IBX=0 F  S IBX=$O(^IBA(363.2,IBXRF,IBCI,-IBDT,IBX)) Q:'IBX  S IBZ=$G(^IBA(363.2,IBX,0)) I $P(IBZ,U,6)=IBRVCD D
 . S IBCI=0,IBCNT1=IBCNT1+1 I +$P(IBZ,U,5)'=IBCHG D MSG("** Error: Item exists, wrong charge: "_IBLN)
 Q:'IBCI
 ;
 K DD,DO S DLAYGO=363.2,DIC="^IBA(363.2,",DIC(0)="L",X=IBCI_";DGCR(399.1," D FILE^DICN K DIC
 I Y<1 D MSG("** Error: when adding the charge item "_$P(IBLN,U,2)_" with rate "_IBCHG_" to the file, Log a ticket!") K X,Y Q
 S IBFN=+Y,IBCNT=IBCNT+1
 ;
 S DR=".02///"_IBCS_";.03///"_IBDT_";.05///"_IBCHG I +IBRVCD S DR=DR_";.06///"_IBRVCD
 S DIE="^IBA(363.2,",DA=+IBFN D ^DIE K DIE,DA,DR,X,Y
 Q
 ;
 ;
MCCRUTL(IBC,IBPE) ; returns IEN in 399.1 if Name is found and piece P is true
 N IBX,IBY S IBY=""
 I $G(IBC)'="" S IBX=0 F  S IBX=$O(^DGCR(399.1,"B",IBC,IBX)) Q:'IBX  I $P($G(^DGCR(399.1,IBX,0)),U,+$G(IBPE)) S IBY=IBX
 Q IBY
 ;
RVCD(RVCD) ; returns IFN if revenue code is valid and active
 N IBX,IBY S IBY=""
 I +$G(RVCD) S IBX=$G(^DGCR(399.2,+RVCD,0)) I +$P(IBX,U,3) S IBY=+RVCD
 Q IBY
 ;
MSG(IBA) ;
 D MES^XPDUTL(IBA)
 Q
 ;
CIF ; 68 Charge Items (363.2): Bedsection ^ Charge Set ^Effective Date ^ Revenue Code ^ Charge
 ;;     
TORT ;; Cost Based (Tortiously Liable) - All Inclusive
 ;;        
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (INCLUSIVE)^^^1814
 ;;BLIND REHABILITATION^TL-INPT (INCLUSIVE)^^^1726
 ;;GENERAL MEDICAL CARE^TL-INPT (INCLUSIVE)^^^3805
 ;;INTERMEDIATE CARE^TL-INPT (INCLUSIVE)^^^2123
 ;;NEUROLOGY^TL-INPT (INCLUSIVE)^^^3806
 ;;NURSING HOME CARE^TL-INPT (INCLUSIVE)^^^1209
 ;;POLYTRAUMA INPATIENT^TL-INPT (INCLUSIVE)^^^3070
 ;;PRRTP^TL-INPT (INCLUSIVE)^^^705
 ;;PSYCHIATRIC CARE^TL-INPT (INCLUSIVE)^^^1849
 ;;REHABILITATION MEDICINE^TL-INPT (INCLUSIVE)^^^2489
 ;;SPINAL CORD INJURY CARE^TL-INPT (INCLUSIVE)^^^2285
 ;;SURGICAL CARE^TL-INPT (INCLUSIVE)^^^6388
 ;;             
 ;; Non-Professional: Nursing/Room/Board 101 & Ancillary 240    
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (NPF)^^101^1221
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (NPF)^^240^420
 ;;BLIND REHABILITATION^TL-INPT (NPF)^^101^730
 ;;BLIND REHABILITATION^TL-INPT (NPF)^^240^857
 ;;GENERAL MEDICAL CARE^TL-INPT (NPF)^^101^2358
 ;;GENERAL MEDICAL CARE^TL-INPT (NPF)^^240^992
 ;;INTERMEDIATE CARE^TL-INPT (NPF)^^101^1708
 ;;INTERMEDIATE CARE^TL-INPT (NPF)^^240^311
 ;;NEUROLOGY^TL-INPT (NPF)^^101^2244
 ;;NEUROLOGY^TL-INPT (NPF)^^240^1005
 ;;NURSING HOME CARE^TL-INPT (NPF)^^101^1007
 ;;NURSING HOME CARE^TL-INPT (NPF)^^240^164
 ;;POLYTRAUMA INPATIENT^TL-INPT (NPF)^^101^1783
 ;;POLYTRAUMA INPATIENT^TL-INPT (NPF)^^240^938
 ;;PRRTP^TL-INPT (NPF)^^101^587
 ;;PRRTP^TL-INPT (NPF)^^240^74
 ;;PSYCHIATRIC CARE^TL-INPT (NPF)^^101^1383
 ;;PSYCHIATRIC CARE^TL-INPT (NPF)^^240^291
 ;;REHABILITATION MEDICINE^TL-INPT (NPF)^^101^1446
 ;;REHABILITATION MEDICINE^TL-INPT (NPF)^^240^760
 ;;SPINAL CORD INJURY CARE^TL-INPT (NPF)^^101^1427
 ;;SPINAL CORD INJURY CARE^TL-INPT (NPF)^^240^575
 ;;SURGICAL CARE^TL-INPT (NPF)^^101^3747
 ;;SURGICAL CARE^TL-INPT (NPF)^^240^1937
 ;;              
 ;; Professional Physician
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (PF)^^^173
 ;;BLIND REHABILITATION^TL-INPT (PF)^^^139
 ;;GENERAL MEDICAL CARE^TL-INPT (PF)^^^455
 ;;INTERMEDIATE CARE^TL-INPT (PF)^^^104
 ;;NEUROLOGY^TL-INPT (PF)^^^557
 ;;NURSING HOME CARE^TL-INPT (PF)^^^38
 ;;POLYTRAUMA INPATIENT^TL-INPT (PF)^^^349
 ;;PRRTP^TL-INPT (PF)^^^44
 ;;PSYCHIATRIC CARE^TL-INPT (PF)^^^175
 ;;REHABILITATION MEDICINE^TL-INPT (PF)^^^283
 ;;SPINAL CORD INJURY CARE^TL-INPT (PF)^^^283
 ;;SURGICAL CARE^TL-INPT (PF)^^^704
 ;;                    
 ;; Outpatient Care Other
 ;;OUTPATIENT DENTAL^TL-OPT DENTAL^^^347
 ;;OUTPATIENT VISIT^TL-OPT VST^^^347
 ;;POLYTRAUMA OUTPATIENT VISIT^TL-OPT VST POLYTRAUMA^^^546
 ;;PM&RS OUTPATIENT VISIT^TL-OPT VST PM&RS^^^212
 ;;          
IA ;; Interagency
 ;;            
 ;;ALCOHOL AND DRUG TREATMENT^IA-INPT^^^1727
 ;;BLIND REHABILITATION^IA-INPT^^^1646
 ;;GENERAL MEDICAL CARE^IA-INPT^^^3645
 ;;INTERMEDIATE CARE^IA-INPT^^^2025
 ;;NEUROLOGY^IA-INPT^^^3644
 ;;NURSING HOME CARE^IA-INPT^^^1154
 ;;POLYTRAUMA INPATIENT^IA-INPT^^^2927
 ;;PRRTP^IA-INPT^^^671
 ;;PSYCHIATRIC CARE^IA-INPT^^^1761
 ;;REHABILITATION MEDICINE^IA-INPT^^^2372
 ;;SPINAL CORD INJURY CARE^IA-INPT^^^2182
 ;;SURGICAL CARE^IA-INPT^^^6119
 ;;OUTPATIENT DENTAL^IA-OPT DENTAL^^^333
 ;;OUTPATIENT VISIT^IA-OPT VST^^^333
 ;;POLYTRAUMA OUTPATIENT VISIT^IA-OPT VST POLYTRAUMA^^^522
 ;;PM&RS OUTPATIENT VISIT^IA-OPT VST PM&RS^^^201
 ;;
 Q