IBDEI1S0 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,31355,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31355,1,3,0)
 ;;=3^Intcrn injury w LOC of 30 minutes or less, sequela
 ;;^UTILITY(U,$J,358.3,31355,1,4,0)
 ;;=4^S06.9X1S
 ;;^UTILITY(U,$J,358.3,31355,2)
 ;;=^5021211
 ;;^UTILITY(U,$J,358.3,31356,0)
 ;;=S06.9X2S^^180^1952^19
 ;;^UTILITY(U,$J,358.3,31356,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31356,1,3,0)
 ;;=3^Intcrn injury w LOC of 31-59 min, sequela
 ;;^UTILITY(U,$J,358.3,31356,1,4,0)
 ;;=4^S06.9X2S
 ;;^UTILITY(U,$J,358.3,31356,2)
 ;;=^5021214
 ;;^UTILITY(U,$J,358.3,31357,0)
 ;;=S06.9X4S^^180^1952^20
 ;;^UTILITY(U,$J,358.3,31357,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31357,1,3,0)
 ;;=3^Intcrn injury w LOC of 6-24 hrs, sequela
 ;;^UTILITY(U,$J,358.3,31357,1,4,0)
 ;;=4^S06.9X4S
 ;;^UTILITY(U,$J,358.3,31357,2)
 ;;=^5021220
 ;;^UTILITY(U,$J,358.3,31358,0)
 ;;=S06.9X9S^^180^1952^21
 ;;^UTILITY(U,$J,358.3,31358,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31358,1,3,0)
 ;;=3^Intcrn injury w LOC of unsp duration, sequela
 ;;^UTILITY(U,$J,358.3,31358,1,4,0)
 ;;=4^S06.9X9S
 ;;^UTILITY(U,$J,358.3,31358,2)
 ;;=^5021235
 ;;^UTILITY(U,$J,358.3,31359,0)
 ;;=S06.9X0S^^180^1952^22
 ;;^UTILITY(U,$J,358.3,31359,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31359,1,3,0)
 ;;=3^Intcrn injury w/o LOC, sequela
 ;;^UTILITY(U,$J,358.3,31359,1,4,0)
 ;;=4^S06.9X0S
 ;;^UTILITY(U,$J,358.3,31359,2)
 ;;=^5021208
 ;;^UTILITY(U,$J,358.3,31360,0)
 ;;=I25.10^^180^1953^1
 ;;^UTILITY(U,$J,358.3,31360,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31360,1,3,0)
 ;;=3^Athscl heart disease of native coronary artery w/o ang pctrs
 ;;^UTILITY(U,$J,358.3,31360,1,4,0)
 ;;=4^I25.10
 ;;^UTILITY(U,$J,358.3,31360,2)
 ;;=^5007107
 ;;^UTILITY(U,$J,358.3,31361,0)
 ;;=J44.1^^180^1953^3
 ;;^UTILITY(U,$J,358.3,31361,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31361,1,3,0)
 ;;=3^COPD w acute exacerbation
 ;;^UTILITY(U,$J,358.3,31361,1,4,0)
 ;;=4^J44.1
 ;;^UTILITY(U,$J,358.3,31361,2)
 ;;=^5008240
 ;;^UTILITY(U,$J,358.3,31362,0)
 ;;=J44.9^^180^1953^4
 ;;^UTILITY(U,$J,358.3,31362,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31362,1,3,0)
 ;;=3^COPD, unspecified
 ;;^UTILITY(U,$J,358.3,31362,1,4,0)
 ;;=4^J44.9
 ;;^UTILITY(U,$J,358.3,31362,2)
 ;;=^5008241
 ;;^UTILITY(U,$J,358.3,31363,0)
 ;;=Z98.61^^180^1953^6
 ;;^UTILITY(U,$J,358.3,31363,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31363,1,3,0)
 ;;=3^Coronary angioplasty status
 ;;^UTILITY(U,$J,358.3,31363,1,4,0)
 ;;=4^Z98.61
 ;;^UTILITY(U,$J,358.3,31363,2)
 ;;=^5063742
 ;;^UTILITY(U,$J,358.3,31364,0)
 ;;=J43.9^^180^1953^7
 ;;^UTILITY(U,$J,358.3,31364,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31364,1,3,0)
 ;;=3^Emphysema, unspecified
 ;;^UTILITY(U,$J,358.3,31364,1,4,0)
 ;;=4^J43.9
 ;;^UTILITY(U,$J,358.3,31364,2)
 ;;=^5008238
 ;;^UTILITY(U,$J,358.3,31365,0)
 ;;=Z82.49^^180^1953^8
 ;;^UTILITY(U,$J,358.3,31365,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31365,1,3,0)
 ;;=3^Family hx of ischem heart dis and oth dis of the circ sys
 ;;^UTILITY(U,$J,358.3,31365,1,4,0)
 ;;=4^Z82.49
 ;;^UTILITY(U,$J,358.3,31365,2)
 ;;=^5063369
 ;;^UTILITY(U,$J,358.3,31366,0)
 ;;=I50.9^^180^1953^9
 ;;^UTILITY(U,$J,358.3,31366,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31366,1,3,0)
 ;;=3^Heart failure, unspecified
 ;;^UTILITY(U,$J,358.3,31366,1,4,0)
 ;;=4^I50.9
 ;;^UTILITY(U,$J,358.3,31366,2)
 ;;=^5007251
 ;;^UTILITY(U,$J,358.3,31367,0)
 ;;=I25.2^^180^1953^10
 ;;^UTILITY(U,$J,358.3,31367,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31367,1,3,0)
 ;;=3^Old myocardial infarction
 ;;^UTILITY(U,$J,358.3,31367,1,4,0)
 ;;=4^I25.2
 ;;^UTILITY(U,$J,358.3,31367,2)
 ;;=^259884
 ;;
 ;;$END ROU IBDEI1S0
