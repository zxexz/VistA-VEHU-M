IBDEI0N1 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,10965,1,5,0)
 ;;=5^Observ-Antisocial Behav
 ;;^UTILITY(U,$J,358.3,10965,2)
 ;;=^295603
 ;;^UTILITY(U,$J,358.3,10966,0)
 ;;=V71.09^^47^611^37
 ;;^UTILITY(U,$J,358.3,10966,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10966,1,2,0)
 ;;=2^V71.09
 ;;^UTILITY(U,$J,358.3,10966,1,5,0)
 ;;=5^Observ-Mental Condition
 ;;^UTILITY(U,$J,358.3,10966,2)
 ;;=^295604
 ;;^UTILITY(U,$J,358.3,10967,0)
 ;;=V15.41^^47^611^21
 ;;^UTILITY(U,$J,358.3,10967,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10967,1,2,0)
 ;;=2^V15.41
 ;;^UTILITY(U,$J,358.3,10967,1,5,0)
 ;;=5^Hx Of Sexual Abuse
 ;;^UTILITY(U,$J,358.3,10967,2)
 ;;=^304352
 ;;^UTILITY(U,$J,358.3,10968,0)
 ;;=V61.01^^47^611^12
 ;;^UTILITY(U,$J,358.3,10968,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10968,1,2,0)
 ;;=2^V61.01
 ;;^UTILITY(U,$J,358.3,10968,1,5,0)
 ;;=5^Fmily Dsrpt-Military Deployment
 ;;^UTILITY(U,$J,358.3,10968,2)
 ;;=^336799
 ;;^UTILITY(U,$J,358.3,10969,0)
 ;;=V61.02^^47^611^14
 ;;^UTILITY(U,$J,358.3,10969,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10969,1,2,0)
 ;;=2^V61.02
 ;;^UTILITY(U,$J,358.3,10969,1,5,0)
 ;;=5^Fmily Dsrpt-Ret from Military Deployment
 ;;^UTILITY(U,$J,358.3,10969,2)
 ;;=^336800
 ;;^UTILITY(U,$J,358.3,10970,0)
 ;;=V61.03^^47^611^11
 ;;^UTILITY(U,$J,358.3,10970,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10970,1,2,0)
 ;;=2^V61.03
 ;;^UTILITY(U,$J,358.3,10970,1,5,0)
 ;;=5^Fmily Dsrpt-Divorce/Legal Sep
 ;;^UTILITY(U,$J,358.3,10970,2)
 ;;=^336801
 ;;^UTILITY(U,$J,358.3,10971,0)
 ;;=V61.04^^47^611^13
 ;;^UTILITY(U,$J,358.3,10971,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10971,1,2,0)
 ;;=2^V61.04
 ;;^UTILITY(U,$J,358.3,10971,1,5,0)
 ;;=5^Fmily Dsrpt-Parent-Child Estrangment
 ;;^UTILITY(U,$J,358.3,10971,2)
 ;;=^336802
 ;;^UTILITY(U,$J,358.3,10972,0)
 ;;=V61.05^^47^611^10
 ;;^UTILITY(U,$J,358.3,10972,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10972,1,2,0)
 ;;=2^V61.05
 ;;^UTILITY(U,$J,358.3,10972,1,5,0)
 ;;=5^Fmily Dsrpt-Chld Custody
 ;;^UTILITY(U,$J,358.3,10972,2)
 ;;=^336803
 ;;^UTILITY(U,$J,358.3,10973,0)
 ;;=V61.09^^47^611^9
 ;;^UTILITY(U,$J,358.3,10973,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10973,1,2,0)
 ;;=2^V61.09
 ;;^UTILITY(U,$J,358.3,10973,1,5,0)
 ;;=5^Family Disruption NEC
 ;;^UTILITY(U,$J,358.3,10973,2)
 ;;=^336805
 ;;^UTILITY(U,$J,358.3,10974,0)
 ;;=V62.21^^47^611^4
 ;;^UTILITY(U,$J,358.3,10974,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10974,1,2,0)
 ;;=2^V62.21
 ;;^UTILITY(U,$J,358.3,10974,1,5,0)
 ;;=5^Current Military Deployment
 ;;^UTILITY(U,$J,358.3,10974,2)
 ;;=^336806
 ;;^UTILITY(U,$J,358.3,10975,0)
 ;;=V62.22^^47^611^16
 ;;^UTILITY(U,$J,358.3,10975,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10975,1,2,0)
 ;;=2^V62.22
 ;;^UTILITY(U,$J,358.3,10975,1,5,0)
 ;;=5^HX Retrn Military Deploy
 ;;^UTILITY(U,$J,358.3,10975,2)
 ;;=^336807
 ;;^UTILITY(U,$J,358.3,10976,0)
 ;;=V62.29^^47^611^38
 ;;^UTILITY(U,$J,358.3,10976,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10976,1,2,0)
 ;;=2^V62.29
 ;;^UTILITY(U,$J,358.3,10976,1,5,0)
 ;;=5^Occupationl Circumst NEC
 ;;^UTILITY(U,$J,358.3,10976,2)
 ;;=^87746
 ;;^UTILITY(U,$J,358.3,10977,0)
 ;;=V60.81^^47^611^15
 ;;^UTILITY(U,$J,358.3,10977,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10977,1,2,0)
 ;;=2^V60.81
 ;;^UTILITY(U,$J,358.3,10977,1,5,0)
 ;;=5^Foster Care (Status)
 ;;^UTILITY(U,$J,358.3,10977,2)
 ;;=^338505
 ;;^UTILITY(U,$J,358.3,10978,0)
 ;;=V60.89^^47^611^19
 ;;^UTILITY(U,$J,358.3,10978,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,10978,1,2,0)
 ;;=2^V60.89
 ;;^UTILITY(U,$J,358.3,10978,1,5,0)
 ;;=5^Housing/Econom Circum NEC
 ;;^UTILITY(U,$J,358.3,10978,2)
 ;;=^295545
 ;;
 ;;$END ROU IBDEI0N1
