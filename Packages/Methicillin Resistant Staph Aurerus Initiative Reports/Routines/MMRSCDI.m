MMRSCDI ;LEIDOS/TCK - Print CDI report ; 4/10/17 2:08pm
 ;;1.0;MRSA TOOLS REPORTS MENU;**4,5**;Mar 22, 2009;Build 146
 ;
MAIN ;
 N EXTFLG,MMRSDIV,MMRSLOC
 ;check if parameters are setup.
 D CLEAN
 D CHECK^MMRSIPC Q:$D(EXTFLG)
 S NUMDIV=1
 D CHECK Q:$D(EXTFLG)
 D PROMPT
 I $D(EXTFLG) D CLEAN K MMRSSUM,DIVARY,DVSN,MDIV Q
 Q:'CHK
 K EXTFLG
 Q:'CHK
 D ASKDVC Q:$D(EXTFLG)
 S MMRSNOW=$$NOW^XLFDT()
 D CLEAN
 D END^MMRSCDI1
 D QUIT
 Q
 ;
PROMPT ;Prompt for division
 N STID,STNM,SIEN
 S (STP,ALL)=0
 I $G(MDROETIO)'>0 S MDROETIO=""
 S MMRSMDRO="",MMRSMDRO=$O(^MMRS(104.2,"B","C. diff",0))
 W !
 S DIR(0)="YA",DIR("A")="Do you want to select all divisions: ",DIR("B")="NO"
 D ^DIR K DIR
 I $D(DIRUT) S EXTFLG=1 Q
 I Y=1 S ALL=1 D  Q:'CHK
 .S CHK=1
 .S DIV=0 F  S DIV=$O(^MMRS(104,DIV)) Q:DIV'>0  D  Q:STP!('CHK)
 ..S WR=$$GET1^DIQ(104,+DIV,.01,"I")
 ..S IEN="",IEN=$O(^MMRS(104.1,"C",+DIV,MMRSMDRO,IEN))
 ..Q:$G(IEN)'>0
 ..S ORGP=$$GET1^DIQ(104.1,IEN,.01,"I")
 ..D CHKPAR(ORGP,+DIV,.CHK)
 ..I 'CHK S (MDROETIO,TSTSTP)=0 D ERROR  Q
 ..S FID=$$GET1^DIQ(40.8,WR,1,"E"),STID=$$GET1^DIQ(40.8,WR,.01,"E")
 ..S MMRSLOC(FID)=STID,DIVARY(STID)=+DIV
 ..I $G(NUMDIV)'>0 S STP=1 Q
 ..;I $G(SPCM)'>0 S STP=1 Q
 Q:STP
 I 'Y D  Q:'CHK
 .N DLAYGO,DTOUT,DUOUT
 .S CHK=1
 .W !
 .S DIC("A")="Select Division: "
 .S DIC="^MMRS(104,",DIC(0)="QEAM" D ^DIC
 .I (Y=-1)!($D(DTOUT))!($D(DUOUT)) S EXTFLG=1 Q
 .S IEN="",IEN=$O(^MMRS(104.1,"C",+Y,MMRSMDRO,IEN))
 .Q:$G(IEN)'>0
 .S ORGP=$$GET1^DIQ(104.1,IEN,.01,"I")
 .D CHKPAR(ORGP,+Y,.CHK)
 .I 'CHK S (MDROETIO,TSTSTP)=0 D ERROR  Q
 .S STID=$$GET1^DIQ(104,+Y,.01,"E"),FID=$$GET1^DIQ(104,+Y,1,"E")
 .S MMRSLOC(FID)=STID,DIVARY(STID)=+Y
 .S CHK=1
 .S Y=""
 .S DIC("A")="Select another Division: " F  D ^DIC Q:Y=-1  D  Q:'CHK
 ..S IEN="",IEN=$O(^MMRS(104.1,"C",+Y,MMRSMDRO,IEN))
 ..Q:$G(IEN)'>0
 ..S ORGP=$$GET1^DIQ(104.1,IEN,.01,"I")
 ..D CHKPAR(ORGP,Y,.CHK)
 ..I 'CHK S (MDROETIO,TSTSTP)=0 D ERROR  Q
 ..S STID=$$GET1^DIQ(104,+Y,.01,"E")
 ..S FID=$$GET1^DIQ(104,+Y,1,"E"),MMRSLOC(FID)=STID,DIVARY(STID)=+Y
 ..I $G(NUMDIV)'>0 S STP=1 Q
 .I ($D(DTOUT))!($D(DUOUT)) S EXTFLG=1 Q
 K DIC
 Q:$G(NUMDIV)'>0
 ;Q:$G(SPCM)'>0
 Q:$D(EXTFLG)
 I ($D(DTOUT))!($D(DUOUT)) S EXTFLG=1 Q
