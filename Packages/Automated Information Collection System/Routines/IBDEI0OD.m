IBDEI0OD ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11618,0)
 ;;=304.73^^53^668^64
 ;;^UTILITY(U,$J,358.3,11618,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11618,1,2,0)
 ;;=2^304.73
 ;;^UTILITY(U,$J,358.3,11618,1,5,0)
 ;;=5^Opioid + Other Dep-Remis
 ;;^UTILITY(U,$J,358.3,11618,2)
 ;;=^268217
 ;;^UTILITY(U,$J,358.3,11619,0)
 ;;=304.80^^53^668^50
 ;;^UTILITY(U,$J,358.3,11619,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11619,1,2,0)
 ;;=2^304.80
 ;;^UTILITY(U,$J,358.3,11619,1,5,0)
 ;;=5^Combination Drug Dep
 ;;^UTILITY(U,$J,358.3,11619,2)
 ;;=^268218
 ;;^UTILITY(U,$J,358.3,11620,0)
 ;;=304.83^^53^668^47
 ;;^UTILITY(U,$J,358.3,11620,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11620,1,2,0)
 ;;=2^304.83
 ;;^UTILITY(U,$J,358.3,11620,1,5,0)
 ;;=5^Comb Drug Dep-Remission
 ;;^UTILITY(U,$J,358.3,11620,2)
 ;;=^268221
 ;;^UTILITY(U,$J,358.3,11621,0)
 ;;=305.1^^53^668^63
 ;;^UTILITY(U,$J,358.3,11621,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11621,1,2,0)
 ;;=2^305.1
 ;;^UTILITY(U,$J,358.3,11621,1,5,0)
 ;;=5^Nicotine Dependence
 ;;^UTILITY(U,$J,358.3,11621,2)
 ;;=^119899
 ;;^UTILITY(U,$J,358.3,11622,0)
 ;;=291.81^^53^668^14
 ;;^UTILITY(U,$J,358.3,11622,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11622,1,2,0)
 ;;=2^291.81
 ;;^UTILITY(U,$J,358.3,11622,1,5,0)
 ;;=5^Alcohol Withdrawal
 ;;^UTILITY(U,$J,358.3,11622,2)
 ;;=^123498
 ;;^UTILITY(U,$J,358.3,11623,0)
 ;;=291.0^^53^668^13
 ;;^UTILITY(U,$J,358.3,11623,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11623,1,2,0)
 ;;=2^291.0
 ;;^UTILITY(U,$J,358.3,11623,1,5,0)
 ;;=5^Alcohol Withdraw Delir
 ;;^UTILITY(U,$J,358.3,11623,2)
 ;;=^4589
 ;;^UTILITY(U,$J,358.3,11624,0)
 ;;=303.00^^53^668^5
 ;;^UTILITY(U,$J,358.3,11624,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11624,1,2,0)
 ;;=2^303.00
 ;;^UTILITY(U,$J,358.3,11624,1,5,0)
 ;;=5^Alc Intox NOS
 ;;^UTILITY(U,$J,358.3,11624,2)
 ;;=^268183
 ;;^UTILITY(U,$J,358.3,11625,0)
 ;;=303.01^^53^668^6
 ;;^UTILITY(U,$J,358.3,11625,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11625,1,2,0)
 ;;=2^303.01
 ;;^UTILITY(U,$J,358.3,11625,1,5,0)
 ;;=5^Alc Intox, Continuous
 ;;^UTILITY(U,$J,358.3,11625,2)
 ;;=^268184
 ;;^UTILITY(U,$J,358.3,11626,0)
 ;;=303.02^^53^668^7
 ;;^UTILITY(U,$J,358.3,11626,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11626,1,2,0)
 ;;=2^303.02
 ;;^UTILITY(U,$J,358.3,11626,1,5,0)
 ;;=5^Alc Intox, Episodic
 ;;^UTILITY(U,$J,358.3,11626,2)
 ;;=^268185
 ;;^UTILITY(U,$J,358.3,11627,0)
 ;;=303.03^^53^668^8
 ;;^UTILITY(U,$J,358.3,11627,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11627,1,2,0)
 ;;=2^303.03
 ;;^UTILITY(U,$J,358.3,11627,1,5,0)
 ;;=5^Alc Intox, Remiss
 ;;^UTILITY(U,$J,358.3,11627,2)
 ;;=^268186
 ;;^UTILITY(U,$J,358.3,11628,0)
 ;;=303.91^^53^668^3
 ;;^UTILITY(U,$J,358.3,11628,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11628,1,2,0)
 ;;=2^303.91
 ;;^UTILITY(U,$J,358.3,11628,1,5,0)
 ;;=5^Alc Dep, Continuous
 ;;^UTILITY(U,$J,358.3,11628,2)
 ;;=^268188
 ;;^UTILITY(U,$J,358.3,11629,0)
 ;;=303.92^^53^668^4
 ;;^UTILITY(U,$J,358.3,11629,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11629,1,2,0)
 ;;=2^303.92
 ;;^UTILITY(U,$J,358.3,11629,1,5,0)
 ;;=5^Alc Dep, Episodic
 ;;^UTILITY(U,$J,358.3,11629,2)
 ;;=^268189
 ;;^UTILITY(U,$J,358.3,11630,0)
 ;;=304.01^^53^668^73
 ;;^UTILITY(U,$J,358.3,11630,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11630,1,2,0)
 ;;=2^304.01
 ;;^UTILITY(U,$J,358.3,11630,1,5,0)
 ;;=5^Opioid Depend, Continuous
 ;;^UTILITY(U,$J,358.3,11630,2)
 ;;=^268191
 ;;^UTILITY(U,$J,358.3,11631,0)
 ;;=304.02^^53^668^75
 ;;^UTILITY(U,$J,358.3,11631,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11631,1,2,0)
 ;;=2^304.02
 ;;^UTILITY(U,$J,358.3,11631,1,5,0)
 ;;=5^Opioid Dependence, Episodic
 ;;
 ;;$END ROU IBDEI0OD
