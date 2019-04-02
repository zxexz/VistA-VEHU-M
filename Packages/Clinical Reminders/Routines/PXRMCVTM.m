PXRMCVTM ;SLC/AGP - CPRS Coversheet timer test. ;02/21/2019
 ;;2.0;CLINICAL REMINDERS;**42**;Feb 04, 2005;Build 132
 ;
 ;===============
EN ;Prompt for patient and reminder by name input component.
 N BOP,CLOCKE,CLOCKS,CNT,CPUTMAX,DFN,DIC,DIROUT,DIRUT,DTOUT,DUOUT
 N IDX,IENMAXC,IENMAXW,LOC,MSEC,NL,OUTPUT
 N REMIEN,REMS,TOTTM,USER,WCDIFF,WCMAX,X,Y
 S DIC=2,DIC("A")="Select Patient: "
 S DIC(0)="AEQMZ"
GPAT D ^DIC
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 S DFN=+$P(Y,U)
 I DFN=-1 G GPAT
 ;
GUSER ;
 K Y
 S DIC=200,DIC("A")="Select User: "
 S DIC(0)="AEQMZ"
 D ^DIC
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 S USER=+$P(Y,U)
 I USER=-1 G GUSER
 ;
GLOC ;
 K Y
 S DIC=44,DIC("A")="Select Location "
 S DIC(0)="AEQMZ"
 D ^DIC
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 S LOC=+$P(Y,U)
 I LOC=-1 G GLOC
 ;
GCVL ;
 S CLOCKS=$H
 D REMLIST^PXRMCVRL(.REMS,USER,LOC)
 S CLOCKE=$H
 S NL=1,OUTPUT(NL)="Total time to build reminder list: "_$$HDIFF^XLFDT(CLOCKE,CLOCKS,2)_" seconds"
 S (CNT,CPUTMAX,TOTTM,WCMAX)=0,IDX=""
 S IDX=$O(REMS(""))
 S (IENMAXC,IENMAXW)=$P(REMS(IDX),U,2)
 S CLOCKS=$H
 S CNT=0,IDX=""
 F  S IDX=$O(REMS(IDX)) Q:IDX=""  D
 .S REMIEN=$P(REMS(IDX),U,2)
 .D DOREM(DFN,REMIEN,0,DT,.NL,.OUTPUT,.MSEC,.WCDIFF)
 .I MSEC>CPUTMAX S CPUTMAX=MSEC,IENMAXC=REMIEN
 .S TOTTM=TOTTM+MSEC
 .I WCDIFF>WCMAX S WCMAX=WCDIFF,IENMAXW=REMIEN
 .S CNT=CNT+1
 S CLOCKE=$H
 S NL=NL+1,OUTPUT(NL)=""
 S NL=NL+1,OUTPUT(NL)="Total number of reminders evaluated: "_CNT
 S NL=NL+1,OUTPUT(NL)=""
 S NL=NL+1,OUTPUT(NL)="Elapsed wall clock time: "_$$HDIFF^XLFDT(CLOCKE,CLOCKS,2)_" seconds"
 S NL=NL+1,OUTPUT(NL)="Total CPU coversheet evaluation time: "_TOTTM_" milliseconds"
 S NL=NL+1,OUTPUT(NL)=""
 S NL=NL+1,OUTPUT(NL)="Longest CPU evaluation time"
 S NL=NL+1,OUTPUT(NL)="Reminder: "_$P(^PXD(811.9,IENMAXC,0),U)_" (IEN="_IENMAXC_")"
 S NL=NL+1,OUTPUT(NL)="Reminder CPU evaluation time: "_CPUTMAX_" milliseconds"
 S NL=NL+1,OUTPUT(NL)=""
 S NL=NL+1,OUTPUT(NL)="Longest wall clock evaluation time"
 S NL=NL+1,OUTPUT(NL)="Reminder: "_$P(^PXD(811.9,IENMAXW,0),U)_" (IEN="_IENMAXW_")"
 S NL=NL+1,OUTPUT(NL)="Reminder wall clock evaluation time: "_WCMAX_" seconds"
 S NL=NL+1,OUTPUT(NL)=""
 S BOP=$$BORP^PXRMUTIL("B")
 I BOP="B" D
 . S X="IORESET"
 . D ENDR^%ZISS
 . D BROWSE^DDBR("OUTPUT","NR","CPRS Coversheet Timing Test")
 . W IORESET
 . D KILL^%ZISS
 I BOP="P" D GPRINT^PXRMUTIL("OUTPUT")
 Q
 ;
DOREM(DFN,PXRMITEM,PXRHM,DATE,NL,OUTPUT,MSEC,WCDIFF) ;Do the reminder
 ;Reference to XLFSHAN ICR #6157
 N DEFARR,END,ETIME,FIEVAL,START,WEND,WSTART
 ;This is a debugging run so set PXRMDEBG.
 S START=$$CPUTIME^XLFSHAN
 S WSTART=$H
 D DEF^PXRMLDR(PXRMITEM,.DEFARR)
 I +$G(DATE)=0 D EVAL^PXRM(DFN,.DEFARR,PXRHM,1,.FIEVAL)
 I +$G(DATE)>0 D EVAL^PXRM(DFN,.DEFARR,PXRHM,1,.FIEVAL,DATE)
 S END=$$CPUTIME^XLFSHAN
 S WEND=$H
 ;
 S WCDIFF=$$HDIFF^XLFDT(WEND,WSTART,2)
 S ETIME=$$ETIMEMS^XLFSHAN(START,END)
 S MSEC=+ETIME
 S NL=NL+1,OUTPUT(NL)=""
 S NL=NL+1,OUTPUT(NL)="Reminder: "_$P(^PXD(811.9,PXRMITEM,0),U)_" (IEN="_PXRMITEM_")"
 S NL=NL+1,OUTPUT(NL)="Reminder CPU evaluation time: "_ETIME
 S NL=NL+1,OUTPUT(NL)="Reminder wall clock evaluation time: "_WCDIFF_" seconds"
 Q
 ;