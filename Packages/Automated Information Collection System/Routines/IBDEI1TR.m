IBDEI1TR ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,32151,0)
 ;;=L40.2^^182^1981^11
 ;;^UTILITY(U,$J,358.3,32151,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32151,1,3,0)
 ;;=3^Acrodermatitis Continua
 ;;^UTILITY(U,$J,358.3,32151,1,4,0)
 ;;=4^L40.2
 ;;^UTILITY(U,$J,358.3,32151,2)
 ;;=^5009162
 ;;^UTILITY(U,$J,358.3,32152,0)
 ;;=L40.3^^182^1981^256
 ;;^UTILITY(U,$J,358.3,32152,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32152,1,3,0)
 ;;=3^Pustulosis Palmaris et Plantaris
 ;;^UTILITY(U,$J,358.3,32152,1,4,0)
 ;;=4^L40.3
 ;;^UTILITY(U,$J,358.3,32152,2)
 ;;=^5009163
 ;;^UTILITY(U,$J,358.3,32153,0)
 ;;=L40.4^^182^1981^157
 ;;^UTILITY(U,$J,358.3,32153,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32153,1,3,0)
 ;;=3^Guttate Psoriasis
 ;;^UTILITY(U,$J,358.3,32153,1,4,0)
 ;;=4^L40.4
 ;;^UTILITY(U,$J,358.3,32153,2)
 ;;=^5009164
 ;;^UTILITY(U,$J,358.3,32154,0)
 ;;=L40.8^^182^1981^253
 ;;^UTILITY(U,$J,358.3,32154,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32154,1,3,0)
 ;;=3^Psoriasis NEC
 ;;^UTILITY(U,$J,358.3,32154,1,4,0)
 ;;=4^L40.8
 ;;^UTILITY(U,$J,358.3,32154,2)
 ;;=^271917
 ;;^UTILITY(U,$J,358.3,32155,0)
 ;;=L40.9^^182^1981^255
 ;;^UTILITY(U,$J,358.3,32155,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32155,1,3,0)
 ;;=3^Psoriasis,Unspec
 ;;^UTILITY(U,$J,358.3,32155,1,4,0)
 ;;=4^L40.9
 ;;^UTILITY(U,$J,358.3,32155,2)
 ;;=^5009171
 ;;^UTILITY(U,$J,358.3,32156,0)
 ;;=L50.9^^182^1981^287
 ;;^UTILITY(U,$J,358.3,32156,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32156,1,3,0)
 ;;=3^Urticaria,Unspec
 ;;^UTILITY(U,$J,358.3,32156,1,4,0)
 ;;=4^L50.9
 ;;^UTILITY(U,$J,358.3,32156,2)
 ;;=^5009204
 ;;^UTILITY(U,$J,358.3,32157,0)
 ;;=L53.8^^182^1981^147
 ;;^UTILITY(U,$J,358.3,32157,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32157,1,3,0)
 ;;=3^Erythematous Conditions NEC
 ;;^UTILITY(U,$J,358.3,32157,1,4,0)
 ;;=4^L53.8
 ;;^UTILITY(U,$J,358.3,32157,2)
 ;;=^88044
 ;;^UTILITY(U,$J,358.3,32158,0)
 ;;=L53.9^^182^1981^146
 ;;^UTILITY(U,$J,358.3,32158,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32158,1,3,0)
 ;;=3^Erythematous Condition,Unspec
 ;;^UTILITY(U,$J,358.3,32158,1,4,0)
 ;;=4^L53.9
 ;;^UTILITY(U,$J,358.3,32158,2)
 ;;=^5009210
 ;;^UTILITY(U,$J,358.3,32159,0)
 ;;=L54.^^182^1981^145
 ;;^UTILITY(U,$J,358.3,32159,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32159,1,3,0)
 ;;=3^Erythema in Diseases Classified Elsewhere
 ;;^UTILITY(U,$J,358.3,32159,1,4,0)
 ;;=4^L54.
 ;;^UTILITY(U,$J,358.3,32159,2)
 ;;=^5009211
 ;;^UTILITY(U,$J,358.3,32160,0)
 ;;=L56.0^^182^1981^139
 ;;^UTILITY(U,$J,358.3,32160,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32160,1,3,0)
 ;;=3^Drug Phototoxic Response
 ;;^UTILITY(U,$J,358.3,32160,1,4,0)
 ;;=4^L56.0
 ;;^UTILITY(U,$J,358.3,32160,2)
 ;;=^5009214
 ;;^UTILITY(U,$J,358.3,32161,0)
 ;;=L56.1^^182^1981^138
 ;;^UTILITY(U,$J,358.3,32161,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32161,1,3,0)
 ;;=3^Drug Photoallergic Response
 ;;^UTILITY(U,$J,358.3,32161,1,4,0)
 ;;=4^L56.1
 ;;^UTILITY(U,$J,358.3,32161,2)
 ;;=^5009215
 ;;^UTILITY(U,$J,358.3,32162,0)
 ;;=L56.2^^182^1981^237
 ;;^UTILITY(U,$J,358.3,32162,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32162,1,3,0)
 ;;=3^Photocontact Dermatitis
 ;;^UTILITY(U,$J,358.3,32162,1,4,0)
 ;;=4^L56.2
 ;;^UTILITY(U,$J,358.3,32162,2)
 ;;=^5009216
 ;;^UTILITY(U,$J,358.3,32163,0)
 ;;=L56.3^^182^1981^269
 ;;^UTILITY(U,$J,358.3,32163,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,32163,1,3,0)
 ;;=3^Solar Urticaria
 ;;^UTILITY(U,$J,358.3,32163,1,4,0)
 ;;=4^L56.3
 ;;^UTILITY(U,$J,358.3,32163,2)
 ;;=^5009217
 ;;^UTILITY(U,$J,358.3,32164,0)
 ;;=L57.0^^182^1981^12
 ;;^UTILITY(U,$J,358.3,32164,1,0)
 ;;=^358.31IA^4^2
 ;;
 ;;$END ROU IBDEI1TR