DATE ;
 N DATE,%DT
 S DATE=$$FMADD^XLFDT(DT,-364),%DT("B")=$$FMTE^XLFDT(DATE,"L")
 W ! S %DT="AEPX",%DT("A")="Beginning POS CDI Lab ID Event (Collection) Date: " D ^%DT
 I Y<0 S EXTFLG=1 Q
 S STRTDT=Y
 I STRTDT<DATE W !!,"The start date of the range cannot be greater than one year from today." G DATE
 S DFLTDT=$$FMADD^XLFDT(STRTDT,-56)
DATE1 ;
 S %DT("A")="Ending POS CDI Lab ID Event (Collection) Date: " K %DT("B") D ^%DT
 I Y<0 S EXTFLG=1 Q
 S ENDDT=Y
 I '$P(ENDDT,".",2) S ENDDT=Y+.24
 I ENDDT<STRTDT W !!,"The end date of the range must be later than the starting date." G DATE1
 Q
 ;
CHKPAR(ORG,Y,CHK) ;
 ;
 N I,TST,ETI
 S (TSTSTP,MDROETIO)=0
 I '$D(^MMRS(104.1,"C",+Y,ORG)) S CHK=0 Q
 S I="",I=$O(^MMRS(104.1,"C",+Y,ORG,I))
 S LIEN=1_","_I_","
 S TST=$$GET1^DIQ(104.15,LIEN,.01,"I")
 I $G(TST)>0 S TSTSTP=1 Q
 S ETI=$$GET1^DIQ(104.109,LIEN,.01,"I")
 I $G(ETI)>0 S MDROETIO=1 Q
 S CHK=0
 Q
 ;
CHECK ; Check if lab tests and etiologies are setup
 N II,XX,TST,MRSASTAP,ORG,ETIONAME,MMRSET,MMRSI
 S (MDROETIO,TSTSTP)=0
 I $D(^MMRS(104.1)) D
 .S II=0 F  S II=$O(^MMRS(104.1,II)) Q:II'>0  D  Q:MDROETIO!(TSTSTP)
 ..Q:'$D(^MMRS(104.1,II,0))
 ..S ORGP=$P(^MMRS(104.1,II,0),"^")
 ..Q:$G(ORGP)'>0
 ..S ETIO=$$GET1^DIQ(104.2,ORGP,.01,"E")
 ..S ETIO=$$UPPER^DGUTL(ETIO)
 ..Q:ETIO'["DIFF"
 ..S IX=0
 ..F  S IX=$O(^MMRS(104.1,II,3,IX)) Q:IX'>0  D  Q:TSTSTP
 ...I $G(IX)>0 D
 ....Q:'$D(^MMRS(104.1,II,3,IX,0))
 ....S III=IX_","_II_","
 ....Q:III=""
 ....S TST=$$GET1^DIQ(104.15,III,.01,"E")
 ....;I $G(TST)'=""&(TST["DIFF") S TSTSTP=1
 ....I $G(TST)'="" S TSTSTP=1
 ....;Q:$G(TST)'["DIFF"
 ....;S TSTSTP=1
 ...I $D(^MMRS(104.1,II,6)) D
 ....S IXI=0 F  S IXI=$O(^MMRS(104.1,II,6,IXI)) Q:IXI'>0  D  Q:MDROETIO
 .....Q:IXI=""
 .....Q:'IXI
 .....S III=IXI_","_II_","
 .....S XX=$$GET1^DIQ(104.109,III,.01,"E")
 .....Q:XX'["CLOSTRIDIUM"
 .....S ETIONAME=XX,ORG=II,MDROETIO=ORG
 Q
 ;
