IBDEI1CD ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,23764,2)
 ;;=^89209
 ;;^UTILITY(U,$J,358.3,23765,0)
 ;;=V11.4^^127^1432^20
 ;;^UTILITY(U,$J,358.3,23765,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23765,1,2,0)
 ;;=2^V11.4
 ;;^UTILITY(U,$J,358.3,23765,1,5,0)
 ;;=5^Hx Combat/Operational Stress
 ;;^UTILITY(U,$J,358.3,23765,2)
 ;;=^339674
 ;;^UTILITY(U,$J,358.3,23766,0)
 ;;=V60.1^^127^1432^22
 ;;^UTILITY(U,$J,358.3,23766,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23766,1,2,0)
 ;;=2^V60.1
 ;;^UTILITY(U,$J,358.3,23766,1,5,0)
 ;;=5^Inadequate Housing
 ;;^UTILITY(U,$J,358.3,23766,2)
 ;;=^295540
 ;;^UTILITY(U,$J,358.3,23767,0)
 ;;=V62.84^^127^1432^49
 ;;^UTILITY(U,$J,358.3,23767,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23767,1,2,0)
 ;;=2^V62.84
 ;;^UTILITY(U,$J,358.3,23767,1,5,0)
 ;;=5^Suicidal Ideation
 ;;^UTILITY(U,$J,358.3,23767,2)
 ;;=^332876
 ;;^UTILITY(U,$J,358.3,23768,0)
 ;;=V62.85^^127^1432^18
 ;;^UTILITY(U,$J,358.3,23768,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23768,1,2,0)
 ;;=2^V62.85
 ;;^UTILITY(U,$J,358.3,23768,1,5,0)
 ;;=5^Homicidal Ideation
 ;;^UTILITY(U,$J,358.3,23768,2)
 ;;=^339690
 ;;^UTILITY(U,$J,358.3,23769,0)
 ;;=V58.61^^127^1432^25
 ;;^UTILITY(U,$J,358.3,23769,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23769,1,2,0)
 ;;=2^V58.61
 ;;^UTILITY(U,$J,358.3,23769,1,5,0)
 ;;=5^L/T (Current) Anticoagulant Use
 ;;^UTILITY(U,$J,358.3,23769,2)
 ;;=^303459
 ;;^UTILITY(U,$J,358.3,23770,0)
 ;;=V58.62^^127^1432^24
 ;;^UTILITY(U,$J,358.3,23770,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23770,1,2,0)
 ;;=2^V58.62
 ;;^UTILITY(U,$J,358.3,23770,1,5,0)
 ;;=5^L/T (Current) Antibiotics Use
 ;;^UTILITY(U,$J,358.3,23770,2)
 ;;=^321546
 ;;^UTILITY(U,$J,358.3,23771,0)
 ;;=V58.63^^127^1432^26
 ;;^UTILITY(U,$J,358.3,23771,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23771,1,2,0)
 ;;=2^V58.63
 ;;^UTILITY(U,$J,358.3,23771,1,5,0)
 ;;=5^L/T (Current) Antiplts/Antithrmbtcs
 ;;^UTILITY(U,$J,358.3,23771,2)
 ;;=^329978
 ;;^UTILITY(U,$J,358.3,23772,0)
 ;;=V58.64^^127^1432^30
 ;;^UTILITY(U,$J,358.3,23772,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23772,1,2,0)
 ;;=2^V58.64
 ;;^UTILITY(U,$J,358.3,23772,1,5,0)
 ;;=5^L/T (Current) NSAIDS Use
 ;;^UTILITY(U,$J,358.3,23772,2)
 ;;=^329979
 ;;^UTILITY(U,$J,358.3,23773,0)
 ;;=V58.65^^127^1432^32
 ;;^UTILITY(U,$J,358.3,23773,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23773,1,2,0)
 ;;=2^V58.65
 ;;^UTILITY(U,$J,358.3,23773,1,5,0)
 ;;=5^L/T (Current) Steroids Use
 ;;^UTILITY(U,$J,358.3,23773,2)
 ;;=^329980
 ;;^UTILITY(U,$J,358.3,23774,0)
 ;;=V58.66^^127^1432^27
 ;;^UTILITY(U,$J,358.3,23774,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23774,1,2,0)
 ;;=2^V58.66
 ;;^UTILITY(U,$J,358.3,23774,1,5,0)
 ;;=5^L/T (Current) Aspirin Use
 ;;^UTILITY(U,$J,358.3,23774,2)
 ;;=^331584
 ;;^UTILITY(U,$J,358.3,23775,0)
 ;;=V58.67^^127^1432^29
 ;;^UTILITY(U,$J,358.3,23775,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23775,1,2,0)
 ;;=2^V58.67
 ;;^UTILITY(U,$J,358.3,23775,1,5,0)
 ;;=5^L/T (Current) Insulin Use
 ;;^UTILITY(U,$J,358.3,23775,2)
 ;;=^331585
 ;;^UTILITY(U,$J,358.3,23776,0)
 ;;=V58.68^^127^1432^28
 ;;^UTILITY(U,$J,358.3,23776,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23776,1,2,0)
 ;;=2^V58.68
 ;;^UTILITY(U,$J,358.3,23776,1,5,0)
 ;;=5^L/T (Current) Bisphos Use
 ;;^UTILITY(U,$J,358.3,23776,2)
 ;;=^340624
 ;;^UTILITY(U,$J,358.3,23777,0)
 ;;=V58.69^^127^1432^31
 ;;^UTILITY(U,$J,358.3,23777,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23777,1,2,0)
 ;;=2^V58.69
 ;;^UTILITY(U,$J,358.3,23777,1,5,0)
 ;;=5^L/T (Current) Other Meds Use
 ;;^UTILITY(U,$J,358.3,23777,2)
 ;;=^303460
 ;;^UTILITY(U,$J,358.3,23778,0)
 ;;=V58.83^^127^1432^50
 ;;
 ;;$END ROU IBDEI1CD
