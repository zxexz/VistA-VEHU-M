IBDEI0IK ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,8690,1,5,0)
 ;;=5^Incontinence of Feces
 ;;^UTILITY(U,$J,358.3,8690,2)
 ;;=^339670
 ;;^UTILITY(U,$J,358.3,8691,0)
 ;;=780.61^^35^487^72
 ;;^UTILITY(U,$J,358.3,8691,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8691,1,4,0)
 ;;=4^780.61
 ;;^UTILITY(U,$J,358.3,8691,1,5,0)
 ;;=5^Fever in Other Conditions
 ;;^UTILITY(U,$J,358.3,8691,2)
 ;;=^336667
 ;;^UTILITY(U,$J,358.3,8692,0)
 ;;=780.62^^35^487^73
 ;;^UTILITY(U,$J,358.3,8692,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8692,1,4,0)
 ;;=4^780.62
 ;;^UTILITY(U,$J,358.3,8692,1,5,0)
 ;;=5^Fever,Postprocedural
 ;;^UTILITY(U,$J,358.3,8692,2)
 ;;=^336668
 ;;^UTILITY(U,$J,358.3,8693,0)
 ;;=780.63^^35^487^74
 ;;^UTILITY(U,$J,358.3,8693,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8693,1,4,0)
 ;;=4^780.63
 ;;^UTILITY(U,$J,358.3,8693,1,5,0)
 ;;=5^Fever,Postvaccination
 ;;^UTILITY(U,$J,358.3,8693,2)
 ;;=^336669
 ;;^UTILITY(U,$J,358.3,8694,0)
 ;;=780.64^^35^487^38
 ;;^UTILITY(U,$J,358.3,8694,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8694,1,4,0)
 ;;=4^780.64
 ;;^UTILITY(U,$J,358.3,8694,1,5,0)
 ;;=5^Chills w/o Fever
 ;;^UTILITY(U,$J,358.3,8694,2)
 ;;=^336670
 ;;^UTILITY(U,$J,358.3,8695,0)
 ;;=780.65^^35^487^89
 ;;^UTILITY(U,$J,358.3,8695,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8695,1,4,0)
 ;;=4^780.65
 ;;^UTILITY(U,$J,358.3,8695,1,5,0)
 ;;=5^Hypothermia w/o Low Env Temp
 ;;^UTILITY(U,$J,358.3,8695,2)
 ;;=^336671
 ;;^UTILITY(U,$J,358.3,8696,0)
 ;;=780.99^^35^487^41
 ;;^UTILITY(U,$J,358.3,8696,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8696,1,4,0)
 ;;=4^780.99
 ;;^UTILITY(U,$J,358.3,8696,1,5,0)
 ;;=5^Cold Intolerence
 ;;^UTILITY(U,$J,358.3,8696,2)
 ;;=^328568
 ;;^UTILITY(U,$J,358.3,8697,0)
 ;;=787.21^^35^487^56
 ;;^UTILITY(U,$J,358.3,8697,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8697,1,4,0)
 ;;=4^787.21
 ;;^UTILITY(U,$J,358.3,8697,1,5,0)
 ;;=5^Dysphagia, Oral Phase
 ;;^UTILITY(U,$J,358.3,8697,2)
 ;;=^335276
 ;;^UTILITY(U,$J,358.3,8698,0)
 ;;=787.22^^35^487^57
 ;;^UTILITY(U,$J,358.3,8698,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8698,1,4,0)
 ;;=4^787.22
 ;;^UTILITY(U,$J,358.3,8698,1,5,0)
 ;;=5^Dysphagia, Oropharyngeal
 ;;^UTILITY(U,$J,358.3,8698,2)
 ;;=^335277
 ;;^UTILITY(U,$J,358.3,8699,0)
 ;;=787.23^^35^487^58
 ;;^UTILITY(U,$J,358.3,8699,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8699,1,4,0)
 ;;=4^787.23
 ;;^UTILITY(U,$J,358.3,8699,1,5,0)
 ;;=5^Dysphagia, Pharyngeal
 ;;^UTILITY(U,$J,358.3,8699,2)
 ;;=^335278
 ;;^UTILITY(U,$J,358.3,8700,0)
 ;;=787.24^^35^487^59
 ;;^UTILITY(U,$J,358.3,8700,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8700,1,4,0)
 ;;=4^787.24
 ;;^UTILITY(U,$J,358.3,8700,1,5,0)
 ;;=5^Dysphagia, Pharyngoesoph
 ;;^UTILITY(U,$J,358.3,8700,2)
 ;;=^335279
 ;;^UTILITY(U,$J,358.3,8701,0)
 ;;=995.83^^35^488^2
 ;;^UTILITY(U,$J,358.3,8701,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8701,1,4,0)
 ;;=4^995.83
 ;;^UTILITY(U,$J,358.3,8701,1,5,0)
 ;;=5^Non-Military Sexual Trauma
 ;;^UTILITY(U,$J,358.3,8701,2)
 ;;=^1
 ;;^UTILITY(U,$J,358.3,8702,0)
 ;;=E967.9^^35^488^1
 ;;^UTILITY(U,$J,358.3,8702,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8702,1,4,0)
 ;;=4^E967.9
 ;;^UTILITY(U,$J,358.3,8702,1,5,0)
 ;;=5^Child & Adult Abuse by Unspec Person
 ;;^UTILITY(U,$J,358.3,8702,2)
 ;;=^22623
 ;;^UTILITY(U,$J,358.3,8703,0)
 ;;=784.0^^35^489^18
 ;;^UTILITY(U,$J,358.3,8703,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8703,1,4,0)
 ;;=4^784.0
 ;;^UTILITY(U,$J,358.3,8703,1,5,0)
 ;;=5^Headache
 ;;^UTILITY(U,$J,358.3,8703,2)
 ;;=Headache^54133
 ;;^UTILITY(U,$J,358.3,8704,0)
 ;;=729.5^^35^489^16
 ;;^UTILITY(U,$J,358.3,8704,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8704,1,4,0)
 ;;=4^729.5
 ;;
 ;;$END ROU IBDEI0IK
