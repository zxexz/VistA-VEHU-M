IBDEI0HR ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,8285,1,5,0)
 ;;=5^ALL,In Relapse
 ;;^UTILITY(U,$J,358.3,8285,2)
 ;;=^336465
 ;;^UTILITY(U,$J,358.3,8286,0)
 ;;=204.12^^35^482^17
 ;;^UTILITY(U,$J,358.3,8286,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8286,1,4,0)
 ;;=4^204.12
 ;;^UTILITY(U,$J,358.3,8286,1,5,0)
 ;;=5^CLL,In Relapse
 ;;^UTILITY(U,$J,358.3,8286,2)
 ;;=^336466
 ;;^UTILITY(U,$J,358.3,8287,0)
 ;;=204.20^^35^482^114
 ;;^UTILITY(U,$J,358.3,8287,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8287,1,4,0)
 ;;=4^204.20
 ;;^UTILITY(U,$J,358.3,8287,1,5,0)
 ;;=5^Subacute LL w/o Remission
 ;;^UTILITY(U,$J,358.3,8287,2)
 ;;=^336852
 ;;^UTILITY(U,$J,358.3,8288,0)
 ;;=204.21^^35^482^116
 ;;^UTILITY(U,$J,358.3,8288,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8288,1,4,0)
 ;;=4^204.21
 ;;^UTILITY(U,$J,358.3,8288,1,5,0)
 ;;=5^Subacute LL,In Remission
 ;;^UTILITY(U,$J,358.3,8288,2)
 ;;=^267526
 ;;^UTILITY(U,$J,358.3,8289,0)
 ;;=204.22^^35^482^115
 ;;^UTILITY(U,$J,358.3,8289,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8289,1,4,0)
 ;;=4^204.22
 ;;^UTILITY(U,$J,358.3,8289,1,5,0)
 ;;=5^Subacute LL,In Relapse
 ;;^UTILITY(U,$J,358.3,8289,2)
 ;;=^336467
 ;;^UTILITY(U,$J,358.3,8290,0)
 ;;=205.02^^35^482^5
 ;;^UTILITY(U,$J,358.3,8290,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8290,1,4,0)
 ;;=4^205.02
 ;;^UTILITY(U,$J,358.3,8290,1,5,0)
 ;;=5^AML,In Relapse
 ;;^UTILITY(U,$J,358.3,8290,2)
 ;;=^336470
 ;;^UTILITY(U,$J,358.3,8291,0)
 ;;=205.12^^35^482^20
 ;;^UTILITY(U,$J,358.3,8291,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8291,1,4,0)
 ;;=4^205.12
 ;;^UTILITY(U,$J,358.3,8291,1,5,0)
 ;;=5^CML,In Relapse
 ;;^UTILITY(U,$J,358.3,8291,2)
 ;;=^336471
 ;;^UTILITY(U,$J,358.3,8292,0)
 ;;=284.81^^35^482^14
 ;;^UTILITY(U,$J,358.3,8292,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8292,1,4,0)
 ;;=4^284.81
 ;;^UTILITY(U,$J,358.3,8292,1,5,0)
 ;;=5^Aplastic Anemia d/t Drugs
 ;;^UTILITY(U,$J,358.3,8292,2)
 ;;=^335245
 ;;^UTILITY(U,$J,358.3,8293,0)
 ;;=284.89^^35^482^13
 ;;^UTILITY(U,$J,358.3,8293,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8293,1,4,0)
 ;;=4^284.89
 ;;^UTILITY(U,$J,358.3,8293,1,5,0)
 ;;=5^Aplastic Anemia d/t Chronic Disease
 ;;^UTILITY(U,$J,358.3,8293,2)
 ;;=^87880
 ;;^UTILITY(U,$J,358.3,8294,0)
 ;;=289.84^^35^482^119
 ;;^UTILITY(U,$J,358.3,8294,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8294,1,4,0)
 ;;=4^289.84
 ;;^UTILITY(U,$J,358.3,8294,1,5,0)
 ;;=5^Thrombocytopenia,Heparin Induced
 ;;^UTILITY(U,$J,358.3,8294,2)
 ;;=^336542
 ;;^UTILITY(U,$J,358.3,8295,0)
 ;;=V10.91^^35^482^67
 ;;^UTILITY(U,$J,358.3,8295,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8295,1,4,0)
 ;;=4^V10.91
 ;;^UTILITY(U,$J,358.3,8295,1,5,0)
 ;;=5^H/O Neuroendocrine CA Tumor
 ;;^UTILITY(U,$J,358.3,8295,2)
 ;;=^338494
 ;;^UTILITY(U,$J,358.3,8296,0)
 ;;=V10.91^^35^482^66
 ;;^UTILITY(U,$J,358.3,8296,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8296,1,4,0)
 ;;=4^V10.91
 ;;^UTILITY(U,$J,358.3,8296,1,5,0)
 ;;=5^H/O Malignant Neoplasm,Unspec
 ;;^UTILITY(U,$J,358.3,8296,2)
 ;;=^338494
 ;;^UTILITY(U,$J,358.3,8297,0)
 ;;=465.9^^35^483^70
 ;;^UTILITY(U,$J,358.3,8297,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8297,1,4,0)
 ;;=4^465.9
 ;;^UTILITY(U,$J,358.3,8297,1,5,0)
 ;;=5^URI
 ;;^UTILITY(U,$J,358.3,8297,2)
 ;;=URI^269878
 ;;^UTILITY(U,$J,358.3,8298,0)
 ;;=462.^^35^483^61
 ;;^UTILITY(U,$J,358.3,8298,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8298,1,4,0)
 ;;=4^462.
 ;;^UTILITY(U,$J,358.3,8298,1,5,0)
 ;;=5^Sore Throat
 ;;^UTILITY(U,$J,358.3,8298,2)
 ;;=^2653
 ;;^UTILITY(U,$J,358.3,8299,0)
 ;;=466.0^^35^483^3
 ;;^UTILITY(U,$J,358.3,8299,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8299,1,4,0)
 ;;=4^466.0
 ;;
 ;;$END ROU IBDEI0HR