ERROR ;
 I 'TSTSTP&'MDROETIO D
 .S EXTFLG=1
 .W !!,"   >>>The report cannot be run because the Laboratory Test(s) or"
 .W !,"       the Etiology is not configured in the MDRO TOOLS LAB "
 .W !,"       SEARCH/EXTRACT file, (104.1).  Use the MDRO Tools "
 .W !,"       Lab Parameter Setup option to configure."
 Q
 ;
MAIN2 ;
 S MMRSNOW=$$NOW^XLFDT()
 D GETPARAM ; Load parameters in temp global
 D PRT
 Q
CLEAN ;
 K ^TMP($J,"MMRSCDI")
 K ^TMP($J,"MMRS")
 K ^TMP($J,"MMRSCD"),DIVARY,DVSN
 Q
 ;
GETPARAM ; Loads lab search/extract parameters from file 104.1
 N TSTNM,TST,TEST,IEN,TIEN,ITOP,TOP,ETOP,IBACT,BACT,EBACT
 N ETIOL,ETIOLOGY,ANTI,ANTIM,INC,MRSASTAP,ETIONAME,MMRSI,MMRSET,ORG
 N MDRO
 Q:'$D(DIVARY)
 S (TSTSTP,MMRSETIO,MMRSDIV)=0,DIVSN=""
 S MMRSMDRO=$O(^MMRS(104.2,"B","C. diff",0))
 F  S DIVSN=$O(DIVARY(DIVSN)) Q:DIVSN=""  D
 .K ^TMP($J,"MMRSCD")
 .S Y=DIVARY(DIVSN)
 .S IEN="",IEN=$O(^MMRS(104.1,"C",Y,MMRSMDRO,IEN))
 .Q:$G(IEN)'>0
 .S (FND,TST,INC)=0
 .;I $G(TSTSTP)'>0 S TSTSTP=1
 .;I TSTSTP D
 .S MDRO=MMRSMDRO
 .S TIEN=0 F  S TIEN=$O(^MMRS(104.1,IEN,3,TIEN)) Q:'TIEN  D
 ..S TEST=$P($G(^MMRS(104.1,IEN,3,TIEN,0)),U,1)
 ..Q:'TEST
 ..S INC=INC+1
 ..S TSTSTP=1
 ..S ^TMP($J,"MMRSCD","T",MDRO,TEST,0)=$P($G(^MMRS(104.1,IEN,3,TIEN,0)),U,2,3)
 .S IBACT=0 F  S IBACT=$O(^MMRS(104.1,IEN,4,IBACT)) Q:'IBACT  D
 ..S BACT=$G(^MMRS(104.1,IEN,4,IBACT,0))
 ..I BACT'="" S ^TMP($J,"MMRSCD","BACT",MDRO,"INC_REMARK",IBACT)=BACT
 .S EBACT=0 F  S EBACT=$O(^MMRS(104.1,IEN,5,EBACT)) Q:'EBACT  D
 ..S BACT=$G(^MMRS(104.1,MMRSMDRO,5,EBACT,0))
 ..I BACT'="" S ^TMP($J,"MMRSCD","BACT",MDRO,"EXC_REMARK",EBACT)=BACT
 .S ETIOL=0 F  S ETIOL=$O(^MMRS(104.1,IEN,6,ETIOL)) Q:'ETIOL  D
 ..S ETIOLOGY=$G(^MMRS(104.1,IEN,6,ETIOL,0))
 ..Q:'ETIOLOGY
 ..S ^TMP($J,"MMRSCD","ETIOL",MDRO,+ETIOLOGY)=""
 ..S ANTI=0 F  S ANTI=$O(^MMRS(104.1,IEN,6,ETIOL,1,ANTI)) Q:'ANTI  D
 ...S ANTIM=$P($G(^MMRS(104.1,IEN,6,ETIOL,1,ANTI,0)),U)
 ...I ANTIM S ^TMP($J,"MMRSCD","ETIOL",MDRO,ETIOLOGY,ANTI)=$G(^MMRS(104.1,IEN,6,ETIOL,1,ANTI,0))
 ..I $G(ETIOLOGY)'="" D
 ...D FIND^DIC(61.2,,".01E;@","PM","CLOSTRIDIUM DIFFICILE",,"B",,,"MMRSET")
 .S MMRSI="" F  S MMRSI=$O(MMRSET("DILIST",MMRSI)) Q:MMRSI=""  I +MMRSI>0  D
 ..S ETIONAME=$P($G(MMRSET("DILIST",MMRSI,0)),U,2)
 ..S ORG=$P($G(MMRSET("DILIST",MMRSI,0)),U,1)
 ..I ETIONAME'["CLOSTRIDIUM DIFFICILE" Q
 ..K ^TMP($J,"MMRSCD","ETIOL",MMRSMDRO,ORG)
 ..S ^TMP($J,"MMRSCD","ETIOL",MMRSMDRO,ORG)="",MDROETIO=1
 .K MMRSET
 .D SETDATA
 Q
 ;
