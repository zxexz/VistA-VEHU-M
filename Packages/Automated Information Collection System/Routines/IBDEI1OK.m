IBDEI1OK ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,29827,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29827,1,3,0)
 ;;=3^UTI,Site Unspec
 ;;^UTILITY(U,$J,358.3,29827,1,4,0)
 ;;=4^N39.0
 ;;^UTILITY(U,$J,358.3,29827,2)
 ;;=^124436
 ;;^UTILITY(U,$J,358.3,29828,0)
 ;;=N40.0^^177^1900^12
 ;;^UTILITY(U,$J,358.3,29828,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29828,1,3,0)
 ;;=3^Enlarged Prostate w/o Lower Urinary Tract Symptoms
 ;;^UTILITY(U,$J,358.3,29828,1,4,0)
 ;;=4^N40.0
 ;;^UTILITY(U,$J,358.3,29828,2)
 ;;=^5015689
 ;;^UTILITY(U,$J,358.3,29829,0)
 ;;=N40.1^^177^1900^11
 ;;^UTILITY(U,$J,358.3,29829,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29829,1,3,0)
 ;;=3^Enlarged Prostate w/ Lower Urinary Tract Symptoms
 ;;^UTILITY(U,$J,358.3,29829,1,4,0)
 ;;=4^N40.1
 ;;^UTILITY(U,$J,358.3,29829,2)
 ;;=^5015690
 ;;^UTILITY(U,$J,358.3,29830,0)
 ;;=N40.2^^177^1900^24
 ;;^UTILITY(U,$J,358.3,29830,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29830,1,3,0)
 ;;=3^Nodular Prostate w/o Lower Urinary Tract Symptoms
 ;;^UTILITY(U,$J,358.3,29830,1,4,0)
 ;;=4^N40.2
 ;;^UTILITY(U,$J,358.3,29830,2)
 ;;=^5015691
 ;;^UTILITY(U,$J,358.3,29831,0)
 ;;=N40.3^^177^1900^23
 ;;^UTILITY(U,$J,358.3,29831,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29831,1,3,0)
 ;;=3^Nodular Prostate w/ Lower Urinary Tract Symptoms
 ;;^UTILITY(U,$J,358.3,29831,1,4,0)
 ;;=4^N40.3
 ;;^UTILITY(U,$J,358.3,29831,2)
 ;;=^5015692
 ;;^UTILITY(U,$J,358.3,29832,0)
 ;;=N42.83^^177^1900^26
 ;;^UTILITY(U,$J,358.3,29832,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29832,1,3,0)
 ;;=3^Prostate Cyst
 ;;^UTILITY(U,$J,358.3,29832,1,4,0)
 ;;=4^N42.83
 ;;^UTILITY(U,$J,358.3,29832,2)
 ;;=^322241
 ;;^UTILITY(U,$J,358.3,29833,0)
 ;;=N52.9^^177^1900^13
 ;;^UTILITY(U,$J,358.3,29833,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29833,1,3,0)
 ;;=3^Erectile Dysfunction,Unspec
 ;;^UTILITY(U,$J,358.3,29833,1,4,0)
 ;;=4^N52.9
 ;;^UTILITY(U,$J,358.3,29833,2)
 ;;=^5015763
 ;;^UTILITY(U,$J,358.3,29834,0)
 ;;=R39.89^^177^1900^15
 ;;^UTILITY(U,$J,358.3,29834,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29834,1,3,0)
 ;;=3^Genitourinary System Symptoms/Signs NEC
 ;;^UTILITY(U,$J,358.3,29834,1,4,0)
 ;;=4^R39.89
 ;;^UTILITY(U,$J,358.3,29834,2)
 ;;=^5019350
 ;;^UTILITY(U,$J,358.3,29835,0)
 ;;=R39.2^^177^1900^14
 ;;^UTILITY(U,$J,358.3,29835,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29835,1,3,0)
 ;;=3^Extrarenal Uremia
 ;;^UTILITY(U,$J,358.3,29835,1,4,0)
 ;;=4^R39.2
 ;;^UTILITY(U,$J,358.3,29835,2)
 ;;=^5019348
 ;;^UTILITY(U,$J,358.3,29836,0)
 ;;=R30.1^^177^1900^29
 ;;^UTILITY(U,$J,358.3,29836,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29836,1,3,0)
 ;;=3^Vesical Tenesmus
 ;;^UTILITY(U,$J,358.3,29836,1,4,0)
 ;;=4^R30.1
 ;;^UTILITY(U,$J,358.3,29836,2)
 ;;=^5019323
 ;;^UTILITY(U,$J,358.3,29837,0)
 ;;=Z85.46^^177^1900^16
 ;;^UTILITY(U,$J,358.3,29837,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29837,1,3,0)
 ;;=3^Hx of Malig Neop of Prostate
 ;;^UTILITY(U,$J,358.3,29837,1,4,0)
 ;;=4^Z85.46
 ;;^UTILITY(U,$J,358.3,29837,2)
 ;;=^5063423
 ;;^UTILITY(U,$J,358.3,29838,0)
 ;;=N18.1^^177^1900^4
 ;;^UTILITY(U,$J,358.3,29838,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29838,1,3,0)
 ;;=3^Chr Kidney Disease,Stage 1
 ;;^UTILITY(U,$J,358.3,29838,1,4,0)
 ;;=4^N18.1
 ;;^UTILITY(U,$J,358.3,29838,2)
 ;;=^5015602
 ;;^UTILITY(U,$J,358.3,29839,0)
 ;;=N18.2^^177^1900^5
 ;;^UTILITY(U,$J,358.3,29839,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,29839,1,3,0)
 ;;=3^Chr Kidney Disease,Stage 2
 ;;^UTILITY(U,$J,358.3,29839,1,4,0)
 ;;=4^N18.2
 ;;^UTILITY(U,$J,358.3,29839,2)
 ;;=^5015603
 ;;^UTILITY(U,$J,358.3,29840,0)
 ;;=N18.3^^177^1900^6
 ;;^UTILITY(U,$J,358.3,29840,1,0)
 ;;=^358.31IA^4^2
 ;;
 ;;$END ROU IBDEI1OK
