IBDEI0J9 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,9048,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9048,1,4,0)
 ;;=4^TRACHEOSTOMY STATUS
 ;;^UTILITY(U,$J,358.3,9048,1,5,0)
 ;;=5^V44.0
 ;;^UTILITY(U,$J,358.3,9048,2)
 ;;=^295446
 ;;^UTILITY(U,$J,358.3,9049,0)
 ;;=V46.11^^38^510^35
 ;;^UTILITY(U,$J,358.3,9049,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9049,1,4,0)
 ;;=4^RESPIRATOR DEPENDENCY STATUS
 ;;^UTILITY(U,$J,358.3,9049,1,5,0)
 ;;=5^V46.11
 ;;^UTILITY(U,$J,358.3,9049,2)
 ;;=^331580
 ;;^UTILITY(U,$J,358.3,9050,0)
 ;;=V45.11^^38^510^34
 ;;^UTILITY(U,$J,358.3,9050,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9050,1,4,0)
 ;;=4^RENAL DIALYSIS STATUS
 ;;^UTILITY(U,$J,358.3,9050,1,5,0)
 ;;=5^V45.11
 ;;^UTILITY(U,$J,358.3,9050,2)
 ;;=^336792
 ;;^UTILITY(U,$J,358.3,9051,0)
 ;;=783.7^^38^510^13
 ;;^UTILITY(U,$J,358.3,9051,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9051,1,4,0)
 ;;=4^FAILURE TO THRIVE,ADULT
 ;;^UTILITY(U,$J,358.3,9051,1,5,0)
 ;;=5^783.7
 ;;^UTILITY(U,$J,358.3,9051,2)
 ;;=^322019
 ;;^UTILITY(U,$J,358.3,9052,0)
 ;;=276.51^^38^510^11
 ;;^UTILITY(U,$J,358.3,9052,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9052,1,4,0)
 ;;=4^DEHYDRATION
 ;;^UTILITY(U,$J,358.3,9052,1,5,0)
 ;;=5^276.51
 ;;^UTILITY(U,$J,358.3,9052,2)
 ;;=^332743
 ;;^UTILITY(U,$J,358.3,9053,0)
 ;;=276.50^^38^510^39
 ;;^UTILITY(U,$J,358.3,9053,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9053,1,4,0)
 ;;=4^VOLUME DEPLETION NOS
 ;;^UTILITY(U,$J,358.3,9053,1,5,0)
 ;;=5^276.50
 ;;^UTILITY(U,$J,358.3,9053,2)
 ;;=^332840
 ;;^UTILITY(U,$J,358.3,9054,0)
 ;;=276.52^^38^510^23
 ;;^UTILITY(U,$J,358.3,9054,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9054,1,4,0)
 ;;=4^HYPOVOLEMIA
 ;;^UTILITY(U,$J,358.3,9054,1,5,0)
 ;;=5^276.52
 ;;^UTILITY(U,$J,358.3,9054,2)
 ;;=^332744
 ;;^UTILITY(U,$J,358.3,9055,0)
 ;;=276.2^^38^510^3
 ;;^UTILITY(U,$J,358.3,9055,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9055,1,4,0)
 ;;=4^ACIDOSIS
 ;;^UTILITY(U,$J,358.3,9055,1,5,0)
 ;;=5^276.2
 ;;^UTILITY(U,$J,358.3,9055,2)
 ;;=^2070
 ;;^UTILITY(U,$J,358.3,9056,0)
 ;;=276.3^^38^510^4
 ;;^UTILITY(U,$J,358.3,9056,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9056,1,4,0)
 ;;=4^ALKALOSIS
 ;;^UTILITY(U,$J,358.3,9056,1,5,0)
 ;;=5^276.3
 ;;^UTILITY(U,$J,358.3,9056,2)
 ;;=^4889
 ;;^UTILITY(U,$J,358.3,9057,0)
 ;;=276.0^^38^510^15
 ;;^UTILITY(U,$J,358.3,9057,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9057,1,4,0)
 ;;=4^HYPEROSMOLALITY/HYPERNATREMIA
 ;;^UTILITY(U,$J,358.3,9057,1,5,0)
 ;;=5^276.0
 ;;^UTILITY(U,$J,358.3,9057,2)
 ;;=^60144
 ;;^UTILITY(U,$J,358.3,9058,0)
 ;;=276.1^^38^510^22
 ;;^UTILITY(U,$J,358.3,9058,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9058,1,4,0)
 ;;=4^HYPOSMOLALITY/HYPONATREMIA
 ;;^UTILITY(U,$J,358.3,9058,1,5,0)
 ;;=5^276.1
 ;;^UTILITY(U,$J,358.3,9058,2)
 ;;=^60722
 ;;^UTILITY(U,$J,358.3,9059,0)
 ;;=276.4^^38^510^29
 ;;^UTILITY(U,$J,358.3,9059,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9059,1,4,0)
 ;;=4^MIXED ACID-BASED BALANCE DISORDER
 ;;^UTILITY(U,$J,358.3,9059,1,5,0)
 ;;=5^276.4
 ;;^UTILITY(U,$J,358.3,9059,2)
 ;;=^267945
 ;;^UTILITY(U,$J,358.3,9060,0)
 ;;=276.8^^38^510^20
 ;;^UTILITY(U,$J,358.3,9060,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9060,1,4,0)
 ;;=4^HYPOKALEMIA
 ;;^UTILITY(U,$J,358.3,9060,1,5,0)
 ;;=5^276.8
 ;;^UTILITY(U,$J,358.3,9060,2)
 ;;=^60611
 ;;^UTILITY(U,$J,358.3,9061,0)
 ;;=275.41^^38^510^18
 ;;^UTILITY(U,$J,358.3,9061,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,9061,1,4,0)
 ;;=4^HYPOCALCEMIA
 ;;^UTILITY(U,$J,358.3,9061,1,5,0)
 ;;=5^275.41
 ;;^UTILITY(U,$J,358.3,9061,2)
 ;;=^60542
 ;;^UTILITY(U,$J,358.3,9062,0)
 ;;=276.8^^38^510^21
 ;;^UTILITY(U,$J,358.3,9062,1,0)
 ;;=^358.31IA^5^2
 ;;
 ;;$END ROU IBDEI0J9