SETDATA ;
 N LOCATION,LOCNAME,DFN,LOCTYPE,MMRSI,SDRESULT,Y,WLOC,WARD,WARDNAME,VAIP,WRDNME
 S DFN=0 F  S DFN=$O(^DPT(DFN)) Q:'DFN  D
 .Q:'$D(^PXRMINDX(63,"PI",DFN))
 .Q:$G(DFN)'>0
 .D SETDATA2(DFN)
 Q
 ;
SETDATA2(DFN) ;
 N INTT,IEN,INDATE,INIFN,MRSA,MRSACULT,LABORDER,TSTNM,LABTEST,ORDITM,ORDTEMP,PATNM,VADM,DCDATE
 S LOC=""
 S (CDIVT,PCD)=""
 ;Get MRSA history
 D GETLAB^MMRSCDI1(DFN,.MRSA,MMRSMDRO,MMRSNOW,"CD")
 Q:'$D(MRSA)
 S I="" F  S I=$O(MRSA(I)) Q:I=""  D
 .Q:I=""
 .S CDIVT=I
 .S MRSA=$P(MRSA(I),"^",1,2)
 .S LOC=+$P(MRSA(I),"^",3)
 .S DVSN=$$GET1^DIQ(44,+LOC,3.5,"E")
 .Q:DVSN'=DIVSN
 .Q:'$D(DIVARY(DVSN))
 .S WARDNAME=$$GET1^DIQ(44,+LOC,.01,"E")
 .;Get Order info
 .S LABORDER="^^"
 .Q:'CDIVT
 .S MRSA=$P(MRSA(I),"^",2)
 .S LRFILE=44
 .S STPCD=$$GET1^DIQ(LRFILE,+LOC,8,"I")
 .S TYPE=$$GET1^DIQ(LRFILE,+LOC,2,"E")
 .S SERV=$$GET1^DIQ(LRFILE,+LOC,9,"E")
 .D GTDATE(DFN,CDIVT,.INDATE,.DCDATE)
 .I $G(TYPE)'="",TYPE'="WARD" S (INDATE,DCDATE)=""
 .I $D(^TMP($J,"MMRSCD","T")) D
 ..S MDRO="" F  S MDRO=$O(^TMP($J,"MMRSCD","T",MDRO)) Q:MDRO=""  D
 ...Q:$G(MDRO)'>0
 ...S TST="" F  S TST=$O(^TMP($J,"MMRSCD","T",MDRO,TST)) Q:TST=""  D
 ....N TESTS D GORDITM(TST,.LABORDER,.TESTS) ;MIA/LMT - Added with patch MMRS*1*1
 .S PCD="",PATNM=$$GET1^DIQ(2,DFN,.01,"E")
 .Q:$D(^TMP($J,"MMRSCDI",DVSN,WARDNAME,PATNM,DFN,CDIVT))
 .I $D(^TMP($J,"MMRSCDI",DVSN,WARDNAME,PATNM,DFN)) D
 ..S PCD=999999999999999
 ..S PCD=$O(^TMP($J,"MMRSCDI",DVSN,WARDNAME,PATNM,DFN,PCD),-1)
 .S CD=CDIVT,CD=$O(MRSA(CD),-1)
 .I $G(CD)>0,CD<CDIVT S PCD=CD
 .Q:CDIVT<STRTDT
 .S ^TMP($J,"MMRSCDI",DVSN,WARDNAME,PATNM,DFN,CDIVT)=$G(TYPE)_U_$G(SERV)_U_$G(STPCD)_U_$G(CDIVT)_U_$G(INDATE)_U_$G(DCDATE)_U_$G(MRSA)_U_$G(PCD),PCD=""
 K MRSA
 Q
 ;
