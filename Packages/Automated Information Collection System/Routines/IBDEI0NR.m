IBDEI0NR ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11321,2)
 ;;=^268251
 ;;^UTILITY(U,$J,358.3,11322,0)
 ;;=305.72^^50^641^17
 ;;^UTILITY(U,$J,358.3,11322,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11322,1,2,0)
 ;;=2^305.72
 ;;^UTILITY(U,$J,358.3,11322,1,5,0)
 ;;=5^Amphetamine Abuse, Episodic
 ;;^UTILITY(U,$J,358.3,11322,2)
 ;;=^268252
 ;;^UTILITY(U,$J,358.3,11323,0)
 ;;=305.91^^50^641^77
 ;;^UTILITY(U,$J,358.3,11323,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11323,1,2,0)
 ;;=2^305.91
 ;;^UTILITY(U,$J,358.3,11323,1,5,0)
 ;;=5^Other Drug Abuse, Continuous
 ;;^UTILITY(U,$J,358.3,11323,2)
 ;;=^268259
 ;;^UTILITY(U,$J,358.3,11324,0)
 ;;=305.92^^50^641^78
 ;;^UTILITY(U,$J,358.3,11324,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11324,1,2,0)
 ;;=2^305.92
 ;;^UTILITY(U,$J,358.3,11324,1,5,0)
 ;;=5^Other Drug Abuse, Episodic
 ;;^UTILITY(U,$J,358.3,11324,2)
 ;;=^268260
 ;;^UTILITY(U,$J,358.3,11325,0)
 ;;=304.03^^50^641^72
 ;;^UTILITY(U,$J,358.3,11325,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11325,1,2,0)
 ;;=2^304.03
 ;;^UTILITY(U,$J,358.3,11325,1,5,0)
 ;;=5^Opioid Dep-Remission
 ;;^UTILITY(U,$J,358.3,11325,2)
 ;;=^268193
 ;;^UTILITY(U,$J,358.3,11326,0)
 ;;=V65.2^^50^642^35
 ;;^UTILITY(U,$J,358.3,11326,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11326,1,2,0)
 ;;=2^V65.2
 ;;^UTILITY(U,$J,358.3,11326,1,5,0)
 ;;=5^Malingering
 ;;^UTILITY(U,$J,358.3,11326,2)
 ;;=^92393
 ;;^UTILITY(U,$J,358.3,11327,0)
 ;;=V65.49^^50^642^3
 ;;^UTILITY(U,$J,358.3,11327,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11327,1,2,0)
 ;;=2^V65.49
 ;;^UTILITY(U,$J,358.3,11327,1,5,0)
 ;;=5^Counseling,Oth Specified
 ;;^UTILITY(U,$J,358.3,11327,2)
 ;;=^303471
 ;;^UTILITY(U,$J,358.3,11328,0)
 ;;=V61.10^^50^642^43
 ;;^UTILITY(U,$J,358.3,11328,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11328,1,2,0)
 ;;=2^V61.10
 ;;^UTILITY(U,$J,358.3,11328,1,5,0)
 ;;=5^Partner Relational Problem
 ;;^UTILITY(U,$J,358.3,11328,2)
 ;;=^74110
 ;;^UTILITY(U,$J,358.3,11329,0)
 ;;=V61.20^^50^642^41
 ;;^UTILITY(U,$J,358.3,11329,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11329,1,2,0)
 ;;=2^V61.20
 ;;^UTILITY(U,$J,358.3,11329,1,5,0)
 ;;=5^Parent-Child Problem NOS
 ;;^UTILITY(U,$J,358.3,11329,2)
 ;;=^304300
 ;;^UTILITY(U,$J,358.3,11330,0)
 ;;=V61.12^^50^642^5
 ;;^UTILITY(U,$J,358.3,11330,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11330,1,2,0)
 ;;=2^V61.12
 ;;^UTILITY(U,$J,358.3,11330,1,5,0)
 ;;=5^Domestic Violence/Perpet
 ;;^UTILITY(U,$J,358.3,11330,2)
 ;;=^304356
 ;;^UTILITY(U,$J,358.3,11331,0)
 ;;=V61.11^^50^642^6
 ;;^UTILITY(U,$J,358.3,11331,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11331,1,2,0)
 ;;=2^V61.11
 ;;^UTILITY(U,$J,358.3,11331,1,5,0)
 ;;=5^Domestic Violence/Victim
 ;;^UTILITY(U,$J,358.3,11331,2)
 ;;=^304357
 ;;^UTILITY(U,$J,358.3,11332,0)
 ;;=V62.0^^50^642^51
 ;;^UTILITY(U,$J,358.3,11332,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11332,1,2,0)
 ;;=2^V62.0
 ;;^UTILITY(U,$J,358.3,11332,1,5,0)
 ;;=5^Unemployment
 ;;^UTILITY(U,$J,358.3,11332,2)
 ;;=^123545
 ;;^UTILITY(U,$J,358.3,11333,0)
 ;;=V69.2^^50^642^17
 ;;^UTILITY(U,$J,358.3,11333,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11333,1,2,0)
 ;;=2^V69.2
 ;;^UTILITY(U,$J,358.3,11333,1,5,0)
 ;;=5^Hi-Risk Sexual Behavior
 ;;^UTILITY(U,$J,358.3,11333,2)
 ;;=^303474
 ;;^UTILITY(U,$J,358.3,11334,0)
 ;;=V62.82^^50^642^2
 ;;^UTILITY(U,$J,358.3,11334,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11334,1,2,0)
 ;;=2^V62.82
 ;;^UTILITY(U,$J,358.3,11334,1,5,0)
 ;;=5^Bereavement/Uncomplicated
 ;;^UTILITY(U,$J,358.3,11334,2)
 ;;=^123500
 ;;^UTILITY(U,$J,358.3,11335,0)
 ;;=V70.1^^50^642^46
 ;;^UTILITY(U,$J,358.3,11335,1,0)
 ;;=^358.31IA^5^2
 ;;
 ;;$END ROU IBDEI0NR
