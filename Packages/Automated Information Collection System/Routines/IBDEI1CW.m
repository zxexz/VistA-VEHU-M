IBDEI1CW ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24025,1,3,0)
 ;;=3^Hypertension
 ;;^UTILITY(U,$J,358.3,24025,1,4,0)
 ;;=4^401.9
 ;;^UTILITY(U,$J,358.3,24025,2)
 ;;=^186630
 ;;^UTILITY(U,$J,358.3,24026,0)
 ;;=250.01^^130^1458^10
 ;;^UTILITY(U,$J,358.3,24026,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24026,1,3,0)
 ;;=3^DM Type I w/o Complications
 ;;^UTILITY(U,$J,358.3,24026,1,4,0)
 ;;=4^250.01
 ;;^UTILITY(U,$J,358.3,24026,2)
 ;;=^331780
 ;;^UTILITY(U,$J,358.3,24027,0)
 ;;=907.0^^130^1458^14
 ;;^UTILITY(U,$J,358.3,24027,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24027,1,3,0)
 ;;=3^Lt Eff Intracranial Inj
 ;;^UTILITY(U,$J,358.3,24027,1,4,0)
 ;;=4^907.0
 ;;^UTILITY(U,$J,358.3,24027,2)
 ;;=^68489
 ;;^UTILITY(U,$J,358.3,24028,0)
 ;;=438.9^^130^1458^13
 ;;^UTILITY(U,$J,358.3,24028,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24028,1,3,0)
 ;;=3^Lt Eff Cerebrovascular Disease,Unspec
 ;;^UTILITY(U,$J,358.3,24028,1,4,0)
 ;;=4^438.9
 ;;^UTILITY(U,$J,358.3,24028,2)
 ;;=^269757
 ;;^UTILITY(U,$J,358.3,24029,0)
 ;;=99377^^131^1459^2^^^^1
 ;;^UTILITY(U,$J,358.3,24029,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24029,1,1,0)
 ;;=1^99377
 ;;^UTILITY(U,$J,358.3,24029,1,2,0)
 ;;=2^Hospice Care Supervision,15-29 min
 ;;^UTILITY(U,$J,358.3,24030,0)
 ;;=99378^^131^1459^3^^^^1
 ;;^UTILITY(U,$J,358.3,24030,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24030,1,1,0)
 ;;=1^99378
 ;;^UTILITY(U,$J,358.3,24030,1,2,0)
 ;;=2^Hospice Care Supervision,30 min or more
 ;;^UTILITY(U,$J,358.3,24031,0)
 ;;=G0182^^131^1459^1^^^^1
 ;;^UTILITY(U,$J,358.3,24031,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24031,1,1,0)
 ;;=1^G0182
 ;;^UTILITY(U,$J,358.3,24031,1,2,0)
 ;;=2^Hospice Care-Use with each encounter
 ;;^UTILITY(U,$J,358.3,24032,0)
 ;;=99356^^131^1460^1^^^^1
 ;;^UTILITY(U,$J,358.3,24032,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24032,1,1,0)
 ;;=1^99356
 ;;^UTILITY(U,$J,358.3,24032,1,2,0)
 ;;=2^Prolonged Services F-T-F,1st Hr
 ;;^UTILITY(U,$J,358.3,24033,0)
 ;;=99357^^131^1460^2^^^^1
 ;;^UTILITY(U,$J,358.3,24033,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24033,1,1,0)
 ;;=1^99357
 ;;^UTILITY(U,$J,358.3,24033,1,2,0)
 ;;=2^Prolonged Services F-T-F,Ea Addl 30min
 ;;^UTILITY(U,$J,358.3,24034,0)
 ;;=99358^^131^1460^3^^^^1
 ;;^UTILITY(U,$J,358.3,24034,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24034,1,1,0)
 ;;=1^99358
 ;;^UTILITY(U,$J,358.3,24034,1,2,0)
 ;;=2^Prolonged Services w/o Contact,1st Hr
 ;;^UTILITY(U,$J,358.3,24035,0)
 ;;=99359^^131^1460^4^^^^1
 ;;^UTILITY(U,$J,358.3,24035,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24035,1,1,0)
 ;;=1^99359
 ;;^UTILITY(U,$J,358.3,24035,1,2,0)
 ;;=2^Prolonged Svc w/o Contact,Ea Addl 30min
 ;;^UTILITY(U,$J,358.3,24036,0)
 ;;=99251^^132^1461^1
 ;;^UTILITY(U,$J,358.3,24036,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24036,1,1,0)
 ;;=1^PF HX/EXAM,SF MDM
 ;;^UTILITY(U,$J,358.3,24036,1,2,0)
 ;;=2^99251
 ;;^UTILITY(U,$J,358.3,24037,0)
 ;;=99252^^132^1461^2
 ;;^UTILITY(U,$J,358.3,24037,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24037,1,1,0)
 ;;=1^EPF HX/EXAM,SF MDM
 ;;^UTILITY(U,$J,358.3,24037,1,2,0)
 ;;=2^99252
 ;;^UTILITY(U,$J,358.3,24038,0)
 ;;=99253^^132^1461^3
 ;;^UTILITY(U,$J,358.3,24038,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24038,1,1,0)
 ;;=1^DET HX/EXAM,LOW MDM
 ;;^UTILITY(U,$J,358.3,24038,1,2,0)
 ;;=2^99253
 ;;^UTILITY(U,$J,358.3,24039,0)
 ;;=99254^^132^1461^4
 ;;^UTILITY(U,$J,358.3,24039,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24039,1,1,0)
 ;;=1^COMP HX/EXAM,MOD MDM
 ;;^UTILITY(U,$J,358.3,24039,1,2,0)
 ;;=2^99254
 ;;^UTILITY(U,$J,358.3,24040,0)
 ;;=99255^^132^1461^5
 ;;^UTILITY(U,$J,358.3,24040,1,0)
 ;;=^358.31IA^2^2
 ;;
 ;;$END ROU IBDEI1CW
