SDMHNS ;MAF/ALB - MENTAL HEALTH NO SHOW REPORT (BGJ);SEPTEMBER 9, 2010
 ;;5.3;Scheduling;**578,588**;Aug 13,1993;Build 53
 ;
EN ;entry point for the automatic generation of the No Show Report from BGJ
 N SDBEG,SDEND,VAUTD,Y,SDUP,SDXFLG,SDDAT,X1,X2,SDTL,X,VAUTCL,SDPAG,SDX,TOTAL,IOM,SDNSDT,%
 K ^TMP("SDNS1",$J)
 S SDXFLG=1 ; This flag is set to 1 when it is from the background Job
 D NOW^%DTC S Y=$E(%,1,12) S SDDAT=$$FMTE^XLFDT(Y,"5") S X1=Y,X2=-1 D C^%DTC S SDBEG=$P(X,".",1)_".0000",SDEND=$P(X,".",1)_".2359"
 S SDNSDT=$$FMTE^XLFDT(X,"2")
 S VAUTD=1   ;All the divisions in the facility
 S SDTL="CLIN"   ; sort by clinc for the BGJ
 S IOM=80
 N SDLN
 S X="",SDLN=0
 D START^SDMHAD
 N XMSUB,XMY,XMTEXT,XMDUZ,SDGRP
 S SDGRP=$O(^XMB(3.8,"B","SD MH NO SHOW NOTIFICATION",""))
 Q:'SDGRP
 D XMY^SDUTL2(SDGRP,0,0)
 S XMSUB="HRMH NO SHOW NIGHTLY REPORT"_" MESSAGE # "
 S XMTEXT="^TMP(""SDNS1"",$J,"
 S XMDUZ="POSTMASTER"
 D ^XMD
 K ^TMP("SDNS1",$J)
 Q
SET(X) ; SET UP THE STRING
 S SDLN=SDLN+1,^TMP("SDNS1",$J,SDLN,0)=X
 Q
HEAD ;Heading for the report
 ;
 N SDX
 S SDX="",X=""
 S SDPAG=SDPAG+1,SDX=$$SETSTR^SDMHNS1("HIGH RISK MENTAL HEALTH NO SHOW NIGHTLY REPORT",X,1,46)_$$SETSTR^SDMHNS1(" PAGE ",X,20,6)_$$SETSTR^SDMHNS1(SDPAG,X,4,4) D SET1^SDMHNS1(SDX)
 S SDX=$$SETSTR^SDMHNS1("By "_$S(SDTL="MEN":"MH CLINIC LIST",SDTL="STOP":"STOPCODE",1:"CLINIC")_" for Appointments on "_$P(SDNSDT,"@",1),X,1,50)_$$SETSTR^SDMHNS1("Run: "_SDDAT,X,9,30) D SET1^SDMHNS1(SDX)
 S SDX=$$SETSTR^SDMHNS1("*STATUS: NS = No Show      NSA = No Show Auto Rebook     NAT = No Action Taken",X,1,80) D SET1^SDMHNS1(SDX)
 S SDX=$$SETSTR^SDMHNS1("#",X,1,2)_$$SETSTR^SDMHNS1("PATIENT",X,4,7)_$$SETSTR^SDMHNS1("PT ID",X,15,5)_$$SETSTR^SDMHNS1("APPT D/T",X,2,17)_$$SETSTR^SDMHNS1("CLINIC/STATUS/PROVIDER",X,1,22) D SET1^SDMHNS1(SDX)
 S SDX=$$SETSTR^SDMHNS1($$LINE^SDMHAD(""),X,1,80) D SET1^SDMHNS1(SDX)
HEAD1 I $D(^TMP(NAMSPC1,$J)),$D(SDXDIV) S SDX=$$SETSTR^SDMHNS1("DIVISION/CLINIC/STOP: "_$E(SDXDIV,1,24)_"/"_$E(SDXCLIN,1,26)_"/"_$E(SDXSTOP,1,6),X,1,80) D SET1^SDMHNS1(SDX)
 I '$D(^TMP(NAMSPC1,$J)),'$D(SDXDIV) S SDX=$$SETSTR^SDMHNS1($$LINE1^SDMHAD(">>>>>>>>>>>>> NO RECORDS <<<<<<<<<<<<<"),X,1,80) D SET1^SDMHNS1(SDX)
 Q
 ;S SDX=$$SETSTR^SDMHNS1("#",X,1,1)_$$SETSTR^SDMHNS1("PATIENT",X,5,7)_$$SETSTR^SDMHNS1("PT ID",X,14,5)_$$SETSTR^SDMHNS1("APPT D/T",X,6,20)_$$SETSTR^SDMHNS1("CLINIC",X,2,15)_$$SETSTR^SDMHNS1("STATUS",X,2,6) D SET1^SDMHNS1(SDX)
 ;
