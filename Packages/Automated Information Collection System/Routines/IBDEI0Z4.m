IBDEI0Z4 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,17122,1,5,0)
 ;;=5^HX-MALE GENIT MALIG NEC
 ;;^UTILITY(U,$J,358.3,17122,2)
 ;;=^295226
 ;;^UTILITY(U,$J,358.3,17123,0)
 ;;=V10.50^^88^1046^46
 ;;^UTILITY(U,$J,358.3,17123,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17123,1,4,0)
 ;;=4^V10.50
 ;;^UTILITY(U,$J,358.3,17123,1,5,0)
 ;;=5^HX-URINARY MALIGNAN NOS
 ;;^UTILITY(U,$J,358.3,17123,2)
 ;;=^295227
 ;;^UTILITY(U,$J,358.3,17124,0)
 ;;=V10.51^^88^1046^1
 ;;^UTILITY(U,$J,358.3,17124,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17124,1,4,0)
 ;;=4^V10.51
 ;;^UTILITY(U,$J,358.3,17124,1,5,0)
 ;;=5^HX OF BLADDER MALIGNANCY
 ;;^UTILITY(U,$J,358.3,17124,2)
 ;;=^295228
 ;;^UTILITY(U,$J,358.3,17125,0)
 ;;=V10.52^^88^1046^10
 ;;^UTILITY(U,$J,358.3,17125,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17125,1,4,0)
 ;;=4^V10.52
 ;;^UTILITY(U,$J,358.3,17125,1,5,0)
 ;;=5^HX OF KIDNEY MALIGNANCY
 ;;^UTILITY(U,$J,358.3,17125,2)
 ;;=^295229
 ;;^UTILITY(U,$J,358.3,17126,0)
 ;;=V10.53^^88^1046^15
 ;;^UTILITY(U,$J,358.3,17126,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17126,1,4,0)
 ;;=4^V10.53
 ;;^UTILITY(U,$J,358.3,17126,1,5,0)
 ;;=5^HX OF MAL NEOPLASM,RENAL PELVIS
 ;;^UTILITY(U,$J,358.3,17126,2)
 ;;=^323624
 ;;^UTILITY(U,$J,358.3,17127,0)
 ;;=V10.59^^88^1046^45
 ;;^UTILITY(U,$J,358.3,17127,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17127,1,4,0)
 ;;=4^V10.59
 ;;^UTILITY(U,$J,358.3,17127,1,5,0)
 ;;=5^HX-URINARY MALIGNAN NEC
 ;;^UTILITY(U,$J,358.3,17127,2)
 ;;=^295230
 ;;^UTILITY(U,$J,358.3,17128,0)
 ;;=V10.60^^88^1046^12
 ;;^UTILITY(U,$J,358.3,17128,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17128,1,4,0)
 ;;=4^V10.60
 ;;^UTILITY(U,$J,358.3,17128,1,5,0)
 ;;=5^HX OF LEUKEMIA NOS
 ;;^UTILITY(U,$J,358.3,17128,2)
 ;;=^295231
 ;;^UTILITY(U,$J,358.3,17129,0)
 ;;=V10.61^^88^1046^14
 ;;^UTILITY(U,$J,358.3,17129,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17129,1,4,0)
 ;;=4^V10.61
 ;;^UTILITY(U,$J,358.3,17129,1,5,0)
 ;;=5^HX OF LYMPHOID LEUKEMIA
 ;;^UTILITY(U,$J,358.3,17129,2)
 ;;=^295232
 ;;^UTILITY(U,$J,358.3,17130,0)
 ;;=V10.62^^88^1046^18
 ;;^UTILITY(U,$J,358.3,17130,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17130,1,4,0)
 ;;=4^V10.62
 ;;^UTILITY(U,$J,358.3,17130,1,5,0)
 ;;=5^HX OF MYELOID LEUKEMIA
 ;;^UTILITY(U,$J,358.3,17130,2)
 ;;=^295233
 ;;^UTILITY(U,$J,358.3,17131,0)
 ;;=V10.63^^88^1046^17
 ;;^UTILITY(U,$J,358.3,17131,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17131,1,4,0)
 ;;=4^V10.63
 ;;^UTILITY(U,$J,358.3,17131,1,5,0)
 ;;=5^HX OF MONOCYTIC LEUKEMIA
 ;;^UTILITY(U,$J,358.3,17131,2)
 ;;=^295234
 ;;^UTILITY(U,$J,358.3,17132,0)
 ;;=V10.69^^88^1046^11
 ;;^UTILITY(U,$J,358.3,17132,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17132,1,4,0)
 ;;=4^V10.69
 ;;^UTILITY(U,$J,358.3,17132,1,5,0)
 ;;=5^HX OF LEUKEMIA NEC
 ;;^UTILITY(U,$J,358.3,17132,2)
 ;;=^295235
 ;;^UTILITY(U,$J,358.3,17133,0)
 ;;=V10.71^^88^1046^32
 ;;^UTILITY(U,$J,358.3,17133,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17133,1,4,0)
 ;;=4^V10.71
 ;;^UTILITY(U,$J,358.3,17133,1,5,0)
 ;;=5^HX-LYMPHOSARCOMA
 ;;^UTILITY(U,$J,358.3,17133,2)
 ;;=^295236
 ;;^UTILITY(U,$J,358.3,17134,0)
 ;;=V10.72^^88^1046^28
 ;;^UTILITY(U,$J,358.3,17134,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17134,1,4,0)
 ;;=4^V10.72
 ;;^UTILITY(U,$J,358.3,17134,1,5,0)
 ;;=5^HX-HODGKIN'S DISEASE
 ;;^UTILITY(U,$J,358.3,17134,2)
 ;;=^295237
 ;;^UTILITY(U,$J,358.3,17135,0)
 ;;=V10.79^^88^1046^31
 ;;^UTILITY(U,$J,358.3,17135,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,17135,1,4,0)
 ;;=4^V10.79
 ;;^UTILITY(U,$J,358.3,17135,1,5,0)
 ;;=5^HX-LYMPHATIC MALIGN NEC
 ;;^UTILITY(U,$J,358.3,17135,2)
 ;;=^295238
 ;;^UTILITY(U,$J,358.3,17136,0)
 ;;=V10.81^^88^1046^2
 ;;
 ;;$END ROU IBDEI0Z4
