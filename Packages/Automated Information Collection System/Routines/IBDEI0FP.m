IBDEI0FP ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,7224,1,2,0)
 ;;=2^90636
 ;;^UTILITY(U,$J,358.3,7224,1,3,0)
 ;;=3^Hepatitis A&B Vaccine
 ;;^UTILITY(U,$J,358.3,7225,0)
 ;;=90707^^33^443^9^^^^1
 ;;^UTILITY(U,$J,358.3,7225,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7225,1,2,0)
 ;;=2^90707
 ;;^UTILITY(U,$J,358.3,7225,1,3,0)
 ;;=3^MMR Vaccine
 ;;^UTILITY(U,$J,358.3,7226,0)
 ;;=90658^^33^443^3^^^^1
 ;;^UTILITY(U,$J,358.3,7226,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7226,1,2,0)
 ;;=2^90658
 ;;^UTILITY(U,$J,358.3,7226,1,3,0)
 ;;=3^Flu Vaccine IM (Flulaval)
 ;;^UTILITY(U,$J,358.3,7227,0)
 ;;=90732^^33^443^10^^^^1
 ;;^UTILITY(U,$J,358.3,7227,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7227,1,2,0)
 ;;=2^90732
 ;;^UTILITY(U,$J,358.3,7227,1,3,0)
 ;;=3^Pneumococcal
 ;;^UTILITY(U,$J,358.3,7228,0)
 ;;=90714^^33^443^11^^^^1
 ;;^UTILITY(U,$J,358.3,7228,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7228,1,2,0)
 ;;=2^90714
 ;;^UTILITY(U,$J,358.3,7228,1,3,0)
 ;;=3^TD VACCINE
 ;;^UTILITY(U,$J,358.3,7229,0)
 ;;=90715^^33^443^12^^^^1
 ;;^UTILITY(U,$J,358.3,7229,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7229,1,2,0)
 ;;=2^90715
 ;;^UTILITY(U,$J,358.3,7229,1,3,0)
 ;;=3^TDAP VACCINE
 ;;^UTILITY(U,$J,358.3,7230,0)
 ;;=90656^^33^443^4^^^^1
 ;;^UTILITY(U,$J,358.3,7230,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7230,1,2,0)
 ;;=2^90656
 ;;^UTILITY(U,$J,358.3,7230,1,3,0)
 ;;=3^Flu Vaccine Single Dose Syringe (Afluria)
 ;;^UTILITY(U,$J,358.3,7231,0)
 ;;=90662^^33^443^2^^^^1
 ;;^UTILITY(U,$J,358.3,7231,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7231,1,2,0)
 ;;=2^90662
 ;;^UTILITY(U,$J,358.3,7231,1,3,0)
 ;;=3^Flu Vaccine High Dose Syringe (Fluzone)
 ;;^UTILITY(U,$J,358.3,7232,0)
 ;;=90736^^33^443^13^^^^1
 ;;^UTILITY(U,$J,358.3,7232,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7232,1,2,0)
 ;;=2^90736
 ;;^UTILITY(U,$J,358.3,7232,1,3,0)
 ;;=3^ZOSTER (SHINGLES) VACCINE
 ;;^UTILITY(U,$J,358.3,7233,0)
 ;;=95120^^33^444^5^^^^1
 ;;^UTILITY(U,$J,358.3,7233,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7233,1,2,0)
 ;;=2^95120
 ;;^UTILITY(U,$J,358.3,7233,1,3,0)
 ;;=3^Allergy Injection
 ;;^UTILITY(U,$J,358.3,7234,0)
 ;;=J3301^^33^444^26^^^^1
 ;;^UTILITY(U,$J,358.3,7234,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7234,1,2,0)
 ;;=2^J3301
 ;;^UTILITY(U,$J,358.3,7234,1,3,0)
 ;;=3^Kenalog per 10mg
 ;;^UTILITY(U,$J,358.3,7235,0)
 ;;=J9217^^33^444^28^^^^1
 ;;^UTILITY(U,$J,358.3,7235,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7235,1,2,0)
 ;;=2^J9217
 ;;^UTILITY(U,$J,358.3,7235,1,3,0)
 ;;=3^Lupron per 7.5mg
 ;;^UTILITY(U,$J,358.3,7236,0)
 ;;=J1885^^33^444^43^^^^1
 ;;^UTILITY(U,$J,358.3,7236,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7236,1,2,0)
 ;;=2^J1885
 ;;^UTILITY(U,$J,358.3,7236,1,3,0)
 ;;=3^Toradol per 15mg
 ;;^UTILITY(U,$J,358.3,7237,0)
 ;;=J3420^^33^444^44^^^^1
 ;;^UTILITY(U,$J,358.3,7237,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7237,1,2,0)
 ;;=2^J3420
 ;;^UTILITY(U,$J,358.3,7237,1,3,0)
 ;;=3^Vitamin B12 per 1000mcg
 ;;^UTILITY(U,$J,358.3,7238,0)
 ;;=J2270^^33^444^32^^^^1
 ;;^UTILITY(U,$J,358.3,7238,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7238,1,2,0)
 ;;=2^J2270
 ;;^UTILITY(U,$J,358.3,7238,1,3,0)
 ;;=3^Morphine Sulfate per 10mg
 ;;^UTILITY(U,$J,358.3,7239,0)
 ;;=J1940^^33^444^27^^^^1
 ;;^UTILITY(U,$J,358.3,7239,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7239,1,2,0)
 ;;=2^J1940
 ;;^UTILITY(U,$J,358.3,7239,1,3,0)
 ;;=3^Lasix per 20mg
 ;;^UTILITY(U,$J,358.3,7240,0)
 ;;=J0515^^33^444^10^^^^1
 ;;^UTILITY(U,$J,358.3,7240,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7240,1,2,0)
 ;;=2^J0515
 ;;^UTILITY(U,$J,358.3,7240,1,3,0)
 ;;=3^Benzotropine per 1mg
 ;;
 ;;$END ROU IBDEI0FP
