IBDEI0N4 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11005,2)
 ;;=^303467
 ;;^UTILITY(U,$J,358.3,11006,0)
 ;;=V65.44^^47^612^3
 ;;^UTILITY(U,$J,358.3,11006,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11006,1,2,0)
 ;;=2^V65.44
 ;;^UTILITY(U,$J,358.3,11006,1,5,0)
 ;;=5^HIV Counseling
 ;;^UTILITY(U,$J,358.3,11006,2)
 ;;=^303469
 ;;^UTILITY(U,$J,358.3,11007,0)
 ;;=V65.49^^47^612^5
 ;;^UTILITY(U,$J,358.3,11007,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11007,1,2,0)
 ;;=2^V65.49
 ;;^UTILITY(U,$J,358.3,11007,1,5,0)
 ;;=5^Oth Specified Counseling
 ;;^UTILITY(U,$J,358.3,11007,2)
 ;;=^303471
 ;;^UTILITY(U,$J,358.3,11008,0)
 ;;=V68.1^^47^612^4
 ;;^UTILITY(U,$J,358.3,11008,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11008,1,2,0)
 ;;=2^V68.1
 ;;^UTILITY(U,$J,358.3,11008,1,5,0)
 ;;=5^Issue Repeat Prescription
 ;;^UTILITY(U,$J,358.3,11008,2)
 ;;=^295585
 ;;^UTILITY(U,$J,358.3,11009,0)
 ;;=V70.2^^47^612^6
 ;;^UTILITY(U,$J,358.3,11009,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11009,1,2,0)
 ;;=2^V70.2
 ;;^UTILITY(U,$J,358.3,11009,1,5,0)
 ;;=5^Psychiatric Examination
 ;;^UTILITY(U,$J,358.3,11009,2)
 ;;=^295592
 ;;^UTILITY(U,$J,358.3,11010,0)
 ;;=296.20^^47^613^14
 ;;^UTILITY(U,$J,358.3,11010,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11010,1,2,0)
 ;;=2^296.20
 ;;^UTILITY(U,$J,358.3,11010,1,5,0)
 ;;=5^MDD, Single, NOS
 ;;^UTILITY(U,$J,358.3,11010,2)
 ;;=^73311
 ;;^UTILITY(U,$J,358.3,11011,0)
 ;;=296.21^^47^613^12
 ;;^UTILITY(U,$J,358.3,11011,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11011,1,2,0)
 ;;=2^296.21
 ;;^UTILITY(U,$J,358.3,11011,1,5,0)
 ;;=5^MDD, Single, Mild
 ;;^UTILITY(U,$J,358.3,11011,2)
 ;;=^268110
 ;;^UTILITY(U,$J,358.3,11012,0)
 ;;=296.22^^47^613^13
 ;;^UTILITY(U,$J,358.3,11012,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11012,1,2,0)
 ;;=2^296.22
 ;;^UTILITY(U,$J,358.3,11012,1,5,0)
 ;;=5^MDD, Single, Moderate
 ;;^UTILITY(U,$J,358.3,11012,2)
 ;;=^268111
 ;;^UTILITY(U,$J,358.3,11013,0)
 ;;=296.23^^47^613^5
 ;;^UTILITY(U,$J,358.3,11013,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11013,1,2,0)
 ;;=2^296.23
 ;;^UTILITY(U,$J,358.3,11013,1,5,0)
 ;;=5^MDD Sing, Sev w/o Psychosis
 ;;^UTILITY(U,$J,358.3,11013,2)
 ;;=^268112
 ;;^UTILITY(U,$J,358.3,11014,0)
 ;;=296.24^^47^613^4
 ;;^UTILITY(U,$J,358.3,11014,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11014,1,2,0)
 ;;=2^296.24
 ;;^UTILITY(U,$J,358.3,11014,1,5,0)
 ;;=5^MDD Sing, Sev w/Psychosis
 ;;^UTILITY(U,$J,358.3,11014,2)
 ;;=^268113
 ;;^UTILITY(U,$J,358.3,11015,0)
 ;;=296.25^^47^613^15
 ;;^UTILITY(U,$J,358.3,11015,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11015,1,2,0)
 ;;=2^296.25
 ;;^UTILITY(U,$J,358.3,11015,1,5,0)
 ;;=5^MDD, Single, Part Remiss
 ;;^UTILITY(U,$J,358.3,11015,2)
 ;;=^268114
 ;;^UTILITY(U,$J,358.3,11016,0)
 ;;=296.30^^47^613^9
 ;;^UTILITY(U,$J,358.3,11016,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11016,1,2,0)
 ;;=2^296.30
 ;;^UTILITY(U,$J,358.3,11016,1,5,0)
 ;;=5^MDD, Recur, NOS
 ;;^UTILITY(U,$J,358.3,11016,2)
 ;;=^268116
 ;;^UTILITY(U,$J,358.3,11017,0)
 ;;=296.31^^47^613^7
 ;;^UTILITY(U,$J,358.3,11017,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11017,1,2,0)
 ;;=2^296.31
 ;;^UTILITY(U,$J,358.3,11017,1,5,0)
 ;;=5^MDD, Recur, Mild
 ;;^UTILITY(U,$J,358.3,11017,2)
 ;;=^268117
 ;;^UTILITY(U,$J,358.3,11018,0)
 ;;=296.32^^47^613^8
 ;;^UTILITY(U,$J,358.3,11018,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11018,1,2,0)
 ;;=2^296.32
 ;;^UTILITY(U,$J,358.3,11018,1,5,0)
 ;;=5^MDD, Recur, Moderate
 ;;^UTILITY(U,$J,358.3,11018,2)
 ;;=^268118
 ;;^UTILITY(U,$J,358.3,11019,0)
 ;;=296.33^^47^613^3
 ;;^UTILITY(U,$J,358.3,11019,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11019,1,2,0)
 ;;=2^296.33
 ;;
 ;;$END ROU IBDEI0N4
