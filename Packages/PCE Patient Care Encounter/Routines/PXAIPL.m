PXAIPL ;ISL/JVS - PROBLEM LIST ;24 Jan 2013  12:59 PM
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**69,124,168,199**;Aug 12, 1996;Build 52
 ;
 ;
 Q
PL ;--ENTRY POINT TO EDIT PROBLEMS
 ;
 ;
 Q:'$L($T(^GMPLUTL))
 ;
 N PXARRAY,RESULT
DECIDE ;--DECIDE IF A PROBLEM
 I $G(PXAA("PL ADD"))=1 G SET
 I $G(PXAA("PL IEN"))>0 G SET
 I $G(PXAA("PL ACTIVE"))]"" G SET
 I $G(PXAA("PL ONSET DATE"))>0 G SET
 I $G(PXAA("PL RESOLVED DATE"))>0 G SET
 ;PX*1.0*124
 ;I $G(PXAA("PL SC"))]"" G SET
 ;I $G(PXAA("PL AO"))]"" G SET
 ;I $G(PXAA("PL IR"))]"" G SET
 ;I $G(PXAA("PL EC"))]"" G SET
 ;I $G(PXAA("PL MST"))]"" G SET
 ;I $G(PXAA("PL HNC"))]"" G SET
 ;I $G(PXAA("PL CV"))]"" G SET
 ;I $G(PXAA("PL SHAD"))]"" G SET
 Q
 ;
 ;
SET ;--REQUIRED
 S PXARRAY("PATIENT")=$G(PATIENT)
 S PXARRAY("NARRATIVE")=$G(PXAA("NARRATIVE"))
 S PXARRAY("PROVIDER")=$G(PXAA("ENC PROVIDER"))
 ;--OPTIONAL
 S PXARRAY("DIAGNOSIS")=$G(PXAA("DIAGNOSIS"))
 S PXARRAY("DX_DATE_OF_INTEREST")=$$CSDATE^PXDXUTL(PXAVISIT)
 S PXARRAY("LEXICON")=$G(PXAA("LEXICON TERM"))
 S PXARRAY("STATUS")=$G(PXAA("PL ACTIVE"))
 S PXARRAY("ONSET")=$G(PXAA("PL ONSET DATE"))
 I '$G(PXAA("PL IEN")) S PXARRAY("RECORDED")=$G(PXAA("EVENT D/T"))
 S PXARRAY("RESOLVED")=$G(PXAA("PL RESOLVED DATE"))
 S PXARRAY("COMMENT")=$G(PXAA("COMMENT"))
 I $G(PXARRAY("COMMENT"))="@" S PXARRAY("COMMENT")=""
 ;--LOCATION
 S PXARRAY("LOCATION")=$P($G(^AUPNVSIT(PXAVISIT,0)),"^",22)
 ;--SERVICE CONNECTEDNESS
 S PXARRAY("SC")=$P(AFTER800,"^",1)
 S PXARRAY("AO")=$P(AFTER800,"^",2)
 S PXARRAY("IR")=$P(AFTER800,"^",3)
 S PXARRAY("EC")=$P(AFTER800,"^",4)
 S PXARRAY("MST")=$P(AFTER800,"^",5)
 S PXARRAY("HNC")=$P(AFTER800,"^",6)
 S PXARRAY("CV")=$P(AFTER800,"^",7)
 S PXARRAY("SHAD")=$P(AFTER800,"^",8)
 ;---MISC
 S PXARRAY("PROBLEM")=$G(PXAA("PL IEN"))
 ;
 ;
 ;
RUN ;
 D UPDATE^GMPLUTL(.PXARRAY,.RESULT)
 I RESULT(0)="" S $P(AFTER0,"^",16)=RESULT
 ;--**SET ERROR INTO DIALOG
 I RESULT(0)]"" D
 .S PXAERR("PL1")=$G(RESULT(0))
 .S PXAERRF=1
 .S PXADI("DIALOG")=8390001.004
 Q
