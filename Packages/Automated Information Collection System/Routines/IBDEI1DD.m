IBDEI1DD ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24265,0)
 ;;=99213^^135^1485^3
 ;;^UTILITY(U,$J,358.3,24265,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24265,1,1,0)
 ;;=1^INTERMEDIATE EXAM
 ;;^UTILITY(U,$J,358.3,24265,1,2,0)
 ;;=2^99213
 ;;^UTILITY(U,$J,358.3,24266,0)
 ;;=99214^^135^1485^4
 ;;^UTILITY(U,$J,358.3,24266,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24266,1,1,0)
 ;;=1^EXTENDED EXAM
 ;;^UTILITY(U,$J,358.3,24266,1,2,0)
 ;;=2^99214
 ;;^UTILITY(U,$J,358.3,24267,0)
 ;;=99215^^135^1485^5
 ;;^UTILITY(U,$J,358.3,24267,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24267,1,1,0)
 ;;=1^COMPREHENSIVE EXAM
 ;;^UTILITY(U,$J,358.3,24267,1,2,0)
 ;;=2^99215
 ;;^UTILITY(U,$J,358.3,24268,0)
 ;;=99241^^135^1486^1
 ;;^UTILITY(U,$J,358.3,24268,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24268,1,1,0)
 ;;=1^BRIEF EXAM
 ;;^UTILITY(U,$J,358.3,24268,1,2,0)
 ;;=2^99241
 ;;^UTILITY(U,$J,358.3,24269,0)
 ;;=99242^^135^1486^2
 ;;^UTILITY(U,$J,358.3,24269,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24269,1,1,0)
 ;;=1^LIMITED EXAM
 ;;^UTILITY(U,$J,358.3,24269,1,2,0)
 ;;=2^99242
 ;;^UTILITY(U,$J,358.3,24270,0)
 ;;=99243^^135^1486^3
 ;;^UTILITY(U,$J,358.3,24270,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24270,1,1,0)
 ;;=1^INTERMEDIATE EXAM
 ;;^UTILITY(U,$J,358.3,24270,1,2,0)
 ;;=2^99243
 ;;^UTILITY(U,$J,358.3,24271,0)
 ;;=99244^^135^1486^4
 ;;^UTILITY(U,$J,358.3,24271,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24271,1,1,0)
 ;;=1^EXTENDED EXAM
 ;;^UTILITY(U,$J,358.3,24271,1,2,0)
 ;;=2^99244
 ;;^UTILITY(U,$J,358.3,24272,0)
 ;;=99245^^135^1486^5
 ;;^UTILITY(U,$J,358.3,24272,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24272,1,1,0)
 ;;=1^COMPREHENSIVE EXAM
 ;;^UTILITY(U,$J,358.3,24272,1,2,0)
 ;;=2^99245
 ;;^UTILITY(U,$J,358.3,24273,0)
 ;;=188.9^^136^1487^6
 ;;^UTILITY(U,$J,358.3,24273,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24273,1,1,0)
 ;;=1^188.9
 ;;^UTILITY(U,$J,358.3,24273,1,2,0)
 ;;=2^BLADDER CANCER,UNSPEC
 ;;^UTILITY(U,$J,358.3,24273,2)
 ;;=^267253
 ;;^UTILITY(U,$J,358.3,24274,0)
 ;;=162.9^^136^1487^27
 ;;^UTILITY(U,$J,358.3,24274,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24274,1,1,0)
 ;;=1^162.9
 ;;^UTILITY(U,$J,358.3,24274,1,2,0)
 ;;=2^LUNG CANCER
 ;;^UTILITY(U,$J,358.3,24274,2)
 ;;=^73521
 ;;^UTILITY(U,$J,358.3,24275,0)
 ;;=191.9^^136^1487^8
 ;;^UTILITY(U,$J,358.3,24275,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24275,1,1,0)
 ;;=1^191.9
 ;;^UTILITY(U,$J,358.3,24275,1,2,0)
 ;;=2^BRAIN CANCER,UNSPEC
 ;;^UTILITY(U,$J,358.3,24275,2)
 ;;=^267279
 ;;^UTILITY(U,$J,358.3,24276,0)
 ;;=171.9^^136^1487^15
 ;;^UTILITY(U,$J,358.3,24276,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24276,1,1,0)
 ;;=1^171.9
 ;;^UTILITY(U,$J,358.3,24276,1,2,0)
 ;;=2^CONNECTIVE/OTH SOFT TISSUE CANCER,SITE UNSPEC
 ;;^UTILITY(U,$J,358.3,24276,2)
 ;;=^267165
 ;;^UTILITY(U,$J,358.3,24277,0)
 ;;=150.9^^136^1487^17
 ;;^UTILITY(U,$J,358.3,24277,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24277,1,1,0)
 ;;=1^150.9
 ;;^UTILITY(U,$J,358.3,24277,1,2,0)
 ;;=2^ESOPHAGEAL CANCER
 ;;^UTILITY(U,$J,358.3,24277,2)
 ;;=^267055
 ;;^UTILITY(U,$J,358.3,24278,0)
 ;;=153.9^^136^1487^14
 ;;^UTILITY(U,$J,358.3,24278,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24278,1,1,0)
 ;;=1^153.9
 ;;^UTILITY(U,$J,358.3,24278,1,2,0)
 ;;=2^COLON CANCER
 ;;^UTILITY(U,$J,358.3,24278,2)
 ;;=^267078
 ;;^UTILITY(U,$J,358.3,24279,0)
 ;;=152.9^^136^1487^59
 ;;^UTILITY(U,$J,358.3,24279,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24279,1,1,0)
 ;;=1^152.9
 ;;^UTILITY(U,$J,358.3,24279,1,2,0)
 ;;=2^SMALL INTESTINE CANCER
 ;;^UTILITY(U,$J,358.3,24279,2)
 ;;=^267077
 ;;^UTILITY(U,$J,358.3,24280,0)
 ;;=193.^^136^1487^63
 ;;
 ;;$END ROU IBDEI1DD