TOTAL ;Prints totals for the clinics by division - FOR BGJ
 Q:'$D(TOTAL)
 N SDVISN,SDCLNIC,SDFLAG,SDX,X
 S (SDVISN,SDCLNIC)=0
 S X="",SDX=""
 S SDX=$$SETSTR^SDMHNS1("Division/Clinic Appointment Totals",X,1,80) D SET1^SDMHNS1(SDX)
 S X="",SDX=""
 S SDX=$$SETSTR^SDMHNS1("Division/CLinic",X,1,26)_$$SETSTR^SDMHNS1("Unique",X,47,6) D SET1^SDMHNS1(SDX)
 S X="",SDX="" S SDX=$$SETSTR^SDMHNS1("NS   NSA   NAT  Patients",X,56,24) D SET1^SDMHNS1(SDX)
 F  S SDVISN=$O(TOTAL(SDVISN)) Q:SDVISN']""  F  S SDCLNIC=$O(TOTAL(SDVISN,SDCLNIC)) Q:SDCLNIC']""  D
 . N SDX,X
 .I $D(TOTAL(SDVISN,SDCLNIC)) D
 ..S SDX="",X=""
 ..N SDTOTS
 ..S SDTOTS=$J($P(TOTAL(SDVISN,SDCLNIC),"^",2),3)_"   "_$J($P(TOTAL(SDVISN,SDCLNIC),"^",3),3)_"   "_$J($P(TOTAL(SDVISN,SDCLNIC),"^",4),3)_"    "_$J($P(TOTAL(SDVISN,SDCLNIC),"^",5),3)
 ..S SDX=$$SETSTR^SDMHNS1($E(SDVISN,1,24)_"/"_$E(SDCLNIC,1,26),X,1,54)_$$SETSTR^SDMHNS1(SDTOTS,X,1,24) D SET1^SDMHNS1(SDX)
 S X="",SDX="" S SDX=$$SETSTR^SDMHNS1(" ",X,1,80) D SET1^SDMHNS1(SDX)
 S X="",SDX=""
 ;S SDX=$$SETSTR^SDMHNS1("*STATUS: NS = No Show      NSA = No Show Auto Rebook     NAT = No Action Taken",X,1,80) D SET1^SDMHNS1(SDX)
 Q
TOTAL1 ;TOTALS FOR AD HOC
 Q:'$D(TOTAL)
 N SDVISN,SDCLNIC,SDFLAG,SDX,X
 S (SDVISN,SDCLNIC)=0
 W ?25,"Division/Clinic Appointment Totals",!
 W "Division/CLinic",?73,"Unique",!
 W ?56,"NS   NSA   NAT  Patients",!
 F  S SDVISN=$O(TOTAL(SDVISN)) Q:SDVISN']""  F  S SDCLNIC=$O(TOTAL(SDVISN,SDCLNIC)) Q:SDCLNIC']""  D
 .I $D(TOTAL(SDVISN,SDCLNIC)) D
 ..N SDTOTS
 ..S SDTOTS=$J($P(TOTAL(SDVISN,SDCLNIC),"^",2),3)_"   "_$J($P(TOTAL(SDVISN,SDCLNIC),"^",3),3)_"   "_$J($P(TOTAL(SDVISN,SDCLNIC),"^",4),3)_"    "_$J($P(TOTAL(SDVISN,SDCLNIC),"^",5),3)
 ..W $E(SDVISN,1,24)_"/"_$E(SDCLNIC,1,26),?55,SDTOTS,! D RET^SDMHAD1 Q:SDUP
 W ! D RET^SDMHAD1 Q:SDUP
 ;W "*STATUS: NS = No Show      NSA = No Show Auto Rebook     NAT = No Action Taken",! D RET^SDMHAD1 Q:SDUP
 Q
COUNT ; COUNTER
 S SDCOUNT=SDCOUNT+1
