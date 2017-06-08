IBD3P63  ;ALB/SS - POST INSTALL ROUTINE FOR IBD*3*63 ;07/26/11
 ;;3.0;AUTOMATED INFO COLLECTION SYS;**63**;APR 24, 1997;Build 81
 ;
 Q
 ;
POST ; post install for IBD*3*63
 N IBDBLK,IBDIPNAM,IBDI10,IBDI9,IBDRETV,IBDFRIEN,IBDEXST
 D MES^XPDUTL("Starting post-install of IBD*3*63")
 D MES^XPDUTL(" ")
 D INACT^IBD3P63A
 D MES^XPDUTL(" ")
 I $$PATCH^XPDUTL("IBD*3.0*63") D MES^XPDUTL("Skipping ICD-10 Package Interface file creation. Previously installed.") Q
 ;
 D MES^XPDUTL("Adding an ""ICD-10 DIAGNOSIS CODE"" record to #359.1 file")
 S IBDEXST=0 I $O(^IBE(359.1,"B","ICD-10 DIAGNOSIS CODE",0))>0 S IBDEXST=1 D MES^XPDUTL("Skipping - ""ICD-10 DIAGNOSIS CODE"" was added previously.")
 I IBDEXST=0 I $$ADD3591()<0 D MES^XPDUTL("Error has occurred during the installation.") Q
 ;
 D MES^XPDUTL("Adding a ""SHORT NARRATIVE (60 CHAR)"" record to #359.1 file")
 S IBDEXST=0 I $O(^IBE(359.1,"B","SHORT NARRATIVE (60 CHAR)",0))>0 S IBDEXST=1 D MES^XPDUTL("Skipping - ""SHORT NARRATIVE (60 CHAR)"" was added previously.")
 I IBDEXST=0 I $$ADD3591A()<0 D MES^XPDUTL("Error has occurred during the installation.") Q
 ;
 D MES^XPDUTL("Adding ""INPUT DIAGNOSIS CODE (ICD10)"" record to #357.6 file")
 S IBDEXST=0 I $O(^IBE(357.6,"B","INPUT DIAGNOSIS CODE (ICD10)",0))>0 S IBDEXST=1 D MES^XPDUTL("Skipping - ""INPUT DIAGNOSIS CODE (ICD10)"" was added previously.")
 I IBDEXST=0 I $$ADD3576A()<0 D MES^XPDUTL("Error has occurred during the installation.") Q
 ;
 D MES^XPDUTL("Adding ""DG SELECT ICD-10 DIAGNOSIS CODES"" record to #357.6 file")
 S IBDEXST=0 I $O(^IBE(357.6,"B","DG SELECT ICD-10 DIAGNOSIS COD",0))>0 S IBDEXST=1 D MES^XPDUTL("Skipping - ""DG SELECT ICD-10 DIAGNOSIS COD"" was added previously.")
 I IBDEXST=0 I $$ADD3576B(.IBDIPNAM)<0 D MES^XPDUTL("Error has occurred during the installation.") Q
 ;
 D MES^XPDUTL("Adding ICD-10 blocks to both the TOOL KIT form and the DEFAULTS form.")
 S IBDEXST=0 I $O(^IBE(357.1,"B","ICD-10 DIAGNOSES (V1.0)",0))>0 S IBDEXST=1 D MES^XPDUTL("Skipping - ""ICD-10 DIAGNOSES (V1.0)"" was added previously.")
 I IBDEXST=0 I $$ADD3571(.IBDBLK)<0 D MES^XPDUTL("Error has occurred during the installation.") Q
 I IBDEXST=0 I $$ADD3572(.IBDBLK,.IBDIPNAM)<0 D MES^XPDUTL("Error has occurred during the installation.") Q
 ;
 D MES^XPDUTL("Copying block to DEFAULTS form.")
 S IBDFRIEN=$O(^IBE(357,"B","DEFAULTS",""))
 I +IBDFRIEN=0 D MES^XPDUTL("Warning: The DEFAULTS form wasn't found.") D NODEFAUL^IBD3P63A  ;send the warning message and continue installation
 I +IBDFRIEN>0 S IBDRETV=0 D  I IBDRETV<0 D MES^XPDUTL("Error has occurred during the installation.") Q
 . I $$CHK10BLK^IBD3P63A(IBDFRIEN)=1 D MES^XPDUTL("Skipping - ICD-10 block was added previously to the Defaults form.") Q
 . S IBDRETV=$$COPYBLK(.IBDBLK)
 ;
 D MES^XPDUTL("Changing block names from ""DIAGNOSIS (V2.1)"" to ""ICD-9 DIAGNOSIS (V2.1)""")
 D ICD9NAME^IBD3P63A
 ;
 D MES^XPDUTL("Changing text in the INPUT DIAGNOSIS CODE (ICD9) record from ""Diagnosis Code"" to ""ICD-9 Diagnosis code""")
 S IBDEXST=$$CHK3576^IBD3P63A()
 I IBDEXST=1 D MES^XPDUTL("Skipping - text in the INPUT DIAGNOSIS CODE (ICD9) record already changed to indicate ICD-9.")
 I IBDEXST=0 I $$CHNG3576^IBD3P63A()<0 D MES^XPDUTL("Error has occurred during the installation.") Q
 ;
 D MES^XPDUTL("Setting the Coding System flag in #357 field .22 for ICD-9 and ICD-10 Package Interfaces")
 S IBDEXST=0
 S IBDI9=$O(^IBE(357.6,"B","DG SELECT ICD-9 DIAGNOSIS CODE",0)) I IBDI9'="" S $P(^IBE(357.6,IBDI9,0),U,22)=1 D
 . D MES^XPDUTL("Coding System set to 1 in ^IBE(357.6,"_IBDI9_",0)")
 S IBDI10=$O(^IBE(357.6,"B","DG SELECT ICD-10 DIAGNOSIS COD",0)) I IBDI10'="" S $P(^IBE(357.6,IBDI10,0),U,22)=30 D
 . D MES^XPDUTL("Coding System set to 30 in ^IBE(357.6,"_IBDI10_",0)")
 D MES^XPDUTL("Finished pre-install of BPS*1*7")
 Q
 ;
 ;Adding an "ICD-10 DIAGNOSIS CODE" record to 359.1 file
