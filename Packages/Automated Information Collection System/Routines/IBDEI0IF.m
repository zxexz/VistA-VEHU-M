IBDEI0IF ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,8621,0)
 ;;=787.03^^35^487^155
 ;;^UTILITY(U,$J,358.3,8621,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8621,1,4,0)
 ;;=4^787.03
 ;;^UTILITY(U,$J,358.3,8621,1,5,0)
 ;;=5^Vomiting Alone
 ;;^UTILITY(U,$J,358.3,8621,2)
 ;;=Vomiting Alone^127237
 ;;^UTILITY(U,$J,358.3,8622,0)
 ;;=784.8^^35^487^29
 ;;^UTILITY(U,$J,358.3,8622,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8622,1,4,0)
 ;;=4^784.8
 ;;^UTILITY(U,$J,358.3,8622,1,5,0)
 ;;=5^Bleeding from throat
 ;;^UTILITY(U,$J,358.3,8622,2)
 ;;=^273371
 ;;^UTILITY(U,$J,358.3,8623,0)
 ;;=525.9^^35^487^47
 ;;^UTILITY(U,$J,358.3,8623,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8623,1,4,0)
 ;;=4^525.9
 ;;^UTILITY(U,$J,358.3,8623,1,5,0)
 ;;=5^Dental Pain
 ;;^UTILITY(U,$J,358.3,8623,2)
 ;;=Dental Pain^123871
 ;;^UTILITY(U,$J,358.3,8624,0)
 ;;=784.7^^35^487^69
 ;;^UTILITY(U,$J,358.3,8624,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8624,1,4,0)
 ;;=4^784.7
 ;;^UTILITY(U,$J,358.3,8624,1,5,0)
 ;;=5^Epistaxis
 ;;^UTILITY(U,$J,358.3,8624,2)
 ;;=Epistaxis^41658
 ;;^UTILITY(U,$J,358.3,8625,0)
 ;;=784.0^^35^487^79
 ;;^UTILITY(U,$J,358.3,8625,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8625,1,4,0)
 ;;=4^784.0
 ;;^UTILITY(U,$J,358.3,8625,1,5,0)
 ;;=5^Headache
 ;;^UTILITY(U,$J,358.3,8625,2)
 ;;=Headache^54133
 ;;^UTILITY(U,$J,358.3,8626,0)
 ;;=784.2^^35^487^108
 ;;^UTILITY(U,$J,358.3,8626,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8626,1,4,0)
 ;;=4^784.2
 ;;^UTILITY(U,$J,358.3,8626,1,5,0)
 ;;=5^Mass or Lump in Head/Neck
 ;;^UTILITY(U,$J,358.3,8626,2)
 ;;=Mass or Lump in Head/Neck^273367
 ;;^UTILITY(U,$J,358.3,8627,0)
 ;;=784.1^^35^487^149
 ;;^UTILITY(U,$J,358.3,8627,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8627,1,4,0)
 ;;=4^784.1
 ;;^UTILITY(U,$J,358.3,8627,1,5,0)
 ;;=5^Throat Pain
 ;;^UTILITY(U,$J,358.3,8627,2)
 ;;=Throat Pain^276881
 ;;^UTILITY(U,$J,358.3,8628,0)
 ;;=781.0^^35^487^12
 ;;^UTILITY(U,$J,358.3,8628,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8628,1,4,0)
 ;;=4^781.0
 ;;^UTILITY(U,$J,358.3,8628,1,5,0)
 ;;=5^Abnormal Involuntary Movement
 ;;^UTILITY(U,$J,358.3,8628,2)
 ;;=Abnormal Involuntary MMovement^23827
 ;;^UTILITY(U,$J,358.3,8629,0)
 ;;=781.2^^35^487^16
 ;;^UTILITY(U,$J,358.3,8629,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8629,1,4,0)
 ;;=4^781.2
 ;;^UTILITY(U,$J,358.3,8629,1,5,0)
 ;;=5^Abnormality of Gait
 ;;^UTILITY(U,$J,358.3,8629,2)
 ;;=^48820
 ;;^UTILITY(U,$J,358.3,8630,0)
 ;;=305.00^^35^487^19
 ;;^UTILITY(U,$J,358.3,8630,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8630,1,4,0)
 ;;=4^305.00
 ;;^UTILITY(U,$J,358.3,8630,1,5,0)
 ;;=5^Alcohol Abuse, unsp
 ;;^UTILITY(U,$J,358.3,8630,2)
 ;;=^268227
 ;;^UTILITY(U,$J,358.3,8631,0)
 ;;=784.3^^35^487^25
 ;;^UTILITY(U,$J,358.3,8631,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8631,1,4,0)
 ;;=4^784.3
 ;;^UTILITY(U,$J,358.3,8631,1,5,0)
 ;;=5^Aphasia
 ;;^UTILITY(U,$J,358.3,8631,2)
 ;;=Aphasia^9453
 ;;^UTILITY(U,$J,358.3,8632,0)
 ;;=781.3^^35^487^102
 ;;^UTILITY(U,$J,358.3,8632,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8632,1,4,0)
 ;;=4^781.3
 ;;^UTILITY(U,$J,358.3,8632,1,5,0)
 ;;=5^Lack of Coordination
 ;;^UTILITY(U,$J,358.3,8632,2)
 ;;=^11172
 ;;^UTILITY(U,$J,358.3,8633,0)
 ;;=733.6^^35^487^44
 ;;^UTILITY(U,$J,358.3,8633,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8633,1,4,0)
 ;;=4^733.6
 ;;^UTILITY(U,$J,358.3,8633,1,5,0)
 ;;=5^Costochondritis
 ;;^UTILITY(U,$J,358.3,8633,2)
 ;;=Costochondritis^119586
 ;;^UTILITY(U,$J,358.3,8634,0)
 ;;=311.^^35^487^48
 ;;^UTILITY(U,$J,358.3,8634,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8634,1,4,0)
 ;;=4^311.
 ;;^UTILITY(U,$J,358.3,8634,1,5,0)
 ;;=5^Depression
 ;;
 ;;$END ROU IBDEI0IF
