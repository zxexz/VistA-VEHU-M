IBDEI0NS ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11335,1,2,0)
 ;;=2^V70.1
 ;;^UTILITY(U,$J,358.3,11335,1,5,0)
 ;;=5^Psych Exam, Mandated
 ;;^UTILITY(U,$J,358.3,11335,2)
 ;;=^295591
 ;;^UTILITY(U,$J,358.3,11336,0)
 ;;=V60.2^^50^642^7
 ;;^UTILITY(U,$J,358.3,11336,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11336,1,2,0)
 ;;=2^V60.2
 ;;^UTILITY(U,$J,358.3,11336,1,5,0)
 ;;=5^Economic Problem
 ;;^UTILITY(U,$J,358.3,11336,2)
 ;;=^62174
 ;;^UTILITY(U,$J,358.3,11337,0)
 ;;=V62.89^^50^642^47
 ;;^UTILITY(U,$J,358.3,11337,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11337,1,2,0)
 ;;=2^V62.89
 ;;^UTILITY(U,$J,358.3,11337,1,5,0)
 ;;=5^Psychological Stress NEC
 ;;^UTILITY(U,$J,358.3,11337,2)
 ;;=^87822
 ;;^UTILITY(U,$J,358.3,11338,0)
 ;;=V62.9^^50^642^48
 ;;^UTILITY(U,$J,358.3,11338,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11338,1,2,0)
 ;;=2^V62.9
 ;;^UTILITY(U,$J,358.3,11338,1,5,0)
 ;;=5^Psychosocial Circum NOS
 ;;^UTILITY(U,$J,358.3,11338,2)
 ;;=^295551
 ;;^UTILITY(U,$J,358.3,11339,0)
 ;;=V60.0^^50^642^33
 ;;^UTILITY(U,$J,358.3,11339,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11339,1,2,0)
 ;;=2^V60.0
 ;;^UTILITY(U,$J,358.3,11339,1,5,0)
 ;;=5^Lack Of Housing
 ;;^UTILITY(U,$J,358.3,11339,2)
 ;;=^295539
 ;;^UTILITY(U,$J,358.3,11340,0)
 ;;=V62.81^^50^642^23
 ;;^UTILITY(U,$J,358.3,11340,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11340,1,2,0)
 ;;=2^V62.81
 ;;^UTILITY(U,$J,358.3,11340,1,5,0)
 ;;=5^Interpersonal Problem
 ;;^UTILITY(U,$J,358.3,11340,2)
 ;;=^276358
 ;;^UTILITY(U,$J,358.3,11341,0)
 ;;=V71.01^^50^642^36
 ;;^UTILITY(U,$J,358.3,11341,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11341,1,2,0)
 ;;=2^V71.01
 ;;^UTILITY(U,$J,358.3,11341,1,5,0)
 ;;=5^Observ-Antisocial Behav
 ;;^UTILITY(U,$J,358.3,11341,2)
 ;;=^295603
 ;;^UTILITY(U,$J,358.3,11342,0)
 ;;=V71.09^^50^642^37
 ;;^UTILITY(U,$J,358.3,11342,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11342,1,2,0)
 ;;=2^V71.09
 ;;^UTILITY(U,$J,358.3,11342,1,5,0)
 ;;=5^Observ-Mental Condition
 ;;^UTILITY(U,$J,358.3,11342,2)
 ;;=^295604
 ;;^UTILITY(U,$J,358.3,11343,0)
 ;;=V15.41^^50^642^21
 ;;^UTILITY(U,$J,358.3,11343,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11343,1,2,0)
 ;;=2^V15.41
 ;;^UTILITY(U,$J,358.3,11343,1,5,0)
 ;;=5^Hx Of Sexual Abuse
 ;;^UTILITY(U,$J,358.3,11343,2)
 ;;=^304352
 ;;^UTILITY(U,$J,358.3,11344,0)
 ;;=V61.01^^50^642^12
 ;;^UTILITY(U,$J,358.3,11344,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11344,1,2,0)
 ;;=2^V61.01
 ;;^UTILITY(U,$J,358.3,11344,1,5,0)
 ;;=5^Fmily Dsrpt-Military Deployment
 ;;^UTILITY(U,$J,358.3,11344,2)
 ;;=^336799
 ;;^UTILITY(U,$J,358.3,11345,0)
 ;;=V61.02^^50^642^14
 ;;^UTILITY(U,$J,358.3,11345,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11345,1,2,0)
 ;;=2^V61.02
 ;;^UTILITY(U,$J,358.3,11345,1,5,0)
 ;;=5^Fmily Dsrpt-Ret from Military Deployment
 ;;^UTILITY(U,$J,358.3,11345,2)
 ;;=^336800
 ;;^UTILITY(U,$J,358.3,11346,0)
 ;;=V61.03^^50^642^11
 ;;^UTILITY(U,$J,358.3,11346,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11346,1,2,0)
 ;;=2^V61.03
 ;;^UTILITY(U,$J,358.3,11346,1,5,0)
 ;;=5^Fmily Dsrpt-Divorce/Legal Sep
 ;;^UTILITY(U,$J,358.3,11346,2)
 ;;=^336801
 ;;^UTILITY(U,$J,358.3,11347,0)
 ;;=V61.04^^50^642^13
 ;;^UTILITY(U,$J,358.3,11347,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11347,1,2,0)
 ;;=2^V61.04
 ;;^UTILITY(U,$J,358.3,11347,1,5,0)
 ;;=5^Fmily Dsrpt-Parent-Child Estrangment
 ;;^UTILITY(U,$J,358.3,11347,2)
 ;;=^336802
 ;;^UTILITY(U,$J,358.3,11348,0)
 ;;=V61.05^^50^642^10
 ;;^UTILITY(U,$J,358.3,11348,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11348,1,2,0)
 ;;=2^V61.05
 ;;^UTILITY(U,$J,358.3,11348,1,5,0)
 ;;=5^Fmily Dsrpt-Chld Custody
 ;;
 ;;$END ROU IBDEI0NS