ADD3591() ;
 N IBDFLD
 ;DATA TYPE
 S IBDFLD(.01)="ICD-10 DIAGNOSIS CODE"
 ;MAXIMUM LENGTH FOR INPUT
 S IBDFLD(.02)=8 ;7 chars + decimal point = 8 chars in total: AN?.???? where A - alpha, N numeric and ? - alpha or numeric
 ;PRINT FORMAT
 S IBDFLD(.05)="___.____"
 ;SPACE ALLOCATION
 S IBDFLD(.06)=8 ;
 ;REQUIRED CONFIDENCE
 S IBDFLD(.07)=10 ;
 ;PCE DIM VITALS TYPE
 S IBDFLD(.12)="ICD10" ;
 ;PCE DIM INPUT TRANSFORM
 S IBDFLD(1)="D INPICD10^IBDFN8(.X)" ;
 ;PAPER KEYBOARD DATA TYPE
 S IBDFLD(10.01)="a"
 ;PAPER KEYBOARD PICTURE
 S IBDFLD(10.02)="XF"
 ;PK PICTURES FOR SUBFIELDS
 S IBDFLD(10.04)="ANX.XXXX"
 ;
 S IBDRET=$$INSREC^IBDUTIL1(359.1,"",.IBDFLD,"")
 I IBDRET>0 D MES^XPDUTL("  "_IBDFLD(.01)_" has been added to the file #359.1 ") Q +IBDRET
 D MES^XPDUTL("Error: "_IBDFLD(.01)_" has NOT been added to the file #359.1 ")
 Q -1
 ;
 ;adding "SHORT NARRATIVE (60 CHAR)" to file 359.1
ADD3591A() ;
 N IBDFLD,IBDBORDR,IBDPOUND
 S $P(IBDBORDR,"_",60)=""
 S $P(IBDPOUND,"#",60)=""
 ;DATA TYPE
 S IBDFLD(.01)="SHORT NARRATIVE (60 CHAR)"
 ;MAXIMUM LENGTH FOR INPUT
 S IBDFLD(.02)=60
 ;PRINT FORMAT
 S IBDFLD(.05)=IBDBORDR
 ;SPACE ALLOCATION
 S IBDFLD(.06)=60 ;
 ;REQUIRED CONFIDENCE
 S IBDFLD(.07)=10 ;
 ;PCE DIM VITALS TYPE
 S IBDFLD(.12)="NARR" ;
 ;PAPER KEYBOARD DATA TYPE
 S IBDFLD(10.01)="a"
 ;PK PICTURES FOR SUBFIELDS
 S IBDFLD(10.04)=IBDPOUND
 ;
 S IBDRET=$$INSREC^IBDUTIL1(359.1,"",.IBDFLD,"")
 I IBDRET>0 D MES^XPDUTL("  "_IBDFLD(.01)_" has been added to the file #359.1 ") Q +IBDRET
 D MES^XPDUTL("Error: "_IBDFLD(.01)_" has NOT been added to the file #359.1 ")
 Q -1
 ;
 ;adding "INPUT DIAGNOSIS CODE (ICD10)" to #357.6 file
