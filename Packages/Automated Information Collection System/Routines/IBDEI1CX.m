IBDEI1CX ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24040,1,1,0)
 ;;=1^COMP HX/EXAM,HIGH COMP MDM
 ;;^UTILITY(U,$J,358.3,24040,1,2,0)
 ;;=2^99255
 ;;^UTILITY(U,$J,358.3,24041,0)
 ;;=99221^^132^1462^1
 ;;^UTILITY(U,$J,358.3,24041,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24041,1,1,0)
 ;;=1^DETAILED/COMP HX/EXAM,SF MDM
 ;;^UTILITY(U,$J,358.3,24041,1,2,0)
 ;;=2^99221
 ;;^UTILITY(U,$J,358.3,24042,0)
 ;;=99222^^132^1462^2
 ;;^UTILITY(U,$J,358.3,24042,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24042,1,1,0)
 ;;=1^COMP HX/EXAM,MOD MDM
 ;;^UTILITY(U,$J,358.3,24042,1,2,0)
 ;;=2^99222
 ;;^UTILITY(U,$J,358.3,24043,0)
 ;;=99223^^132^1462^3
 ;;^UTILITY(U,$J,358.3,24043,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24043,1,1,0)
 ;;=1^COMP HX/EXAM,HIGH MDM
 ;;^UTILITY(U,$J,358.3,24043,1,2,0)
 ;;=2^99223
 ;;^UTILITY(U,$J,358.3,24044,0)
 ;;=99231^^132^1463^1
 ;;^UTILITY(U,$J,358.3,24044,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24044,1,1,0)
 ;;=1^PF HX/EXAM,SF MDM
 ;;^UTILITY(U,$J,358.3,24044,1,2,0)
 ;;=2^99231
 ;;^UTILITY(U,$J,358.3,24045,0)
 ;;=99232^^132^1463^2
 ;;^UTILITY(U,$J,358.3,24045,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24045,1,1,0)
 ;;=1^EPF HX/EXAM,MOD MDM
 ;;^UTILITY(U,$J,358.3,24045,1,2,0)
 ;;=2^99232
 ;;^UTILITY(U,$J,358.3,24046,0)
 ;;=99233^^132^1463^3
 ;;^UTILITY(U,$J,358.3,24046,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24046,1,1,0)
 ;;=1^DET HX/EXAM,HIGH MDM
 ;;^UTILITY(U,$J,358.3,24046,1,2,0)
 ;;=2^99233
 ;;^UTILITY(U,$J,358.3,24047,0)
 ;;=99238^^132^1464^1
 ;;^UTILITY(U,$J,358.3,24047,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24047,1,1,0)
 ;;=1^D/C Visit incl Pronouncement of Death < 31min
 ;;^UTILITY(U,$J,358.3,24047,1,2,0)
 ;;=2^99238
 ;;^UTILITY(U,$J,358.3,24048,0)
 ;;=99239^^132^1464^2
 ;;^UTILITY(U,$J,358.3,24048,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24048,1,1,0)
 ;;=1^D/C Visit incl Pronouncement of Death > 30min
 ;;^UTILITY(U,$J,358.3,24048,1,2,0)
 ;;=2^99239
 ;;^UTILITY(U,$J,358.3,24049,0)
 ;;=99304^^132^1465^1
 ;;^UTILITY(U,$J,358.3,24049,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24049,1,1,0)
 ;;=1^DETAILED/COMP HX/EXAM,SF MDM
 ;;^UTILITY(U,$J,358.3,24049,1,2,0)
 ;;=2^99304
 ;;^UTILITY(U,$J,358.3,24050,0)
 ;;=99305^^132^1465^2
 ;;^UTILITY(U,$J,358.3,24050,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24050,1,1,0)
 ;;=1^COMP HX/EXAM,MOD MDM
 ;;^UTILITY(U,$J,358.3,24050,1,2,0)
 ;;=2^99305
 ;;^UTILITY(U,$J,358.3,24051,0)
 ;;=99306^^132^1465^3
 ;;^UTILITY(U,$J,358.3,24051,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24051,1,1,0)
 ;;=1^COMP HX/EXAM,HIGH MDM
 ;;^UTILITY(U,$J,358.3,24051,1,2,0)
 ;;=2^99306
 ;;^UTILITY(U,$J,358.3,24052,0)
 ;;=99307^^132^1466^1
 ;;^UTILITY(U,$J,358.3,24052,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24052,1,1,0)
 ;;=1^PF HX/EXAM,SF MDM
 ;;^UTILITY(U,$J,358.3,24052,1,2,0)
 ;;=2^99307
 ;;^UTILITY(U,$J,358.3,24053,0)
 ;;=99308^^132^1466^2
 ;;^UTILITY(U,$J,358.3,24053,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24053,1,1,0)
 ;;=1^EPF HX/EXAM,MOD MDM
 ;;^UTILITY(U,$J,358.3,24053,1,2,0)
 ;;=2^99308
 ;;^UTILITY(U,$J,358.3,24054,0)
 ;;=99309^^132^1466^3
 ;;^UTILITY(U,$J,358.3,24054,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24054,1,1,0)
 ;;=1^DETAILED HX/EXAM,HIGH MDM
 ;;^UTILITY(U,$J,358.3,24054,1,2,0)
 ;;=2^99309
 ;;^UTILITY(U,$J,358.3,24055,0)
 ;;=99310^^132^1466^4
 ;;^UTILITY(U,$J,358.3,24055,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24055,1,1,0)
 ;;=1^COMP HX/EXAM,HIGH MDM
 ;;^UTILITY(U,$J,358.3,24055,1,2,0)
 ;;=2^99310
 ;;^UTILITY(U,$J,358.3,24056,0)
 ;;=99315^^132^1467^1
 ;;^UTILITY(U,$J,358.3,24056,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24056,1,1,0)
 ;;=1^NH DISCHARGE DAY MGMT,30 MIN OR LESS
 ;;
 ;;$END ROU IBDEI1CX
