GMVSR0 ;HOIFO/RM,YH,FT-VITAL SIGNS RECORD SF 511 ;6/6/07
 ;;5.0;GEN. MED. REC. - VITALS;**23**;Oct 31, 2002;Build 25
 ;
 ; This routine uses the following IAs:
 ; #10039 - FILE 42 references     (supported)
 ; #10061 - ^VADPT calls           (supported)
 ; #10103 - ^XLFDT calls           (supported)
 ; #10104 - ^XLFSTR calls          (supported)
 ;
EN1(RESULT,GMVDATA) ; GMV PT GRAPH [RPC entry point]
 ; Queues a graphic report to a printer
 ; GMVDATA=DFN^START DT^END DT^TYPE OF GRAPH^DEVICE^DEVICE IEN(#3.5)^
 ;         DATE/TIME TO PRINT REPORT^WARD IEN^LOCATION IEN^ROOM LIST
 ;
 ; DFN      - patient internal entry number
 ; GMRSTRT  - start date/time of report range (FileMan format)
 ; GMRFIN   - end date/time of report range (FileMan format)
 ; GRAPH    - number of the graph (1-5)
 ; GMVDEV   - device name
 ; GMVIEN   - device internal entry number
 ; GMVPDT   - date/time to print the report
 ; GMVWARD  - ward internal entry number
 ; GMVHLOC  - hospital location internal entry number
 ; GMVRMLST - list of rooms separated by a comma (e.g., 210,220,230) 
 ;
 S RESULT="This report is no longer available. Please right click on the data grid and use 'Print Graph' instead."
 Q
 N DFN,G,GMROUT,GFLAG,GRAPH,GMRSTRT,GMRFIN,GMVPDT,GMVDEV,GMVIEN,GMREDB
 N GMRLEN,GMVHLOC,GMRWARD,GMVRMLST,GSTRFIN,GMVDEVUC
 S DFN=+$P(GMVDATA,"^"),GMRSTRT=$P(GMVDATA,"^",2),GMRFIN=$P(GMVDATA,"^",3),GRAPH=$P(GMVDATA,"^",4),GMVDEV=$P(GMVDATA,"^",5),GMVIEN=+$P(GMVDATA,"^",6),GMVPDT=$P(GMVDATA,"^",7)
 S GMRWARD=$P(GMVDATA,"^",8),GMVHLOC=$P(GMVDATA,"^",9),GMVRMLST=$P(GMVDATA,"^",10)
 S (GMROUT,GFLAG)=0
 S ZTIO=GMVDEV ;device
 S ZTDTH=$S($G(GMVPDT)>0:GMVPDT,1:$$NOW^XLFDT()) ;date/time to print
 D:GRAPH<6 DATELN^GMVSR0
 S GMREDB=$S(DFN>0:"P",GMVRMLST'="":"S",1:"A")
 S GMRWARD(1)=$S(GMRWARD>0:$P($G(^DIC(42,GMRWARD,0)),U,1),1:"") ;ward name
 I $G(GMREDB)="P" D
 .D DEM^VADPT S GMRNAM=$P(VADM(1),"^"),SSN=$E($P(VADM(2),"^",2),8,11)
 .D INP^VADPT ;get inpatient data
 .S GMRWARD(1)=$P(VAIN(4),U,2),GMRWARD=$P(VAIN(4),U) ;inpatient location
 .S GMRRMBD=$S(VAIN(5)'="":VAIN(5),1:"  BLANK") ;roombed
 .D KVAR^VADPT K VA
 .Q
DEV ;
 S GMVDEVUC=$$UP^XLFSTR(GMVDEV) ;device name in uppercase
 I GRAPH=5,GMVDEVUC'["KYOCERA",GMVDEVUC'["HPLASER",GMVDEVUC'["HP LASER" D  Q
 .S RESULT="Sorry, you must select a Kyocera or HP Laser printer for the Pain Chart."
 .Q
 S ZTRTN=$S(GMREDB="P":"EN2^GMVSR0",1:"EN3^GMVSR0")
 S ZTDESC="V/M GRAPHIC REPORTS"
 F G="GRAPH","GMROUT","DFN","GMREDB","GMRNAM","SSN","GMRWARD","GMRSTRT","GMRFIN","GMRWARD(","GFLAG","GSTRFIN","GMREDB","GMVRMLST" S ZTSAVE(G)=""
 D ^%ZTLOAD
 S RESULT=$S($G(ZTSK)>0:"Report sent to device. Task #: "_ZTSK,1:"Unable to task the report.")
 K ZTSK,ZTIO,ZTRTN,ZTDESC,ZTSAVE,ZTDTH
 Q
EN2 ; Start the graphic report
 ; Note: Graphic reports must go to a printer
 S:$D(ZTQUEUED) ZTREQ="@"
 N GAPICAL,GRADIAL,GBRACHI
 S GAPICAL=$O(^GMRD(120.52,"B","APICAL",0)),GRADIAL=$O(^GMRD(120.52,"B","RADIAL",0)),GBRACHI=$O(^GMRD(120.52,"B","BRACHIAL",0))
 I IOST["KYOCERA"!(IOST["Kyocera") S GROUTN=$S(GRAPH=1:"EN1^GMVGR0",GRAPH=2:"EN1^GMVBP0",GRAPH=3:"EN1^GMVWT0",GRAPH=4:"EN1^GMVKPO0",GRAPH=5:"^GMVKPN0",1:"") D:GROUTN'="" @GROUTN G:"Pp"[GMREDB Q1 Q
 I $$UP^XLFSTR(IOST)["HPLASER" S GROUTN=$S(GRAPH=1:"EN1^GMVHG0",GRAPH=2:"EN1^GMVHB0",GRAPH=3:"EN1^GMVHW0",GRAPH=4:"EN1^GMVHPO0",GRAPH=5:"EN1^GMVHPN0",1:"") D:GROUTN'="" @GROUTN G:"Pp"[GMREDB Q1 Q
 I GRAPH=2 D ^GMVLBP0 G:"Pp"[GMREDB Q1 Q
 I GRAPH=3 D ^GMVLWT0 G:"Pp"[GMREDB Q1 Q
 I GRAPH=4 D ^GMVLPO0 G:"Pp"[GMREDB Q1 Q
 I GRAPH=5 S:'$G(GMRPERR) GMRPERR=1 G:"Pp"[GMREDB Q1 Q
 S GMRS=GMRSTRT-.0001,GMRQ=GMRFIN
 F GMRTY="B","P","R","T","H","W","PO2","CVP","CG","PN" D SETT^GMVSR1
 U IO D SF511^GMVSR1
Q1 ;
 K J,G,GMR,GMR3,GMRDAT,GMRDT,GMREN,GMRHDR1,GMRHDR10,GMRHDR11,GMRHDR2,GMRHT,GMRI,GMRJ,GMRK,GMRLINE,GMRMSL,GMRNM,GMROLD,GMRP,GMRPDIF,GMRT,GMRX,GMRTY,GMRPG,GMRPGC,GMRPGS,GMRPHI,GMRPLO,GMRTDIF,GMRTHI,GMRTLO,GMRTNM,GMRX1,GMRX2
 D KVAR^VADPT K VA,%T
 K GVAR,GMRDIV,GMRHT,GMRQUAL,GMRS,GMRQ,GMRPOFF,GMRTOFF,GMRVWLOC,GMRVX,DIK,%ZIS,%DT,DIPGM,GMRLEN,GMRRMST,GMRVHLOC,GDA,GMRINF,GLINE,GMRVARY,GMRPERR,GMRVPS,GMVROOM,GMVWARD,GMVLOOP
 W:$E(IOST)="P"!$D(IO("S"))&($$UP^XLFSTR(IOST)'["HPLASER") !
 Q:'("Pp"[GMREDB)
Q2 ;
 K ^TMP($J),GMRII,GMRQUAL,GMREDB,GMROUT,GMRROOM,GMRSTRT,GMRFIN,GMRNAM,GMRRMBD,GMRSITE,GMRVHLOC,GMRWARD,POP,SSN,DFN,ZTIO,ZTSK,GDT,GDTA,GFOUND,GMRAGE,GMRBED,GMRBTH,GMRCOL,GMRHLOC,GMROP,GMRSEX,GMRVADM,GRPT,GSUB,GTYPE1
 K GSTRFIN,GMRVFLAG,SNN,GMVRMBD,GMVWRD,GRAPH,GROUTN,GIVDT,GSTAR,GSOL,GN,GNDATE,GNSHFT,GFLAG,X,Y
 D ^%ZISC
 Q
EN3 ; Entry to print report for all or selected group of patients,
 ; for ward stored in GMRWARD
 S GMRPERR=0
 S GMVWARD=GMRWARD ;ward ien
 S GMVWARD(1)=GMRWARD(1) ;ward name
 S GMVEDB=GMREDB ;A - all patients, S - selected rooms, P - 1 patient
 ; if selected roombeds, then set up GMVROOM array
 I $L(GMVRMLST)>0 D
 .F GMVLOOP=1:1 Q:$P(GMVRMLST,",",GMVLOOP)=""  D
 ..S GMVROOM($P(GMVRMLST,",",GMVLOOP))=""
 ..Q
 .Q
 D WARD^GMVDS1 ;creates TMP global w/patients in ward or rooms 
 S GMRROOM=""
 F GMRII=0:0 S GMRROOM=$O(^TMP($J,GMRROOM)) Q:GMRROOM=""  S GMRNAM="" F GMRII=0:0 S GMRNAM=$O(^TMP($J,GMRROOM,GMRNAM)) Q:GMRNAM=""  F DFN=0:0 S DFN=$O(^TMP($J,GMRROOM,GMRNAM,DFN)) Q:DFN'>0  D:DFN>0 PRT
 D Q1
 G Q2
 ;
PRT ;
 D DEM^VADPT
 S SSN=$P(VADM(2),"^",2) Q:$G(GMRPERR)&('$D(IO("Q")))
 D EN2
 Q
 ;
DATELN ;
 S Y=GMRSTRT
 X ^DD("DD")
 S GSTRFIN=Y
 S Y=GMRFIN
 X ^DD("DD")
 S GSTRFIN=GSTRFIN_" - "_Y
 Q