ADD3576A() ;
 ;
 N IBDFLD,IBDRET,IBDIEN10,IBDARR,IBDIEN9,IBDSUB,IBDENTRY
 ;populate array
 S IBDIEN9=$$ARR3576^IBD3P63("INPUT DIAGNOSIS CODE (ICD9)",.IBDFLD)
 I IBDIEN9=0 D MES^XPDUTL("Error: "_IBDFLD(.01)_" has NOT been added to the file #357.6 because ICD9 record wasn't found") Q -1
 ;override/set some of the fields
 S (IBDFLD(.01),IBDENTRY)="INPUT DIAGNOSIS CODE (ICD10)"
 ;kill description node
 K IBDFLD(1)
 ;
 S IBDFLD(3)="INPUT ICD10 ICD-10 DIAGNOSIS CODES"
 ;PCE DIM INPUT TRANSFORM: D INPICD10^IBDFN8(.X)
 S IBDFLD(9)="D INPICD10^IBDFN8(.X)"
 ;HELP TEXT: Enter an active ICD10 diagnosis code.
 S IBDFLD(10)="Enter at least two characters of an active ICD10 diagnosis code."
 ;VALIDATOR: D TESTICD0^IBDFN7
 S IBDFLD(11)="D TESTICD0^IBDFN7"
 ;PCE DIM OUTPUT TRANSFORM: S Y=$$DSPICD10^IBDFN9(Y)
 S IBDFLD(14)="S Y=$$DSPICD10^IBDFN9(Y)"
 ;SELECTOR: D SLCTDX10^IBDFN12(.X)
 S IBDFLD(17)="D SLCTDX10^IBDFN12(.X)"
 ;MANUAL DATA ENTRY ROUTINE: D LIST10^IBDFDE2(.IBDSEL,.IBDF,"Diagnosis Code")
 S IBDFLD(18)="S IBDF(""OTHER"")=""80^I '$P(^(0),U,9)"" D LIST^IBDFDE2(.IBDSEL,.IBDF,""ICD-10 Diagnosis Code"")"
 ;EXTERNAL DISPLAY VALUES: D DX10^IBDFN14(X)
 S IBDFLD(19)="D DX10^IBDFN14(X)"
 ;kill some other nodes
 K IBDFLD(16),IBDFLD(20),IBDFLD(21)
 ;create a new entry
 S IBDRET=$$INSREC^IBDUTIL1(357.6,"",.IBDFLD,"")
 I IBDRET<1 D MES^XPDUTL("Error: "_IBDFLD(.01)_" has NOT been added to the file #357.6 ") Q -1
 D MES^XPDUTL("  "_IBDFLD(.01)_" has been added to the file #357.6 ")
 S IBDIEN10=+IBDRET
 ;populate DESCRIPTION
 ;DESCRIPTION: Used for inputting ICD10 diagnosis codes.
 S IBDARR(1,0)="Used for inputting ICD10 diagnosis codes."
 S IBDRET=$$UPDWD^IBDUTIL1(357.6,IBDIEN10_",",1,"KA",.IBDARR)
 I IBDRET<0 D MES^XPDUTL("Error: Description was NOT added for the"_IBDFLD(.01)_" #357.6 entry")
 ;
 ;get ALLOWABLE QUALIFIERS from ICD9 record
 ;populate 357.613 multiple
 ;
 K IBDFLD,IBDARR
 D U357613(IBDIEN9,.IBDARR)
 S IBDSUB=0,IBDRET=1
 F  S IBDSUB=$O(IBDARR(IBDSUB)) Q:+IBDSUB=0  D
 . S IBDFLD(.01)=$G(IBDARR(IBDSUB,.01))
 . S IBDFLD(.03)=$G(IBDARR(IBDSUB,.03))
 . S IBDFLD(.08)=$G(IBDARR(IBDSUB,.08))
 . S IBDRET=$$INSREC^IBDUTIL1(357.613,IBDIEN10,.IBDFLD,"")
 . I IBDRET<0 D MES^XPDUTL("Error: "_IBDFLD(.01)_" ALLOWABLE QUALIFIER was NOT added for the "_IBDENTRY_" #357.6 entry") Q
 . D MES^XPDUTL("  "_IBDFLD(.01)_" has been added to the #357.613 multiple")
 Q 0
 ;
 ;adding "DG SELECT ICD-10 DIAGNOSIS CODES"
