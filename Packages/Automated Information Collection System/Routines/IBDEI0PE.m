IBDEI0PE ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,12136,1,3,0)
 ;;=3^Biopsy of Nerve
 ;;^UTILITY(U,$J,358.3,12137,0)
 ;;=20200^^59^716^2^^^^1
 ;;^UTILITY(U,$J,358.3,12137,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12137,1,2,0)
 ;;=2^20200
 ;;^UTILITY(U,$J,358.3,12137,1,3,0)
 ;;=3^Muscle Biopsy, Superficial
 ;;^UTILITY(U,$J,358.3,12138,0)
 ;;=20205^^59^716^3^^^^1
 ;;^UTILITY(U,$J,358.3,12138,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12138,1,2,0)
 ;;=2^20205
 ;;^UTILITY(U,$J,358.3,12138,1,3,0)
 ;;=3^Muscle Biopsy,Deep
 ;;^UTILITY(U,$J,358.3,12139,0)
 ;;=95921^^59^717^1^^^^1
 ;;^UTILITY(U,$J,358.3,12139,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12139,1,2,0)
 ;;=2^95921
 ;;^UTILITY(U,$J,358.3,12139,1,3,0)
 ;;=3^Autonomic Nerv Function Test
 ;;^UTILITY(U,$J,358.3,12140,0)
 ;;=95922^^59^717^2^^^^1
 ;;^UTILITY(U,$J,358.3,12140,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12140,1,2,0)
 ;;=2^95922
 ;;^UTILITY(U,$J,358.3,12140,1,3,0)
 ;;=3^ANS; Vasomotor Adrenergic Innervation
 ;;^UTILITY(U,$J,358.3,12141,0)
 ;;=95923^^59^717^3^^^^1
 ;;^UTILITY(U,$J,358.3,12141,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12141,1,2,0)
 ;;=2^95923
 ;;^UTILITY(U,$J,358.3,12141,1,3,0)
 ;;=3^ANS; Sudomotor
 ;;^UTILITY(U,$J,358.3,12142,0)
 ;;=61796^^59^718^1^^^^1
 ;;^UTILITY(U,$J,358.3,12142,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12142,1,2,0)
 ;;=2^61796
 ;;^UTILITY(U,$J,358.3,12142,1,3,0)
 ;;=3^SRS Cranial Lesion,Simple
 ;;^UTILITY(U,$J,358.3,12143,0)
 ;;=61797^^59^718^2^^^^1
 ;;^UTILITY(U,$J,358.3,12143,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12143,1,2,0)
 ;;=2^61797
 ;;^UTILITY(U,$J,358.3,12143,1,3,0)
 ;;=3^SRS Cranial Lesion,Simple,Addl Lesion
 ;;^UTILITY(U,$J,358.3,12144,0)
 ;;=61800^^59^718^3^^^^1
 ;;^UTILITY(U,$J,358.3,12144,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12144,1,2,0)
 ;;=2^61800
 ;;^UTILITY(U,$J,358.3,12144,1,3,0)
 ;;=3^Apply SRS Headframe,Add-On
 ;;^UTILITY(U,$J,358.3,12145,0)
 ;;=98960^^59^719^1^^^^1
 ;;^UTILITY(U,$J,358.3,12145,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12145,1,2,0)
 ;;=2^98960
 ;;^UTILITY(U,$J,358.3,12145,1,3,0)
 ;;=3^Self-Mgmt Ed/Train,1 Pt
 ;;^UTILITY(U,$J,358.3,12146,0)
 ;;=98961^^59^719^2^^^^1
 ;;^UTILITY(U,$J,358.3,12146,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12146,1,2,0)
 ;;=2^98961
 ;;^UTILITY(U,$J,358.3,12146,1,3,0)
 ;;=3^Self-Mgmt Ed/Train,2-4 Pts
 ;;^UTILITY(U,$J,358.3,12147,0)
 ;;=98962^^59^719^3^^^^1
 ;;^UTILITY(U,$J,358.3,12147,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12147,1,2,0)
 ;;=2^98962
 ;;^UTILITY(U,$J,358.3,12147,1,3,0)
 ;;=3^Self-Mgmt Ed/Train,5-8 Pts
 ;;^UTILITY(U,$J,358.3,12148,0)
 ;;=95971^^59^720^3^^^^1
 ;;^UTILITY(U,$J,358.3,12148,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12148,1,2,0)
 ;;=2^95971
 ;;^UTILITY(U,$J,358.3,12148,1,3,0)
 ;;=3^Analyze Neurostim,Simple
 ;;^UTILITY(U,$J,358.3,12149,0)
 ;;=95972^^59^720^2^^^^1
 ;;^UTILITY(U,$J,358.3,12149,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12149,1,2,0)
 ;;=2^95972
 ;;^UTILITY(U,$J,358.3,12149,1,3,0)
 ;;=3^Analyze Neurostim,Complex,up to 1hr
 ;;^UTILITY(U,$J,358.3,12150,0)
 ;;=95973^^59^720^1^^^^1
 ;;^UTILITY(U,$J,358.3,12150,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12150,1,2,0)
 ;;=2^95973
 ;;^UTILITY(U,$J,358.3,12150,1,3,0)
 ;;=3^Analyze Neurostim,Complex,Ea Addl 30 Min
 ;;^UTILITY(U,$J,358.3,12151,0)
 ;;=95974^^59^720^4^^^^1
 ;;^UTILITY(U,$J,358.3,12151,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12151,1,2,0)
 ;;=2^95974
 ;;^UTILITY(U,$J,358.3,12151,1,3,0)
 ;;=3^Cranial Neurostim,Complex,1st Hr
 ;;^UTILITY(U,$J,358.3,12152,0)
 ;;=95975^^59^720^5^^^^1
 ;;^UTILITY(U,$J,358.3,12152,1,0)
 ;;=^358.31IA^3^2
 ;;
 ;;$END ROU IBDEI0PE
