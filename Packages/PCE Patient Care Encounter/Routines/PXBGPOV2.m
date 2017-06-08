PXBGPOV2 ;ISL/JVS - DOUBLE ?? GATHERING OF DIAGNOSES ;27 Mar 2013  6:12 PM
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**1,5,11,136,149,124,203,199**;Aug 12, 1996;Build 52
 ;
 W !,"THIS IS NOT AN ENTRY POINT" Q
DOUBLE(FROM) ;--Entry point
 ;  WHAT   = The same WHAT as sent in from the API
 ;  FROM   = Exactly which prompt is asking for the list
 ;  SCREEN = Same as the DIC("S") screen used by FileMan
 ;  START  = The starting point as to what to look up
 ;
 N BACK,CODE,FIELD,FILE,FIRST,HEADING,NAME,NUM,PXACS,PXACSREC,PXDXDATE
 N SCREEN,START,SUB,SUB2,TEMP,TITLE,VSTIEN
 S VSTIEN=$S($D(PXBVST)=1:PXBVST,$D(VISIT)=1:VISIT,1:"")
 S PXDXDATE=$$CSDATE^PXDXUTL(VSTIEN)
 S PXACSREC=$$ACTDT^PXDXUTL(PXDXDATE),PXACS=$P(PXACSREC,U,3)
 I PXACS["-" S PXACS=$P(PXACS,"-",1,2)
 S BACK="",NUM=0,SCREEN=""
 D LOC
 ; ICD9/ICD10 must be filtered out depending on PXDXDATE, so SCREEN must be defined
 S SCREEN="I $P($$ICDDATA^ICDXCODE(""DIAG"",Y,PXDXDATE,$$IE^ICDEX(Y)),""^"",10)"
 ;
 S START=$S($P(PXACSREC,"^",1)="ICD":"001.0 ",1:"A")  ; start with A codes if ICD10
START ;--RECYCLE POINT
 S TITLE="ALL DIAGNOSES ("_PXACS_" CODES)"
 D SETUP
 D LIST^DIC(FILE,"",FIELD,BACK,10,.START,"","BA",SCREEN,"","^TMP(""PXBTANA"",$J)","^TMP(""PXBTANA"",$J)")
 D LOC,HEAD
 D SETSECND   ; SET UP DESCRIPTIONS TO GET AROUND FACT THAT THIS IS NOW A MULTIPLE FIELD IN FILE 80
 D SUB
 ;
PROMPT ;---WRITE PROMPT HERE
 D WIN17^PXBCC(PXBCNT),LOC^PXBCC(15,1)
 W !!,"Enter '^' to quit,  '-' for previous page."
 S DIR("A")="Select a single 'ITEM NUMBER' or 'RETURN' to continue: "
 S DIR("?")="Enter ITEM 'No' to select , '^' to quit,  '-' for previous page."
 S DIR(0)="N,A,O^0:10:0^I X'?.1""-"".1""^"".2N!(+X>10) K X"
 D ^DIR
 I X="-" S BACK="B" D BACK G START
 I X="" S BACK="" D FORWARD G START
 I $G(DIRUT) K DIRUT S VAL="^P" G EXIT
 ;
FINISH ;--FINISH SETTING A VARIABLE TO SELECTED ITEM
 S VAL=$G(^TMP("PXBTANA",$J,"DILIST",2,X))_"^"_$G(^TMP("PXBTANA",$J,"DILIST","ID",X,FIRST))_"--"_$G(^TMP("PXBTANA",$J,"DILIST","ID",X,SECOND))
EXIT ;--EXIT
 K DIR,^TMP("PXBTANA",$J),^TMP("PXBTOTAL",$J)
 Q VAL
 ;
DOUBLE1(FROM) ;--Entry point
NEW ;
 N CNT,CODE,CYCLE,FIELD,FILE,FIRST,HEADING,HLP,INDEX,NAME,OK,PXACS
 N PXACSREC,PXDXDATE,SCREEN,START,SUB,SUB2,TITLE,TOTAL,VSTIEN
 S VSTIEN=$S($D(PXBVST)=1:PXBVST,$D(VISIT)=1:VISIT,1:"")
 S PXDXDATE=$$CSDATE^PXDXUTL(VSTIEN)
 S PXACSREC=$$ACTDT^PXDXUTL(PXDXDATE),PXACS=$P(PXACSREC,U,3)
 I PXACS["-" S PXACS=$P(PXACS,"-",1,2)
 S BACK="",INDEX="BA"
 S START=DATA,SUB=0,SUB2=0
 S DIC("S")="I $P($$ICDDATA^ICDXCODE(""DIAG"",Y,PXDXDATE,$$IE^ICDEX(Y)),""^"",10)"
 ;
START1 ;--RECYCLE POINT
 W !
 S TITLE="- - S E L E C T E D  D I A G N O S E S ("_PXACS_" CODES) - -"
 S FILE=80,(FIELD,FIRST)=.01,SECOND="DxDesc",EDATA=DATA
 I DATA?1N S START=DATA*100 S START=$O(^ICD9("BA",START_" ",-1)) S INDEX="BA"
 I DATA?2N S START=DATA*10 S START=$O(^ICD9("BA",START_" ",-1)) S INDEX="BA"
 I DATA?3.NP S (START)=DATA-(.99) S START=$O(^ICD9("BA",START_" ",-1)) S INDEX="BA"
 I DATA?1A.ANP S START=$O(^ICD9("BA",START_" ",-1)) S INDEX="BA"
 I DATA?2AP S HLP=1
 I DATA?3.AP S START=$O(^ICD9("D",DATA),-1),INDEX="D"
 I DATA?1A!(DATA?1.2N) D WAIT^DICD
 ;
 D LIST^DIC(FILE,"",FIELD,BACK,"",.START,DATA,INDEX,DIC("S"),"","^TMP(""PXBTOTAL"",$J)","^TMP(""PXBTOTAL"",$J)")
 D SETSECND
 ;
FILTER ;--FILTER OUT DUPLICATES
 N I,DXINF,DXINFARR S I=0 F  S I=$O(^TMP("PXBTOTAL",$J,"DILIST","ID",I)) Q:I=""  D
 .S DXINFARR=$$ICDDESC^ICDXCODE("DIAG",^TMP("PXBTOTAL",$J,"DILIST","ID",I,.01),PXDXDATE,.DXINFARR)
 .S DXINF=$G(DXINFARR(1))
 .I DXINF'="" S ^TMP("PXBOTAL",$J,$G(^TMP("PXBTOTAL",$J,"DILIST","ID",I,.01)),$E(DXINF,1,59)_" ",$G(^TMP("PXBTOTAL",$J,"DILIST",2,I))_" ")=""
 K ^TMP("PXBTOTAL",$J)
 N I,J,K,C S (I,J,K,C)="" F  S I=$O(^TMP("PXBOTAL",$J,I)) Q:I=""  D
 .S C=C+1
 .S J=$O(^TMP("PXBOTAL",$J,I,0))
 .S K=$O(^TMP("PXBOTAL",$J,I,J,0))
 .S ^TMP("PXBTOTAL",$J,"DILIST","ID",C,.01)=I
 .S ^TMP("PXBTOTAL",$J,"DILIST","ID",C,"DxDesc")=J
 .S ^TMP("PXBTOTAL",$J,"DILIST",2,C)=K
 S ^TMP("PXBTOTAL",$J,"DILIST",0)=C
 K ^TMP("PXBOTAL",$J)
 ;
 S TOTAL=$P($G(^TMP("PXBTOTAL",$J,"DILIST",0)),"^",1)
 ;
 ;--DISPLAY IF NO MATCH FOUND
 I TOTAL<1 D
 .W IOEDEOP
 .I '$G(HLP) W ! D HELP^PXBUTL0("CPTM")
 .I $G(HLP) S RESULTS="USE AT LEAST THE 3 CHARACTERS" W !,IOCUU,?(IOM-$L(RESULTS))\2,RESULTS
 .S ERROR=1,CYCL=1
 I TOTAL<1 Q TOTAL
 ;
 ;----DISPLAY LIST TO THE SCREEN
 S HEADING="W !,""ITEM"",?6,""CODE"",?16,""DESCRIPTION    "",IOINHI,TOTAL,"" MATCHES"",IOINLOW"
LIST ;-DISPLAY LIST TO THE SCREEN
 I TOTAL=1 S X=1 G VAL
 D LOC,HEAD  ; W !
 ;X HEADING
 S SUB=SUB-1
 S NUM=0 F  S SUB=$O(^TMP("PXBTOTAL",$J,"DILIST","ID",SUB)) S NUM=NUM+1 Q:NUM=11  Q:SUB'>0  S SUB2=SUB2+1 D
 .S CODE=$G(^TMP("PXBTOTAL",$J,"DILIST","ID",SUB,.01))
 .S NAME=$E($G(^TMP("PXBTOTAL",$J,"DILIST","ID",SUB,"DxDesc")),1,62)
 .W !,SUB,?6,CODE,?16,NAME
 ;
 ;----If There is only one selection go to proper prompting
 I TOTAL=1 G PRMPT2
 ;
PRMPT ;---WRITE PROMPT HERE
 D WIN17^PXBCC(PXBCNT)
 D LOC^PXBCC(15,1)
 W !
 I SUB>0 W !,"Enter '^' to quit"
 E  I TOTAL>10 W !,"               END OF LIST"
 I SUB>0 S DIR("A")="Select a single 'ITEM NUMBER' or 'RETURN' to continue: "
 E  S DIR("A")="Select a single 'ITEM NUMBER' or 'RETURN' to exit: "
 S DIR("?")="Enter ITEM 'No' to select , '^' to quit"
 S DIR(0)="N,A,O^0:"_SUB2_":0^I X'?.1""^"".N K X"
 D ^DIR
 I X="",SUB>0 G LIST
 I X="",SUB'>0 S X="^"
VAL ;-----Set the VAL equal to the value
 S VAL=$G(^TMP("PXBTOTAL",$J,"DILIST",2,X))_"^"_$G(^TMP("PXBTOTAL",$J,"DILIST","ID",X,.01))
EXITNEW ;--EXIT
 K DIR,^TMP("PXBTANA",$J),^TMP("PXBTOTAL",$J)
 K TANA,TOTAL
 Q VAL
 Q
 ;
 ;---SUBROUTINES
BACK ;
 S START=$G(^TMP("PXBTANA",$J,"DILIST",1,1))
 S START("IEN")=$G(^TMP("PXBTANA",$J,"DILIST",2,1))
 Q
FORWARD ;
 S START=$G(^TMP("PXBTANA",$J,"DILIST",1,10))
 S START("IEN")=$G(^TMP("PXBTANA",$J,"DILIST",2,10))
 Q
LOC ;--LOCATE CURSOR
 D LOC^PXBCC(3,1) ;--LOCATE THE CURSOR
 W IOEDEOP ;--CLEAR THE PAGE
 Q
HEAD ;--HEAD
 W !,IOCUU,IOBON,"HELP SCREEN",IOSGR0,?(IOM-$L(TITLE))\2,IOINHI,TITLE,IOINLOW,IOELEOL
 Q
SUB ;--DISPLAY LIST TO THE SCREEN
 I $P(^TMP("PXBTANA",$J,"DILIST",0),"^",1)=0 W !!,"     E N D  O F  L I S T" Q
 X HEADING
 S SUB=0,CNT=0 F  S SUB=$O(^TMP("PXBTANA",$J,"DILIST","ID",SUB)) Q:SUB'>0  S CNT=CNT+1 D
 .S CODE=$G(^TMP("PXBTANA",$J,"DILIST","ID",SUB,FIRST))
 .S NAME=$E($G(^TMP("PXBTANA",$J,"DILIST","ID",SUB,SECOND)),1,62)
 .W !,SUB,?6,CODE,?16,NAME
 Q
SETUP ;-SETUP VARIABLES
 S FILE=80,FIRST=.01,SECOND="DxDesc"
 S FIELD=FIRST
 S HEADING="W !,""ITEM"",?6,""CODE"",?16,""DESCRIPTION"""
 Q
SETSECND ;
 N NAMEARR
 S SUB=0 F  S SUB=$O(^TMP("PXBTANA",$J,"DILIST","ID",SUB)) Q:SUB'>0  D
 . S CODE=$G(^TMP("PXBTANA",$J,"DILIST","ID",SUB,FIRST))
 . S NAMEARR=$$ICDDESC^ICDXCODE("DIAG",CODE,PXDXDATE,.NAMEARR)
 . S ^TMP("PXBTANA",$J,"DILIST","ID",SUB,SECOND)=$G(NAMEARR(1))
 Q
 ;
PRMPT2 ;-----Yes and No prompt if only choice
 D WIN17^PXBCC(PXBCNT)
 D LOC^PXBCC(15,1)
 S DIR("A")="Is this the correct entry "
 S DIR("B")="YES"
 S DIR(0)="Y"
 D ^DIR
 I Y=0 S X="^"
 I Y=1 S X=1
 G VAL