ADD3576B(IBDIPNAM) ;
 N IBDFLD,IBDRET,IBDIEN10,IBDARR,IBDIEN9,IBDIEN13
 N IBDIEN162,IBDIEN166,IBDSUB,IBDENTRY
 ;populate array
 S IBDIEN9=$$ARR3576^IBD3P63("DG SELECT ICD-9 DIAGNOSIS CODES",.IBDFLD)
 I IBDIEN9=0 D MES^XPDUTL("Error: "_IBDFLD(.01)_" has NOT been added to the file #357.6 because ICD9 record wasn't found") Q -1
 ;override/set some of the fields
 S IBDIEN13=$O(^IBE(357.6,"B","INPUT DIAGNOSIS CODE (ICD10)",""))
 S (IBDFLD(.01),IBDENTRY)="DG SELECT ICD-10 DIAGNOSIS CODES"
 S IBDIPNAM=$E(IBDENTRY,1,30) ;needed for file 357.2; "B" cross ref has only 30 characters.
 S IBDFLD(.02)="ICD10"
 S IBDFLD(.03)="IBDFN4"
 S IBDFLD(.13)=IBDIEN13
 ;kill description node
 K IBDFLD(1)
 S IBDFLD(2.01)="CODE"
 S IBDFLD(2.02)=8
 S IBDFLD(3)="SELECT ICD10 ICD-10 CODES DIAGNOSIS"
 S IBDFLD(9)="D INPICD10^IBDFN8(.X)"
 S IBDFLD(11)="D TESTICD0^IBDFN7"
 S IBDIEN162=$O(^IBE(359.1,"B","SHORT NARRATIVE (60 CHAR)",""))
 S IBDFLD(16.2)=IBDIEN162
 S IBDIEN166=$O(^IBE(359.1,"B","ICD-10 DIAGNOSIS CODE",""))
 S IBDFLD(16.6)=IBDIEN166
 S IBDFLD(16.7)="ICD-10 Code"
 S IBDFLD(17)="D SLCTDX10^IBDFN12(.X)"
 S IBDFLD(18)=""
 S IBDFLD(19)="D DX10^IBDFN14(X)"
 ;create a new entry
 S IBDRET=$$INSREC^IBDUTIL1(357.6,"",.IBDFLD,"")
 I IBDRET<1 D MES^XPDUTL("Error: "_IBDFLD(.01)_" has NOT been added to the file #357.6 ") Q -1
 D MES^XPDUTL("  "_IBDFLD(.01)_" has been added to the file #357.6 ")
 S IBDIEN10=+IBDRET
 ;populate DESCRIPTION
 ;DESCRIPTION: Used for inputting ICD10 diagnosis codes.
 S IBDARR(1,0)="Allows the user to select ICD-10 diagnosis codes from the ICD Diagnosis"
 S IBDARR(2,0)="file. Allows only active codes to be selected."
 S IBDRET=$$UPDWD^IBDUTIL1(357.6,IBDIEN10_",",1,"KA",.IBDARR)
 I IBDRET<0 D MES^XPDUTL("Error: Description was NOT added for the"_IBDFLD(.01)_" #357.6 entry")
 ;
 ;get ALLOWABLE QUALIFIERS from ICD9 record
 ; populate 357.613 multiple
 ; 
 K IBDFLD,IBDARR
 D U357613(IBDIEN9,.IBDARR)
 S IBDSUB=0,IBDRET=1
 F  S IBDSUB=$O(IBDARR(IBDSUB)) Q:+IBDSUB=0!(IBDRET<1)  D
 . S IBDFLD(.01)=$G(IBDARR(IBDSUB,.01))
 . S IBDFLD(.03)=$G(IBDARR(IBDSUB,.03))
 . S IBDFLD(.08)=$G(IBDARR(IBDSUB,.08))
 . S IBDRET=$$INSREC^IBDUTIL1(357.613,IBDIEN10,.IBDFLD,"")
 . I IBDRET<0 D MES^XPDUTL("Error: "_IBDFLD(.01)_" ALLOWABLE QUALIFIER was NOT added for the "_IBDENTRY_" #357.6 entry") Q
 . D MES^XPDUTL("  "_IBDFLD(.01)_" has been added to the #357.613 multiple")
 ;
 ;get DATA DESCRIPTION from ICD9 record
 ; populate 357.615 multiple
 ; 
 K IBDFLD,IBDARR
 D U357615(IBDIEN9,.IBDARR)
 S IBDSUB=0,IBDRET=1
 F  S IBDSUB=$O(IBDARR(IBDSUB)) Q:+IBDSUB=0!(IBDRET<1)  D
 . S IBDFLD(.01)=$G(IBDARR(IBDSUB,.01))
 . S IBDFLD(.02)=$G(IBDARR(IBDSUB,.02))
 . S IBDFLD(.03)=$G(IBDARR(IBDSUB,.03))
 . S IBDFLD(.04)=$G(IBDARR(IBDSUB,.04))
 . S IBDFLD(.05)=$G(IBDARR(IBDSUB,.05))
 . S IBDRET=$$INSREC^IBDUTIL1(357.615,IBDIEN10,.IBDFLD,"")
 . I IBDRET<0 D MES^XPDUTL("Error: "_IBDFLD(.01)_" DATA DESCRIPTION was NOT added for the "_IBDENTRY_" #357.6 entry") Q
 . D MES^XPDUTL("  "_IBDFLD(.01)_" has been added to the #357.615 multiple")
 ;
 Q 0
 ;
 ;set array for #357.6 based on existing ICD-9 record
 ;returns IEN for the entry if found
 ; and array as
 ; IBDFLD10(FLDNO)=value
 ;if not then returns 0
 ;Example: D ARR3576A^IBD3P63("DG SELECT ICD-9 DIAGNOSIS CODES",.IBDFLDS)
