IBDEI1B0 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,23095,1,5,0)
 ;;=5^Insect Bite, Not Infected
 ;;^UTILITY(U,$J,358.3,23095,2)
 ;;=^63612
 ;;^UTILITY(U,$J,358.3,23096,0)
 ;;=919.7^^125^1401^17
 ;;^UTILITY(U,$J,358.3,23096,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23096,1,4,0)
 ;;=4^919.7
 ;;^UTILITY(U,$J,358.3,23096,1,5,0)
 ;;=5^Sup Foreign Body Infected
 ;;^UTILITY(U,$J,358.3,23096,2)
 ;;=^275362
 ;;^UTILITY(U,$J,358.3,23097,0)
 ;;=919.6^^125^1401^18
 ;;^UTILITY(U,$J,358.3,23097,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23097,1,4,0)
 ;;=4^919.6
 ;;^UTILITY(U,$J,358.3,23097,1,5,0)
 ;;=5^Sup Foreign Body No Infec
 ;;^UTILITY(U,$J,358.3,23097,2)
 ;;=^275361
 ;;^UTILITY(U,$J,358.3,23098,0)
 ;;=919.9^^125^1401^19
 ;;^UTILITY(U,$J,358.3,23098,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23098,1,4,0)
 ;;=4^919.9
 ;;^UTILITY(U,$J,358.3,23098,1,5,0)
 ;;=5^Sup Injury, Infected
 ;;^UTILITY(U,$J,358.3,23098,2)
 ;;=^275364
 ;;^UTILITY(U,$J,358.3,23099,0)
 ;;=919.8^^125^1401^20
 ;;^UTILITY(U,$J,358.3,23099,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23099,1,4,0)
 ;;=4^919.8
 ;;^UTILITY(U,$J,358.3,23099,1,5,0)
 ;;=5^Sup Injury, Not Infected
 ;;^UTILITY(U,$J,358.3,23099,2)
 ;;=^275363
 ;;^UTILITY(U,$J,358.3,23100,0)
 ;;=840.0^^125^1401^11
 ;;^UTILITY(U,$J,358.3,23100,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23100,1,4,0)
 ;;=4^840.0
 ;;^UTILITY(U,$J,358.3,23100,1,5,0)
 ;;=5^Shoulder Sprain
 ;;^UTILITY(U,$J,358.3,23100,2)
 ;;=Shoulder Sprain^274465
 ;;^UTILITY(U,$J,358.3,23101,0)
 ;;=840.4^^125^1401^15
 ;;^UTILITY(U,$J,358.3,23101,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23101,1,4,0)
 ;;=4^840.4
 ;;^UTILITY(U,$J,358.3,23101,1,5,0)
 ;;=5^Sprain, Rotator Cuff
 ;;^UTILITY(U,$J,358.3,23101,2)
 ;;=Sprain, Rotator Cuff^274469
 ;;^UTILITY(U,$J,358.3,23102,0)
 ;;=841.9^^125^1401^14
 ;;^UTILITY(U,$J,358.3,23102,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23102,1,4,0)
 ;;=4^841.9
 ;;^UTILITY(U,$J,358.3,23102,1,5,0)
 ;;=5^Sprain, Elbow
 ;;^UTILITY(U,$J,358.3,23102,2)
 ;;=Sprain, Elbow^274480
 ;;^UTILITY(U,$J,358.3,23103,0)
 ;;=842.00^^125^1401^16
 ;;^UTILITY(U,$J,358.3,23103,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23103,1,4,0)
 ;;=4^842.00
 ;;^UTILITY(U,$J,358.3,23103,1,5,0)
 ;;=5^Sprain, Wrist
 ;;^UTILITY(U,$J,358.3,23103,2)
 ;;=Sprain, Wrist^274483
 ;;^UTILITY(U,$J,358.3,23104,0)
 ;;=844.8^^125^1401^12
 ;;^UTILITY(U,$J,358.3,23104,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23104,1,4,0)
 ;;=4^844.8
 ;;^UTILITY(U,$J,358.3,23104,1,5,0)
 ;;=5^Sprain of Knee
 ;;^UTILITY(U,$J,358.3,23104,2)
 ;;=Sprain of Knee^274503
 ;;^UTILITY(U,$J,358.3,23105,0)
 ;;=845.00^^125^1401^13
 ;;^UTILITY(U,$J,358.3,23105,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23105,1,4,0)
 ;;=4^845.00
 ;;^UTILITY(U,$J,358.3,23105,1,5,0)
 ;;=5^Sprain, Ankle
 ;;^UTILITY(U,$J,358.3,23105,2)
 ;;=^274507
 ;;^UTILITY(U,$J,358.3,23106,0)
 ;;=949.1^^125^1401^7
 ;;^UTILITY(U,$J,358.3,23106,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23106,1,4,0)
 ;;=4^949.1
 ;;^UTILITY(U,$J,358.3,23106,1,5,0)
 ;;=5^Burn,First Degree,Unspec Site
 ;;^UTILITY(U,$J,358.3,23106,2)
 ;;=^275878
 ;;^UTILITY(U,$J,358.3,23107,0)
 ;;=949.3^^125^1401^8
 ;;^UTILITY(U,$J,358.3,23107,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23107,1,4,0)
 ;;=4^949.3
 ;;^UTILITY(U,$J,358.3,23107,1,5,0)
 ;;=5^Burn,Second Degree,Unspec Site
 ;;^UTILITY(U,$J,358.3,23107,2)
 ;;=^275880
 ;;^UTILITY(U,$J,358.3,23108,0)
 ;;=919.1^^125^1402^18
 ;;^UTILITY(U,$J,358.3,23108,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23108,1,4,0)
 ;;=4^919.1
 ;;^UTILITY(U,$J,358.3,23108,1,5,0)
 ;;=5^Abrasion, infected
 ;;^UTILITY(U,$J,358.3,23108,2)
 ;;=^275358
 ;;
 ;;$END ROU IBDEI1B0
