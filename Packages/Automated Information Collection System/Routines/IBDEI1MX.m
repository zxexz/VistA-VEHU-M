IBDEI1MX ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,29030,2)
 ;;=^331920
 ;;^UTILITY(U,$J,358.3,29031,0)
 ;;=295.20^^171^1854^79
 ;;^UTILITY(U,$J,358.3,29031,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29031,1,3,0)
 ;;=3^Schizo,Catatonic NOS
 ;;^UTILITY(U,$J,358.3,29031,1,4,0)
 ;;=4^295.20
 ;;^UTILITY(U,$J,358.3,29031,2)
 ;;=^108310
 ;;^UTILITY(U,$J,358.3,29032,0)
 ;;=295.10^^171^1854^75
 ;;^UTILITY(U,$J,358.3,29032,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29032,1,3,0)
 ;;=3^Schizo, Disorganized NOS
 ;;^UTILITY(U,$J,358.3,29032,1,4,0)
 ;;=4^295.10
 ;;^UTILITY(U,$J,358.3,29032,2)
 ;;=^108319
 ;;^UTILITY(U,$J,358.3,29033,0)
 ;;=295.30^^171^1854^76
 ;;^UTILITY(U,$J,358.3,29033,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29033,1,3,0)
 ;;=3^Schizo, Paranoid
 ;;^UTILITY(U,$J,358.3,29033,1,4,0)
 ;;=4^295.30
 ;;^UTILITY(U,$J,358.3,29033,2)
 ;;=^108330
 ;;^UTILITY(U,$J,358.3,29034,0)
 ;;=295.62^^171^1854^77
 ;;^UTILITY(U,$J,358.3,29034,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29034,1,3,0)
 ;;=3^Schizo, Residual, Chr
 ;;^UTILITY(U,$J,358.3,29034,1,4,0)
 ;;=4^295.62
 ;;^UTILITY(U,$J,358.3,29034,2)
 ;;=^331853
 ;;^UTILITY(U,$J,358.3,29035,0)
 ;;=295.92^^171^1854^78
 ;;^UTILITY(U,$J,358.3,29035,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29035,1,3,0)
 ;;=3^Schizo, Undiff, Chr
 ;;^UTILITY(U,$J,358.3,29035,1,4,0)
 ;;=4^295.92
 ;;^UTILITY(U,$J,358.3,29035,2)
 ;;=^268093
 ;;^UTILITY(U,$J,358.3,29036,0)
 ;;=295.70^^171^1854^80
 ;;^UTILITY(U,$J,358.3,29036,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29036,1,3,0)
 ;;=3^Schizoaffective Dis
 ;;^UTILITY(U,$J,358.3,29036,1,4,0)
 ;;=4^295.70
 ;;^UTILITY(U,$J,358.3,29036,2)
 ;;=^331857
 ;;^UTILITY(U,$J,358.3,29037,0)
 ;;=295.90^^171^1854^81
 ;;^UTILITY(U,$J,358.3,29037,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29037,1,3,0)
 ;;=3^Schizophrenia NOS
 ;;^UTILITY(U,$J,358.3,29037,1,4,0)
 ;;=4^295.90
 ;;^UTILITY(U,$J,358.3,29037,2)
 ;;=^108287
 ;;^UTILITY(U,$J,358.3,29038,0)
 ;;=304.10^^171^1854^83
 ;;^UTILITY(U,$J,358.3,29038,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29038,1,3,0)
 ;;=3^Sedative, Hypnotic, Anxio Depend
 ;;^UTILITY(U,$J,358.3,29038,1,4,0)
 ;;=4^304.10
 ;;^UTILITY(U,$J,358.3,29038,2)
 ;;=^331931
 ;;^UTILITY(U,$J,358.3,29039,0)
 ;;=305.40^^171^1854^82
 ;;^UTILITY(U,$J,358.3,29039,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29039,1,3,0)
 ;;=3^Sedative, Hypnotic, Anxio Abuse
 ;;^UTILITY(U,$J,358.3,29039,1,4,0)
 ;;=4^305.40
 ;;^UTILITY(U,$J,358.3,29039,2)
 ;;=^331935
 ;;^UTILITY(U,$J,358.3,29040,0)
 ;;=780.99^^171^1854^58
 ;;^UTILITY(U,$J,358.3,29040,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29040,1,3,0)
 ;;=3^Other General Symptoms
 ;;^UTILITY(U,$J,358.3,29040,1,4,0)
 ;;=4^780.99
 ;;^UTILITY(U,$J,358.3,29040,2)
 ;;=^328568
 ;;^UTILITY(U,$J,358.3,29041,0)
 ;;=780.79^^171^1854^36
 ;;^UTILITY(U,$J,358.3,29041,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29041,1,3,0)
 ;;=3^General Weakness
 ;;^UTILITY(U,$J,358.3,29041,1,4,0)
 ;;=4^780.79
 ;;^UTILITY(U,$J,358.3,29041,2)
 ;;=^73344
 ;;^UTILITY(U,$J,358.3,29042,0)
 ;;=369.4^^171^1854^46
 ;;^UTILITY(U,$J,358.3,29042,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29042,1,3,0)
 ;;=3^Legal Blindness (USA Definition)
 ;;^UTILITY(U,$J,358.3,29042,1,4,0)
 ;;=4^369.4
 ;;^UTILITY(U,$J,358.3,29042,2)
 ;;=^268887
 ;;^UTILITY(U,$J,358.3,29043,0)
 ;;=413.9^^171^1854^5
 ;;^UTILITY(U,$J,358.3,29043,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29043,1,3,0)
 ;;=3^Angina Pectoris NEC/NOS
 ;;^UTILITY(U,$J,358.3,29043,1,4,0)
 ;;=4^413.9
 ;;^UTILITY(U,$J,358.3,29043,2)
 ;;=^87258
 ;;^UTILITY(U,$J,358.3,29044,0)
 ;;=300.00^^171^1854^6
 ;;^UTILITY(U,$J,358.3,29044,1,0)
 ;;=^358.31IA^4^2
 ;;
 ;;$END ROU IBDEI1MX