GTDATE(DFN,CDIVT,IND,DCDT) ;
 N DATE,IEN
 S (IND,DCDT)="",FND=0
 Q:$G(CDIVT)=""
 Q:'$D(^DGPM("APTT1",DFN))
 S DATE=9999999999,TT=1
 F  S DATE=$O(^DGPM("APTT"_TT,DFN,DATE),-1) Q:DATE=""  D  Q:FND
 .Q:DATE=""
 .I CDIVT<DATE Q
 .S IEN="",IEN=$O(^DGPM("APTT"_TT,DFN,DATE,IEN))
 .Q:$G(IEN)'>0
 .I $G(IEN)>0 D
 ..S IND=$$GET1^DIQ(405,IEN,.01,"I")
 ..S WRD=$$GET1^DIQ(405,IEN,.06,"E")
 ..S LOCNME="",LOCNME=$$GET1^DIQ(44,LOC,.01,"E")
 .I WRD=LOCNME S FND=1
 .S NXDT=$O(^DGPM("APTT"_TT,DFN,DATE),-1)
 .I $G(NXDT)'>0 K NXDT S FND=1
 .I $G(NXDT)>0 S DATE=NXDT,NXDT=""
 .Q:$G(DATE)'>0
 .S IEN="",IEN=$O(^DGPM("APTT"_TT,DFN,DATE,IEN))
 .S TIEN=$$GET1^DIQ(405,IEN,.17,"I")
 .I $G(TIEN)'>0 Q
 .S DCDT=$$GET1^DIQ(405,TIEN,.01,"I")
 .I DCDT>CDIVT S FND=1,DCDT="" Q
 .I DCDT'="" S FND=1 Q
 Q
 ;
GORDITM(LABTEST,LABORDER,TESTS) ;MIA/LMT - Added with patch MMRS*1*1 - Include panels in search
 N ORDITM,ORDTEMP,LABPANEL
 I $D(TESTS(LABTEST)) Q  ;prevent infinite recursion; if site has Panel A within Panel B, and Panel B within Panel A
 S TESTS(LABTEST)=1 ;mark that we have searched this test (to prevent infinite recursion)
 S ORDITM=0 F  S ORDITM=$O(^ORD(101.43,"ID",LABTEST_";99LRT",ORDITM)) Q:'ORDITM  D
 .S ORDTEMP=$$GETORD(DFN,ORDITM,INDATE)
 .I $P(LABORDER,U,1)'="YES"!(($P(LABORDER,U,3)'="YES")&($P(ORDTEMP,U,3)="YES")) S LABORDER=ORDTEMP
 S LABPANEL=0 F  S LABPANEL=$O(^LAB(60,"AB",LABTEST,LABPANEL)) Q:'LABPANEL  D
 .D GORDITM(LABPANEL,.LABORDER,.TESTS) ;Recursive call to check for tests within panels
 Q
GETORD(DFN,ORDITM,INDATE) ;
 N RESULT,START,STOP,DAS,STATUS,ORUPCHUK,LABREC
 S RESULT="^^"
 S START=$$FMADD^XLFDT(INDATE,-1)-.0000001
 F  S START=$O(^PXRMINDX(100,"PI",DFN,ORDITM,START)) Q:'START  D
 .S STOP="" F  S STOP=$O(^PXRMINDX(100,"PI",DFN,ORDITM,START,STOP)) Q:STOP=""  D
 ..S DAS="" F  S DAS=$O(^PXRMINDX(100,"PI",DFN,ORDITM,START,STOP,DAS)) Q:DAS=""  D
 ...D EN^ORX8(+DAS)
 ...S STATUS=$P(ORUPCHUK("ORSTS"),U,1)
 ...I STATUS'=2,STATUS'=5,STATUS'=6 Q
 ...S LABREC="NO"
 ...I STATUS=6!(STATUS=2) S LABREC="YES"
 ...I $P(RESULT,U,3)'="YES" S RESULT="YES^"_START_U_LABREC
 Q RESULT
