IBDEI0XD ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,16224,1,5,0)
 ;;=5^Dysarthria
 ;;^UTILITY(U,$J,358.3,16224,2)
 ;;=^338286
 ;;^UTILITY(U,$J,358.3,16225,0)
 ;;=784.59^^81^955^85
 ;;^UTILITY(U,$J,358.3,16225,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16225,1,4,0)
 ;;=4^784.59
 ;;^UTILITY(U,$J,358.3,16225,1,5,0)
 ;;=5^Speech Disturbance NEC
 ;;^UTILITY(U,$J,358.3,16225,2)
 ;;=^338287
 ;;^UTILITY(U,$J,358.3,16226,0)
 ;;=V62.3^^81^955^32
 ;;^UTILITY(U,$J,358.3,16226,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16226,1,4,0)
 ;;=4^V62.3
 ;;^UTILITY(U,$J,358.3,16226,1,5,0)
 ;;=5^Educational Counseling
 ;;^UTILITY(U,$J,358.3,16226,2)
 ;;=^38578
 ;;^UTILITY(U,$J,358.3,16227,0)
 ;;=313.83^^81^955^49
 ;;^UTILITY(U,$J,358.3,16227,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16227,1,4,0)
 ;;=4^313.83
 ;;^UTILITY(U,$J,358.3,16227,1,5,0)
 ;;=5^Knowledge Deficit
 ;;^UTILITY(U,$J,358.3,16227,2)
 ;;=^268347
 ;;^UTILITY(U,$J,358.3,16228,0)
 ;;=V65.41^^81^956^6
 ;;^UTILITY(U,$J,358.3,16228,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16228,1,4,0)
 ;;=4^V65.41
 ;;^UTILITY(U,$J,358.3,16228,1,5,0)
 ;;=5^Exercise Counseling
 ;;^UTILITY(U,$J,358.3,16228,2)
 ;;=^303466
 ;;^UTILITY(U,$J,358.3,16229,0)
 ;;=V79.1^^81^956^1
 ;;^UTILITY(U,$J,358.3,16229,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16229,1,4,0)
 ;;=4^V79.1
 ;;^UTILITY(U,$J,358.3,16229,1,5,0)
 ;;=5^Alcohol Use Screen
 ;;^UTILITY(U,$J,358.3,16229,2)
 ;;=^295678
 ;;^UTILITY(U,$J,358.3,16230,0)
 ;;=V76.19^^81^956^2
 ;;^UTILITY(U,$J,358.3,16230,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16230,1,4,0)
 ;;=4^V76.19
 ;;^UTILITY(U,$J,358.3,16230,1,5,0)
 ;;=5^Breast Exam
 ;;^UTILITY(U,$J,358.3,16230,2)
 ;;=^295652
 ;;^UTILITY(U,$J,358.3,16231,0)
 ;;=V79.0^^81^956^3
 ;;^UTILITY(U,$J,358.3,16231,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16231,1,4,0)
 ;;=4^V79.0
 ;;^UTILITY(U,$J,358.3,16231,1,5,0)
 ;;=5^Depression Screening
 ;;^UTILITY(U,$J,358.3,16231,2)
 ;;=^295677
 ;;^UTILITY(U,$J,358.3,16232,0)
 ;;=V80.2^^81^956^4
 ;;^UTILITY(U,$J,358.3,16232,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16232,1,4,0)
 ;;=4^V80.2
 ;;^UTILITY(U,$J,358.3,16232,1,5,0)
 ;;=5^Diabetic Eye Exam
 ;;^UTILITY(U,$J,358.3,16232,2)
 ;;=^295685
 ;;^UTILITY(U,$J,358.3,16233,0)
 ;;=V72.85^^81^956^5
 ;;^UTILITY(U,$J,358.3,16233,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16233,1,4,0)
 ;;=4^V72.85
 ;;^UTILITY(U,$J,358.3,16233,1,5,0)
 ;;=5^Diabetic Foot Exam
 ;;^UTILITY(U,$J,358.3,16233,2)
 ;;=^295831
 ;;^UTILITY(U,$J,358.3,16234,0)
 ;;=V70.0^^81^956^7
 ;;^UTILITY(U,$J,358.3,16234,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16234,1,4,0)
 ;;=4^V70.0
 ;;^UTILITY(U,$J,358.3,16234,1,5,0)
 ;;=5^Health Check-Up
 ;;^UTILITY(U,$J,358.3,16234,2)
 ;;=^295590
 ;;^UTILITY(U,$J,358.3,16235,0)
 ;;=V73.89^^81^956^8
 ;;^UTILITY(U,$J,358.3,16235,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16235,1,4,0)
 ;;=4^V73.89
 ;;^UTILITY(U,$J,358.3,16235,1,5,0)
 ;;=5^Hepatitis C Screening
 ;;^UTILITY(U,$J,358.3,16235,2)
 ;;=^295833
 ;;^UTILITY(U,$J,358.3,16236,0)
 ;;=V81.1^^81^956^9
 ;;^UTILITY(U,$J,358.3,16236,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16236,1,4,0)
 ;;=4^V81.1
 ;;^UTILITY(U,$J,358.3,16236,1,5,0)
 ;;=5^Hypertension Screening
 ;;^UTILITY(U,$J,358.3,16236,2)
 ;;=^295688
 ;;^UTILITY(U,$J,358.3,16237,0)
 ;;=V65.3^^81^956^10
 ;;^UTILITY(U,$J,358.3,16237,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16237,1,4,0)
 ;;=4^V65.3
 ;;^UTILITY(U,$J,358.3,16237,1,5,0)
 ;;=5^Nutrition Counseling
 ;;^UTILITY(U,$J,358.3,16237,2)
 ;;=^295563
 ;;^UTILITY(U,$J,358.3,16238,0)
 ;;=V76.41^^81^956^13
 ;;^UTILITY(U,$J,358.3,16238,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16238,1,4,0)
 ;;=4^V76.41
 ;;
 ;;$END ROU IBDEI0XD
