IBDEI1BO ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,23422,2)
 ;;=^322105
 ;;^UTILITY(U,$J,358.3,23423,0)
 ;;=E886.0^^125^1409^16
 ;;^UTILITY(U,$J,358.3,23423,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23423,1,4,0)
 ;;=4^E886.0
 ;;^UTILITY(U,$J,358.3,23423,1,5,0)
 ;;=5^Fall in Sports
 ;;^UTILITY(U,$J,358.3,23423,2)
 ;;=^294656
 ;;^UTILITY(U,$J,358.3,23424,0)
 ;;=E886.9^^125^1409^7
 ;;^UTILITY(U,$J,358.3,23424,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23424,1,4,0)
 ;;=4^E886.9
 ;;^UTILITY(U,$J,358.3,23424,1,5,0)
 ;;=5^Fall from Collision with Another Person
 ;;^UTILITY(U,$J,358.3,23424,2)
 ;;=^294657
 ;;^UTILITY(U,$J,358.3,23425,0)
 ;;=E888.9^^125^1409^1
 ;;^UTILITY(U,$J,358.3,23425,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23425,1,4,0)
 ;;=4^E888.9
 ;;^UTILITY(U,$J,358.3,23425,1,5,0)
 ;;=5^Fall NOS
 ;;^UTILITY(U,$J,358.3,23425,2)
 ;;=^323639
 ;;^UTILITY(U,$J,358.3,23426,0)
 ;;=E891.9^^125^1409^18
 ;;^UTILITY(U,$J,358.3,23426,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23426,1,4,0)
 ;;=4^E891.9
 ;;^UTILITY(U,$J,358.3,23426,1,5,0)
 ;;=5^Fire in Building
 ;;^UTILITY(U,$J,358.3,23426,2)
 ;;=^294669
 ;;^UTILITY(U,$J,358.3,23427,0)
 ;;=369.00^^125^1410^2
 ;;^UTILITY(U,$J,358.3,23427,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23427,1,4,0)
 ;;=4^369.00
 ;;^UTILITY(U,$J,358.3,23427,1,5,0)
 ;;=5^Both Eyes Blind-WHO Def
 ;;^UTILITY(U,$J,358.3,23427,2)
 ;;=^15310
 ;;^UTILITY(U,$J,358.3,23428,0)
 ;;=369.01^^125^1410^26
 ;;^UTILITY(U,$J,358.3,23428,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23428,1,4,0)
 ;;=4^369.01
 ;;^UTILITY(U,$J,358.3,23428,1,5,0)
 ;;=5^Tot Impairment,Both Eyes
 ;;^UTILITY(U,$J,358.3,23428,2)
 ;;=^268861
 ;;^UTILITY(U,$J,358.3,23429,0)
 ;;=369.02^^125^1410^14
 ;;^UTILITY(U,$J,358.3,23429,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23429,1,4,0)
 ;;=4^369.02
 ;;^UTILITY(U,$J,358.3,23429,1,5,0)
 ;;=5^One Eye Nr Total/Oth Eye NOS
 ;;^UTILITY(U,$J,358.3,23429,2)
 ;;=^268862
 ;;^UTILITY(U,$J,358.3,23430,0)
 ;;=369.03^^125^1410^15
 ;;^UTILITY(U,$J,358.3,23430,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23430,1,4,0)
 ;;=4^369.03
 ;;^UTILITY(U,$J,358.3,23430,1,5,0)
 ;;=5^One Eye Nr Total/Oth Eye Total
 ;;^UTILITY(U,$J,358.3,23430,2)
 ;;=^268863
 ;;^UTILITY(U,$J,358.3,23431,0)
 ;;=369.04^^125^1410^6
 ;;^UTILITY(U,$J,358.3,23431,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23431,1,4,0)
 ;;=4^369.04
 ;;^UTILITY(U,$J,358.3,23431,1,5,0)
 ;;=5^Near Total Impairment,Both Eyes
 ;;^UTILITY(U,$J,358.3,23431,2)
 ;;=^268864
 ;;^UTILITY(U,$J,358.3,23432,0)
 ;;=369.05^^125^1410^16
 ;;^UTILITY(U,$J,358.3,23432,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23432,1,4,0)
 ;;=4^369.05
 ;;^UTILITY(U,$J,358.3,23432,1,5,0)
 ;;=5^One Eye Profound/Oth Eye NOS
 ;;^UTILITY(U,$J,358.3,23432,2)
 ;;=^268865
 ;;^UTILITY(U,$J,358.3,23433,0)
 ;;=369.06^^125^1410^18
 ;;^UTILITY(U,$J,358.3,23433,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23433,1,4,0)
 ;;=4^369.06
 ;;^UTILITY(U,$J,358.3,23433,1,5,0)
 ;;=5^One Eye Profound/Oth Eye Total
 ;;^UTILITY(U,$J,358.3,23433,2)
 ;;=^268866
 ;;^UTILITY(U,$J,358.3,23434,0)
 ;;=369.07^^125^1410^17
 ;;^UTILITY(U,$J,358.3,23434,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23434,1,4,0)
 ;;=4^369.07
 ;;^UTILITY(U,$J,358.3,23434,1,5,0)
 ;;=5^One Eye Profound/Oth Eye Near Total
 ;;^UTILITY(U,$J,358.3,23434,2)
 ;;=^268867
 ;;^UTILITY(U,$J,358.3,23435,0)
 ;;=369.08^^125^1410^24
 ;;^UTILITY(U,$J,358.3,23435,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23435,1,4,0)
 ;;=4^369.08
 ;;^UTILITY(U,$J,358.3,23435,1,5,0)
 ;;=5^Profound Impairment,Both Eyes
 ;;^UTILITY(U,$J,358.3,23435,2)
 ;;=^268868
 ;;^UTILITY(U,$J,358.3,23436,0)
 ;;=369.10^^125^1410^7
 ;;
 ;;$END ROU IBDEI1BO