PRT ;
 N LN,PG,LOCNAME,PATNM,DFN,NODE,LAST4,INTT,ADT,ORDDATE,VADM,QUIT,COUNT,DOB,PRVCDI
 K ^TMP($J,"MMRSCDI","T")
 K ^TMP($J,"MMRSCDI","ETIOL")
 S $P(LN,"-",160)=""
 S PG=1,QUIT=0
 S DVS=""
 F  S DVS=$O(DIVARY(DVS)) Q:DVS=""  D
 .I '$D(^TMP($J,"MMRSCDI",DVS)) D  Q
 ..S WARDNAME=""
 ..D PRTHDRS
 ..W !!!,"NO RECORDS FOUND FOR REPORTING PERIOD."
 .S WARDNAME="" F  S WARDNAME=$O(^TMP($J,"MMRSCDI",DVS,WARDNAME)) Q:WARDNAME=""  D  Q:QUIT
 ..I WARDNAME="" S QUIT=1 Q
 ..Q:'$D(^TMP($J,"MMRSCDI",DVS,WARDNAME))
 ..D PRTHDRS
 ..S PATNM="" F  S PATNM=$O(^TMP($J,"MMRSCDI",DVS,WARDNAME,PATNM)) Q:PATNM=""  D
 ...I PATNM?.N K ^TMP($J,"MMRSCDI",DVS,WARDNAME,PATNM) Q
 ...S DFN=0 F  S DFN=$O(^TMP($J,"MMRSCDI",DVS,WARDNAME,PATNM,DFN)) Q:'DFN  D  Q:'DFN
 ....S CD=0 F  S CD=$O(^TMP($J,"MMRSCDI",DVS,WARDNAME,PATNM,DFN,CD)) Q:'CD  D
 .....S NODE=$G(^TMP($J,"MMRSCDI",DVS,WARDNAME,PATNM,DFN,CD))
 .....S TYPE=$P(NODE,"^")
 .....S SERV=$P(NODE,"^",2)
 .....S STPCD=$P(NODE,"^",3)
 .....S CDIVT=$P(NODE,"^",4) I $G(CDIVT)>0 D
 ......S CDIVT=$$FMTE^XLFDT(CDIVT,2)
 ......I CDIVT["@" S CDIVT=$TR(CDIVT,"@"," ")
 .....S INDATE=$P(NODE,"^",5) I $G(INDATE)>0 D
 ......S INDATE=$$FMTE^XLFDT(INDATE,2)
 ......I INDATE["@" S INDATE=$TR(INDATE,"@"," ")
 .....S DCDT=$P(NODE,U,6) I $G(DCDT)>0 D
 ......S DCDT=$$FMTE^XLFDT(DCDT,2)
 ......I DCDT["@" S DCDT=$TR(DCDT,"@"," ")
 .....S PRVCDI=$P(NODE,U,8) I $G(PRVCDI)>0 D
 ......S PRVCDI=$$FMTE^XLFDT(PRVCDI,2)
 ......I PRVCDI["@" S PRVCDI=$TR(PRVCDI,"@"," ")
 .....D KVA^VADPT
 .....D DEM^VADPT
 .....S LAST4=$E($P(VADM(2),U),6,9)
 .....D KVA^VADPT
 .....S ORDDATE=$P(NODE,"^",5)
 .....I ORDDATE S ORDDATE=$$FMTE^XLFDT(ORDDATE,"2M")
 .....S DOB=$$GET1^DIQ(2,DFN,.03,"E")
 .....W !,$E(PATNM,1,30),?25,LAST4,?30,DOB,?42,$G(CDIVT),?70,$G(INDATE),?90,$G(WARDNAME),?106,$G(DCDT),?130,$G(PRVCDI)
 .....S COUNT=$G(COUNT)+1
 .....S DL="^"
 .....S ^TMP($J,"MMRS",COUNT)=PATNM_DL_LAST4_DL_DOB_DL_$G(CDIVT)_DL_$G(INDATE)_DL_$G(WARDNAME)_DL_$G(TYPE)_DL_$G(SERV)_DL_$G(STPCD)_DL_$G(DCDT)_DL_$G(PRVCDI)
 ....S PRVCDI=""
 I '$D(ZTSK)&($G(ION)'["P-MESS") D
 .D PRINTCDI
 W !!,"END OF REPORT."
 Q
 ;
PRINTCDI ;
 W !!
 I '$D(^TMP($J,"MMRS")) W !!!,"No CDI cases found during specified date range" Q
 N DIR,DUOUT,DTOUT,DIRUT,Y
 S PRINT=0
 S DIR("A")="Print a delimited report to the screen? (Y/N): "
 S DIR(0)="YA" D ^DIR
 I $D(DIRUT)!($D(DUOUT)!$D(DTOUT)) S PRINT=0
 I Y>0 S PRINT=1
 S CDI=1
 Q:'PRINT
 W !!,"Delimited Report will now be printed to the screen..." H 3
 D ^%ZIS
 W @IOF
 N C,I,DL
 S (C,I)="",DL="^",CNT=0
 F  S C=$O(^TMP($J,"MMRS",C)) Q:C=""  D
 .S X1=$P(^TMP($J,"MMRS",C),DL)
 .S X2=$P(^TMP($J,"MMRS",C),DL,2)
 .S X3=$P(^TMP($J,"MMRS",C),DL,3)
 .S X4=$P(^TMP($J,"MMRS",C),DL,4)
 .S X5=$P(^TMP($J,"MMRS",C),DL,5)
 .S X6=$P(^TMP($J,"MMRS",C),DL,6)
 .S X7=$P(^TMP($J,"MMRS",C),DL,7)
 .S X8=$P(^TMP($J,"MMRS",C),DL,8)
 .S X9=$P(^TMP($J,"MMRS",C),DL,9)
 .S X10=""
 .S X11=$P(^TMP($J,"MMRS",C),DL,10)
 .S X12=$P(^TMP($J,"MMRS",C),DL,11)
 .W !,X1_DL_X2_DL_X3_DL_X4_DL_X5_DL_X6_DL_X7_DL_X8_DL_X9_DL_X10_DL_X11_DL_X12
 Q
 ;
PRTHDRS ; Helper Function for PRT - Prints report headers
 W @IOF
 W ?13,"FACILITY CDI CASES REPORT"
 W !,?13,"Division: ",DVS
 W !,?13,"Geographical Location: ",WARDNAME
 W !,?13,"Report period: ",$$FMTE^XLFDT(STRTDT)," to ",$$FMTE^XLFDT(ENDDT)
 W !,?13,"Report printed on: ",$$FMTE^XLFDT(MMRSNOW),?75,"PAGE: ",PG
 W !,"PATIENT",?25,"SSN",?30,"DOB",?42,"CDI Event D/T",?70,"ADM D/T",?90,"LOCATION",?105,"DC D/T",?130,"PREV CDI Event D/T"
 W !,LN
 S PG=PG+1
 Q
ASKDVC ;Prompts user for device of output (allows queuing)
 W !!
 N MMRSVAR
 W !!!,"This report is designed for a 132 column format (compressed).",!
 S MMRSVAR("MMRSLOC")="",MMRS("MMRSLOC(")="",MMRSVAR("MMRSDIV")="",MMRSVAR("STRTDT")=""
 S MMRSVAR("ENDDT")="",MMRSVAR("TSTSTP")="",MMRSVAR("MDROETIO")="",MMRSVAR("DFLTDT")="",MMRSVAR("DIVARY")="",MMRSVAR("DIVARY(")=""
 D EN^XUTMDEVQ("MAIN2^MMRSCDI","Print CDI report (MMRSCDI)",.MMRSVAR,"QM",1)
 W:$D(ZTSK) !,"Report Queued to Print ("_ZTSK_").",!
 Q
 ;
QUIT ;
 K ALL,DFLDT,DIV,DIVSN,DVS,FID,IXI,LIEN,LOCNME,MMRS
 K MMRSETIO,NUMDIV,STP,TSTSTP,TT,WR,WRD,DFLTDT
 K ENDDT,FND,CDI,LCPTR,LRFILE,MMRSMDRO,PCDIVT,PRINT,PCDIVT,SERV
 K STPCD,STRTDT,TYPE,WPTR,WRDPTR,X2,X10,X12,X2,X3,X4,X5,X6,X7,X8,X9
 K X1,X11,MRSA,^TMP($J),ORGP,MDROETIO,CNT,PCD,CD,ETIO,III,IX,I
 K LOC,MMRSNOW,PTR,TSTSTP,ZTSK,DVSN,DIVARY
 Q
 ;