IBDEI0UO ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,14901,0)
 ;;=V58.61^^81^936^6
 ;;^UTILITY(U,$J,358.3,14901,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14901,1,4,0)
 ;;=4^V58.61
 ;;^UTILITY(U,$J,358.3,14901,1,5,0)
 ;;=5^Anticoag Rx, chronic
 ;;^UTILITY(U,$J,358.3,14901,2)
 ;;=^303459
 ;;^UTILITY(U,$J,358.3,14902,0)
 ;;=441.4^^81^936^7
 ;;^UTILITY(U,$J,358.3,14902,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14902,1,4,0)
 ;;=4^441.4
 ;;^UTILITY(U,$J,358.3,14902,1,5,0)
 ;;=5^Aortic Aneursym, abdominal
 ;;^UTILITY(U,$J,358.3,14902,2)
 ;;=^269769
 ;;^UTILITY(U,$J,358.3,14903,0)
 ;;=441.2^^81^936^8
 ;;^UTILITY(U,$J,358.3,14903,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14903,1,4,0)
 ;;=4^441.2
 ;;^UTILITY(U,$J,358.3,14903,1,5,0)
 ;;=5^Aortic Aneursym, thoracic
 ;;^UTILITY(U,$J,358.3,14903,2)
 ;;=^269765
 ;;^UTILITY(U,$J,358.3,14904,0)
 ;;=786.59^^81^936^14
 ;;^UTILITY(U,$J,358.3,14904,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14904,1,4,0)
 ;;=4^786.59
 ;;^UTILITY(U,$J,358.3,14904,1,5,0)
 ;;=5^Atypical Chest Pain
 ;;^UTILITY(U,$J,358.3,14904,2)
 ;;=^87384
 ;;^UTILITY(U,$J,358.3,14905,0)
 ;;=428.0^^81^936^19
 ;;^UTILITY(U,$J,358.3,14905,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14905,1,4,0)
 ;;=4^428.0
 ;;^UTILITY(U,$J,358.3,14905,1,5,0)
 ;;=5^CHF
 ;;^UTILITY(U,$J,358.3,14905,2)
 ;;=^54758
 ;;^UTILITY(U,$J,358.3,14906,0)
 ;;=428.1^^81^936^20
 ;;^UTILITY(U,$J,358.3,14906,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14906,1,4,0)
 ;;=4^428.1
 ;;^UTILITY(U,$J,358.3,14906,1,5,0)
 ;;=5^CHF, left ventricular
 ;;^UTILITY(U,$J,358.3,14906,2)
 ;;=^68721
 ;;^UTILITY(U,$J,358.3,14907,0)
 ;;=785.2^^81^936^82
 ;;^UTILITY(U,$J,358.3,14907,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14907,1,4,0)
 ;;=4^785.2
 ;;^UTILITY(U,$J,358.3,14907,1,5,0)
 ;;=5^Undiag Cardiac murmurs
 ;;^UTILITY(U,$J,358.3,14907,2)
 ;;=^295854
 ;;^UTILITY(U,$J,358.3,14908,0)
 ;;=429.3^^81^936^22
 ;;^UTILITY(U,$J,358.3,14908,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14908,1,4,0)
 ;;=4^429.3
 ;;^UTILITY(U,$J,358.3,14908,1,5,0)
 ;;=5^Cardiomegaly
 ;;^UTILITY(U,$J,358.3,14908,2)
 ;;=^54748
 ;;^UTILITY(U,$J,358.3,14909,0)
 ;;=425.5^^81^936^23
 ;;^UTILITY(U,$J,358.3,14909,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14909,1,4,0)
 ;;=4^425.5
 ;;^UTILITY(U,$J,358.3,14909,1,5,0)
 ;;=5^Cardiomyopathy, Alcoholic
 ;;^UTILITY(U,$J,358.3,14909,2)
 ;;=^19623
 ;;^UTILITY(U,$J,358.3,14910,0)
 ;;=433.10^^81^936^24
 ;;^UTILITY(U,$J,358.3,14910,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14910,1,4,0)
 ;;=4^433.10
 ;;^UTILITY(U,$J,358.3,14910,1,5,0)
 ;;=5^Carotid Artery disease
 ;;^UTILITY(U,$J,358.3,14910,2)
 ;;=^295801
 ;;^UTILITY(U,$J,358.3,14911,0)
 ;;=786.52^^81^936^25
 ;;^UTILITY(U,$J,358.3,14911,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14911,1,4,0)
 ;;=4^786.52
 ;;^UTILITY(U,$J,358.3,14911,1,5,0)
 ;;=5^Chest Pain, pleuritic
 ;;^UTILITY(U,$J,358.3,14911,2)
 ;;=^89126
 ;;^UTILITY(U,$J,358.3,14912,0)
 ;;=786.51^^81^936^26
 ;;^UTILITY(U,$J,358.3,14912,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14912,1,4,0)
 ;;=4^786.51
 ;;^UTILITY(U,$J,358.3,14912,1,5,0)
 ;;=5^Chest Pain, precordial
 ;;^UTILITY(U,$J,358.3,14912,2)
 ;;=^276877
 ;;^UTILITY(U,$J,358.3,14913,0)
 ;;=V12.51^^81^936^53
 ;;^UTILITY(U,$J,358.3,14913,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14913,1,4,0)
 ;;=4^V12.51
 ;;^UTILITY(U,$J,358.3,14913,1,5,0)
 ;;=5^Hx of DVT
 ;;^UTILITY(U,$J,358.3,14913,2)
 ;;=Hx of DVT^303397
 ;;^UTILITY(U,$J,358.3,14914,0)
 ;;=780.4^^81^936^29
 ;;^UTILITY(U,$J,358.3,14914,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,14914,1,4,0)
 ;;=4^780.4
 ;;^UTILITY(U,$J,358.3,14914,1,5,0)
 ;;=5^Dizziness
 ;;
 ;;$END ROU IBDEI0UO
