IBDEI14F ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,19779,0)
 ;;=V15.88^^105^1235^33
 ;;^UTILITY(U,$J,358.3,19779,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19779,1,4,0)
 ;;=4^V15.88
 ;;^UTILITY(U,$J,358.3,19779,1,5,0)
 ;;=5^Hx of Fall(s)
 ;;^UTILITY(U,$J,358.3,19779,2)
 ;;=^332859
 ;;^UTILITY(U,$J,358.3,19780,0)
 ;;=V13.59^^105^1235^42
 ;;^UTILITY(U,$J,358.3,19780,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19780,1,4,0)
 ;;=4^V13.59
 ;;^UTILITY(U,$J,358.3,19780,1,5,0)
 ;;=5^Hx of Musculosk Disease
 ;;^UTILITY(U,$J,358.3,19780,2)
 ;;=^295268
 ;;^UTILITY(U,$J,358.3,19781,0)
 ;;=V15.52^^105^1235^55
 ;;^UTILITY(U,$J,358.3,19781,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19781,1,4,0)
 ;;=4^V15.52
 ;;^UTILITY(U,$J,358.3,19781,1,5,0)
 ;;=5^Hx of TBI
 ;;^UTILITY(U,$J,358.3,19781,2)
 ;;=^338495
 ;;^UTILITY(U,$J,358.3,19782,0)
 ;;=V12.04^^105^1235^38
 ;;^UTILITY(U,$J,358.3,19782,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19782,1,4,0)
 ;;=4^V12.04
 ;;^UTILITY(U,$J,358.3,19782,1,5,0)
 ;;=5^Hx of MRSA Infection
 ;;^UTILITY(U,$J,358.3,19782,2)
 ;;=^336780
 ;;^UTILITY(U,$J,358.3,19783,0)
 ;;=V13.51^^105^1235^23
 ;;^UTILITY(U,$J,358.3,19783,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19783,1,4,0)
 ;;=4^V13.51
 ;;^UTILITY(U,$J,358.3,19783,1,5,0)
 ;;=5^Hs of Pathological Fx
 ;;^UTILITY(U,$J,358.3,19783,2)
 ;;=^336781
 ;;^UTILITY(U,$J,358.3,19784,0)
 ;;=V15.51^^105^1235^58
 ;;^UTILITY(U,$J,358.3,19784,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19784,1,4,0)
 ;;=4^V15.51
 ;;^UTILITY(U,$J,358.3,19784,1,5,0)
 ;;=5^Hx of Traumatic Fx
 ;;^UTILITY(U,$J,358.3,19784,2)
 ;;=^336786
 ;;^UTILITY(U,$J,358.3,19785,0)
 ;;=V62.22^^105^1235^49
 ;;^UTILITY(U,$J,358.3,19785,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19785,1,4,0)
 ;;=4^V62.22
 ;;^UTILITY(U,$J,358.3,19785,1,5,0)
 ;;=5^Hx of Return from Military Deployment
 ;;^UTILITY(U,$J,358.3,19785,2)
 ;;=^336807
 ;;^UTILITY(U,$J,358.3,19786,0)
 ;;=919.1^^105^1236^1
 ;;^UTILITY(U,$J,358.3,19786,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19786,1,4,0)
 ;;=4^919.1
 ;;^UTILITY(U,$J,358.3,19786,1,5,0)
 ;;=5^Abrasion, Infected
 ;;^UTILITY(U,$J,358.3,19786,2)
 ;;=^275358
 ;;^UTILITY(U,$J,358.3,19787,0)
 ;;=919.0^^105^1236^2
 ;;^UTILITY(U,$J,358.3,19787,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19787,1,4,0)
 ;;=4^919.0
 ;;^UTILITY(U,$J,358.3,19787,1,5,0)
 ;;=5^Abrasion, Not Infected
 ;;^UTILITY(U,$J,358.3,19787,2)
 ;;=^1305
 ;;^UTILITY(U,$J,358.3,19788,0)
 ;;=924.9^^105^1236^3
 ;;^UTILITY(U,$J,358.3,19788,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19788,1,4,0)
 ;;=4^924.9
 ;;^UTILITY(U,$J,358.3,19788,1,5,0)
 ;;=5^Bite, Human, Contusion
 ;;^UTILITY(U,$J,358.3,19788,2)
 ;;=^28117
 ;;^UTILITY(U,$J,358.3,19789,0)
 ;;=879.8^^105^1236^4
 ;;^UTILITY(U,$J,358.3,19789,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19789,1,4,0)
 ;;=4^879.8
 ;;^UTILITY(U,$J,358.3,19789,1,5,0)
 ;;=5^Bite, Human, Penetrating
 ;;^UTILITY(U,$J,358.3,19789,2)
 ;;=^275021
 ;;^UTILITY(U,$J,358.3,19790,0)
 ;;=919.3^^105^1236^5
 ;;^UTILITY(U,$J,358.3,19790,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19790,1,4,0)
 ;;=4^919.3
 ;;^UTILITY(U,$J,358.3,19790,1,5,0)
 ;;=5^Blister, Infected
 ;;^UTILITY(U,$J,358.3,19790,2)
 ;;=^275359
 ;;^UTILITY(U,$J,358.3,19791,0)
 ;;=919.2^^105^1236^6
 ;;^UTILITY(U,$J,358.3,19791,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19791,1,4,0)
 ;;=4^919.2
 ;;^UTILITY(U,$J,358.3,19791,1,5,0)
 ;;=5^Blister, Not Infected
 ;;^UTILITY(U,$J,358.3,19791,2)
 ;;=^15350
 ;;^UTILITY(U,$J,358.3,19792,0)
 ;;=919.5^^105^1236^9
 ;;^UTILITY(U,$J,358.3,19792,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19792,1,4,0)
 ;;=4^919.5
 ;;^UTILITY(U,$J,358.3,19792,1,5,0)
 ;;=5^Insect Bite, Infected
 ;;
 ;;$END ROU IBDEI14F
