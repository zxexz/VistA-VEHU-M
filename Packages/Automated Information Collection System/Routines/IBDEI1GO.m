IBDEI1GO ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,25925,1,5,0)
 ;;=5^Cannabis Abuse, Continued
 ;;^UTILITY(U,$J,358.3,25925,2)
 ;;=^268234
 ;;^UTILITY(U,$J,358.3,25926,0)
 ;;=305.22^^150^1647^33
 ;;^UTILITY(U,$J,358.3,25926,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25926,1,2,0)
 ;;=2^305.22
 ;;^UTILITY(U,$J,358.3,25926,1,5,0)
 ;;=5^Cannabis Abuse, Episodic
 ;;^UTILITY(U,$J,358.3,25926,2)
 ;;=^268235
 ;;^UTILITY(U,$J,358.3,25927,0)
 ;;=305.31^^150^1647^57
 ;;^UTILITY(U,$J,358.3,25927,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25927,1,2,0)
 ;;=2^305.31
 ;;^UTILITY(U,$J,358.3,25927,1,5,0)
 ;;=5^Hallucinogen Abuse, Continuous
 ;;^UTILITY(U,$J,358.3,25927,2)
 ;;=^268237
 ;;^UTILITY(U,$J,358.3,25928,0)
 ;;=305.32^^150^1647^58
 ;;^UTILITY(U,$J,358.3,25928,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25928,1,2,0)
 ;;=2^305.32
 ;;^UTILITY(U,$J,358.3,25928,1,5,0)
 ;;=5^Hallucinogen Abuse, Episodic
 ;;^UTILITY(U,$J,358.3,25928,2)
 ;;=^268238
 ;;^UTILITY(U,$J,358.3,25929,0)
 ;;=305.41^^150^1647^24
 ;;^UTILITY(U,$J,358.3,25929,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25929,1,2,0)
 ;;=2^305.41
 ;;^UTILITY(U,$J,358.3,25929,1,5,0)
 ;;=5^Anxiolytic Abuse, Continuous
 ;;^UTILITY(U,$J,358.3,25929,2)
 ;;=^331936
 ;;^UTILITY(U,$J,358.3,25930,0)
 ;;=305.42^^150^1647^25
 ;;^UTILITY(U,$J,358.3,25930,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25930,1,2,0)
 ;;=2^305.42
 ;;^UTILITY(U,$J,358.3,25930,1,5,0)
 ;;=5^Anxiolytic Abuse, Episodic
 ;;^UTILITY(U,$J,358.3,25930,2)
 ;;=^331937
 ;;^UTILITY(U,$J,358.3,25931,0)
 ;;=305.51^^150^1647^69
 ;;^UTILITY(U,$J,358.3,25931,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25931,1,2,0)
 ;;=2^305.51
 ;;^UTILITY(U,$J,358.3,25931,1,5,0)
 ;;=5^Opioid Abuse, Continuous
 ;;^UTILITY(U,$J,358.3,25931,2)
 ;;=^268244
 ;;^UTILITY(U,$J,358.3,25932,0)
 ;;=305.52^^150^1647^70
 ;;^UTILITY(U,$J,358.3,25932,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25932,1,2,0)
 ;;=2^305.52
 ;;^UTILITY(U,$J,358.3,25932,1,5,0)
 ;;=5^Opioid Abuse, Episodic
 ;;^UTILITY(U,$J,358.3,25932,2)
 ;;=^268245
 ;;^UTILITY(U,$J,358.3,25933,0)
 ;;=305.61^^150^1647^40
 ;;^UTILITY(U,$J,358.3,25933,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25933,1,2,0)
 ;;=2^305.61
 ;;^UTILITY(U,$J,358.3,25933,1,5,0)
 ;;=5^Cocaine Abuse, Continuous
 ;;^UTILITY(U,$J,358.3,25933,2)
 ;;=^268247
 ;;^UTILITY(U,$J,358.3,25934,0)
 ;;=305.62^^150^1647^41
 ;;^UTILITY(U,$J,358.3,25934,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25934,1,2,0)
 ;;=2^305.62
 ;;^UTILITY(U,$J,358.3,25934,1,5,0)
 ;;=5^Cocaine Abuse, Episodic
 ;;^UTILITY(U,$J,358.3,25934,2)
 ;;=^268248
 ;;^UTILITY(U,$J,358.3,25935,0)
 ;;=305.71^^150^1647^16
 ;;^UTILITY(U,$J,358.3,25935,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25935,1,2,0)
 ;;=2^305.71
 ;;^UTILITY(U,$J,358.3,25935,1,5,0)
 ;;=5^Amphetamine Abuse, Continuous
 ;;^UTILITY(U,$J,358.3,25935,2)
 ;;=^268251
 ;;^UTILITY(U,$J,358.3,25936,0)
 ;;=305.72^^150^1647^17
 ;;^UTILITY(U,$J,358.3,25936,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25936,1,2,0)
 ;;=2^305.72
 ;;^UTILITY(U,$J,358.3,25936,1,5,0)
 ;;=5^Amphetamine Abuse, Episodic
 ;;^UTILITY(U,$J,358.3,25936,2)
 ;;=^268252
 ;;^UTILITY(U,$J,358.3,25937,0)
 ;;=305.91^^150^1647^77
 ;;^UTILITY(U,$J,358.3,25937,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25937,1,2,0)
 ;;=2^305.91
 ;;^UTILITY(U,$J,358.3,25937,1,5,0)
 ;;=5^Other Drug Abuse, Continuous
 ;;^UTILITY(U,$J,358.3,25937,2)
 ;;=^268259
 ;;^UTILITY(U,$J,358.3,25938,0)
 ;;=305.92^^150^1647^78
 ;;^UTILITY(U,$J,358.3,25938,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25938,1,2,0)
 ;;=2^305.92
 ;;^UTILITY(U,$J,358.3,25938,1,5,0)
 ;;=5^Other Drug Abuse, Episodic
 ;;
 ;;$END ROU IBDEI1GO
