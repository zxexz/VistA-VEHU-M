IBDEI1XA ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,33786,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33786,1,3,0)
 ;;=3^Fall from Non-Moving Wheelchair,Init Encntr
 ;;^UTILITY(U,$J,358.3,33786,1,4,0)
 ;;=4^W05.0XXA
 ;;^UTILITY(U,$J,358.3,33786,2)
 ;;=^5059550
 ;;^UTILITY(U,$J,358.3,33787,0)
 ;;=W05.0XXD^^182^2011^50
 ;;^UTILITY(U,$J,358.3,33787,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33787,1,3,0)
 ;;=3^Fall from Non-Moving Wheelchair,Subs Encntr
 ;;^UTILITY(U,$J,358.3,33787,1,4,0)
 ;;=4^W05.0XXD
 ;;^UTILITY(U,$J,358.3,33787,2)
 ;;=^5059551
 ;;^UTILITY(U,$J,358.3,33788,0)
 ;;=W05.1XXA^^182^2011^47
 ;;^UTILITY(U,$J,358.3,33788,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33788,1,3,0)
 ;;=3^Fall from Non-Moving Non-Motorized Scooter,Init Encntr
 ;;^UTILITY(U,$J,358.3,33788,1,4,0)
 ;;=4^W05.1XXA
 ;;^UTILITY(U,$J,358.3,33788,2)
 ;;=^5059553
 ;;^UTILITY(U,$J,358.3,33789,0)
 ;;=W05.1XXD^^182^2011^48
 ;;^UTILITY(U,$J,358.3,33789,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33789,1,3,0)
 ;;=3^Fall from Non-Moving Non-Motorized Scooter,Subs Encntr
 ;;^UTILITY(U,$J,358.3,33789,1,4,0)
 ;;=4^W05.1XXD
 ;;^UTILITY(U,$J,358.3,33789,2)
 ;;=^5059554
 ;;^UTILITY(U,$J,358.3,33790,0)
 ;;=W05.2XXA^^182^2011^45
 ;;^UTILITY(U,$J,358.3,33790,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33790,1,3,0)
 ;;=3^Fall from Non-Moving Motorized Scooter,Init Encntr
 ;;^UTILITY(U,$J,358.3,33790,1,4,0)
 ;;=4^W05.2XXA
 ;;^UTILITY(U,$J,358.3,33790,2)
 ;;=^5059556
 ;;^UTILITY(U,$J,358.3,33791,0)
 ;;=W05.2XXD^^182^2011^46
 ;;^UTILITY(U,$J,358.3,33791,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33791,1,3,0)
 ;;=3^Fall from Non-Moving Motorized Scooter,Subs Encntr
 ;;^UTILITY(U,$J,358.3,33791,1,4,0)
 ;;=4^W05.2XXD
 ;;^UTILITY(U,$J,358.3,33791,2)
 ;;=^5059557
 ;;^UTILITY(U,$J,358.3,33792,0)
 ;;=W06.XXXA^^182^2011^27
 ;;^UTILITY(U,$J,358.3,33792,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33792,1,3,0)
 ;;=3^Fall from Bed,Init Encntr
 ;;^UTILITY(U,$J,358.3,33792,1,4,0)
 ;;=4^W06.XXXA
 ;;^UTILITY(U,$J,358.3,33792,2)
 ;;=^5059559
 ;;^UTILITY(U,$J,358.3,33793,0)
 ;;=W06.XXXD^^182^2011^28
 ;;^UTILITY(U,$J,358.3,33793,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33793,1,3,0)
 ;;=3^Fall from Bed,Subs Encntr
 ;;^UTILITY(U,$J,358.3,33793,1,4,0)
 ;;=4^W06.XXXD
 ;;^UTILITY(U,$J,358.3,33793,2)
 ;;=^5059560
 ;;^UTILITY(U,$J,358.3,33794,0)
 ;;=W07.XXXA^^182^2011^35
 ;;^UTILITY(U,$J,358.3,33794,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33794,1,3,0)
 ;;=3^Fall from Chair,Init Encntr
 ;;^UTILITY(U,$J,358.3,33794,1,4,0)
 ;;=4^W07.XXXA
 ;;^UTILITY(U,$J,358.3,33794,2)
 ;;=^5059562
 ;;^UTILITY(U,$J,358.3,33795,0)
 ;;=W07.XXXD^^182^2011^36
 ;;^UTILITY(U,$J,358.3,33795,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33795,1,3,0)
 ;;=3^Fall from Chair,Subs Encntr
 ;;^UTILITY(U,$J,358.3,33795,1,4,0)
 ;;=4^W07.XXXD
 ;;^UTILITY(U,$J,358.3,33795,2)
 ;;=^5059563
 ;;^UTILITY(U,$J,358.3,33796,0)
 ;;=W10.1XXA^^182^2011^77
 ;;^UTILITY(U,$J,358.3,33796,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33796,1,3,0)
 ;;=3^Fall on Sidewalk Curb,Init Encntr
 ;;^UTILITY(U,$J,358.3,33796,1,4,0)
 ;;=4^W10.1XXA
 ;;^UTILITY(U,$J,358.3,33796,2)
 ;;=^5059583
 ;;^UTILITY(U,$J,358.3,33797,0)
 ;;=W10.1XXD^^182^2011^78
 ;;^UTILITY(U,$J,358.3,33797,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33797,1,3,0)
 ;;=3^Fall on Sidewalk Curb,Subs Encntr
 ;;^UTILITY(U,$J,358.3,33797,1,4,0)
 ;;=4^W10.1XXD
 ;;^UTILITY(U,$J,358.3,33797,2)
 ;;=^5059584
 ;;^UTILITY(U,$J,358.3,33798,0)
 ;;=W11.XXXA^^182^2011^39
 ;;^UTILITY(U,$J,358.3,33798,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33798,1,3,0)
 ;;=3^Fall from Ladder,Init Encntr
 ;;
 ;;$END ROU IBDEI1XA
