IBDEI08D ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,3438,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3438,1,2,0)
 ;;=2^309.89
 ;;^UTILITY(U,$J,358.3,3438,1,5,0)
 ;;=5^Adj Reaction NEC
 ;;^UTILITY(U,$J,358.3,3438,2)
 ;;=^268313
 ;;^UTILITY(U,$J,358.3,3439,0)
 ;;=300.00^^11^146^4
 ;;^UTILITY(U,$J,358.3,3439,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3439,1,2,0)
 ;;=2^300.00
 ;;^UTILITY(U,$J,358.3,3439,1,5,0)
 ;;=5^Anxiety State
 ;;^UTILITY(U,$J,358.3,3439,2)
 ;;=^9200
 ;;^UTILITY(U,$J,358.3,3440,0)
 ;;=300.01^^11^146^9
 ;;^UTILITY(U,$J,358.3,3440,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3440,1,2,0)
 ;;=2^300.01
 ;;^UTILITY(U,$J,358.3,3440,1,5,0)
 ;;=5^Panic Disord w/o Agoraphobia
 ;;^UTILITY(U,$J,358.3,3440,2)
 ;;=^89489
 ;;^UTILITY(U,$J,358.3,3441,0)
 ;;=300.02^^11^146^7
 ;;^UTILITY(U,$J,358.3,3441,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3441,1,2,0)
 ;;=2^300.02
 ;;^UTILITY(U,$J,358.3,3441,1,5,0)
 ;;=5^Generalized Anxiety Dis
 ;;^UTILITY(U,$J,358.3,3441,2)
 ;;=^50059
 ;;^UTILITY(U,$J,358.3,3442,0)
 ;;=300.20^^11^146^14
 ;;^UTILITY(U,$J,358.3,3442,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3442,1,2,0)
 ;;=2^300.20
 ;;^UTILITY(U,$J,358.3,3442,1,5,0)
 ;;=5^Phobia, Unspecified
 ;;^UTILITY(U,$J,358.3,3442,2)
 ;;=^93428
 ;;^UTILITY(U,$J,358.3,3443,0)
 ;;=300.21^^11^146^10
 ;;^UTILITY(U,$J,358.3,3443,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3443,1,2,0)
 ;;=2^300.21
 ;;^UTILITY(U,$J,358.3,3443,1,5,0)
 ;;=5^Panic W/Agoraphobia
 ;;^UTILITY(U,$J,358.3,3443,2)
 ;;=^268168
 ;;^UTILITY(U,$J,358.3,3444,0)
 ;;=300.22^^11^146^3
 ;;^UTILITY(U,$J,358.3,3444,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3444,1,2,0)
 ;;=2^300.22
 ;;^UTILITY(U,$J,358.3,3444,1,5,0)
 ;;=5^Agoraphobia w/o Panic
 ;;^UTILITY(U,$J,358.3,3444,2)
 ;;=^4218
 ;;^UTILITY(U,$J,358.3,3445,0)
 ;;=300.23^^11^146^13
 ;;^UTILITY(U,$J,358.3,3445,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3445,1,2,0)
 ;;=2^300.23
 ;;^UTILITY(U,$J,358.3,3445,1,5,0)
 ;;=5^Phobia, Social
 ;;^UTILITY(U,$J,358.3,3445,2)
 ;;=^93420
 ;;^UTILITY(U,$J,358.3,3446,0)
 ;;=300.29^^11^146^12
 ;;^UTILITY(U,$J,358.3,3446,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3446,1,2,0)
 ;;=2^300.29
 ;;^UTILITY(U,$J,358.3,3446,1,5,0)
 ;;=5^Phobia, Simple
 ;;^UTILITY(U,$J,358.3,3446,2)
 ;;=^87670
 ;;^UTILITY(U,$J,358.3,3447,0)
 ;;=300.3^^11^146^8
 ;;^UTILITY(U,$J,358.3,3447,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3447,1,2,0)
 ;;=2^300.3
 ;;^UTILITY(U,$J,358.3,3447,1,5,0)
 ;;=5^Obsessive/Compulsive
 ;;^UTILITY(U,$J,358.3,3447,2)
 ;;=^84904
 ;;^UTILITY(U,$J,358.3,3448,0)
 ;;=308.9^^11^146^1
 ;;^UTILITY(U,$J,358.3,3448,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3448,1,2,0)
 ;;=2^308.9
 ;;^UTILITY(U,$J,358.3,3448,1,5,0)
 ;;=5^Acute Stress Reaction,Unspec
 ;;^UTILITY(U,$J,358.3,3448,2)
 ;;=^268303
 ;;^UTILITY(U,$J,358.3,3449,0)
 ;;=300.15^^11^146^6
 ;;^UTILITY(U,$J,358.3,3449,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3449,1,2,0)
 ;;=2^300.15
 ;;^UTILITY(U,$J,358.3,3449,1,5,0)
 ;;=5^Dissociative Reaction,Unspec
 ;;^UTILITY(U,$J,358.3,3449,2)
 ;;=^35700
 ;;^UTILITY(U,$J,358.3,3450,0)
 ;;=291.1^^11^147^5
 ;;^UTILITY(U,$J,358.3,3450,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3450,1,2,0)
 ;;=2^291.1
 ;;^UTILITY(U,$J,358.3,3450,1,5,0)
 ;;=5^Amnestic Syndrome Due to Alcohol
 ;;^UTILITY(U,$J,358.3,3450,2)
 ;;=^303492
 ;;^UTILITY(U,$J,358.3,3451,0)
 ;;=294.0^^11^147^7
 ;;^UTILITY(U,$J,358.3,3451,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3451,1,2,0)
 ;;=2^294.0
 ;;^UTILITY(U,$J,358.3,3451,1,5,0)
 ;;=5^Amnestic Syndrome in Oth Conditions
 ;;^UTILITY(U,$J,358.3,3451,2)
 ;;=^6319
 ;;^UTILITY(U,$J,358.3,3452,0)
 ;;=292.83^^11^147^6
 ;;
 ;;$END ROU IBDEI08D
