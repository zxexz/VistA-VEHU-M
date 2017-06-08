GMRCP85 ;WAT - Post-install for GMRC*3.0*85 ;12/22/15  07:21
 ;;3.0;CONSULT/REQUEST TRACKING;**85**;DEC 27, 1997;Build 3
 ;;ICR 6257 - GMRC READ OF OR(100 GLOBAL
 ;;10061 VADPT (DEM and KVA)
 ;;10104 XLFSTR ;;10103 XLFDT ;;10141 XPDUTL ;;1131 ^XMB("NETNAME")
 ;;10063 ZTLOAD
 ;;3169 ^ORD(101.43 ;;873 ^ORD(100.98
 ;; ZT* TaskMan variables
 Q
RECIP ;RECIPIENTS
 K:$D(^XTMP("GMRCP85RECIPS")) ^XTMP("GMRCP85RECIPS")
 W !,$$CJ^XLFSTR("*** REJECTED CONSULT/PROCEDURE ORDERS REPORT ",80," "),!
 W $$CJ^XLFSTR("DATE DEFAULT VALUE REPORT QUESTIONS ***",80," "),!
 W !,"The post-install will create the REJECTED CONSULT/PROCEDURE ORDERS",!
 W "REPORT, which contains orders rejected by Consults with the message:",!
 W "   Code not valid for Coding System",!!
 W "The installer MUST include the site's local Clinical Application Coordinators",!
 W "(CACs) or other identified points-of-contact as recipients of this report.",!!
 W !!,"Please select the recipients for the REJECTED CONSULT/PROCEDURE ORDERS REPORT",!
 W "below."
 N XMDUZ,XMDF,XMMG,X,XMOUT,XMY
 S XMDUZ=DUZ
 D DES^XMA21 ;ICR #10067
 I $D(XMY)>9 D
 .S ^XTMP("GMRCP85RECIPS",0)=$$FMADD^XLFDT(DT,31)_U_DT_U_"RECIPIENTS OF REJECTED CONSULT/PROCEDURE ORDERS REPORT"
 .M ^XTMP("GMRCP85RECIPS")=XMY
 Q
PRE ; pre-init
 D RECIP
 Q
POST ; post init
 N GMRCPOST
 S GMRCPOST=1
 D QUEUE("find rejected gmrc orders report","ORDSRCH^GMRCP85","FILE #100 SEARCH FOR ORDERS REJECTED BY GMRC")
 Q
 ;
RESTART ;index redux
 W !,"Queueing file 100 search..."
 D QUEUE("GMRC*3.0*85 file #100 search","ORDSRCH^GMRCP85","FILE #100 SEARCH FOR ORDERS REJECTED BY GMRC")
 Q
QUEUE(GMRCMSG,ZTRTN,ZTDESC) ;CREATE A SPECIFIED TASK
 ;PARAMETERS: GMRCMSG    => STRING CONTAINING THE TEXT TO OUTPUT TO THE SCREEN
 ;            ZTRTN    => STRING CONTAINING THE ROUTINE TASKMAN SHOULD EXECUTE
 ;            ZTDESC   => STRING CONTAINING THE TASK'S DESCRIPTION
 N ZTDTH,ZTIO,ZTSK
 D BMES^XPDUTL("Queueing "_GMRCMSG_"...")
 S ZTDTH=$$FMADD^XLFDT($$NOW^XLFDT,0,0,0,10)
 S ZTIO=""
 D ^%ZTLOAD
 I +$G(ZTSK)=0 D
 .I $G(GMRCPOST) D BMES^XPDUTL("Unable to queue the "_GMRCMSG_"; file a Remedy ticket for assistance.")
 .E  W "ERROR",!,"Unable to queue the "_GMRCMSG_"; file a Remedy ticket for assistance.",!
 E  D
 .I $G(GMRCPOST) D
 ..D BMES^XPDUTL("DONE - Task #"_ZTSK)
 .E  W "DONE",!,"Task #"_ZTSK,!
 Q
 ;
ORDSRCH ;find rejected consult/procedure orders
 K ^XTMP("GMRCP85_ORDERS")
 S ^XTMP("GMRCP85_ORDERS",0)=$$FMADD^XLFDT(DT,31)_U_DT_U_"REJECTED ORDERS FOUND BY GMRC*3.0*85"
 N GMRCON,GMRCPROC,DISPGRP,GMRCIFN,DCTXT,COUNT,GMRCREP,GMRCSTAT,DFN,GMRCNAME,GMRCSVC,GMRCDATE,LOOPCNT
 S COUNT=1,LOOPCNT=0
 S GMRCON="",GMRCON=$O(^ORD(100.98,"B","CONSULTS",""))
 S GMRCPROC="",GMRCPROC=$O(^ORD(100.98,"B","PROCEDURES",""))
 N STRTDATE S STRTDATE=3150901
 I $D(^XTMP("GMRCP85","OR100AF","DATE")) S STRTDATE=^XTMP("GMRCP85","OR100AF","DATE") ;restart search from last date referenced
 N GMRCIDX S GMRCIDX=$Q(^OR(100,"AF",STRTDATE))
 F  S GMRCIDX=$Q(@GMRCIDX) Q:GMRCIDX'?1"^OR(100,""AF"",".E!($G(ZTSTOP)=1)  D
 .S GMRCIFN=$P(GMRCIDX,",",4) Q:+$G(GMRCIFN)'>0
 .S DISPGRP=$P(^OR(100,GMRCIFN,0),U,11) ;DISPLAY GROUP
 .Q:DISPGRP'=GMRCON&(DISPGRP'=GMRCPROC)
 .Q:$D(^OR(100,GMRCIFN,6))=0  ;not rejected
 .Q:$P(^OR(100,GMRCIFN,6),U)'=7  ;REJECTED
 .S DCTXT=$P(^OR(100,GMRCIFN,6),U,5) ;DC REASON TEXT
 .Q:$G(DCTXT)'["Code not valid for Coding System"
 .S GMRCSVC=""
 .I $D(^OR(100,GMRCIFN,4.5,"ID","SERVICE")) D
 ..S GMRCSVC=$O(^OR(100,GMRCIFN,4.5,"ID","SERVICE",0))
 ..S GMRCSVC=^OR(100,GMRCIFN,4.5,GMRCSVC,1) S GMRCSVC=$P(^GMR(123.5,GMRCSVC,0),U)
 .I $G(GMRCSVC)="" D
 ..S GMRCSVC=$$FINDSVC(.GMRCIFN)  S:+$G(GMRCSVC)="" GMRCSVC="NOT FOUND"
 .S GMRCNAME=$P(^OR(100,GMRCIFN,0),U,2) Q:$G(GMRCNAME)'["DPT"
 .S DFN=+$G(GMRCNAME)
 .D DEM^VADPT ;get pt name and last 4
 .S GMRCDATE=$P(^OR(100,GMRCIFN,0),U,7) ;to service
 .S ^XTMP("GMRCP85_ORDERS",VADM(1)_" ("_VA("BID")_")",COUNT)=VADM(1)_"("_VA("BID")_")"_U_GMRCSVC_U_GMRCDATE_U_GMRCIFN,COUNT=COUNT+1 ;name + last 4
 .D KVA^VADPT
 .S LOOPCNT=LOOPCNT+1
 .I LOOPCNT#500=0,($$S^%ZTLOAD) N X S ZTSTOP=1,X=$$S^%ZTLOAD("Received shutdown request")
 ;SEND STATUS EMAIL
 I +$G(ZTSTOP)=0 D
 .S GMRCREP(1)="The file #100 search process from GMRC*3.0*85 was successfully completed."
 .S GMRCREP(2)=""
 .D OUTPUT
 E  D
 .K GMRCREP
 .S GMRCREP(1)="The file #100 search process from GMRC*3.0*85 has unexpectedly stopped."
 .S GMRCREP(2)="If you or the system manager did not stop the process, please check the"
 .S GMRCREP(3)="error log and file a Remedy ticket for assistance."
 .S GMRCREP(4)=""
 .S GMRCREP(5)="To requeue the cleanup/conversion process, run RESTART^GMRCP85 from the"
 .S GMRCREP(6)="programmer prompt."
 S GMRCSTAT=$$MAIL("GMRCREP(","PATCH GMRC*3.0*85 ORDER SEARCH STATUS",,"GMRCP85RECIPS")
 I +GMRCSTAT,($G(ZTSTOP)=1) D
 .S ^XTMP("GMRCP85",0)=$$FMADD^XLFDT($$NOW^XLFDT,7,0,0,0)_U_$$NOW^XLFDT_U_"GMRC*3.0*85 POST-INSTALL DATA"
 .S ^XTMP("GMRCP85","OR100AF","DATE")=$P(GMRCIDX,",",3) ;capture last date referenced to restart search from.
 S ZTREQ="@"
 Q
FINDSVC(GMRCIFN) ; service not directly accessbile in the OR(100 entry, go find it
 N GMRCSERV,GMRCODBL,GMRCPROC S GMRCSERV=""
 ;GMRSERV - CONSULT SERVICE
 ;GMRCODBL - ORDERABLE ITEM FROM OR(100
 I $D(^OR(100,GMRCIFN,.1,1,0)) D
 .S GMRCODBL=^OR(100,GMRCIFN,.1,1,0)
 I $D(^ORD(101.43,$G(GMRCODBL),0)) D
 .S GMRCODBL=$P(^ORD(101.43,$G(GMRCODBL),0),U,2) ; service IEN;99CON or procedure IEN;99PRC
 .I $G(GMRCODBL)["CON" S GMRCSERV=$P(GMRCODBL,";") I $D(^GMR(123.5,GMRCSERV,0)) S GMRCSERV=$P(^GMR(123.5,GMRCSERV,0),U) Q
 .I $G(GMRCODBL)["PRC" D
 ..S GMRCPROC=$P(GMRCODBL,";")
 ..I $D(^GMR(123.3,GMRCPROC)) D
 ...I $D(^GMR(123.3,GMRCPROC,2,1,0)) S GMRCSERV=^GMR(123.3,GMRCPROC,2,1,0) Q
 Q GMRCSERV
 ;
OUTPUT ;add data to message array
 I '$D(^XTMP("GMRCP85_ORDERS")) D  Q
 .S GMRCREP(3)="REPORT DATA NO LONGER AVAILABLE. A NEW SEARCH MUST BE COMPLETED."
 .S GMRCREP(4)="SEE GMRC*3.0*85 PATCH DESCRIPTION FOR INSTRUCTIONS."
 I $O(^XTMP("GMRCP85_ORDERS",0))="" D  Q
 .S GMRCREP(3)="No CONSULT or PROCEDURE orders found with the "
 .S GMRCREP(4)="'Code not valid for Coding System' rejection message."
 N GMRCINC,GMRCPAT,GMRCSERV,GMRCDATE,GMRCONBR,GMRCNAME,GMRCTEMP,LINECNT,TOTAL
 S GMRCINC=0,GMRCPAT="",TOTAL=0
 S GMRCREP(3)="PATIENT"
 S GMRCREP(4)="  SERVICE"_$$REPEAT^XLFSTR(" ",44)_"   ORDER DATE    ORDER #"
 S GMRCREP(5)=$$REPEAT^XLFSTR("-",78)
 S LINECNT=6
 F  S GMRCPAT=$O(^XTMP("GMRCP85_ORDERS",GMRCPAT)) Q:$G(GMRCPAT)=""   D
 .Q:$G(GMRCPAT)=0
 .S GMRCREP(LINECNT)=$G(GMRCPAT),LINECNT=LINECNT+1
 .F  S GMRCINC=$O(^XTMP("GMRCP85_ORDERS",GMRCPAT,GMRCINC)) Q:+$G(GMRCINC)'>0  D
 ..S GMRCSERV=$P(^XTMP("GMRCP85_ORDERS",GMRCPAT,GMRCINC),U,2)
 ..S GMRCDATE=$P(^XTMP("GMRCP85_ORDERS",GMRCPAT,GMRCINC),U,3) S GMRCDATE=$$FMTE^XLFDT(GMRCDATE,"2DZ") ;MM/DD/YY
 ..S GMRCONBR=$P(^XTMP("GMRCP85_ORDERS",GMRCPAT,GMRCINC),U,4)
 ..S GMRCSERV=$E(GMRCSERV,0,53)
 ..I $L(GMRCSERV)<53 S GMRCSERV=GMRCSERV_$$REPEAT^XLFSTR(" ",(53-$L(GMRCSERV)))
 ..S GMRCREP(LINECNT)="  "_GMRCSERV_$J(GMRCDATE,10)_$J(GMRCONBR,14),LINECNT=LINECNT+1,TOTAL=TOTAL+1
 .S GMRCREP(LINECNT)="",LINECNT=LINECNT+1
 .S GMRCREP(LINECNT)=""
 S GMRCREP(LINECNT)="TOTAL ORDERS FOUND:     "_TOTAL
 Q
 ;
MAIL(XMTEXT,XMSUB,XMY,SUBSCR) ;SEND AN EMAIL
 ;PARAMETERS: XMTEXT => STRING CONTAINING NAME OF ARRAY CONTAINING MESSAGE TEXT (REQUIRED)
 ;            XMSUB  => STRING CONTAINING THE SUBJECT OF THE MESSAGE (REQUIRED)
 ;            XMY    => REFERENCE TO AN ARRAY CONTAINING THE RECIPIENTS (OPTIONAL)
 ;            SUBSCR => STRING CONTAINING THE SUBSCIPT WITHIN ^XTMP WHERE RECIPIENTS ARE STORED (OPTIONAL)
 ;RETURN: $$MAIL => STRING CONTAINING XMMG (ERROR STRING)^XMERR (NUMBER OF ERRORS)
 N XMMG,XMDUZ,XMZ,XMERR,DIFROM,GMRCMSG
 Q:'$D(XMTEXT)!($G(XMSUB)="")
 I $D(XMY)=0 D
 .I $G(SUBSCR)'="",($Q(^XTMP(SUBSCR,0))[SUBSCR) D  Q
 ..K ^XTMP(SUBSCR,0)
 ..M XMY=^XTMP(SUBSCR)
 ..K ^XTMP(SUBSCR)
 .I $D(ZTQUEUED)>0 D
 ..S XMY(DUZ)=""
 .E  D
 ..S GMRCMSG(1)=" "
 ..S GMRCMSG(2)="Select the recipient(s) of the report below."
 ..D MAILOUT(.GMRCMSG)
 S XMDUZ="GMRC*3.0*85 Install@"_^XMB("NETNAME")
 D ^XMD ;ICR #10070
 K GMRCMSG
 I $D(XMMG)>0 D
 .S GMRCMSG(1)=" "
 .S GMRCMSG(2)="Unable to email the report:"
 .S GMRCMSG(3)=XMMG
 .D MAILOUT(.GMRCMSG)
 Q $G(XMMG)_U_$G(XMERR)
 ;
MAILOUT(MESSAGE) ;OUTPUT THE GMRCMSG ARRAY FROM MAIL LINE TAG
 ;IF KIDS IS NOT EXECUTING, OUTPUT THE MESSAGE TO THE SCREEN
 I $G(XPDNM)="" D
 .N LINE S LINE=0 F  S LINE=$O(MESSAGE(LINE)) Q:+$G(LINE)=0  W MESSAGE(LINE),!
 E  D MES^XPDUTL(.MESSAGE)
 Q
 ;
OUTPUT2 ;programmer mode write data to screen
 I '$D(^XTMP("GMRCP85_ORDERS")) D  Q
 .W !,"REPORT DATA NO LONGER AVAILABLE. A NEW SEARCH MUST BE COMPLETED."
 .W !,"SEE GMRC*3.0*85 PATCH DESCRIPTION FOR INSTRUCTIONS."
 I $O(^XTMP("GMRCP85_ORDERS",0))="" D  Q
 .W !,"No CONSULT or PROCEDURE orders found with the "
 .W !,"'Code not valid for Coding System' rejection message."
 N GMRCINC,GMRCPAT,GMRCSERV,GMRCDATE,GMRCONBR,GMRCNAME,GMRCTEMP S GMRCINC=0,GMRCPAT=""
 D HEADER
 F  S GMRCPAT=$O(^XTMP("GMRCP85_ORDERS",GMRCPAT)) Q:$G(GMRCPAT)=""  D
 .Q:$G(GMRCPAT)=0
 .W !!,$G(GMRCPAT)
 .F  S GMRCINC=$O(^XTMP("GMRCP85_ORDERS",GMRCPAT,GMRCINC)) Q:+$G(GMRCINC)'>0  D
 ..S GMRCSERV=$P(^XTMP("GMRCP85_ORDERS",GMRCPAT,GMRCINC),U,2)
 ..S GMRCDATE=$P(^XTMP("GMRCP85_ORDERS",GMRCPAT,GMRCINC),U,3) S GMRCDATE=$$FMTE^XLFDT(GMRCDATE,"2DZ") ;MM/DD/YY
 ..S GMRCONBR=$P(^XTMP("GMRCP85_ORDERS",GMRCPAT,GMRCINC),U,4)
 ..I $L(GMRCSERV)<53 S GMRCSERV=GMRCSERV_$$REPEAT^XLFSTR(" ",(53-$L(GMRCSERV)))
 ..W !,"  "_GMRCSERV_$J(GMRCDATE,10)_$J(GMRCONBR,14)
 Q
 ;
HEADER ;header
 W @IOF
 W "PATIENT",!
 W "  SERVICE"_$$REPEAT^XLFSTR(" ",44)_"   ORDER DATE    ORDER #"
 W !,$$REPEAT^XLFSTR("-",78)
 Q
