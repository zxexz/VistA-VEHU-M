IBDEI0LH ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,10182,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10182,1,3,0)
 ;;=3^Hallucinations,Auditory
 ;;^UTILITY(U,$J,358.3,10182,1,4,0)
 ;;=4^780.1
 ;;^UTILITY(U,$J,358.3,10182,2)
 ;;=^53738
 ;;^UTILITY(U,$J,358.3,10183,0)
 ;;=780.2^^44^561^112
 ;;^UTILITY(U,$J,358.3,10183,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10183,1,3,0)
 ;;=3^Syncope
 ;;^UTILITY(U,$J,358.3,10183,1,4,0)
 ;;=4^780.2
 ;;^UTILITY(U,$J,358.3,10183,2)
 ;;=^116707
 ;;^UTILITY(U,$J,358.3,10184,0)
 ;;=780.39^^44^561^110
 ;;^UTILITY(U,$J,358.3,10184,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10184,1,3,0)
 ;;=3^Seizure Disorder
 ;;^UTILITY(U,$J,358.3,10184,1,4,0)
 ;;=4^780.39
 ;;^UTILITY(U,$J,358.3,10184,2)
 ;;=^28162
 ;;^UTILITY(U,$J,358.3,10185,0)
 ;;=780.4^^44^561^32
 ;;^UTILITY(U,$J,358.3,10185,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10185,1,3,0)
 ;;=3^Dizziness
 ;;^UTILITY(U,$J,358.3,10185,1,4,0)
 ;;=4^780.4
 ;;^UTILITY(U,$J,358.3,10185,2)
 ;;=^35946
 ;;^UTILITY(U,$J,358.3,10186,0)
 ;;=780.71^^44^561^22
 ;;^UTILITY(U,$J,358.3,10186,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10186,1,3,0)
 ;;=3^Chronic Fatigue Syndrome
 ;;^UTILITY(U,$J,358.3,10186,1,4,0)
 ;;=4^780.71
 ;;^UTILITY(U,$J,358.3,10186,2)
 ;;=^304659
 ;;^UTILITY(U,$J,358.3,10187,0)
 ;;=795.79^^44^561^1
 ;;^UTILITY(U,$J,358.3,10187,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10187,1,3,0)
 ;;=3^ACLA/APLA
 ;;^UTILITY(U,$J,358.3,10187,1,4,0)
 ;;=4^795.79
 ;;^UTILITY(U,$J,358.3,10187,2)
 ;;=^303352
 ;;^UTILITY(U,$J,358.3,10188,0)
 ;;=854.01^^44^561^120
 ;;^UTILITY(U,$J,358.3,10188,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10188,1,3,0)
 ;;=3^TBI-Open Wound,No LOC
 ;;^UTILITY(U,$J,358.3,10188,1,4,0)
 ;;=4^854.01
 ;;^UTILITY(U,$J,358.3,10188,2)
 ;;=^274712
 ;;^UTILITY(U,$J,358.3,10189,0)
 ;;=854.02^^44^561^118
 ;;^UTILITY(U,$J,358.3,10189,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10189,1,3,0)
 ;;=3^TBI-Open Wound,LOC < 1hr
 ;;^UTILITY(U,$J,358.3,10189,1,4,0)
 ;;=4^854.02
 ;;^UTILITY(U,$J,358.3,10189,2)
 ;;=^274713
 ;;^UTILITY(U,$J,358.3,10190,0)
 ;;=854.03^^44^561^117
 ;;^UTILITY(U,$J,358.3,10190,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10190,1,3,0)
 ;;=3^TBI-Open Wound,LOC 1-24hr
 ;;^UTILITY(U,$J,358.3,10190,1,4,0)
 ;;=4^854.03
 ;;^UTILITY(U,$J,358.3,10190,2)
 ;;=^274714
 ;;^UTILITY(U,$J,358.3,10191,0)
 ;;=854.04^^44^561^119
 ;;^UTILITY(U,$J,358.3,10191,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10191,1,3,0)
 ;;=3^TBI-Open Wound,LOC > 24hr
 ;;^UTILITY(U,$J,358.3,10191,1,4,0)
 ;;=4^854.04
 ;;^UTILITY(U,$J,358.3,10191,2)
 ;;=^274715
 ;;^UTILITY(U,$J,358.3,10192,0)
 ;;=854.11^^44^561^114
 ;;^UTILITY(U,$J,358.3,10192,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10192,1,3,0)
 ;;=3^TBI-Closed Wound,No LOC
 ;;^UTILITY(U,$J,358.3,10192,1,4,0)
 ;;=4^854.11
 ;;^UTILITY(U,$J,358.3,10192,2)
 ;;=^274721
 ;;^UTILITY(U,$J,358.3,10193,0)
 ;;=854.12^^44^561^113
 ;;^UTILITY(U,$J,358.3,10193,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10193,1,3,0)
 ;;=3^TBI-Closed Wound,LOC < 1hr
 ;;^UTILITY(U,$J,358.3,10193,1,4,0)
 ;;=4^854.12
 ;;^UTILITY(U,$J,358.3,10193,2)
 ;;=^274722
 ;;^UTILITY(U,$J,358.3,10194,0)
 ;;=854.13^^44^561^115
 ;;^UTILITY(U,$J,358.3,10194,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10194,1,3,0)
 ;;=3^TBI-Closed,LOC 1-24hr
 ;;^UTILITY(U,$J,358.3,10194,1,4,0)
 ;;=4^854.13
 ;;^UTILITY(U,$J,358.3,10194,2)
 ;;=^274723
 ;;^UTILITY(U,$J,358.3,10195,0)
 ;;=854.14^^44^561^116
 ;;^UTILITY(U,$J,358.3,10195,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10195,1,3,0)
 ;;=3^TBI-Closed,LOC > 24hr
 ;;^UTILITY(U,$J,358.3,10195,1,4,0)
 ;;=4^854.14
 ;;^UTILITY(U,$J,358.3,10195,2)
 ;;=^274724
 ;;
 ;;$END ROU IBDEI0LH
