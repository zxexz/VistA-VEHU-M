IBDEI1FI ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,25341,0)
 ;;=V10.71^^147^1587^32
 ;;^UTILITY(U,$J,358.3,25341,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25341,1,4,0)
 ;;=4^V10.71
 ;;^UTILITY(U,$J,358.3,25341,1,5,0)
 ;;=5^HX-LYMPHOSARCOMA
 ;;^UTILITY(U,$J,358.3,25341,2)
 ;;=^295236
 ;;^UTILITY(U,$J,358.3,25342,0)
 ;;=V10.72^^147^1587^28
 ;;^UTILITY(U,$J,358.3,25342,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25342,1,4,0)
 ;;=4^V10.72
 ;;^UTILITY(U,$J,358.3,25342,1,5,0)
 ;;=5^HX-HODGKIN'S DISEASE
 ;;^UTILITY(U,$J,358.3,25342,2)
 ;;=^295237
 ;;^UTILITY(U,$J,358.3,25343,0)
 ;;=V10.79^^147^1587^31
 ;;^UTILITY(U,$J,358.3,25343,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25343,1,4,0)
 ;;=4^V10.79
 ;;^UTILITY(U,$J,358.3,25343,1,5,0)
 ;;=5^HX-LYMPHATIC MALIGN NEC
 ;;^UTILITY(U,$J,358.3,25343,2)
 ;;=^295238
 ;;^UTILITY(U,$J,358.3,25344,0)
 ;;=V10.81^^147^1587^2
 ;;^UTILITY(U,$J,358.3,25344,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25344,1,4,0)
 ;;=4^V10.81
 ;;^UTILITY(U,$J,358.3,25344,1,5,0)
 ;;=5^HX OF BONE MALIGNANCY
 ;;^UTILITY(U,$J,358.3,25344,2)
 ;;=^295239
 ;;^UTILITY(U,$J,358.3,25345,0)
 ;;=V10.82^^147^1587^35
 ;;^UTILITY(U,$J,358.3,25345,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25345,1,4,0)
 ;;=4^V10.82
 ;;^UTILITY(U,$J,358.3,25345,1,5,0)
 ;;=5^HX-MALIG SKIN MELANOMA
 ;;^UTILITY(U,$J,358.3,25345,2)
 ;;=^295240
 ;;^UTILITY(U,$J,358.3,25346,0)
 ;;=V10.83^^147^1587^42
 ;;^UTILITY(U,$J,358.3,25346,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25346,1,4,0)
 ;;=4^V10.83
 ;;^UTILITY(U,$J,358.3,25346,1,5,0)
 ;;=5^HX-SKIN MALIGNANCY NEC
 ;;^UTILITY(U,$J,358.3,25346,2)
 ;;=^295241
 ;;^UTILITY(U,$J,358.3,25347,0)
 ;;=V10.84^^147^1587^6
 ;;^UTILITY(U,$J,358.3,25347,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25347,1,4,0)
 ;;=4^V10.84
 ;;^UTILITY(U,$J,358.3,25347,1,5,0)
 ;;=5^HX OF EYE MALIGNANCY
 ;;^UTILITY(U,$J,358.3,25347,2)
 ;;=^295242
 ;;^UTILITY(U,$J,358.3,25348,0)
 ;;=V10.85^^147^1587^3
 ;;^UTILITY(U,$J,358.3,25348,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25348,1,4,0)
 ;;=4^V10.85
 ;;^UTILITY(U,$J,358.3,25348,1,5,0)
 ;;=5^HX OF BRAIN MALIGNANCY
 ;;^UTILITY(U,$J,358.3,25348,2)
 ;;=^295243
 ;;^UTILITY(U,$J,358.3,25349,0)
 ;;=V10.86^^147^1587^36
 ;;^UTILITY(U,$J,358.3,25349,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25349,1,4,0)
 ;;=4^V10.86
 ;;^UTILITY(U,$J,358.3,25349,1,5,0)
 ;;=5^HX-MALIGN NERVE SYST NEC
 ;;^UTILITY(U,$J,358.3,25349,2)
 ;;=^295244
 ;;^UTILITY(U,$J,358.3,25350,0)
 ;;=V10.87^^147^1587^20
 ;;^UTILITY(U,$J,358.3,25350,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25350,1,4,0)
 ;;=4^V10.87
 ;;^UTILITY(U,$J,358.3,25350,1,5,0)
 ;;=5^HX OF THYROID MALIGNANCY
 ;;^UTILITY(U,$J,358.3,25350,2)
 ;;=^295245
 ;;^UTILITY(U,$J,358.3,25351,0)
 ;;=V10.88^^147^1587^24
 ;;^UTILITY(U,$J,358.3,25351,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25351,1,4,0)
 ;;=4^V10.88
 ;;^UTILITY(U,$J,358.3,25351,1,5,0)
 ;;=5^HX-ENDOCRINE MALIGN NEC
 ;;^UTILITY(U,$J,358.3,25351,2)
 ;;=^295246
 ;;^UTILITY(U,$J,358.3,25352,0)
 ;;=V10.89^^147^1587^16
 ;;^UTILITY(U,$J,358.3,25352,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25352,1,4,0)
 ;;=4^V10.89
 ;;^UTILITY(U,$J,358.3,25352,1,5,0)
 ;;=5^HX OF MALIGNANCY NEC
 ;;^UTILITY(U,$J,358.3,25352,2)
 ;;=^295247
 ;;^UTILITY(U,$J,358.3,25353,0)
 ;;=V45.71^^147^1588^7
 ;;^UTILITY(U,$J,358.3,25353,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25353,1,4,0)
 ;;=4^V45.71
 ;;^UTILITY(U,$J,358.3,25353,1,5,0)
 ;;=5^ACQUIRED ABSENCE OF BREAST
 ;;^UTILITY(U,$J,358.3,25353,2)
 ;;=^336882
 ;;^UTILITY(U,$J,358.3,25354,0)
 ;;=V45.72^^147^1588^6
 ;;^UTILITY(U,$J,358.3,25354,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25354,1,4,0)
 ;;=4^V45.72
 ;;
 ;;$END ROU IBDEI1FI
