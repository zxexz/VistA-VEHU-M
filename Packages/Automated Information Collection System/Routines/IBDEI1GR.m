IBDEI1GR ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,25965,2)
 ;;=^336807
 ;;^UTILITY(U,$J,358.3,25966,0)
 ;;=V62.29^^150^1648^38
 ;;^UTILITY(U,$J,358.3,25966,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25966,1,2,0)
 ;;=2^V62.29
 ;;^UTILITY(U,$J,358.3,25966,1,5,0)
 ;;=5^Occupationl Circumst NEC
 ;;^UTILITY(U,$J,358.3,25966,2)
 ;;=^87746
 ;;^UTILITY(U,$J,358.3,25967,0)
 ;;=V60.81^^150^1648^15
 ;;^UTILITY(U,$J,358.3,25967,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25967,1,2,0)
 ;;=2^V60.81
 ;;^UTILITY(U,$J,358.3,25967,1,5,0)
 ;;=5^Foster Care (Status)
 ;;^UTILITY(U,$J,358.3,25967,2)
 ;;=^338505
 ;;^UTILITY(U,$J,358.3,25968,0)
 ;;=V60.89^^150^1648^19
 ;;^UTILITY(U,$J,358.3,25968,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25968,1,2,0)
 ;;=2^V60.89
 ;;^UTILITY(U,$J,358.3,25968,1,5,0)
 ;;=5^Housing/Econom Circum NEC
 ;;^UTILITY(U,$J,358.3,25968,2)
 ;;=^295545
 ;;^UTILITY(U,$J,358.3,25969,0)
 ;;=V61.22^^150^1648^44
 ;;^UTILITY(U,$J,358.3,25969,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25969,1,2,0)
 ;;=2^V61.22
 ;;^UTILITY(U,$J,358.3,25969,1,5,0)
 ;;=5^Perpetrator-Parental Child
 ;;^UTILITY(U,$J,358.3,25969,2)
 ;;=^304358
 ;;^UTILITY(U,$J,358.3,25970,0)
 ;;=V61.23^^150^1648^40
 ;;^UTILITY(U,$J,358.3,25970,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25970,1,2,0)
 ;;=2^V61.23
 ;;^UTILITY(U,$J,358.3,25970,1,5,0)
 ;;=5^Parent-Biological Child Prob
 ;;^UTILITY(U,$J,358.3,25970,2)
 ;;=^338508
 ;;^UTILITY(U,$J,358.3,25971,0)
 ;;=V61.24^^150^1648^39
 ;;^UTILITY(U,$J,358.3,25971,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25971,1,2,0)
 ;;=2^V61.24
 ;;^UTILITY(U,$J,358.3,25971,1,5,0)
 ;;=5^Parent-Adopted Child Prob
 ;;^UTILITY(U,$J,358.3,25971,2)
 ;;=^338509
 ;;^UTILITY(U,$J,358.3,25972,0)
 ;;=V61.25^^150^1648^42
 ;;^UTILITY(U,$J,358.3,25972,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25972,1,2,0)
 ;;=2^V61.25
 ;;^UTILITY(U,$J,358.3,25972,1,5,0)
 ;;=5^Parent-Foster Child Prob
 ;;^UTILITY(U,$J,358.3,25972,2)
 ;;=^338510
 ;;^UTILITY(U,$J,358.3,25973,0)
 ;;=V40.31^^150^1648^52
 ;;^UTILITY(U,$J,358.3,25973,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25973,1,2,0)
 ;;=2^V40.31
 ;;^UTILITY(U,$J,358.3,25973,1,5,0)
 ;;=5^Wandering-Dis Classified Elsewhere
 ;;^UTILITY(U,$J,358.3,25973,2)
 ;;=^340621
 ;;^UTILITY(U,$J,358.3,25974,0)
 ;;=V40.39^^150^1648^1
 ;;^UTILITY(U,$J,358.3,25974,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25974,1,2,0)
 ;;=2^V40.39
 ;;^UTILITY(U,$J,358.3,25974,1,5,0)
 ;;=5^Behavioral Problem NEC
 ;;^UTILITY(U,$J,358.3,25974,2)
 ;;=^340622
 ;;^UTILITY(U,$J,358.3,25975,0)
 ;;=V65.19^^150^1648^45
 ;;^UTILITY(U,$J,358.3,25975,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25975,1,2,0)
 ;;=2^V65.19
 ;;^UTILITY(U,$J,358.3,25975,1,5,0)
 ;;=5^Person Consulting on Behalf of Pt
 ;;^UTILITY(U,$J,358.3,25975,2)
 ;;=^329985
 ;;^UTILITY(U,$J,358.3,25976,0)
 ;;=V66.7^^150^1648^8
 ;;^UTILITY(U,$J,358.3,25976,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25976,1,2,0)
 ;;=2^V66.7
 ;;^UTILITY(U,$J,358.3,25976,1,5,0)
 ;;=5^Encounter for Palliative Care
 ;;^UTILITY(U,$J,358.3,25976,2)
 ;;=^89209
 ;;^UTILITY(U,$J,358.3,25977,0)
 ;;=V11.4^^150^1648^20
 ;;^UTILITY(U,$J,358.3,25977,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25977,1,2,0)
 ;;=2^V11.4
 ;;^UTILITY(U,$J,358.3,25977,1,5,0)
 ;;=5^Hx Combat/Operational Stress
 ;;^UTILITY(U,$J,358.3,25977,2)
 ;;=^339674
 ;;^UTILITY(U,$J,358.3,25978,0)
 ;;=V60.1^^150^1648^22
 ;;^UTILITY(U,$J,358.3,25978,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25978,1,2,0)
 ;;=2^V60.1
 ;;^UTILITY(U,$J,358.3,25978,1,5,0)
 ;;=5^Inadequate Housing
 ;;^UTILITY(U,$J,358.3,25978,2)
 ;;=^295540
 ;;^UTILITY(U,$J,358.3,25979,0)
 ;;=V62.84^^150^1648^49
 ;;
 ;;$END ROU IBDEI1GR
