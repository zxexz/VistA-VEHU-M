IBDEI16C ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,20733,2)
 ;;=^269571
 ;;^UTILITY(U,$J,358.3,20734,0)
 ;;=443.9^^112^1283^11
 ;;^UTILITY(U,$J,358.3,20734,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20734,1,3,0)
 ;;=3^443.9
 ;;^UTILITY(U,$J,358.3,20734,1,4,0)
 ;;=4^Periph Vascular Dis
 ;;^UTILITY(U,$J,358.3,20734,2)
 ;;=^184182
 ;;^UTILITY(U,$J,358.3,20735,0)
 ;;=424.1^^112^1283^1
 ;;^UTILITY(U,$J,358.3,20735,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20735,1,3,0)
 ;;=3^424.1
 ;;^UTILITY(U,$J,358.3,20735,1,4,0)
 ;;=4^Aortic Valve Dis
 ;;^UTILITY(U,$J,358.3,20735,2)
 ;;=^9330
 ;;^UTILITY(U,$J,358.3,20736,0)
 ;;=459.81^^112^1283^12
 ;;^UTILITY(U,$J,358.3,20736,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20736,1,3,0)
 ;;=3^459.81
 ;;^UTILITY(U,$J,358.3,20736,1,4,0)
 ;;=4^Venous Insufficiency
 ;;^UTILITY(U,$J,358.3,20736,2)
 ;;=^125826
 ;;^UTILITY(U,$J,358.3,20737,0)
 ;;=401.9^^112^1283^8
 ;;^UTILITY(U,$J,358.3,20737,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20737,1,3,0)
 ;;=3^401.9
 ;;^UTILITY(U,$J,358.3,20737,1,4,0)
 ;;=4^Hypertension
 ;;^UTILITY(U,$J,358.3,20737,2)
 ;;=^186630
 ;;^UTILITY(U,$J,358.3,20738,0)
 ;;=786.50^^112^1283^6
 ;;^UTILITY(U,$J,358.3,20738,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20738,1,3,0)
 ;;=3^786.50
 ;;^UTILITY(U,$J,358.3,20738,1,4,0)
 ;;=4^Chest Pain
 ;;^UTILITY(U,$J,358.3,20738,2)
 ;;=^22485
 ;;^UTILITY(U,$J,358.3,20739,0)
 ;;=412.^^112^1283^10
 ;;^UTILITY(U,$J,358.3,20739,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20739,1,3,0)
 ;;=3^412.
 ;;^UTILITY(U,$J,358.3,20739,1,4,0)
 ;;=4^Old Myocardial Infarct
 ;;^UTILITY(U,$J,358.3,20739,2)
 ;;=^259884
 ;;^UTILITY(U,$J,358.3,20740,0)
 ;;=414.00^^112^1283^3
 ;;^UTILITY(U,$J,358.3,20740,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20740,1,3,0)
 ;;=3^414.00
 ;;^UTILITY(U,$J,358.3,20740,1,4,0)
 ;;=4^CAD
 ;;^UTILITY(U,$J,358.3,20740,2)
 ;;=^28512
 ;;^UTILITY(U,$J,358.3,20741,0)
 ;;=414.01^^112^1283^4
 ;;^UTILITY(U,$J,358.3,20741,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20741,1,3,0)
 ;;=3^414.01
 ;;^UTILITY(U,$J,358.3,20741,1,4,0)
 ;;=4^CAD of Native Artery
 ;;^UTILITY(U,$J,358.3,20741,2)
 ;;=^303281
 ;;^UTILITY(U,$J,358.3,20742,0)
 ;;=285.9^^112^1284^1
 ;;^UTILITY(U,$J,358.3,20742,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20742,1,3,0)
 ;;=3^285.9
 ;;^UTILITY(U,$J,358.3,20742,1,4,0)
 ;;=4^Anemia
 ;;^UTILITY(U,$J,358.3,20742,2)
 ;;=^7007
 ;;^UTILITY(U,$J,358.3,20743,0)
 ;;=266.2^^112^1284^3
 ;;^UTILITY(U,$J,358.3,20743,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20743,1,3,0)
 ;;=3^266.2
 ;;^UTILITY(U,$J,358.3,20743,1,4,0)
 ;;=4^B12 & Folate Anemia
 ;;^UTILITY(U,$J,358.3,20743,2)
 ;;=^87347
 ;;^UTILITY(U,$J,358.3,20744,0)
 ;;=250.00^^112^1284^7
 ;;^UTILITY(U,$J,358.3,20744,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20744,1,3,0)
 ;;=3^250.00
 ;;^UTILITY(U,$J,358.3,20744,1,4,0)
 ;;=4^DM type II,not uncontrolled
 ;;^UTILITY(U,$J,358.3,20744,2)
 ;;=^33605
 ;;^UTILITY(U,$J,358.3,20745,0)
 ;;=272.4^^112^1284^12
 ;;^UTILITY(U,$J,358.3,20745,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20745,1,3,0)
 ;;=3^272.4
 ;;^UTILITY(U,$J,358.3,20745,1,4,0)
 ;;=4^Hyperlipidemia
 ;;^UTILITY(U,$J,358.3,20745,2)
 ;;=^87281
 ;;^UTILITY(U,$J,358.3,20746,0)
 ;;=244.9^^112^1284^13
 ;;^UTILITY(U,$J,358.3,20746,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20746,1,3,0)
 ;;=3^244.9
 ;;^UTILITY(U,$J,358.3,20746,1,4,0)
 ;;=4^Hypothyroidism
 ;;^UTILITY(U,$J,358.3,20746,2)
 ;;=^123752
 ;;^UTILITY(U,$J,358.3,20747,0)
 ;;=250.01^^112^1284^5
 ;;^UTILITY(U,$J,358.3,20747,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20747,1,3,0)
 ;;=3^250.01
 ;;^UTILITY(U,$J,358.3,20747,1,4,0)
 ;;=4^DM Type I,not uncontrolled
 ;;
 ;;$END ROU IBDEI16C
