IBDEI0CV ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,5771,1,4,0)
 ;;=4^INFLUENZA
 ;;^UTILITY(U,$J,358.3,5771,2)
 ;;=^63125
 ;;^UTILITY(U,$J,358.3,5772,0)
 ;;=730.00^^28^381^13
 ;;^UTILITY(U,$J,358.3,5772,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5772,1,3,0)
 ;;=3^730.00
 ;;^UTILITY(U,$J,358.3,5772,1,4,0)
 ;;=4^OSTEOMYELITIS
 ;;^UTILITY(U,$J,358.3,5772,2)
 ;;=^272612
 ;;^UTILITY(U,$J,358.3,5773,0)
 ;;=382.9^^28^381^14
 ;;^UTILITY(U,$J,358.3,5773,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5773,1,3,0)
 ;;=3^382.9
 ;;^UTILITY(U,$J,358.3,5773,1,4,0)
 ;;=4^OTITIS MEDIA NOS
 ;;^UTILITY(U,$J,358.3,5773,2)
 ;;=^123967
 ;;^UTILITY(U,$J,358.3,5774,0)
 ;;=614.9^^28^381^15
 ;;^UTILITY(U,$J,358.3,5774,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5774,1,3,0)
 ;;=3^614.9
 ;;^UTILITY(U,$J,358.3,5774,1,4,0)
 ;;=4^PELVIC INFLAMMATORY DISEASE
 ;;^UTILITY(U,$J,358.3,5774,2)
 ;;=^3537
 ;;^UTILITY(U,$J,358.3,5775,0)
 ;;=462.^^28^381^16
 ;;^UTILITY(U,$J,358.3,5775,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5775,1,3,0)
 ;;=3^462.
 ;;^UTILITY(U,$J,358.3,5775,1,4,0)
 ;;=4^PHARYNGITIS
 ;;^UTILITY(U,$J,358.3,5775,2)
 ;;=^2653
 ;;^UTILITY(U,$J,358.3,5776,0)
 ;;=486.^^28^381^17
 ;;^UTILITY(U,$J,358.3,5776,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5776,1,3,0)
 ;;=3^486.
 ;;^UTILITY(U,$J,358.3,5776,1,4,0)
 ;;=4^PNEUMONIA
 ;;^UTILITY(U,$J,358.3,5776,2)
 ;;=^95632
 ;;^UTILITY(U,$J,358.3,5777,0)
 ;;=590.80^^28^381^18
 ;;^UTILITY(U,$J,358.3,5777,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5777,1,3,0)
 ;;=3^590.80
 ;;^UTILITY(U,$J,358.3,5777,1,4,0)
 ;;=4^PYELONEPHRITIS NOS
 ;;^UTILITY(U,$J,358.3,5777,2)
 ;;=^101463
 ;;^UTILITY(U,$J,358.3,5778,0)
 ;;=711.00^^28^381^19
 ;;^UTILITY(U,$J,358.3,5778,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5778,1,3,0)
 ;;=3^711.00
 ;;^UTILITY(U,$J,358.3,5778,1,4,0)
 ;;=4^SEPTIC JOINT
 ;;^UTILITY(U,$J,358.3,5778,2)
 ;;=^263780
 ;;^UTILITY(U,$J,358.3,5779,0)
 ;;=461.8^^28^381^20
 ;;^UTILITY(U,$J,358.3,5779,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5779,1,3,0)
 ;;=3^461.8
 ;;^UTILITY(U,$J,358.3,5779,1,4,0)
 ;;=4^SINUSITIS,ACUTE
 ;;^UTILITY(U,$J,358.3,5779,2)
 ;;=^269865
 ;;^UTILITY(U,$J,358.3,5780,0)
 ;;=473.8^^28^381^21
 ;;^UTILITY(U,$J,358.3,5780,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5780,1,3,0)
 ;;=3^473.8
 ;;^UTILITY(U,$J,358.3,5780,1,4,0)
 ;;=4^SINUSITIS,CHRONIC
 ;;^UTILITY(U,$J,358.3,5780,2)
 ;;=^269890
 ;;^UTILITY(U,$J,358.3,5781,0)
 ;;=463.^^28^381^22
 ;;^UTILITY(U,$J,358.3,5781,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5781,1,3,0)
 ;;=3^463.
 ;;^UTILITY(U,$J,358.3,5781,1,4,0)
 ;;=4^TONSILLITIS
 ;;^UTILITY(U,$J,358.3,5781,2)
 ;;=^2695
 ;;^UTILITY(U,$J,358.3,5782,0)
 ;;=011.90^^28^381^23
 ;;^UTILITY(U,$J,358.3,5782,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5782,1,3,0)
 ;;=3^011.90
 ;;^UTILITY(U,$J,358.3,5782,1,4,0)
 ;;=4^TUBERCULOSIS
 ;;^UTILITY(U,$J,358.3,5782,2)
 ;;=^122756
 ;;^UTILITY(U,$J,358.3,5783,0)
 ;;=465.9^^28^381^24
 ;;^UTILITY(U,$J,358.3,5783,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5783,1,3,0)
 ;;=3^465.9
 ;;^UTILITY(U,$J,358.3,5783,1,4,0)
 ;;=4^URI
 ;;^UTILITY(U,$J,358.3,5783,2)
 ;;=^269878
 ;;^UTILITY(U,$J,358.3,5784,0)
 ;;=599.0^^28^381^25
 ;;^UTILITY(U,$J,358.3,5784,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5784,1,3,0)
 ;;=3^599.0
 ;;^UTILITY(U,$J,358.3,5784,1,4,0)
 ;;=4^UTI
 ;;^UTILITY(U,$J,358.3,5784,2)
 ;;=^124436
 ;;^UTILITY(U,$J,358.3,5785,0)
 ;;=616.10^^28^381^26
 ;;^UTILITY(U,$J,358.3,5785,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5785,1,3,0)
 ;;=3^616.10
 ;;^UTILITY(U,$J,358.3,5785,1,4,0)
 ;;=4^VAGINITIS NOS
 ;;^UTILITY(U,$J,358.3,5785,2)
 ;;=^125233
 ;;^UTILITY(U,$J,358.3,5786,0)
 ;;=277.30^^28^382^1
 ;;
 ;;$END ROU IBDEI0CV