ARR3576(IBDICD9,IBDFLD10) ;
 ;
 N IBDIEN9,IBDFLD9,IBDIEN,IBDA,IBDFLD
 ;note: "B" x-ref logic for this file truncates the value to 30 chars
 S IBDIEN9=$O(^IBE(357.6,"B",$E(IBDICD9,1,30),""))
 I +IBDIEN9<1 Q 0
 D GETS^DIQ(357.6,IBDIEN9_",","*","I","IBDFLD9")
 M IBDA=IBDFLD9(357.6,IBDIEN9_",")
 S IBDFLD="" F  S IBDFLD=$O(IBDA(IBDFLD)) Q:IBDFLD=""  D
 . S IBDFLD10(IBDFLD)=$G(IBDA(IBDFLD,"I"))
 Q IBDIEN9
 ;
 ;populate 357.613 multiple
U357613(IBDIEN9,IBDFLD) ;
 ;
 N IBDSUB
 S IBDSUB=0
 F  S IBDSUB=$O(^IBE(357.6,IBDIEN9,13,IBDSUB)) Q:+IBDSUB=0  D
 . S IBDFLD(IBDSUB,.01)=$P($G(^IBE(357.6,IBDIEN9,13,IBDSUB,0)),U,1)
 . I IBDFLD(IBDSUB,.01)="" Q
 . S IBDFLD(IBDSUB,.03)=$P($G(^IBE(357.6,IBDIEN9,13,IBDSUB,0)),U,3)
 . S IBDFLD(IBDSUB,.08)=$P($G(^IBE(357.6,IBDIEN9,13,IBDSUB,0)),U,8)
 Q
 ;
 ;populate 357.615 multiple
