IBDEI0LL ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,10236,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10236,1,3,0)
 ;;=3^Epliepsy,Unspec
 ;;^UTILITY(U,$J,358.3,10236,1,4,0)
 ;;=4^345.90
 ;;^UTILITY(U,$J,358.3,10236,2)
 ;;=^268477
 ;;^UTILITY(U,$J,358.3,10237,0)
 ;;=368.02^^44^562^23
 ;;^UTILITY(U,$J,358.3,10237,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10237,1,3,0)
 ;;=3^Deprivation Amblyopia
 ;;^UTILITY(U,$J,358.3,10237,1,4,0)
 ;;=4^368.02
 ;;^UTILITY(U,$J,358.3,10237,2)
 ;;=^265361
 ;;^UTILITY(U,$J,358.3,10238,0)
 ;;=368.11^^44^562^103
 ;;^UTILITY(U,$J,358.3,10238,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10238,1,3,0)
 ;;=3^Sudden Visual Loss
 ;;^UTILITY(U,$J,358.3,10238,1,4,0)
 ;;=4^368.11
 ;;^UTILITY(U,$J,358.3,10238,2)
 ;;=^268831
 ;;^UTILITY(U,$J,358.3,10239,0)
 ;;=368.59^^44^562^11
 ;;^UTILITY(U,$J,358.3,10239,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10239,1,3,0)
 ;;=3^Color Blindness
 ;;^UTILITY(U,$J,358.3,10239,1,4,0)
 ;;=4^368.59
 ;;^UTILITY(U,$J,358.3,10239,2)
 ;;=^87408
 ;;^UTILITY(U,$J,358.3,10240,0)
 ;;=368.60^^44^562^67
 ;;^UTILITY(U,$J,358.3,10240,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10240,1,3,0)
 ;;=3^Night Blindness
 ;;^UTILITY(U,$J,358.3,10240,1,4,0)
 ;;=4^368.60
 ;;^UTILITY(U,$J,358.3,10240,2)
 ;;=^83350
 ;;^UTILITY(U,$J,358.3,10241,0)
 ;;=368.9^^44^562^114
 ;;^UTILITY(U,$J,358.3,10241,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10241,1,3,0)
 ;;=3^Visual Disturbance,Unspec
 ;;^UTILITY(U,$J,358.3,10241,1,4,0)
 ;;=4^368.9
 ;;^UTILITY(U,$J,358.3,10241,2)
 ;;=^124001
 ;;^UTILITY(U,$J,358.3,10242,0)
 ;;=369.00^^44^562^109
 ;;^UTILITY(U,$J,358.3,10242,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10242,1,3,0)
 ;;=3^Total Blindness,Both Eyes
 ;;^UTILITY(U,$J,358.3,10242,1,4,0)
 ;;=4^369.00
 ;;^UTILITY(U,$J,358.3,10242,2)
 ;;=^15310
 ;;^UTILITY(U,$J,358.3,10243,0)
 ;;=369.01^^44^562^110
 ;;^UTILITY(U,$J,358.3,10243,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10243,1,3,0)
 ;;=3^Total Impairment,Both Eyes
 ;;^UTILITY(U,$J,358.3,10243,1,4,0)
 ;;=4^369.01
 ;;^UTILITY(U,$J,358.3,10243,2)
 ;;=^268861
 ;;^UTILITY(U,$J,358.3,10244,0)
 ;;=369.02^^44^562^75
 ;;^UTILITY(U,$J,358.3,10244,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10244,1,3,0)
 ;;=3^One Eye-Near Total/Oth Eye-NOS
 ;;^UTILITY(U,$J,358.3,10244,1,4,0)
 ;;=4^369.02
 ;;^UTILITY(U,$J,358.3,10244,2)
 ;;=^268862
 ;;^UTILITY(U,$J,358.3,10245,0)
 ;;=369.03^^44^562^74
 ;;^UTILITY(U,$J,358.3,10245,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10245,1,3,0)
 ;;=3^One Eye-Near Total/Oth Eye Total
 ;;^UTILITY(U,$J,358.3,10245,1,4,0)
 ;;=4^369.03
 ;;^UTILITY(U,$J,358.3,10245,2)
 ;;=^268863
 ;;^UTILITY(U,$J,358.3,10246,0)
 ;;=369.04^^44^562^64
 ;;^UTILITY(U,$J,358.3,10246,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10246,1,3,0)
 ;;=3^Near Total Impairment,Both Eyes
 ;;^UTILITY(U,$J,358.3,10246,1,4,0)
 ;;=4^369.04
 ;;^UTILITY(U,$J,358.3,10246,2)
 ;;=^268864
 ;;^UTILITY(U,$J,358.3,10247,0)
 ;;=369.06^^44^562^78
 ;;^UTILITY(U,$J,358.3,10247,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10247,1,3,0)
 ;;=3^One Eye-Profound,Oth Eye-Total
 ;;^UTILITY(U,$J,358.3,10247,1,4,0)
 ;;=4^369.06
 ;;^UTILITY(U,$J,358.3,10247,2)
 ;;=^268866
 ;;^UTILITY(U,$J,358.3,10248,0)
 ;;=369.07^^44^562^77
 ;;^UTILITY(U,$J,358.3,10248,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10248,1,3,0)
 ;;=3^One Eye-Profound,Oth Eye-Near
 ;;^UTILITY(U,$J,358.3,10248,1,4,0)
 ;;=4^369.07
 ;;^UTILITY(U,$J,358.3,10248,2)
 ;;=^268867
 ;;^UTILITY(U,$J,358.3,10249,0)
 ;;=369.08^^44^562^92
 ;;^UTILITY(U,$J,358.3,10249,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,10249,1,3,0)
 ;;=3^Profound Impairment,Both Eyes
 ;;
 ;;$END ROU IBDEI0LL
