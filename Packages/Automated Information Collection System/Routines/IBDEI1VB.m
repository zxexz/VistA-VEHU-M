IBDEI1VB ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,32870,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32870,1,3,0)
 ;;=3^Family Hx of Malig Neop of Prostate
 ;;^UTILITY(U,$J,358.3,32870,1,4,0)
 ;;=4^Z80.42
 ;;^UTILITY(U,$J,358.3,32870,2)
 ;;=^5063349
 ;;^UTILITY(U,$J,358.3,32871,0)
 ;;=Z80.43^^182^1993^32
 ;;^UTILITY(U,$J,358.3,32871,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32871,1,3,0)
 ;;=3^Family Hx of Malig Neop of Testis
 ;;^UTILITY(U,$J,358.3,32871,1,4,0)
 ;;=4^Z80.43
 ;;^UTILITY(U,$J,358.3,32871,2)
 ;;=^5063350
 ;;^UTILITY(U,$J,358.3,32872,0)
 ;;=Z80.6^^182^1993^26
 ;;^UTILITY(U,$J,358.3,32872,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32872,1,3,0)
 ;;=3^Family Hx of Leukemia
 ;;^UTILITY(U,$J,358.3,32872,1,4,0)
 ;;=4^Z80.6
 ;;^UTILITY(U,$J,358.3,32872,2)
 ;;=^5063354
 ;;^UTILITY(U,$J,358.3,32873,0)
 ;;=Z80.8^^182^1993^29
 ;;^UTILITY(U,$J,358.3,32873,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32873,1,3,0)
 ;;=3^Family Hx of Malig Neop of Organs/Systems
 ;;^UTILITY(U,$J,358.3,32873,1,4,0)
 ;;=4^Z80.8
 ;;^UTILITY(U,$J,358.3,32873,2)
 ;;=^5063356
 ;;^UTILITY(U,$J,358.3,32874,0)
 ;;=Z81.8^^182^1993^34
 ;;^UTILITY(U,$J,358.3,32874,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32874,1,3,0)
 ;;=3^Family Hx of Mental/Behavioral Disorders
 ;;^UTILITY(U,$J,358.3,32874,1,4,0)
 ;;=4^Z81.8
 ;;^UTILITY(U,$J,358.3,32874,2)
 ;;=^5063363
 ;;^UTILITY(U,$J,358.3,32875,0)
 ;;=Z82.3^^182^1993^40
 ;;^UTILITY(U,$J,358.3,32875,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32875,1,3,0)
 ;;=3^Family Hx of Stroke
 ;;^UTILITY(U,$J,358.3,32875,1,4,0)
 ;;=4^Z82.3
 ;;^UTILITY(U,$J,358.3,32875,2)
 ;;=^5063367
 ;;^UTILITY(U,$J,358.3,32876,0)
 ;;=Z82.49^^182^1993^25
 ;;^UTILITY(U,$J,358.3,32876,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32876,1,3,0)
 ;;=3^Family Hx of Ischemic Heart Disease/Circulatory System
 ;;^UTILITY(U,$J,358.3,32876,1,4,0)
 ;;=4^Z82.49
 ;;^UTILITY(U,$J,358.3,32876,2)
 ;;=^5063369
 ;;^UTILITY(U,$J,358.3,32877,0)
 ;;=Z82.5^^182^1993^17
 ;;^UTILITY(U,$J,358.3,32877,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32877,1,3,0)
 ;;=3^Family Hx of Asthma/Chronic Lower Respiratory Diseases
 ;;^UTILITY(U,$J,358.3,32877,1,4,0)
 ;;=4^Z82.5
 ;;^UTILITY(U,$J,358.3,32877,2)
 ;;=^5063370
 ;;^UTILITY(U,$J,358.3,32878,0)
 ;;=Z82.61^^182^1993^16
 ;;^UTILITY(U,$J,358.3,32878,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32878,1,3,0)
 ;;=3^Family Hx of Arthritis
 ;;^UTILITY(U,$J,358.3,32878,1,4,0)
 ;;=4^Z82.61
 ;;^UTILITY(U,$J,358.3,32878,2)
 ;;=^5063371
 ;;^UTILITY(U,$J,358.3,32879,0)
 ;;=Z82.69^^182^1993^35
 ;;^UTILITY(U,$J,358.3,32879,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32879,1,3,0)
 ;;=3^Family Hx of Musculoskeletal System/Connective Tissue
 ;;^UTILITY(U,$J,358.3,32879,1,4,0)
 ;;=4^Z82.69
 ;;^UTILITY(U,$J,358.3,32879,2)
 ;;=^5063373
 ;;^UTILITY(U,$J,358.3,32880,0)
 ;;=Z83.3^^182^1993^23
 ;;^UTILITY(U,$J,358.3,32880,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32880,1,3,0)
 ;;=3^Family Hx of Diabetes Mellitus
 ;;^UTILITY(U,$J,358.3,32880,1,4,0)
 ;;=4^Z83.3
 ;;^UTILITY(U,$J,358.3,32880,2)
 ;;=^5063379
 ;;^UTILITY(U,$J,358.3,32881,0)
 ;;=Z83.2^^182^1993^19
 ;;^UTILITY(U,$J,358.3,32881,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32881,1,3,0)
 ;;=3^Family Hx of Blood/Immune Mechanism Diseases
 ;;^UTILITY(U,$J,358.3,32881,1,4,0)
 ;;=4^Z83.2
 ;;^UTILITY(U,$J,358.3,32881,2)
 ;;=^5063378
 ;;^UTILITY(U,$J,358.3,32882,0)
 ;;=Z82.71^^182^1993^38
 ;;^UTILITY(U,$J,358.3,32882,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32882,1,3,0)
 ;;=3^Family Hx of Polycystic Kidney
 ;;^UTILITY(U,$J,358.3,32882,1,4,0)
 ;;=4^Z82.71
 ;;^UTILITY(U,$J,358.3,32882,2)
 ;;=^321531
 ;;
 ;;$END ROU IBDEI1VB