U357615(IBDIEN9,IBDFLD) ;
 ;
 N IBDSUB,IBDDESC
 S IBDSUB=0
 F  S IBDSUB=$O(^IBE(357.6,IBDIEN9,15,IBDSUB)) Q:+IBDSUB=0  D
 . S IBDFLD(IBDSUB,.01)=$P($G(^IBE(357.6,IBDIEN9,15,IBDSUB,0)),U,1)
 . I IBDFLD(IBDSUB,.01)="" Q
 . S IBDDESC=IBDFLD(IBDSUB,.01)
 . S IBDFLD(IBDSUB,.02)=$S(IBDDESC="DIAGNOSIS":60,1:$P($G(^IBE(357.6,IBDIEN9,15,IBDSUB,0)),U,2))
 . S IBDFLD(IBDSUB,.03)=$P($G(^IBE(357.6,IBDIEN9,15,IBDSUB,0)),U,3)
 . S IBDFLD(IBDSUB,.04)=$P($G(^IBE(357.6,IBDIEN9,15,IBDSUB,0)),U,4)
 . S IBDFLD(IBDSUB,.05)=$P($G(^IBE(357.6,IBDIEN9,15,IBDSUB,0)),U,5)
 Q
 ;
 ;  Add ICD-10 Diagnosis block to Tool Kit Form
ADD3571(IBDBLK) ;
 N IBDFLD,IBDNAME,IBDROW,IBDTLKOR
 S IBDFORM=$O(^IBE(357,"B","TOOL KIT",""))
 I +IBDFORM=0 D MES^XPDUTL("Error: Tool Kit form does not exist") Q -1
 S IBDNAME="ICD-10 DIAGNOSES (V1.0)"
 S IBDFLD(.01)=IBDNAME
 S IBDFLD(.02)=IBDFORM
 S IBDFLD(.04)=0
 S IBDFLD(.05)=0
 S IBDFLD(.06)=132
 S IBDFLD(.07)=15
 S IBDFLD(.1)=1
 S IBDFLD(.11)="DIAGNOSIS"
 S IBDFLD(.12)="CR"
 S IBDFLD(.13)="Common ICD-10 diagnoses"
 S IBDTLKOR=$$TKORDER^IBDF13()
 S IBDFLD(.14)=IBDTLKOR
 S IBDRET=$$INSREC^IBDUTIL1(357.1,"",.IBDFLD,"")
 I IBDRET<0 D MES^XPDUTL("Error: "_IBDFLD(.01)_" has NOT been added to the file #357.1") Q -1
 S IBDBLK=+IBDRET
 D MES^XPDUTL("  "_IBDFLD(.01)_" has been added to file #357.1")
 Q 0
 ; add selection list to block element.
ADD3572(IBDBLK,IBDIPNAM) ;
 N IBDIPIEN,IBDFLD,IBDQUIT,IBDLIST,IBDMSG
 S IBDIPNAM=$G(IBDIPNAM)
 S IBDQUIT=0
 I IBDIPNAM="" D MES^XPDUTL("Error:  ICD-10 Interface Package not found in file #357.6.") Q -1
 I IBDBLK="" D MES^XPDUTL("Error: Block not found for Tool Kit form") Q -1
 S IBDIPIEN=$O(^IBE(357.6,"B",IBDIPNAM,""))
 S IBDFLD(.01)="ICD-10 DIAGNOSES"
 S IBDFLD(.02)=IBDBLK
 S IBDFLD(.07)=4
 S IBDFLD(.08)=0
 S IBDFLD(.09)="SC"
 S IBDFLD(.11)=IBDIPIEN
 S IBDFLD(.12)=0
 S IBDFLD(.14)=0
 S IBDFLD(.16)=1
 S IBDFLD(.17)=3
 S IBDFLD(.18)=2
 S IBDRET=$$INSREC^IBDUTIL1(357.2,"",.IBDFLD,"")
 S IBDLIST=+IBDRET  ;set variable for IBDF routine calls
 I IBDLIST<0 D MES^XPDUTL("Error: "_IBDFLD(.01)_" has NOT been added to file #357.2 ") Q -1
 D MES^XPDUTL("  "_IBDFLD(.01)_" has been added to file #357.2")
 D DLISTCNT^IBDFU3(IBDLIST,357.2)  ;if any, delete lists groups.
 K IBDFLD
 N IBDBUBL,IBDADD,IBDPRIM,IBDSECD
 S IBDBUBL=$O(^IBE(357.91,"B","BUBBLE (use for scanning)",""))
 S IBDADD=$O(^IBD(357.98,"B","ADD TO PROBLEM LIST",""))
 S IBDPRIM=$O(^IBD(357.98,"B","PRIMARY",""))
 S IBDSECD=$O(^IBD(357.98,"B","SECONDARY",""))
 F IBD=1:1:5 D  Q:IBDQUIT
 . K IBDFLD
 . S IBDQUIT=0
 . D U35722(IBD,.IBDFLD,.IBDBUBL,.IBDADD,.IBDPRIM,.IBDSECD)
 . S IBDRET=$$INSREC^IBDUTIL1(357.22,IBDLIST,.IBDFLD,"")
 . S IBDMSG="Error:  File #357.22 has not finished its population."
 . I IBDRET<0 D MES^XPDUTL(IBDMSG) S IBDQUIT=1 Q
 I IBDQUIT Q -1
 D MES^XPDUTL("  ICD-10 DIAGNOSES has populated file #357.22.")
 Q 0
 ;
 ; populate file #357.22
