IBDEI1HL ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,26375,2)
 ;;=^89209
 ;;^UTILITY(U,$J,358.3,26376,0)
 ;;=V11.4^^152^1681^20
 ;;^UTILITY(U,$J,358.3,26376,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26376,1,2,0)
 ;;=2^V11.4
 ;;^UTILITY(U,$J,358.3,26376,1,5,0)
 ;;=5^Hx Combat/Operational Stress
 ;;^UTILITY(U,$J,358.3,26376,2)
 ;;=^339674
 ;;^UTILITY(U,$J,358.3,26377,0)
 ;;=V60.1^^152^1681^22
 ;;^UTILITY(U,$J,358.3,26377,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26377,1,2,0)
 ;;=2^V60.1
 ;;^UTILITY(U,$J,358.3,26377,1,5,0)
 ;;=5^Inadequate Housing
 ;;^UTILITY(U,$J,358.3,26377,2)
 ;;=^295540
 ;;^UTILITY(U,$J,358.3,26378,0)
 ;;=V62.84^^152^1681^49
 ;;^UTILITY(U,$J,358.3,26378,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26378,1,2,0)
 ;;=2^V62.84
 ;;^UTILITY(U,$J,358.3,26378,1,5,0)
 ;;=5^Suicidal Ideation
 ;;^UTILITY(U,$J,358.3,26378,2)
 ;;=^332876
 ;;^UTILITY(U,$J,358.3,26379,0)
 ;;=V62.85^^152^1681^18
 ;;^UTILITY(U,$J,358.3,26379,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26379,1,2,0)
 ;;=2^V62.85
 ;;^UTILITY(U,$J,358.3,26379,1,5,0)
 ;;=5^Homicidal Ideation
 ;;^UTILITY(U,$J,358.3,26379,2)
 ;;=^339690
 ;;^UTILITY(U,$J,358.3,26380,0)
 ;;=V58.61^^152^1681^25
 ;;^UTILITY(U,$J,358.3,26380,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26380,1,2,0)
 ;;=2^V58.61
 ;;^UTILITY(U,$J,358.3,26380,1,5,0)
 ;;=5^L/T (Current) Anticoagulant Use
 ;;^UTILITY(U,$J,358.3,26380,2)
 ;;=^303459
 ;;^UTILITY(U,$J,358.3,26381,0)
 ;;=V58.62^^152^1681^24
 ;;^UTILITY(U,$J,358.3,26381,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26381,1,2,0)
 ;;=2^V58.62
 ;;^UTILITY(U,$J,358.3,26381,1,5,0)
 ;;=5^L/T (Current) Antibiotics Use
 ;;^UTILITY(U,$J,358.3,26381,2)
 ;;=^321546
 ;;^UTILITY(U,$J,358.3,26382,0)
 ;;=V58.63^^152^1681^26
 ;;^UTILITY(U,$J,358.3,26382,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26382,1,2,0)
 ;;=2^V58.63
 ;;^UTILITY(U,$J,358.3,26382,1,5,0)
 ;;=5^L/T (Current) Antiplts/Antithrmbtcs
 ;;^UTILITY(U,$J,358.3,26382,2)
 ;;=^329978
 ;;^UTILITY(U,$J,358.3,26383,0)
 ;;=V58.64^^152^1681^30
 ;;^UTILITY(U,$J,358.3,26383,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26383,1,2,0)
 ;;=2^V58.64
 ;;^UTILITY(U,$J,358.3,26383,1,5,0)
 ;;=5^L/T (Current) NSAIDS Use
 ;;^UTILITY(U,$J,358.3,26383,2)
 ;;=^329979
 ;;^UTILITY(U,$J,358.3,26384,0)
 ;;=V58.65^^152^1681^32
 ;;^UTILITY(U,$J,358.3,26384,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26384,1,2,0)
 ;;=2^V58.65
 ;;^UTILITY(U,$J,358.3,26384,1,5,0)
 ;;=5^L/T (Current) Steroids Use
 ;;^UTILITY(U,$J,358.3,26384,2)
 ;;=^329980
 ;;^UTILITY(U,$J,358.3,26385,0)
 ;;=V58.66^^152^1681^27
 ;;^UTILITY(U,$J,358.3,26385,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26385,1,2,0)
 ;;=2^V58.66
 ;;^UTILITY(U,$J,358.3,26385,1,5,0)
 ;;=5^L/T (Current) Aspirin Use
 ;;^UTILITY(U,$J,358.3,26385,2)
 ;;=^331584
 ;;^UTILITY(U,$J,358.3,26386,0)
 ;;=V58.67^^152^1681^29
 ;;^UTILITY(U,$J,358.3,26386,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26386,1,2,0)
 ;;=2^V58.67
 ;;^UTILITY(U,$J,358.3,26386,1,5,0)
 ;;=5^L/T (Current) Insulin Use
 ;;^UTILITY(U,$J,358.3,26386,2)
 ;;=^331585
 ;;^UTILITY(U,$J,358.3,26387,0)
 ;;=V58.68^^152^1681^28
 ;;^UTILITY(U,$J,358.3,26387,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26387,1,2,0)
 ;;=2^V58.68
 ;;^UTILITY(U,$J,358.3,26387,1,5,0)
 ;;=5^L/T (Current) Bisphos Use
 ;;^UTILITY(U,$J,358.3,26387,2)
 ;;=^340624
 ;;^UTILITY(U,$J,358.3,26388,0)
 ;;=V58.69^^152^1681^31
 ;;^UTILITY(U,$J,358.3,26388,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,26388,1,2,0)
 ;;=2^V58.69
 ;;^UTILITY(U,$J,358.3,26388,1,5,0)
 ;;=5^L/T (Current) Other Meds Use
 ;;^UTILITY(U,$J,358.3,26388,2)
 ;;=^303460
 ;;^UTILITY(U,$J,358.3,26389,0)
 ;;=V58.83^^152^1681^50
 ;;
 ;;$END ROU IBDEI1HL
