RORXU008 ;HCIOFO/SG - REPORT PARAMETERS (CONT.) ;6/21/06 2:08pm
 ;;1.5;CLINICAL CASE REGISTRIES;**1,19**;Feb 17, 2006;Build 43
 ;
 Q
 ;
 ;***** PROCESSES THE LIST OF ICD CODES
 ;
 ; .RORTSK       Task number and task parameters
 ;
 ; PARTAG        Reference (IEN) to the parent tag
 ;
 ; .ROR8LST      Reference to a local variable, which contains a
 ;               closed root of an array. IEN's of ICD codes
 ;               will be returned into this array.
 ;
 ;                 @ROR8LST@(IEN,Group#) = ""
 ;
 ;               If this parameter is undefined or empty, then a
 ;               temporary buffer is allocated by the $$ALLOC^RORTMP
 ;               function and its root is returned via this parameter.
 ;
 ;               If all ICD codes are requested (the "ALL" attribute
 ;               of the "ICDLST" tag), then "*" is returned.
 ;
 ; [.GRPLST]     Reference to a local variable that will contain
 ;               the list of ICD code groups.
 ;
 ;                 GRPLST(
 ;                   "C",Group#)    = GroupName
 ;                   "N",GroupName) = Group#
 ;
 ; Return Values:
 ;       <0  Error code
 ;       >0  IEN of the ICDLST element
 ;
 ;******************************************************************************
 ;******************************************************************************
 ; --- ROUTINE MODIFICATION LOG ---
 ; 
 ;PKG/PATCH   DATE       DEVELOPER   MODIFICATION
 ;----------- ---------- ----------- ----------------------------------------
 ;ROR*1.5*19  FEB 2012   J SCOTT     Support for ICD-10 Coding System.
 ;ROR*1.5*19  FEB 2012   J SCOTT     Change entry point ICD9LST to ICDLST. 
 ;******************************************************************************
 ;******************************************************************************
 ;
ICDLST(RORTSK,PARTAG,ROR8LST,GRPLST) ;
 ;
 N ATTR,ICDALL,ICDOPTS,LTAG,RC,TMP
 ;
 S ICDALL=+$$PARAM^RORTSK01("ICDLST","ALL")
 S (LTAG,RC)=0
 ;
 ;=== Validate parameters
 I 'ICDALL  D  K @ROR8LST
 . S:$G(ROR8LST)="" ROR8LST=$$ALLOC^RORTMP()
 E  S ROR8LST="*"
 ;
 ;=== Process the drug options (if present)
 M ICDOPTS=RORTSK("PARAMS","ICDLST","A")
 I $D(ICDOPTS)>1  D  Q:LTAG'>0 LTAG
 . S ATTR=$S(ICDALL:"ALL",1:"")
 . S LTAG=$$ADDVAL^RORTSK11(RORTSK,"ICDLST",ATTR,PARTAG)
 . Q:LTAG'>0
 . ;--- Output option attributes
 . S ATTR="",RC=0
 . F  S ATTR=$O(ICDOPTS(ATTR))  Q:ATTR=""  D  Q:RC<0
 . . S RC=$$ADDATTR^RORTSK11(RORTSK,LTAG,ATTR,"1")
 . I RC<0  S LTAG=RC  Q
 . S ATTR=$$OPTXT^RORXU002(.ICDOPTS)
 . D:ATTR'="" ADDATTR^RORTSK11(RORTSK,LTAG,"DESCR",ATTR)
 ;
 ;=== Process the list of ICD codes (if present)
 I 'ICDALL  D:$D(RORTSK("PARAMS","ICDLST","G"))>1
 . N GRPNAME,GRPTAG,IG,NODE,RORICDIEN,RORICDCODE,RORXMLNODE,RORICDSYS
 . I LTAG'>0  D  Q:LTAG'>0
 . . S LTAG=$$ADDVAL^RORTSK11(RORTSK,"ICDLST",,PARTAG)
 . ;--
 . S NODE=$NA(RORTSK("PARAMS","ICDLST","G"))
 . S GRPNAME="",RC=0
 . F  S GRPNAME=$O(@NODE@(GRPNAME))  Q:GRPNAME=""  D  Q:RC<0
 . . S IG=$O(GRPLST("C",""),-1)+1
 . . S GRPLST("C",IG)=GRPNAME,GRPLST("N",GRPNAME)=IG
 . . S GRPTAG=$$ADDVAL^RORTSK11(RORTSK,"GROUP",,LTAG)
 . . I GRPTAG'>0  S RC=GRPTAG  Q
 . . D ADDATTR^RORTSK11(RORTSK,GRPTAG,"NAME",GRPNAME)
 . . S RORICDIEN=0
 . . F  S RORICDIEN=$O(@NODE@(GRPNAME,"C",RORICDIEN))  Q:RORICDIEN'>0  D
 . . . S RORICDCODE=$P(@NODE@(GRPNAME,"C",RORICDIEN),U,1)  Q:RORICDCODE=""
 . . . S RORICDSYS=$P(@NODE@(GRPNAME,"C",RORICDIEN),U,2)
 . . . S RORXMLNODE=$S(RORICDSYS=1:"ICD9",RORICDSYS=2:"ICD9",1:"ICD10")
 . . . D ADDVAL^RORTSK11(RORTSK,RORXMLNODE,RORICDCODE,GRPTAG,,RORICDIEN)
 . . . S @ROR8LST@(RORICDIEN,IG)=""
 ;
 Q $S(RC<0:RC,1:LTAG)
 ;
 ;***** FUNCTION FOR THE PHARMACY SEARCH API
 ;
 ; .GRPLST       Reference to a local variable that contains a list
 ;               of group codes. It is used to determine if codes
 ;               from all groups were found.
 ;
 ; ICDIEN        IEN of the ICD code
 ;
 ; ROR8LST       Closed root of the ICD code list generated by the
 ;               $$ICDLST^RORXU008 function or "*" for all drugs.
 ;
 ; Return Values:
 ;        0  Ok
 ;        1  Skip the record
 ;
ICDGRCHK(GRPLST,ICDIEN,ROR8LST) ;
 Q:ROR8LST="*" 0
 Q:$D(@ROR8LST@(ICDIEN))<10 1
 N GRP  S GRP=""
 F  S GRP=$O(@ROR8LST@(ICDIEN,GRP))  Q:GRP=""  K GRPLST(GRP)
 Q 0