U35722(IBD,IBDFLD,IBDBUBL,IBDADD,IBDPRIM,IBDSECD) ;
 S IBDFLD(.01)=$S(IBD=1:4,IBD=2:3,IBD=3:5,IBD=4:1,1:2)
 S IBDFLD(.02)=$S(IBD=1:"CODE",IBD=2:"DIAGNOSIS",IBD=3:"ADD",IBD=4:"P",1:"S")
 S IBDFLD(.03)=$S(IBD=1:8,IBD=2:64,1:"")
 S IBDFLD(.04)=$S(IBD=1:1,IBD=2:1,1:2)
 S IBDFLD(.05)=$S(IBD=1:1,IBD=2:2,1:"")
 S IBDFLD(.06)=$S(IBD=1:"",IBD=2:"",1:IBDBUBL)
 S IBDFLD(.07)=$S(IBD=1:0,IBD=2:1,1:"")
 S IBDFLD(.08)=$S(IBD=1:"",IBD=2:"",1:1)
 S IBDFLD(.09)=$S(IBD=1:"",IBD=2:"",IBD=3:IBDADD,IBD=4:IBDPRIM,1:IBDSECD)
 S IBDFLD(.1)=$S(IBD=1:"",IBD=2:"",IBD=3:0,IBD=4:1,1:0)
 Q
 ;
 ; Copy block created in ADD3571 and ADD3572 to DEFAULTS form.
COPYBLK(IBDCBLK) ;
 N IBDBIEN,IBDPRINT,IBDFORM,IBDEVICE,IBDNEWBK,IBDNODE,IBDROW,IBDROW1,IBDROW2,IBDROWST,IBDROWS
 D DEVICE^IBDFUA(1,.IBDEVICE)
 S IBDFORM=$O(^IBE(357,"B","DEFAULTS",""))
 I +IBDFORM=0 D MES^XPDUTL("Error: Defaults form does not exist") Q -2
 I '$$LOCKFRM2^IBDFU7(IBDFORM) D MES^XPDUTL("Error: The form DEFAULTS is currently being edited by another user.") Q -1
 D PRNTPRMS^IBDFU1C(.IBDPRINT,0,1,0,1),UNCMPL^IBDF19(.IBDFORM,0)
 ; Set up IBDROW array to calculate starting row position on DEFAULTS form.
 S IBDBIEN="" F  S IBDBIEN=$O(^IBE(357.1,"C",IBDFORM,IBDBIEN)) Q:IBDBIEN=""  D
 .S IBDROW=$P(^IBE(357.1,IBDBIEN,0),U,4),IBDROW(IBDROW,IBDBIEN)=""
 S (IBDROW1,IBDROW2,IBDBIEN)=""
 S IBDROW1=$O(IBDROW(IBDROW1),-1),IBDROW2=$O(IBDROW(IBDROW1),-1)
 S IBDROWS=IBDROW1-IBDROW2
 S IBDBIEN=$S(IBDROWS>20:$O(IBDROW(IBDROW2,"")),1:$O(IBDROW(IBDROW1,"")))
 S IBDNODE=^IBE(357.1,IBDBIEN,0)
 S IBDROWST=$P(IBDNODE,U,4)
 S IBDROW=IBDROWST+$P(IBDNODE,U,7)+2
 S IBDNEWBK=$$COPYBLK^IBDFU2(IBDCBLK,IBDFORM,357.1,357.1,IBDROW,1,0,"",1)
 I IBDNEWBK<0 D MES^XPDUTL("Error: ICD-10 DIAGNOSES (V1.0) block was not copied to DEFAULTS form") Q -1
 D MES^XPDUTL("  ICD-10 DIAGNOSES (V1.0) block was copied to DEFAULTS form")
 Q 0
 ;
 ;IBD3P63
