IBDEI07I ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,3012,1,4,0)
 ;;=4^Z91.411
 ;;^UTILITY(U,$J,358.3,3012,2)
 ;;=^5063620
 ;;^UTILITY(U,$J,358.3,3013,0)
 ;;=F06.4^^8^86^5
 ;;^UTILITY(U,$J,358.3,3013,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3013,1,3,0)
 ;;=3^Anxiety Disorder d/t Another Medical Condition
 ;;^UTILITY(U,$J,358.3,3013,1,4,0)
 ;;=4^F06.4
 ;;^UTILITY(U,$J,358.3,3013,2)
 ;;=^5003061
 ;;^UTILITY(U,$J,358.3,3014,0)
 ;;=F41.0^^8^86^13
 ;;^UTILITY(U,$J,358.3,3014,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3014,1,3,0)
 ;;=3^Panic Disorder
 ;;^UTILITY(U,$J,358.3,3014,1,4,0)
 ;;=4^F41.0
 ;;^UTILITY(U,$J,358.3,3014,2)
 ;;=^5003564
 ;;^UTILITY(U,$J,358.3,3015,0)
 ;;=F41.1^^8^86^11
 ;;^UTILITY(U,$J,358.3,3015,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3015,1,3,0)
 ;;=3^Generalized Anxiety Disorder
 ;;^UTILITY(U,$J,358.3,3015,1,4,0)
 ;;=4^F41.1
 ;;^UTILITY(U,$J,358.3,3015,2)
 ;;=^50059
 ;;^UTILITY(U,$J,358.3,3016,0)
 ;;=F41.9^^8^86^4
 ;;^UTILITY(U,$J,358.3,3016,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3016,1,3,0)
 ;;=3^Anxiety Disorder NOS
 ;;^UTILITY(U,$J,358.3,3016,1,4,0)
 ;;=4^F41.9
 ;;^UTILITY(U,$J,358.3,3016,2)
 ;;=^5003567
 ;;^UTILITY(U,$J,358.3,3017,0)
 ;;=F40.02^^8^86^2
 ;;^UTILITY(U,$J,358.3,3017,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3017,1,3,0)
 ;;=3^Agoraphobia
 ;;^UTILITY(U,$J,358.3,3017,1,4,0)
 ;;=4^F40.02
 ;;^UTILITY(U,$J,358.3,3017,2)
 ;;=^5003543
 ;;^UTILITY(U,$J,358.3,3018,0)
 ;;=F40.10^^8^86^15
 ;;^UTILITY(U,$J,358.3,3018,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3018,1,3,0)
 ;;=3^Social Anxiety Disorder
 ;;^UTILITY(U,$J,358.3,3018,1,4,0)
 ;;=4^F40.10
 ;;^UTILITY(U,$J,358.3,3018,2)
 ;;=^5003544
 ;;^UTILITY(U,$J,358.3,3019,0)
 ;;=F40.218^^8^86^3
 ;;^UTILITY(U,$J,358.3,3019,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3019,1,3,0)
 ;;=3^Animal Type Phobias
 ;;^UTILITY(U,$J,358.3,3019,1,4,0)
 ;;=4^F40.218
 ;;^UTILITY(U,$J,358.3,3019,2)
 ;;=^5003547
 ;;^UTILITY(U,$J,358.3,3020,0)
 ;;=F40.228^^8^86^12
 ;;^UTILITY(U,$J,358.3,3020,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3020,1,3,0)
 ;;=3^Natural Environment Type Phobia
 ;;^UTILITY(U,$J,358.3,3020,1,4,0)
 ;;=4^F40.228
 ;;^UTILITY(U,$J,358.3,3020,2)
 ;;=^5003549
 ;;^UTILITY(U,$J,358.3,3021,0)
 ;;=F40.230^^8^86^7
 ;;^UTILITY(U,$J,358.3,3021,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3021,1,3,0)
 ;;=3^Fear of Blood
 ;;^UTILITY(U,$J,358.3,3021,1,4,0)
 ;;=4^F40.230
 ;;^UTILITY(U,$J,358.3,3021,2)
 ;;=^5003550
 ;;^UTILITY(U,$J,358.3,3022,0)
 ;;=F40.231^^8^86^8
 ;;^UTILITY(U,$J,358.3,3022,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3022,1,3,0)
 ;;=3^Fear of Injections & Transfusions
 ;;^UTILITY(U,$J,358.3,3022,1,4,0)
 ;;=4^F40.231
 ;;^UTILITY(U,$J,358.3,3022,2)
 ;;=^5003551
 ;;^UTILITY(U,$J,358.3,3023,0)
 ;;=F40.232^^8^86^10
 ;;^UTILITY(U,$J,358.3,3023,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3023,1,3,0)
 ;;=3^Fear of Oth Medical Care
 ;;^UTILITY(U,$J,358.3,3023,1,4,0)
 ;;=4^F40.232
 ;;^UTILITY(U,$J,358.3,3023,2)
 ;;=^5003552
 ;;^UTILITY(U,$J,358.3,3024,0)
 ;;=F40.233^^8^86^9
 ;;^UTILITY(U,$J,358.3,3024,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3024,1,3,0)
 ;;=3^Fear of Injury
 ;;^UTILITY(U,$J,358.3,3024,1,4,0)
 ;;=4^F40.233
 ;;^UTILITY(U,$J,358.3,3024,2)
 ;;=^5003553
 ;;^UTILITY(U,$J,358.3,3025,0)
 ;;=F40.240^^8^86^6
 ;;^UTILITY(U,$J,358.3,3025,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3025,1,3,0)
 ;;=3^Claustrophobia
 ;;^UTILITY(U,$J,358.3,3025,1,4,0)
 ;;=4^F40.240
 ;;^UTILITY(U,$J,358.3,3025,2)
 ;;=^5003554
 ;;^UTILITY(U,$J,358.3,3026,0)
 ;;=F40.241^^8^86^1
 ;;^UTILITY(U,$J,358.3,3026,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3026,1,3,0)
 ;;=3^Acrophobia
 ;;
 ;;$END ROU IBDEI07I
