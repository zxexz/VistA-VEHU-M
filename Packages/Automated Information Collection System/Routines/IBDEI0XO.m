IBDEI0XO ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,16387,0)
 ;;=99215^^83^973^5
 ;;^UTILITY(U,$J,358.3,16387,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,16387,1,1,0)
 ;;=1^Comprehensive
 ;;^UTILITY(U,$J,358.3,16387,1,2,0)
 ;;=2^99215
 ;;^UTILITY(U,$J,358.3,16388,0)
 ;;=99241^^83^974^1
 ;;^UTILITY(U,$J,358.3,16388,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,16388,1,1,0)
 ;;=1^Problem Focused
 ;;^UTILITY(U,$J,358.3,16388,1,2,0)
 ;;=2^99241
 ;;^UTILITY(U,$J,358.3,16389,0)
 ;;=99242^^83^974^2
 ;;^UTILITY(U,$J,358.3,16389,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,16389,1,1,0)
 ;;=1^Expanded Problem Focus
 ;;^UTILITY(U,$J,358.3,16389,1,2,0)
 ;;=2^99242
 ;;^UTILITY(U,$J,358.3,16390,0)
 ;;=99243^^83^974^3
 ;;^UTILITY(U,$J,358.3,16390,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,16390,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,16390,1,2,0)
 ;;=2^99243
 ;;^UTILITY(U,$J,358.3,16391,0)
 ;;=99244^^83^974^4
 ;;^UTILITY(U,$J,358.3,16391,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,16391,1,1,0)
 ;;=1^Comprehensive, Moderate
 ;;^UTILITY(U,$J,358.3,16391,1,2,0)
 ;;=2^99244
 ;;^UTILITY(U,$J,358.3,16392,0)
 ;;=99245^^83^974^5
 ;;^UTILITY(U,$J,358.3,16392,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,16392,1,1,0)
 ;;=1^Comprehensive, High
 ;;^UTILITY(U,$J,358.3,16392,1,2,0)
 ;;=2^99245
 ;;^UTILITY(U,$J,358.3,16393,0)
 ;;=783.0^^84^975^4
 ;;^UTILITY(U,$J,358.3,16393,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16393,1,3,0)
 ;;=3^783.0
 ;;^UTILITY(U,$J,358.3,16393,1,4,0)
 ;;=4^Anorexia
 ;;^UTILITY(U,$J,358.3,16394,0)
 ;;=786.50^^84^975^6
 ;;^UTILITY(U,$J,358.3,16394,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16394,1,3,0)
 ;;=3^786.50
 ;;^UTILITY(U,$J,358.3,16394,1,4,0)
 ;;=4^Chest Pain
 ;;^UTILITY(U,$J,358.3,16395,0)
 ;;=786.2^^84^975^8
 ;;^UTILITY(U,$J,358.3,16395,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16395,1,3,0)
 ;;=3^786.2
 ;;^UTILITY(U,$J,358.3,16395,1,4,0)
 ;;=4^Cough
 ;;^UTILITY(U,$J,358.3,16396,0)
 ;;=780.4^^84^975^10
 ;;^UTILITY(U,$J,358.3,16396,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16396,1,3,0)
 ;;=3^780.4
 ;;^UTILITY(U,$J,358.3,16396,1,4,0)
 ;;=4^Dizziness/Vertigo
 ;;^UTILITY(U,$J,358.3,16396,2)
 ;;=^35946
 ;;^UTILITY(U,$J,358.3,16397,0)
 ;;=536.8^^84^975^11
 ;;^UTILITY(U,$J,358.3,16397,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16397,1,3,0)
 ;;=3^536.8
 ;;^UTILITY(U,$J,358.3,16397,1,4,0)
 ;;=4^Dyspepsia/Indigest
 ;;^UTILITY(U,$J,358.3,16398,0)
 ;;=788.1^^84^975^13
 ;;^UTILITY(U,$J,358.3,16398,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16398,1,3,0)
 ;;=3^788.1
 ;;^UTILITY(U,$J,358.3,16398,1,4,0)
 ;;=4^Dysuria,Urgency,Freq.
 ;;^UTILITY(U,$J,358.3,16399,0)
 ;;=782.3^^84^975^14
 ;;^UTILITY(U,$J,358.3,16399,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16399,1,3,0)
 ;;=3^782.3
 ;;^UTILITY(U,$J,358.3,16399,1,4,0)
 ;;=4^Edema
 ;;^UTILITY(U,$J,358.3,16400,0)
 ;;=784.0^^84^975^16
 ;;^UTILITY(U,$J,358.3,16400,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16400,1,3,0)
 ;;=3^784.0
 ;;^UTILITY(U,$J,358.3,16400,1,4,0)
 ;;=4^Headache
 ;;^UTILITY(U,$J,358.3,16401,0)
 ;;=782.2^^84^975^20
 ;;^UTILITY(U,$J,358.3,16401,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16401,1,3,0)
 ;;=3^782.2
 ;;^UTILITY(U,$J,358.3,16401,1,4,0)
 ;;=4^Mass/Local Swelling
 ;;^UTILITY(U,$J,358.3,16402,0)
 ;;=785.1^^84^975^23
 ;;^UTILITY(U,$J,358.3,16402,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16402,1,3,0)
 ;;=3^785.1
 ;;^UTILITY(U,$J,358.3,16402,1,4,0)
 ;;=4^Palpitations
 ;;^UTILITY(U,$J,358.3,16403,0)
 ;;=780.2^^84^975^26
 ;;^UTILITY(U,$J,358.3,16403,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16403,1,3,0)
 ;;=3^780.2
 ;;^UTILITY(U,$J,358.3,16403,1,4,0)
 ;;=4^Syncope
 ;;
 ;;$END ROU IBDEI0XO
