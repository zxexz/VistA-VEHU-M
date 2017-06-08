OCXDI01W ;SLC/RJS,CLA - OCX PACKAGE DIAGNOSTIC ROUTINES ;SEP 7,1999 at 10:30
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**32**;Dec 17,1997
 ;;  ;;ORDER CHECK EXPERT version 1.01 released OCT 29,1998
 ;
S ;
 ;
 D DOT^OCXDIAG
 ;
 ;
 K REMOTE,LOCAL,OPCODE,REF
 F LINE=1:1:500 S TEXT=$P($T(DATA+LINE),";",2,999) Q:TEXT  I $L(TEXT) D  Q:QUIT
 .S ^TMP("OCXDIAG",$J,$O(^TMP("OCXDIAG",$J,"A"),-1)+1)=TEXT
 ;
 G ^OCXDI01X
 ;
 Q
 ;
DATA ;
 ;
 ;;D^HL7
 ;;R^"863.3:","863.32:6",.01,"E"
 ;;D^OCXO FILE POINTER
 ;;EOR^
 ;;KEY^863.3:^PATIENT.HL7_CONTROL_CODE
 ;;R^"863.3:",.01,"E"
 ;;D^PATIENT.HL7_CONTROL_CODE
 ;;R^"863.3:",.02,"E"
 ;;D^PATIENT
 ;;R^"863.3:",.04,"E"
 ;;D^HL7
 ;;R^"863.3:",.05,"E"
 ;;D^HL7 CONTROL CODE
 ;;R^"863.3:","863.32:1",.01,"E"
 ;;D^OCXO VARIABLE NAME
 ;;R^"863.3:","863.32:1",1,"E"
 ;;D^OCXODATA("ORC",1)
 ;;R^"863.3:","863.32:2",.01,"E"
 ;;D^OCXO VT-BAR PIECE NUMBER
 ;;R^"863.3:","863.32:3",.01,"E"
 ;;D^OCXO UP-ARROW PIECE NUMBER
 ;;R^"863.3:","863.32:3",1,"E"
 ;;D^1
 ;;R^"863.3:","863.32:4",.01,"E"
 ;;D^OCXO HL7 SEGMENT ID
 ;;R^"863.3:","863.32:5",.01,"E"
 ;;D^OCXO DATA DRIVE SOURCE
 ;;R^"863.3:","863.32:5",1,"E"
 ;;D^HL7
 ;;EOR^
 ;;KEY^863.3:^PATIENT.HL7_ORDERING_PROVIDER
 ;;R^"863.3:",.01,"E"
 ;;D^PATIENT.HL7_ORDERING_PROVIDER
 ;;R^"863.3:",.02,"E"
 ;;D^PATIENT
 ;;R^"863.3:",.04,"E"
 ;;D^HL7
 ;;R^"863.3:",.05,"E"
 ;;D^HL7 ORDERING PROVIDER
 ;;R^"863.3:","863.32:1",.01,"E"
 ;;D^OCXO VARIABLE NAME
 ;;R^"863.3:","863.32:1",1,"E"
 ;;D^OCXODATA("ORC",12)
 ;;R^"863.3:","863.32:2",.01,"E"
 ;;D^OCXO VT-BAR PIECE NUMBER
 ;;R^"863.3:","863.32:3",.01,"E"
 ;;D^OCXO UP-ARROW PIECE NUMBER
 ;;R^"863.3:","863.32:3",1,"E"
 ;;D^1
 ;;R^"863.3:","863.32:4",.01,"E"
 ;;D^OCXO HL7 SEGMENT ID
 ;;R^"863.3:","863.32:5",.01,"E"
 ;;D^OCXO DATA DRIVE SOURCE
 ;;R^"863.3:","863.32:5",1,"E"
 ;;D^HL7
 ;;R^"863.3:","863.32:6",.01,"E"
 ;;D^OCXO FILE POINTER
 ;;R^"863.3:","863.32:6",1,"E"
 ;;D^200
 ;;EOR^
 ;;KEY^863.3:^PATIENT.HL7_STATUS
 ;;R^"863.3:",.01,"E"
 ;;D^PATIENT.HL7_STATUS
 ;;R^"863.3:",.02,"E"
 ;;D^PATIENT
 ;;R^"863.3:",.04,"E"
 ;;D^HL7
 ;;R^"863.3:",.05,"E"
 ;;D^HL7 STATUS
 ;;R^"863.3:","863.32:1",.01,"E"
 ;;D^OCXO VARIABLE NAME
 ;;R^"863.3:","863.32:1",1,"E"
 ;;D^OCXODATA("OBX",11)
 ;;R^"863.3:","863.32:2",.01,"E"
 ;;D^OCXO VT-BAR PIECE NUMBER
 ;;R^"863.3:","863.32:3",.01,"E"
 ;;D^OCXO UP-ARROW PIECE NUMBER
 ;;R^"863.3:","863.32:3",1,"E"
 ;;D^1
 ;;R^"863.3:","863.32:4",.01,"E"
 ;;D^OCXO HL7 SEGMENT ID
 ;;R^"863.3:","863.32:5",.01,"E"
 ;;D^OCXO DATA DRIVE SOURCE
 ;;R^"863.3:","863.32:5",1,"E"
 ;;D^HL7
 ;;EOR^
 ;;KEY^863.3:^PATIENT.HL7_ORDER_START_D/T
 ;;R^"863.3:",.01,"E"
 ;;D^PATIENT.HL7_ORDER_START_D/T
 ;;R^"863.3:",.02,"E"
 ;;D^PATIENT
 ;;R^"863.3:",.04,"E"
 ;;D^HL7
 ;;R^"863.3:",.05,"E"
 ;;D^HL7 ORDER START D/T
 ;;R^"863.3:","863.32:1",.01,"E"
 ;;D^OCXO VARIABLE NAME
 ;;R^"863.3:","863.32:1",1,"E"
 ;;D^OCXODATA("ORC",15)
 ;;R^"863.3:","863.32:2",.01,"E"
 ;;D^OCXO VT-BAR PIECE NUMBER
 ;;R^"863.3:","863.32:3",.01,"E"
 ;;D^OCXO UP-ARROW PIECE NUMBER
 ;;R^"863.3:","863.32:3",1,"E"
 ;;D^1
 ;;R^"863.3:","863.32:4",.01,"E"
 ;;D^OCXO HL7 SEGMENT ID
 ;;R^"863.3:","863.32:5",.01,"E"
 ;;D^OCXO DATA DRIVE SOURCE
 ;;R^"863.3:","863.32:5",1,"E"
 ;;D^HL7
 ;;EOR^
 ;;KEY^863.3:^PATIENT.HL7_ORDER_PRIORITY
 ;;R^"863.3:",.01,"E"
 ;;D^PATIENT.HL7_ORDER_PRIORITY
 ;;R^"863.3:",.02,"E"
 ;;D^PATIENT
 ;;R^"863.3:",.04,"E"
 ;;D^HL7
 ;;R^"863.3:",.05,"E"
 ;;D^ORDER PRIORITY
 ;;R^"863.3:","863.32:1",.01,"E"
 ;;D^OCXO VARIABLE NAME
 ;;R^"863.3:","863.32:1",1,"E"
 ;;D^OCXODATA("OBR",27)
 ;;R^"863.3:","863.32:2",.01,"E"
 ;;D^OCXO HL7 SEGMENT ID
 ;;R^"863.3:","863.32:3",.01,"E"
 ;;D^OCXO VT-BAR PIECE NUMBER
 ;;R^"863.3:","863.32:4",.01,"E"
 ;;D^OCXO UP-ARROW PIECE NUMBER
 ;;R^"863.3:","863.32:4",1,"E"
 ;;D^6
 ;;R^"863.3:","863.32:5",.01,"E"
 ;;D^OCXO DATA DRIVE SOURCE
 ;;R^"863.3:","863.32:5",1,"E"
 ;;D^HL7
 ;;R^"863.3:","863.32:6",.01,"E"
 ;;D^OCXO SEMI-COLON PIECE NUMBER
 ;;R^"863.3:","863.32:6",1,"E"
 ;;D^1
 ;;EOR^
 ;;KEY^863.3:^PATIENT.RESULT_STATUS
 ;;R^"863.3:",.01,"E"
 ;;D^PATIENT.RESULT_STATUS
 ;;R^"863.3:",.02,"E"
 ;;D^PATIENT
 ;;R^"863.3:",.04,"E"
 ;;D^HL7
 ;;R^"863.3:",.05,"E"
 ;;D^RESULT STATUS OBX
 ;;R^"863.3:","863.32:1",.01,"E"
 ;;D^OCXO VARIABLE NAME
 ;;R^"863.3:","863.32:1",1,"E"
 ;;D^OCXODATA("OBX",11)
 ;;R^"863.3:","863.32:2",.01,"E"
 ;;D^OCXO HL7 SEGMENT ID
 ;;R^"863.3:","863.32:3",.01,"E"
 ;;D^OCXO VT-BAR PIECE NUMBER
 ;;R^"863.3:","863.32:4",.01,"E"
 ;;D^OCXO UP-ARROW PIECE NUMBER
 ;;R^"863.3:","863.32:4",1,"E"
 ;;D^1
 ;;R^"863.3:","863.32:5",.01,"E"
 ;;D^OCXO DATA DRIVE SOURCE
 ;;R^"863.3:","863.32:5",1,"E"
 ;;D^HL7
 ;;EOR^
 ;;KEY^863.3:^PATIENT.HL7_ABNORMAL_FLAG
 ;;R^"863.3:",.01,"E"
 ;;D^PATIENT.HL7_ABNORMAL_FLAG
 ;;R^"863.3:",.02,"E"
 ;;D^PATIENT
 ;;R^"863.3:",.04,"E"
 ;;D^HL7
 ;;R^"863.3:",.05,"E"
 ;;D^ABNORM FLAG
 ;;R^"863.3:","863.32:1",.01,"E"
 ;;D^OCXO VARIABLE NAME
 ;;R^"863.3:","863.32:1",1,"E"
 ;;D^OCXODATA("OBX",8)
 ;;R^"863.3:","863.32:2",.01,"E"
 ;;D^OCXO HL7 SEGMENT ID
 ;;R^"863.3:","863.32:3",.01,"E"
 ;;D^OCXO VT-BAR PIECE NUMBER
 ;;R^"863.3:","863.32:4",.01,"E"
 ;;D^OCXO UP-ARROW PIECE NUMBER
 ;;R^"863.3:","863.32:4",1,"E"
 ;;D^1
 ;;R^"863.3:","863.32:5",.01,"E"
 ;;D^OCXO DATA DRIVE SOURCE
 ;;R^"863.3:","863.32:5",1,"E"
 ;1;
 ;
