IBDEI0Z3 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,17109,0)
 ;;=V10.21^^88^1046^30
 ;;^UTILITY(U,$J,358.3,17109,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17109,1,4,0)
 ;;=4^V10.21
 ;;^UTILITY(U,$J,358.3,17109,1,5,0)
 ;;=5^HX-LARYNGEAL MALIGNANCY
 ;;^UTILITY(U,$J,358.3,17109,2)
 ;;=^295214
 ;;^UTILITY(U,$J,358.3,17110,0)
 ;;=V10.22^^88^1046^37
 ;;^UTILITY(U,$J,358.3,17110,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17110,1,4,0)
 ;;=4^V10.22
 ;;^UTILITY(U,$J,358.3,17110,1,5,0)
 ;;=5^HX-NOSE/EAR/SINUS MALIG
 ;;^UTILITY(U,$J,358.3,17110,2)
 ;;=^295215
 ;;^UTILITY(U,$J,358.3,17111,0)
 ;;=V10.29^^88^1046^29
 ;;^UTILITY(U,$J,358.3,17111,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17111,1,4,0)
 ;;=4^V10.29
 ;;^UTILITY(U,$J,358.3,17111,1,5,0)
 ;;=5^HX-INTRATHORACIC MAL NEC
 ;;^UTILITY(U,$J,358.3,17111,2)
 ;;=^295216
 ;;^UTILITY(U,$J,358.3,17112,0)
 ;;=V10.3^^88^1046^4
 ;;^UTILITY(U,$J,358.3,17112,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17112,1,4,0)
 ;;=4^V10.3
 ;;^UTILITY(U,$J,358.3,17112,1,5,0)
 ;;=5^HX OF BREAST MALIGNANCY
 ;;^UTILITY(U,$J,358.3,17112,2)
 ;;=^295217
 ;;^UTILITY(U,$J,358.3,17113,0)
 ;;=V10.40^^88^1046^27
 ;;^UTILITY(U,$J,358.3,17113,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17113,1,4,0)
 ;;=4^V10.40
 ;;^UTILITY(U,$J,358.3,17113,1,5,0)
 ;;=5^HX-FEMALE GENIT MALG NOS
 ;;^UTILITY(U,$J,358.3,17113,2)
 ;;=^295218
 ;;^UTILITY(U,$J,358.3,17114,0)
 ;;=V10.41^^88^1046^23
 ;;^UTILITY(U,$J,358.3,17114,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17114,1,4,0)
 ;;=4^V10.41
 ;;^UTILITY(U,$J,358.3,17114,1,5,0)
 ;;=5^HX-CERVICAL MALIGNANCY
 ;;^UTILITY(U,$J,358.3,17114,2)
 ;;=^295219
 ;;^UTILITY(U,$J,358.3,17115,0)
 ;;=V10.42^^88^1046^47
 ;;^UTILITY(U,$J,358.3,17115,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17115,1,4,0)
 ;;=4^V10.42
 ;;^UTILITY(U,$J,358.3,17115,1,5,0)
 ;;=5^HX-UTERUS MALIGNANCY NEC
 ;;^UTILITY(U,$J,358.3,17115,2)
 ;;=^295220
 ;;^UTILITY(U,$J,358.3,17116,0)
 ;;=V10.43^^88^1046^19
 ;;^UTILITY(U,$J,358.3,17116,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17116,1,4,0)
 ;;=4^V10.43
 ;;^UTILITY(U,$J,358.3,17116,1,5,0)
 ;;=5^HX OF OVARIAN MALIGNANCY
 ;;^UTILITY(U,$J,358.3,17116,2)
 ;;=^295221
 ;;^UTILITY(U,$J,358.3,17117,0)
 ;;=V10.44^^88^1046^26
 ;;^UTILITY(U,$J,358.3,17117,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17117,1,4,0)
 ;;=4^V10.44
 ;;^UTILITY(U,$J,358.3,17117,1,5,0)
 ;;=5^HX-FEMALE GENIT MALG NEC
 ;;^UTILITY(U,$J,358.3,17117,2)
 ;;=^295222
 ;;^UTILITY(U,$J,358.3,17118,0)
 ;;=V10.45^^88^1046^34
 ;;^UTILITY(U,$J,358.3,17118,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17118,1,4,0)
 ;;=4^V10.45
 ;;^UTILITY(U,$J,358.3,17118,1,5,0)
 ;;=5^HX-MALE GENIT MALIG NOS
 ;;^UTILITY(U,$J,358.3,17118,2)
 ;;=^295223
 ;;^UTILITY(U,$J,358.3,17119,0)
 ;;=V10.46^^88^1046^39
 ;;^UTILITY(U,$J,358.3,17119,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17119,1,4,0)
 ;;=4^V10.46
 ;;^UTILITY(U,$J,358.3,17119,1,5,0)
 ;;=5^HX-PROSTATIC MALIGNANCY
 ;;^UTILITY(U,$J,358.3,17119,2)
 ;;=^295224
 ;;^UTILITY(U,$J,358.3,17120,0)
 ;;=V10.47^^88^1046^43
 ;;^UTILITY(U,$J,358.3,17120,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17120,1,4,0)
 ;;=4^V10.47
 ;;^UTILITY(U,$J,358.3,17120,1,5,0)
 ;;=5^HX-TESTICULAR MALIGNANCY
 ;;^UTILITY(U,$J,358.3,17120,2)
 ;;=^295225
 ;;^UTILITY(U,$J,358.3,17121,0)
 ;;=V10.48^^88^1046^48
 ;;^UTILITY(U,$J,358.3,17121,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17121,1,4,0)
 ;;=4^V10.48
 ;;^UTILITY(U,$J,358.3,17121,1,5,0)
 ;;=5^PSNL HX MAL NEOPL-EPIDID
 ;;^UTILITY(U,$J,358.3,17121,2)
 ;;=^321226
 ;;^UTILITY(U,$J,358.3,17122,0)
 ;;=V10.49^^88^1046^33
 ;;^UTILITY(U,$J,358.3,17122,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17122,1,4,0)
 ;;=4^V10.49
 ;;
 ;;$END ROU IBDEI0Z3
