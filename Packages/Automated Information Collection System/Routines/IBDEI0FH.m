IBDEI0FH ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,7111,0)
 ;;=V10.22^^31^428^20
 ;;^UTILITY(U,$J,358.3,7111,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7111,1,4,0)
 ;;=4^V10.22
 ;;^UTILITY(U,$J,358.3,7111,1,5,0)
 ;;=5^HX Nasal/Sinus Malig
 ;;^UTILITY(U,$J,358.3,7111,2)
 ;;=^295215
 ;;^UTILITY(U,$J,358.3,7112,0)
 ;;=V10.12^^31^428^33
 ;;^UTILITY(U,$J,358.3,7112,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7112,1,4,0)
 ;;=4^V10.12
 ;;^UTILITY(U,$J,358.3,7112,1,5,0)
 ;;=5^HX Tracheal Malig
 ;;^UTILITY(U,$J,358.3,7112,2)
 ;;=^295212
 ;;^UTILITY(U,$J,358.3,7113,0)
 ;;=V10.3^^31^428^4
 ;;^UTILITY(U,$J,358.3,7113,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7113,1,4,0)
 ;;=4^V10.3
 ;;^UTILITY(U,$J,358.3,7113,1,5,0)
 ;;=5^HX Breast Cancer
 ;;^UTILITY(U,$J,358.3,7113,2)
 ;;=^295217
 ;;^UTILITY(U,$J,358.3,7114,0)
 ;;=V10.51^^31^428^1
 ;;^UTILITY(U,$J,358.3,7114,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7114,1,4,0)
 ;;=4^V10.51
 ;;^UTILITY(U,$J,358.3,7114,1,5,0)
 ;;=5^HX Bladder Malig
 ;;^UTILITY(U,$J,358.3,7114,2)
 ;;=^295228
 ;;^UTILITY(U,$J,358.3,7115,0)
 ;;=V10.41^^31^428^5
 ;;^UTILITY(U,$J,358.3,7115,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7115,1,4,0)
 ;;=4^V10.41
 ;;^UTILITY(U,$J,358.3,7115,1,5,0)
 ;;=5^HX Cervical Malig
 ;;^UTILITY(U,$J,358.3,7115,2)
 ;;=^295219
 ;;^UTILITY(U,$J,358.3,7116,0)
 ;;=V10.48^^31^428^8
 ;;^UTILITY(U,$J,358.3,7116,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7116,1,4,0)
 ;;=4^V10.48
 ;;^UTILITY(U,$J,358.3,7116,1,5,0)
 ;;=5^HX Epididymis Malig
 ;;^UTILITY(U,$J,358.3,7116,2)
 ;;=^321226
 ;;^UTILITY(U,$J,358.3,7117,0)
 ;;=V10.52^^31^428^11
 ;;^UTILITY(U,$J,358.3,7117,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7117,1,4,0)
 ;;=4^V10.52
 ;;^UTILITY(U,$J,358.3,7117,1,5,0)
 ;;=5^HX Kidney Malig
 ;;^UTILITY(U,$J,358.3,7117,2)
 ;;=^295229
 ;;^UTILITY(U,$J,358.3,7118,0)
 ;;=V10.43^^31^428^26
 ;;^UTILITY(U,$J,358.3,7118,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7118,1,4,0)
 ;;=4^V10.43
 ;;^UTILITY(U,$J,358.3,7118,1,5,0)
 ;;=5^HX Ovarian Malig
 ;;^UTILITY(U,$J,358.3,7118,2)
 ;;=^295221
 ;;^UTILITY(U,$J,358.3,7119,0)
 ;;=V10.46^^31^428^27
 ;;^UTILITY(U,$J,358.3,7119,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7119,1,4,0)
 ;;=4^V10.46
 ;;^UTILITY(U,$J,358.3,7119,1,5,0)
 ;;=5^HX Prostatic Malig
 ;;^UTILITY(U,$J,358.3,7119,2)
 ;;=^295224
 ;;^UTILITY(U,$J,358.3,7120,0)
 ;;=V10.47^^31^428^30
 ;;^UTILITY(U,$J,358.3,7120,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7120,1,4,0)
 ;;=4^V10.47
 ;;^UTILITY(U,$J,358.3,7120,1,5,0)
 ;;=5^HX Testicular Malig
 ;;^UTILITY(U,$J,358.3,7120,2)
 ;;=^295225
 ;;^UTILITY(U,$J,358.3,7121,0)
 ;;=V10.42^^31^428^34
 ;;^UTILITY(U,$J,358.3,7121,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7121,1,4,0)
 ;;=4^V10.42
 ;;^UTILITY(U,$J,358.3,7121,1,5,0)
 ;;=5^HX Uterine Malig
 ;;^UTILITY(U,$J,358.3,7121,2)
 ;;=^295220
 ;;^UTILITY(U,$J,358.3,7122,0)
 ;;=V10.59^^31^428^25
 ;;^UTILITY(U,$J,358.3,7122,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7122,1,4,0)
 ;;=4^V10.59
 ;;^UTILITY(U,$J,358.3,7122,1,5,0)
 ;;=5^HX Other Urinary Malig
 ;;^UTILITY(U,$J,358.3,7122,2)
 ;;=^295230
 ;;^UTILITY(U,$J,358.3,7123,0)
 ;;=V10.61^^31^428^15
 ;;^UTILITY(U,$J,358.3,7123,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7123,1,4,0)
 ;;=4^V10.61
 ;;^UTILITY(U,$J,358.3,7123,1,5,0)
 ;;=5^HX Lymphoid Leukemia
 ;;^UTILITY(U,$J,358.3,7123,2)
 ;;=^295232
 ;;^UTILITY(U,$J,358.3,7124,0)
 ;;=V10.62^^31^428^19
 ;;^UTILITY(U,$J,358.3,7124,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7124,1,4,0)
 ;;=4^V10.62
 ;;^UTILITY(U,$J,358.3,7124,1,5,0)
 ;;=5^HX Myeloid Leukemia
 ;;^UTILITY(U,$J,358.3,7124,2)
 ;;=^295233
 ;;^UTILITY(U,$J,358.3,7125,0)
 ;;=V10.63^^31^428^18
 ;;
 ;;$END ROU IBDEI0FH
