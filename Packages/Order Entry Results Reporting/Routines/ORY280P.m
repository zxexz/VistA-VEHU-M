ORY280P ;slc/dcm - Export Package Level Parameters ;3/17/10  09:18
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**280**;Dec 17, 1997;Build 85
MAIN ; main (initial) parameter transport routine
 K ^TMP($J,"XPARRSTR")
 N ENT,IDX,ROOT,REF,VAL,I
 S ROOT=$NAME(^TMP($J,"XPARRSTR")),ROOT=$E(ROOT,1,$L(ROOT)-1)_","
 D LOAD
 S IDX=0,ENT="PKG.ORDER ENTRY/RESULTS REPORTING"
 F  S IDX=$O(^TMP($J,"XPARRSTR",IDX)) Q:'IDX  D
 . N PAR,INST,ORVAL,ORERR
 . S PAR=$P(^TMP($J,"XPARRSTR",IDX,"KEY"),U),INST=$P(^("KEY"),U,2)
 . M ORVAL=^TMP($J,"XPARRSTR",IDX,"VAL")
 . D EN^XPAR(ENT,PAR,INST,.ORVAL,.ORERR)
 K ^TMP($J,"XPARRSTR")
 D PKG
 Q
LOAD ; load data into ^TMP (expects ROOT to be defined)
 S I=1 F  S REF=$T(DATA+I) Q:REF=""  S VAL=$T(DATA+I+1) D
 . S I=I+2,REF=$P(REF,";",3,999),VAL=$P(VAL,";",3,999)
 . S @(ROOT_REF)=VAL
 Q
PKG ;Setup VBECS package level parameters of Pointer Type
 N ORX,P
 S P="OR VBECS COMPONENT ORDER"
 D SET("RED BLOOD CELLS",P,5,"S.VBC")
 D SET("FRESH FROZEN PLASMA",P,10,"S.VBC")
 D SET("PLATELETS",P,15,"S.VBC")
 D SET("CRYOPRECIPITATE",P,20,"S.VBC")
 D SET("WHOLE BLOOD",P,25,"S.VBC")
 D SET("OTHER",P,30,"S.VBC")
 S P="OR VBECS DIAGNOSTIC TEST ORDER"
 D SET("ABO/RH",P,5,"S.VBT")
 D SET("ANTIBODY SCREEN",P,10,"S.VBT")
 D SET("DIRECT ANTIGLOBULIN TEST",P,15,"S.VBT")
 D SET("TRANSFUSION REACTION WORKUP",P,20,"S.VBT")
 D SET("TYPE & SCREEN",P,25,"S.VBT")
 Q
SET(ONAME,P,S,XREF) ;Set the parameter
 ;ONAME=Report name
 ;P=Parameter name
 ;S=Sequence (count)
 ;XREF=Cross Reference to screen on
 N DA,ORERR
 S DA=0 F  S DA=$O(^ORD(101.43,XREF,ONAME,DA)) Q:'DA  D
 . D EN^XPAR("PKG.ORDER ENTRY/RESULTS REPORTING",P,S,ONAME,.ORERR)
 Q
DATA ; parameter data
 ;;9343,"KEY")
 ;;OR VBECS REMOVE COLL TIME^1
 ;;9343,"VAL")
 ;;NO
 ;;9344,"KEY")
 ;;OR VBECS DIAGNOSTIC PANEL 1ST^1
 ;;9344,"VAL")
 ;;NO
