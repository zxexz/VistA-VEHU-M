IBDEI0E6 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,6453,0)
 ;;=787.29^^31^410^25
 ;;^UTILITY(U,$J,358.3,6453,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6453,1,4,0)
 ;;=4^787.29
 ;;^UTILITY(U,$J,358.3,6453,1,5,0)
 ;;=5^Dysphagia NEC
 ;;^UTILITY(U,$J,358.3,6453,2)
 ;;=^335280
 ;;^UTILITY(U,$J,358.3,6454,0)
 ;;=787.91^^31^410^18
 ;;^UTILITY(U,$J,358.3,6454,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6454,1,4,0)
 ;;=4^787.91
 ;;^UTILITY(U,$J,358.3,6454,1,5,0)
 ;;=5^Diarrhea
 ;;^UTILITY(U,$J,358.3,6454,2)
 ;;=^33921
 ;;^UTILITY(U,$J,358.3,6455,0)
 ;;=787.99^^31^410^81
 ;;^UTILITY(U,$J,358.3,6455,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6455,1,4,0)
 ;;=4^787.99
 ;;^UTILITY(U,$J,358.3,6455,1,5,0)
 ;;=5^Other GI Symptoms
 ;;^UTILITY(U,$J,358.3,6455,2)
 ;;=^273388
 ;;^UTILITY(U,$J,358.3,6456,0)
 ;;=789.00^^31^410^1
 ;;^UTILITY(U,$J,358.3,6456,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6456,1,4,0)
 ;;=4^789.00
 ;;^UTILITY(U,$J,358.3,6456,1,5,0)
 ;;=5^Abdom Pain,Unsp Site
 ;;^UTILITY(U,$J,358.3,6456,2)
 ;;=^303317
 ;;^UTILITY(U,$J,358.3,6457,0)
 ;;=790.5^^31^410^77
 ;;^UTILITY(U,$J,358.3,6457,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6457,1,4,0)
 ;;=4^790.5
 ;;^UTILITY(U,$J,358.3,6457,1,5,0)
 ;;=5^Liver Chem,Abnormal
 ;;^UTILITY(U,$J,358.3,6457,2)
 ;;=^273402
 ;;^UTILITY(U,$J,358.3,6458,0)
 ;;=584.9^^31^411^2
 ;;^UTILITY(U,$J,358.3,6458,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6458,1,4,0)
 ;;=4^584.9
 ;;^UTILITY(U,$J,358.3,6458,1,5,0)
 ;;=5^Acute Renal Failure
 ;;^UTILITY(U,$J,358.3,6458,2)
 ;;=^67114
 ;;^UTILITY(U,$J,358.3,6459,0)
 ;;=583.9^^31^411^16
 ;;^UTILITY(U,$J,358.3,6459,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6459,1,4,0)
 ;;=4^583.9
 ;;^UTILITY(U,$J,358.3,6459,1,5,0)
 ;;=5^Glomerulonephritis
 ;;^UTILITY(U,$J,358.3,6459,2)
 ;;=^83446
 ;;^UTILITY(U,$J,358.3,6460,0)
 ;;=403.90^^31^411^50
 ;;^UTILITY(U,$J,358.3,6460,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6460,1,4,0)
 ;;=4^403.90
 ;;^UTILITY(U,$J,358.3,6460,1,5,0)
 ;;=5^Renal Insufficiency with Hypertension (CRI and HTN)
 ;;^UTILITY(U,$J,358.3,6460,2)
 ;;=Renal Insufficiency with Hypertension (CRI and HTN)^269609
 ;;^UTILITY(U,$J,358.3,6461,0)
 ;;=593.9^^31^411^9
 ;;^UTILITY(U,$J,358.3,6461,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6461,1,4,0)
 ;;=4^593.9
 ;;^UTILITY(U,$J,358.3,6461,1,5,0)
 ;;=5^Chronic Renal Insufficiency
 ;;^UTILITY(U,$J,358.3,6461,2)
 ;;=Chronic Renal Insufficiency^123849
 ;;^UTILITY(U,$J,358.3,6462,0)
 ;;=581.9^^31^411^36
 ;;^UTILITY(U,$J,358.3,6462,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6462,1,4,0)
 ;;=4^581.9
 ;;^UTILITY(U,$J,358.3,6462,1,5,0)
 ;;=5^Nephrotic Syndrome
 ;;^UTILITY(U,$J,358.3,6462,2)
 ;;=^82357
 ;;^UTILITY(U,$J,358.3,6463,0)
 ;;=753.12^^31^411^42
 ;;^UTILITY(U,$J,358.3,6463,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6463,1,4,0)
 ;;=4^753.12
 ;;^UTILITY(U,$J,358.3,6463,1,5,0)
 ;;=5^Polycystic Kidney Disease
 ;;^UTILITY(U,$J,358.3,6463,2)
 ;;=^67295
 ;;^UTILITY(U,$J,358.3,6464,0)
 ;;=791.0^^31^411^44
 ;;^UTILITY(U,$J,358.3,6464,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6464,1,4,0)
 ;;=4^791.0
 ;;^UTILITY(U,$J,358.3,6464,1,5,0)
 ;;=5^Proteinuria
 ;;^UTILITY(U,$J,358.3,6464,2)
 ;;=Proteinuria^99873
 ;;^UTILITY(U,$J,358.3,6465,0)
 ;;=791.9^^31^411^47
 ;;^UTILITY(U,$J,358.3,6465,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6465,1,4,0)
 ;;=4^791.9
 ;;^UTILITY(U,$J,358.3,6465,1,5,0)
 ;;=5^Pyuria
 ;;^UTILITY(U,$J,358.3,6465,2)
 ;;=^273408
 ;;^UTILITY(U,$J,358.3,6466,0)
 ;;=592.0^^31^411^48
 ;;^UTILITY(U,$J,358.3,6466,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6466,1,4,0)
 ;;=4^592.0
 ;;^UTILITY(U,$J,358.3,6466,1,5,0)
 ;;=5^Renal Calculi
 ;;
 ;;$END ROU IBDEI0E6
