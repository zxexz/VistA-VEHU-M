IBDEI08W ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,3699,0)
 ;;=V68.1^^11^159^4
 ;;^UTILITY(U,$J,358.3,3699,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3699,1,2,0)
 ;;=2^V68.1
 ;;^UTILITY(U,$J,358.3,3699,1,5,0)
 ;;=5^Issue Repeat Prescription
 ;;^UTILITY(U,$J,358.3,3699,2)
 ;;=^295585
 ;;^UTILITY(U,$J,358.3,3700,0)
 ;;=V70.2^^11^159^6
 ;;^UTILITY(U,$J,358.3,3700,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3700,1,2,0)
 ;;=2^V70.2
 ;;^UTILITY(U,$J,358.3,3700,1,5,0)
 ;;=5^Psychiatric Examination
 ;;^UTILITY(U,$J,358.3,3700,2)
 ;;=^295592
 ;;^UTILITY(U,$J,358.3,3701,0)
 ;;=296.20^^11^160^14
 ;;^UTILITY(U,$J,358.3,3701,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3701,1,2,0)
 ;;=2^296.20
 ;;^UTILITY(U,$J,358.3,3701,1,5,0)
 ;;=5^MDD, Single, NOS
 ;;^UTILITY(U,$J,358.3,3701,2)
 ;;=^73311
 ;;^UTILITY(U,$J,358.3,3702,0)
 ;;=296.21^^11^160^12
 ;;^UTILITY(U,$J,358.3,3702,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3702,1,2,0)
 ;;=2^296.21
 ;;^UTILITY(U,$J,358.3,3702,1,5,0)
 ;;=5^MDD, Single, Mild
 ;;^UTILITY(U,$J,358.3,3702,2)
 ;;=^268110
 ;;^UTILITY(U,$J,358.3,3703,0)
 ;;=296.22^^11^160^13
 ;;^UTILITY(U,$J,358.3,3703,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3703,1,2,0)
 ;;=2^296.22
 ;;^UTILITY(U,$J,358.3,3703,1,5,0)
 ;;=5^MDD, Single, Moderate
 ;;^UTILITY(U,$J,358.3,3703,2)
 ;;=^268111
 ;;^UTILITY(U,$J,358.3,3704,0)
 ;;=296.23^^11^160^5
 ;;^UTILITY(U,$J,358.3,3704,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3704,1,2,0)
 ;;=2^296.23
 ;;^UTILITY(U,$J,358.3,3704,1,5,0)
 ;;=5^MDD Sing, Sev w/o Psychosis
 ;;^UTILITY(U,$J,358.3,3704,2)
 ;;=^268112
 ;;^UTILITY(U,$J,358.3,3705,0)
 ;;=296.24^^11^160^4
 ;;^UTILITY(U,$J,358.3,3705,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3705,1,2,0)
 ;;=2^296.24
 ;;^UTILITY(U,$J,358.3,3705,1,5,0)
 ;;=5^MDD Sing, Sev w/Psychosis
 ;;^UTILITY(U,$J,358.3,3705,2)
 ;;=^268113
 ;;^UTILITY(U,$J,358.3,3706,0)
 ;;=296.25^^11^160^15
 ;;^UTILITY(U,$J,358.3,3706,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3706,1,2,0)
 ;;=2^296.25
 ;;^UTILITY(U,$J,358.3,3706,1,5,0)
 ;;=5^MDD, Single, Part Remiss
 ;;^UTILITY(U,$J,358.3,3706,2)
 ;;=^268114
 ;;^UTILITY(U,$J,358.3,3707,0)
 ;;=296.30^^11^160^9
 ;;^UTILITY(U,$J,358.3,3707,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3707,1,2,0)
 ;;=2^296.30
 ;;^UTILITY(U,$J,358.3,3707,1,5,0)
 ;;=5^MDD, Recur, NOS
 ;;^UTILITY(U,$J,358.3,3707,2)
 ;;=^268116
 ;;^UTILITY(U,$J,358.3,3708,0)
 ;;=296.31^^11^160^7
 ;;^UTILITY(U,$J,358.3,3708,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3708,1,2,0)
 ;;=2^296.31
 ;;^UTILITY(U,$J,358.3,3708,1,5,0)
 ;;=5^MDD, Recur, Mild
 ;;^UTILITY(U,$J,358.3,3708,2)
 ;;=^268117
 ;;^UTILITY(U,$J,358.3,3709,0)
 ;;=296.32^^11^160^8
 ;;^UTILITY(U,$J,358.3,3709,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3709,1,2,0)
 ;;=2^296.32
 ;;^UTILITY(U,$J,358.3,3709,1,5,0)
 ;;=5^MDD, Recur, Moderate
 ;;^UTILITY(U,$J,358.3,3709,2)
 ;;=^268118
 ;;^UTILITY(U,$J,358.3,3710,0)
 ;;=296.33^^11^160^3
 ;;^UTILITY(U,$J,358.3,3710,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3710,1,2,0)
 ;;=2^296.33
 ;;^UTILITY(U,$J,358.3,3710,1,5,0)
 ;;=5^MDD Recur, Sev w/o Psychosis
 ;;^UTILITY(U,$J,358.3,3710,2)
 ;;=^268119
 ;;^UTILITY(U,$J,358.3,3711,0)
 ;;=296.34^^11^160^2
 ;;^UTILITY(U,$J,358.3,3711,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3711,1,2,0)
 ;;=2^296.34
 ;;^UTILITY(U,$J,358.3,3711,1,5,0)
 ;;=5^MDD Recur, Sev w/Psychosis
 ;;^UTILITY(U,$J,358.3,3711,2)
 ;;=^268120
 ;;^UTILITY(U,$J,358.3,3712,0)
 ;;=296.35^^11^160^10
 ;;^UTILITY(U,$J,358.3,3712,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3712,1,2,0)
 ;;=2^296.35
 ;;^UTILITY(U,$J,358.3,3712,1,5,0)
 ;;=5^MDD, Recur, Part Remiss
 ;;^UTILITY(U,$J,358.3,3712,2)
 ;;=^268121
 ;;
 ;;$END ROU IBDEI08W
