IBDEI0U4 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,14596,1,5,0)
 ;;=5^Screen for Prostate CA
 ;;^UTILITY(U,$J,358.3,14596,2)
 ;;=Screen for Prostate CA^321548
 ;;^UTILITY(U,$J,358.3,14597,0)
 ;;=V74.5^^77^903^11
 ;;^UTILITY(U,$J,358.3,14597,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14597,1,4,0)
 ;;=4^V74.5
 ;;^UTILITY(U,$J,358.3,14597,1,5,0)
 ;;=5^Screening for STD's
 ;;^UTILITY(U,$J,358.3,14597,2)
 ;;=Screening for STD's^295637
 ;;^UTILITY(U,$J,358.3,14598,0)
 ;;=V73.89^^77^903^10
 ;;^UTILITY(U,$J,358.3,14598,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14598,1,4,0)
 ;;=4^V73.89
 ;;^UTILITY(U,$J,358.3,14598,1,5,0)
 ;;=5^Screening for HIV
 ;;^UTILITY(U,$J,358.3,14598,2)
 ;;=^295833
 ;;^UTILITY(U,$J,358.3,14599,0)
 ;;=V82.89^^77^903^12
 ;;^UTILITY(U,$J,358.3,14599,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14599,1,4,0)
 ;;=4^V82.89
 ;;^UTILITY(U,$J,358.3,14599,1,5,0)
 ;;=5^Screening for TBI/Not Found
 ;;^UTILITY(U,$J,358.3,14599,2)
 ;;=^322099
 ;;^UTILITY(U,$J,358.3,14600,0)
 ;;=V74.1^^77^903^9
 ;;^UTILITY(U,$J,358.3,14600,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14600,1,4,0)
 ;;=4^V74.1
 ;;^UTILITY(U,$J,358.3,14600,1,5,0)
 ;;=5^Screen for TB
 ;;^UTILITY(U,$J,358.3,14600,2)
 ;;=^108715
 ;;^UTILITY(U,$J,358.3,14601,0)
 ;;=V04.81^^77^903^2
 ;;^UTILITY(U,$J,358.3,14601,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14601,1,4,0)
 ;;=4^V04.81
 ;;^UTILITY(U,$J,358.3,14601,1,5,0)
 ;;=5^Need for Flu Vaccine
 ;;^UTILITY(U,$J,358.3,14601,2)
 ;;=^329964
 ;;^UTILITY(U,$J,358.3,14602,0)
 ;;=V06.1^^77^903^1
 ;;^UTILITY(U,$J,358.3,14602,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14602,1,4,0)
 ;;=4^V06.1
 ;;^UTILITY(U,$J,358.3,14602,1,5,0)
 ;;=5^Need for DTaP Vaccine
 ;;^UTILITY(U,$J,358.3,14602,2)
 ;;=^330093
 ;;^UTILITY(U,$J,358.3,14603,0)
 ;;=V03.82^^77^903^4
 ;;^UTILITY(U,$J,358.3,14603,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14603,1,4,0)
 ;;=4^V03.82
 ;;^UTILITY(U,$J,358.3,14603,1,5,0)
 ;;=5^Need for Pneumonia Vaccine
 ;;^UTILITY(U,$J,358.3,14603,2)
 ;;=^303387
 ;;^UTILITY(U,$J,358.3,14604,0)
 ;;=V05.3^^77^903^3
 ;;^UTILITY(U,$J,358.3,14604,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14604,1,4,0)
 ;;=4^V05.3
 ;;^UTILITY(U,$J,358.3,14604,1,5,0)
 ;;=5^Need for Hep A/Hep B Vaccine
 ;;^UTILITY(U,$J,358.3,14604,2)
 ;;=^295814
 ;;^UTILITY(U,$J,358.3,14605,0)
 ;;=V05.8^^77^903^5
 ;;^UTILITY(U,$J,358.3,14605,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14605,1,4,0)
 ;;=4^V05.8
 ;;^UTILITY(U,$J,358.3,14605,1,5,0)
 ;;=5^Need for Shingles Vaccine
 ;;^UTILITY(U,$J,358.3,14605,2)
 ;;=^295189
 ;;^UTILITY(U,$J,358.3,14606,0)
 ;;=780.02^^77^904^4
 ;;^UTILITY(U,$J,358.3,14606,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14606,1,4,0)
 ;;=4^780.02
 ;;^UTILITY(U,$J,358.3,14606,1,5,0)
 ;;=5^Altered Awareness, Transient
 ;;^UTILITY(U,$J,358.3,14606,2)
 ;;=^293932
 ;;^UTILITY(U,$J,358.3,14607,0)
 ;;=780.01^^77^904^5
 ;;^UTILITY(U,$J,358.3,14607,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14607,1,4,0)
 ;;=4^780.01
 ;;^UTILITY(U,$J,358.3,14607,1,5,0)
 ;;=5^Altered consciousness, coma
 ;;^UTILITY(U,$J,358.3,14607,2)
 ;;=^263540
 ;;^UTILITY(U,$J,358.3,14608,0)
 ;;=724.2^^77^904^27
 ;;^UTILITY(U,$J,358.3,14608,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14608,1,4,0)
 ;;=4^724.2
 ;;^UTILITY(U,$J,358.3,14608,1,5,0)
 ;;=5^Low Back Pain
 ;;^UTILITY(U,$J,358.3,14608,2)
 ;;=^71885
 ;;^UTILITY(U,$J,358.3,14609,0)
 ;;=724.5^^77^904^7
 ;;^UTILITY(U,$J,358.3,14609,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14609,1,4,0)
 ;;=4^724.5
 ;;^UTILITY(U,$J,358.3,14609,1,5,0)
 ;;=5^Back Pain, Thoracic
 ;;^UTILITY(U,$J,358.3,14609,2)
 ;;=^12250
 ;;^UTILITY(U,$J,358.3,14610,0)
 ;;=780.71^^77^904^10
 ;;
 ;;$END ROU IBDEI0U4
