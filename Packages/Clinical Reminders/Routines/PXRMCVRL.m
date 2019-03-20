PXRMCVRL ; SLC/JM/AGP - Reminder CPRS Code ;01/12/15
 ;;2.0;CLINICAL REMINDERS;**53,42**;Feb 04, 2005;Build 132
 Q
REMIND(ORY,ORPT) ;return pt's currently due PCE clinical reminders
 ; in the format file 811.9 ien^reminder print name^date due^last occur.
 N ORTMPLST,ORI,ORJ,ORIEN,ORTXT,ORX,ORLASTDT,ORDUEDT,ORLOC
 S ORJ=0
 ;
 ;get patient's location flag (INPATIENT ONLY - outpt locations cannot be
 ;reliably determined, and many simultaneous outpt locations can occur):
 I +$G(ORPT)>0 D
 .N DFN S DFN=ORPT,VA200="" D OERR^VADPT
 .I +$G(VAIN(4))>0 S ORLOC=+$G(^DIC(42,+$G(VAIN(4)),44))
 .K VA200,VAIN
 ;
 D REMLIST(.ORTMPLST,$G(ORLOC))
 ;D GETLST^XPAR(.ORTMPLST,"USR^LOC.`"_$G(ORLOC)_"^SRV.`"_+$G(ORSRV)_"^DIV^SYS^PKG","ORQQPX SEARCH ITEMS","Q",.ORERR)
 ;I ORERR>0 S ORY(1)=U_"Error: "_$P(ORERR,U,2) Q
 S ORI=0 F  S ORI=$O(ORTMPLST(ORI)) Q:'ORI  D
 .S ORIEN=$P(ORTMPLST(ORI),U,2)
 .K ^TMP("PXRHM",$J)
 .N ORPRI,ORDUE,ORSTA
 .D MAIN^PXRM(ORPT,ORIEN,0)
 .S ORTXT="",ORTXT=$O(^TMP("PXRHM",$J,ORIEN,ORTXT)) Q:ORTXT=""  D
 ..S ORX=^TMP("PXRHM",$J,ORIEN,ORTXT)
 ..S ORSTA=$P(ORX,U)
 ..S ORDUEDT=$P(ORX,U,2),ORLASTDT=$P(ORX,U,3)
 ..S ORLASTDT=$S(+$G(ORLASTDT)>0:ORLASTDT,1:"")  ;null if not a date
 ..S ORJ=ORJ+1
 ..S ORDUE=$S(ORSTA["DUE":1,ORSTA["ERROR":3,ORSTA["CNBD":4,1:2)
 ..I ORDUE'=2 D
 ...S ORPRI=$P($G(^PXD(811.9,ORIEN,0)),U,10) I ORPRI="" S ORPRI=2
 ...S ORY(ORJ)=ORIEN_U_ORTXT_U_ORDUEDT_U_ORLASTDT_U_ORPRI_U_ORDUE_U_$$DLG^PXRMRPCA(ORIEN)_U_U_U_U_$$DLGWIPE^PXRMRPCA(ORIEN)
 ..I ORDUE=2 D
 ...S ORY(ORJ)=ORIEN_U_ORTXT_U_U_U_U_ORDUE_U_$$DLG^PXRMRPCA(ORIEN)_U_U_U_U_$$DLGWIPE^PXRMRPCA(ORIEN)
 .K ^TMP("PXRHM",$J)
 Q
REMDET(ORY,ORPT,ORIEN) ;return detail for a pt's clinical reminder
 ; ORY - return array
 ; ORPT - patient DFN
 ; ORIEN - clinical reminder (811.9 ien)
 K ^TMP("PXRHM",$J)
 D MAIN^PXRM(ORPT,ORIEN,5)     ; 5 returns all reminder info
 N CR,I,J,ORTXT S I=1
 S ORTXT="",ORTXT=$O(^TMP("PXRHM",$J,ORIEN,ORTXT)) Q:ORTXT=""  D
 .S J=0 F  S J=$O(^TMP("PXRHM",$J,ORIEN,ORTXT,"TXT",J)) Q:J=""  D
 ..S ORY(I)=^TMP("PXRHM",$J,ORIEN,ORTXT,"TXT",J),I=I+1
 K ^TMP("PXRHM",$J)
 Q
NEWACTIV(ORY) ;Return true if Interactive Reminders are active
 S ORY=0
 I $T(APPL^PXRMRPCA)'="",+$G(DUZ) D
 . N SRV
 . ;S SRV=$P($G(^VA(200,DUZ,5)),U)
 . S SRV=$$GET1^DIQ(200,DUZ,29,"I")
 . S ORY=$$GET^XPAR(DUZ_";VA(200,^SRV.`"_+$G(SRV)_"^DIV^SYS","PXRM GUI REMINDERS ACTIVE",1,"Q")
 . I +ORY S ORY=1
 . E  S ORY=0
 Q
 ;
NEWCVOK(RESULT,USER) ; Returns status of 
 N SRV,ERR,TMP
 ;S ORY=0,SRV=$P($G(^VA(200,DUZ,5)),U)
 S RESULT=0,SRV=$$GET1^DIQ(200,USER,29,"I")
 D GETLST^XPAR(.TMP,"USR.`"_USER_"^SRV.`"_+$G(SRV)_"^DIV^SYS^PKG","ORQQPX NEW REMINDER PARAMS","Q",.ERR)
 I +TMP S RESULT=$P($G(TMP(1)),U,2)
 Q
ADDNAME(ORX) ; Add Reminder or Category Name as 3rd piece
 N CAT,IEN
 S CAT=$E($P(ORX,U,2),2)
 S IEN=$E($P(ORX,U,2),3,99)
 I +IEN D
 .I CAT="R" S $P(ORX,U,3)=$P($G(^PXD(811.9,IEN,0)),U,3)
 .I CAT="C" S $P(ORX,U,3)=$P($G(^PXRMD(811.7,IEN,0)),U)
 Q ORX
 ;
REMACCUM(RESULT,LVL,TYP,SORT,CLASS) ; Accumulates ORTMP into ORY
 ; Format of entries in ORQQPX COVER SHEET REMINDERS:
 ;   L:Lock;R:Remove;N:Normal / C:Category;R:Reminder / Cat or Rem IEN
 N IDX,I,J,K,M,FOUND,ORERR,ORTMP,FLAG,IEN
 N FFLAG,FIEN,OUT,P2,ADD,DOADD,CODE
 I LVL="CLASS" D  I 1
 .N ORLST,ORCLS,ORCLSPRM,ORWP
 .S ORCLSPRM="ORQQPX COVER SHEET REM CLASSES"
 .D GETLST^XPAR(.ORLST,"SYS",ORCLSPRM,"Q",.ORERR)
 .S I=0,M=0,CLASS=$G(CLASS)
 .F  S I=$O(ORLST(I)) Q:'I  D
 ..S ORCLS=$P(ORLST(I),U,1)
 ..I +CLASS S ADD=(ORCLS=+CLASS) I 1
 ..E  S ADD=$$ISA^USRLM(DUZ,ORCLS,.ORERR)
 ..I +ADD D
 ...D GETWP^XPAR(.ORWP,"SYS",ORCLSPRM,ORCLS,.ORERR)
 ...S K=0
 ...F  S K=$O(ORWP(K)) Q:'K  D
 ....S M=M+1
 ....S J=$P(ORWP(K,0),";",1)
 ....S ORTMP(M)=J_U_$P(ORWP(K,0),";",2)
 E  D GETLST^XPAR(.ORTMP,LVL,"ORQQPX COVER SHEET REMINDERS",TYP,.ORERR)
 S I=0,IDX=$O(RESULT(999999),-1)+1,ADD=(SORT="")
 F  S I=$O(ORTMP(I)) Q:'I  D
 .S (FOUND,J)=0,P2=$P(ORTMP(I),U,2)
 .S FLAG=$E(P2),IEN=$E(P2,2,999)
 .I ADD S DOADD=1
 .E  D
 ..S DOADD=0
 ..F  S J=$O(RESULT(J)) Q:'J  D  Q:FOUND
 ...S P2=$P(RESULT(J),U,2)
 ...S FIEN=$E(P2,2,999)
 ...I FIEN=IEN S FOUND=J,FFLAG=$E(P2)
 ..I FOUND D  I 1
 ...I FLAG="R",FFLAG'="L" K RESULT(FOUND)
 ...I FLAG'=FFLAG,(FLAG_FFLAG)["L" S $E(P2)="L",$P(RESULT(FOUND),U,2)=P2
 ..E  I (FLAG'="R") S DOADD=1
 .I DOADD D
 ..S OUT(IDX)=ORTMP(I)
 ..S $P(OUT(IDX),U)=$P(OUT(IDX),U)_SORT
 ..I SORT="" S OUT(IDX)=$$ADDNAME(OUT(IDX))
 ..S IDX=IDX+1
 M RESULT=OUT
 Q
ADDREM(RESULT,IDX,IEN) ; Add Reminder to RESULT list
 I $D(RESULT("B",IEN)) Q               ; See if it's in the list
 I '$D(^PXD(811.9,IEN)) Q           ; Check if Exists
 I $P($G(^PXD(811.9,IEN,0)),U,6)'="" Q  ; Check if Active
 ;check to see if the reminder is assigned to CPRS
 I $P($G(^PXD(811.9,IEN,100)),U,4)["L" Q
 I $P($G(^PXD(811.9,IEN,100)),U,4)'["C",$P($G(^PXD(811.9,IEN,100)),U,4)'="*" Q
 S RESULT(IDX)=IDX_U_IEN
 S RESULT("B",IEN)=""
 Q
ADDCAT(RESULT,IDX,IEN) ; Add Category Reminders to ORY list
 N REM,I,IDX2,NREM
 D CATREM^PXRMAPI0(IEN,.REM)
 S I=0
 F  S I=$O(REM(I)) Q:'I  D
 . S IDX2="00000"_I
 . S IDX2=$E(IDX2,$L(IDX2)-5,99)
 . D ADDREM(.RESULT,+(IDX_"."_IDX2),$P(REM(I),U,1))
 Q
REMLIST(RESULT,PERSON,LOC) ;Returns a list of all cover sheet reminders
 N SRV,I,J,LST,CODE,IDX,IEN,NEWP,USER
 ;S SRV=$P($G(^VA(200,DUZ,5)),U)
 S USER=$S(+$G(PERSON)>0:+$G(PERSON),1:DUZ)
 S SRV=$$GET1^DIQ(200,USER,29,"I")
 D NEWCVOK(.NEWP,USER)
 I 'NEWP D GETLST^XPAR(.RESULT,"USR.`"_USER_"^LOC.`"_$G(LOC)_"^SRV.`"_+$G(SRV)_"^DIV^SYS^PKG","ORQQPX SEARCH ITEMS","Q",.ORERR) Q
 D REMACCUM(.LST,"PKG","Q",1000)
 D REMACCUM(.LST,"SYS","Q",2000)
 D REMACCUM(.LST,"DIV","Q",3000)
 I +SRV D REMACCUM(.LST,"SRV.`"_+$G(SRV),"Q",4000)
 I +LOC D REMACCUM(.LST,"LOC.`"_+$G(LOC),"Q",5000)
 D REMACCUM(.LST,"CLASS","Q",6000)
 D REMACCUM(.LST,"USR.`"_USER,"Q",7000)
 S I=0
 F  S I=$O(LST(I)) Q:'I  D
 .S IDX=$P(LST(I),U,1)
 .F  Q:'$D(RESULT(IDX))  S IDX=IDX+1
 .S CODE=$E($P(LST(I),U,2),2)
 .S IEN=$E($P(LST(I),U,2),3,999)
 .I CODE="R" D ADDREM(.RESULT,IDX,IEN)
 .I CODE="C" D ADDCAT(.RESULT,IDX,IEN)
 K RESULT("B")
 Q
 ;
LVREMLST(RESULT,LVL,CLASS) ;Returns cover sheet reminders at a specified level
 D REMACCUM(.RESULT,LVL,"Q","",$G(CLASS))
 Q
 ;
GETLVRD(RESULT,LVL,CLASS) ;
 N CAT,CINC,DIEN,IEN,INC,REMLIST,RIEN,REM,TEMP
 D LVREMLST(.REMLIST,LVL,$G(CLASS))
 S INC=0 F  S INC=$O(REMLIST(INC)) Q:INC'>0  D
 . S TEMP=$P($G(REMLIST(INC)),U,2) I TEMP="" Q
 . I $E(TEMP)="R" Q
 . I $E(TEMP,2)="C" D
 .. S CAT=$E(TEMP,3,$L(TEMP))
 .. D CATREM^PXRMAPI0(CAT,.REM)
 .. S CINC=0 F  S CINC=$O(REM(CINC)) Q:CINC'>0  D
 ... S IEN=$G(REM(CINC)) Q:IEN'>0
 ... S DIEN=+$G(^PXD(811.9,IEN,51)) Q:DIEN'>0
 ... S RESULT("REMINDER",DIEN)=""
 . S IEN=$E(TEMP,3,$L(TEMP))
 . S DIEN=+$G(^PXD(811.9,IEN,51)) Q:DIEN'>0
 . S RESULT("REMINDER",DIEN)=""
 Q
 ;
GETDLIST(RESULT,USER,LOC) ;
 ;get coversheet reminders list.
 N IEN,NODE,NUM,REMLIST
 D GETLIST(.REMLIST,USER,$G(LOC))
 S NUM=0 F  S NUM=$O(REMLIST(NUM)) Q:NUM'>0  D
 .S IEN=+$G(REMLIST(NUM)) I IEN'>0 Q
 .I +$G(^PXD(811.9,IEN,51))>0 S RESULT("REMINDER",+$G(^PXD(811.9,IEN,51)))=""
 Q
 ;
GETTDLST(RESULT) ;
 ;get coversheet reminders list.
 N IEN,NODE,NUM,REMLIST
 S IEN=0 F  S IEN=$O(^TIU(8927,IEN)) Q:IEN'>0  D
 .S NODE=$G(^TIU(8927,IEN,0))
 .I $P(NODE,U,15)>0  S RESULT("TEMPLATE",$P(NODE,U,15))=""
 Q
GETLIST(RESULT,USER,LOC) ;Returns a list of all cover sheet reminders
 N I
 D REMLIST(.RESULT,USER,$G(LOC))
 S I=0
 F  S I=$O(RESULT(I)) Q:'I  D
 .S RESULT(I)=$P(RESULT(I),U,2)
 Q
 ;
EVALCOVR(RESULT,PT,LOC) ; Evaluate Cover Sheet Reminders
 N ORTMP
 D GETLIST(.ORTMP,$G(LOC))
 D ALIST^ORQQPXRM(.RESULT,PT,.ORTMP)
 Q
