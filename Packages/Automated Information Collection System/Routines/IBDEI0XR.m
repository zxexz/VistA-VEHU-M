IBDEI0XR ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,16433,1,3,0)
 ;;=3^724.5
 ;;^UTILITY(U,$J,358.3,16433,1,4,0)
 ;;=4^Back Pain
 ;;^UTILITY(U,$J,358.3,16433,2)
 ;;=Back Pain, NOS^12250
 ;;^UTILITY(U,$J,358.3,16434,0)
 ;;=715.90^^84^980^7
 ;;^UTILITY(U,$J,358.3,16434,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16434,1,3,0)
 ;;=3^715.90
 ;;^UTILITY(U,$J,358.3,16434,1,4,0)
 ;;=4^Osteoarthritis/DJD
 ;;^UTILITY(U,$J,358.3,16435,0)
 ;;=733.00^^84^980^8
 ;;^UTILITY(U,$J,358.3,16435,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16435,1,3,0)
 ;;=3^733.00
 ;;^UTILITY(U,$J,358.3,16435,1,4,0)
 ;;=4^Osteoporosis
 ;;^UTILITY(U,$J,358.3,16436,0)
 ;;=714.0^^84^980^9
 ;;^UTILITY(U,$J,358.3,16436,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16436,1,3,0)
 ;;=3^714.0
 ;;^UTILITY(U,$J,358.3,16436,1,4,0)
 ;;=4^Rheumatoid Arthritis
 ;;^UTILITY(U,$J,358.3,16437,0)
 ;;=274.9^^84^980^2
 ;;^UTILITY(U,$J,358.3,16437,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16437,1,3,0)
 ;;=3^274.9
 ;;^UTILITY(U,$J,358.3,16437,1,4,0)
 ;;=4^Gout
 ;;^UTILITY(U,$J,358.3,16438,0)
 ;;=719.46^^84^980^4
 ;;^UTILITY(U,$J,358.3,16438,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16438,1,3,0)
 ;;=3^719.46
 ;;^UTILITY(U,$J,358.3,16438,1,4,0)
 ;;=4^Knee Pain
 ;;^UTILITY(U,$J,358.3,16438,2)
 ;;=Knee Pain^272403
 ;;^UTILITY(U,$J,358.3,16439,0)
 ;;=722.93^^84^980^5
 ;;^UTILITY(U,$J,358.3,16439,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16439,1,3,0)
 ;;=3^722.93
 ;;^UTILITY(U,$J,358.3,16439,1,4,0)
 ;;=4^L-S Disc Dis
 ;;^UTILITY(U,$J,358.3,16439,2)
 ;;=Lumbosacral Disc Disease^272495
 ;;^UTILITY(U,$J,358.3,16440,0)
 ;;=724.2^^84^980^6
 ;;^UTILITY(U,$J,358.3,16440,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16440,1,3,0)
 ;;=3^724.2
 ;;^UTILITY(U,$J,358.3,16440,1,4,0)
 ;;=4^Low Back Pain
 ;;^UTILITY(U,$J,358.3,16440,2)
 ;;=^71885
 ;;^UTILITY(U,$J,358.3,16441,0)
 ;;=807.00^^84^980^10
 ;;^UTILITY(U,$J,358.3,16441,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16441,1,3,0)
 ;;=3^807.00
 ;;^UTILITY(U,$J,358.3,16441,1,4,0)
 ;;=4^Rib Fx, NOS
 ;;^UTILITY(U,$J,358.3,16441,2)
 ;;=Rib Fracture^25317
 ;;^UTILITY(U,$J,358.3,16442,0)
 ;;=719.45^^84^980^3
 ;;^UTILITY(U,$J,358.3,16442,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16442,1,3,0)
 ;;=3^719.45
 ;;^UTILITY(U,$J,358.3,16442,1,4,0)
 ;;=4^Hip Pain
 ;;^UTILITY(U,$J,358.3,16442,2)
 ;;=^272402
 ;;^UTILITY(U,$J,358.3,16443,0)
 ;;=583.89^^84^981^1
 ;;^UTILITY(U,$J,358.3,16443,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16443,1,3,0)
 ;;=3^583.89
 ;;^UTILITY(U,$J,358.3,16443,1,4,0)
 ;;=4^Glom/Interst Neph
 ;;^UTILITY(U,$J,358.3,16443,2)
 ;;=^83443
 ;;^UTILITY(U,$J,358.3,16444,0)
 ;;=601.9^^84^981^3
 ;;^UTILITY(U,$J,358.3,16444,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16444,1,3,0)
 ;;=3^601.9
 ;;^UTILITY(U,$J,358.3,16444,1,4,0)
 ;;=4^Prostatitis
 ;;^UTILITY(U,$J,358.3,16445,0)
 ;;=593.9^^84^981^4
 ;;^UTILITY(U,$J,358.3,16445,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16445,1,3,0)
 ;;=3^593.9
 ;;^UTILITY(U,$J,358.3,16445,1,4,0)
 ;;=4^Acute Renal Insufficiency
 ;;^UTILITY(U,$J,358.3,16445,2)
 ;;=Acute Renal Insufficiency^123849
 ;;^UTILITY(U,$J,358.3,16446,0)
 ;;=600.00^^84^981^2
 ;;^UTILITY(U,$J,358.3,16446,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16446,1,3,0)
 ;;=3^600.00
 ;;^UTILITY(U,$J,358.3,16446,1,4,0)
 ;;=4^Hypertrophy n Benign
 ;;^UTILITY(U,$J,358.3,16446,2)
 ;;=^329932
 ;;^UTILITY(U,$J,358.3,16447,0)
 ;;=585.9^^84^981^5
 ;;^UTILITY(U,$J,358.3,16447,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16447,1,3,0)
 ;;=3^585.9
 ;;^UTILITY(U,$J,358.3,16447,1,4,0)
 ;;=4^Chronic Renal Insufficiency
 ;;^UTILITY(U,$J,358.3,16447,2)
 ;;=^332812
 ;;
 ;;$END ROU IBDEI0XR
