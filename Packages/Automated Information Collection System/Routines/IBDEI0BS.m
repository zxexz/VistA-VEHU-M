IBDEI0BS ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,5201,0)
 ;;=701.3^^25^305^2
 ;;^UTILITY(U,$J,358.3,5201,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5201,1,2,0)
 ;;=2^701.3
 ;;^UTILITY(U,$J,358.3,5201,1,5,0)
 ;;=5^Milian Atrophic Blanche
 ;;^UTILITY(U,$J,358.3,5201,2)
 ;;=^265898
 ;;^UTILITY(U,$J,358.3,5202,0)
 ;;=705.1^^25^305^3
 ;;^UTILITY(U,$J,358.3,5202,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5202,1,2,0)
 ;;=2^705.1
 ;;^UTILITY(U,$J,358.3,5202,1,5,0)
 ;;=5^Milliaria
 ;;^UTILITY(U,$J,358.3,5202,2)
 ;;=^77948
 ;;^UTILITY(U,$J,358.3,5203,0)
 ;;=701.0^^25^305^5
 ;;^UTILITY(U,$J,358.3,5203,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5203,1,2,0)
 ;;=2^701.0
 ;;^UTILITY(U,$J,358.3,5203,1,5,0)
 ;;=5^Morphea
 ;;^UTILITY(U,$J,358.3,5203,2)
 ;;=^108577
 ;;^UTILITY(U,$J,358.3,5204,0)
 ;;=202.10^^25^305^6
 ;;^UTILITY(U,$J,358.3,5204,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5204,1,2,0)
 ;;=2^202.10
 ;;^UTILITY(U,$J,358.3,5204,1,5,0)
 ;;=5^Mycosis Fungoides Unspec
 ;;^UTILITY(U,$J,358.3,5204,2)
 ;;=^80360
 ;;^UTILITY(U,$J,358.3,5205,0)
 ;;=078.0^^25^305^4
 ;;^UTILITY(U,$J,358.3,5205,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5205,1,2,0)
 ;;=2^078.0
 ;;^UTILITY(U,$J,358.3,5205,1,5,0)
 ;;=5^Molluscum Contagiosum
 ;;^UTILITY(U,$J,358.3,5205,2)
 ;;=^78675
 ;;^UTILITY(U,$J,358.3,5206,0)
 ;;=706.2^^25^305^1.5
 ;;^UTILITY(U,$J,358.3,5206,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5206,1,2,0)
 ;;=2^706.2
 ;;^UTILITY(U,$J,358.3,5206,1,5,0)
 ;;=5^Milia
 ;;^UTILITY(U,$J,358.3,5206,2)
 ;;=^41304
 ;;^UTILITY(U,$J,358.3,5207,0)
 ;;=110.6^^25^305^7
 ;;^UTILITY(U,$J,358.3,5207,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5207,1,2,0)
 ;;=2^110.6
 ;;^UTILITY(U,$J,358.3,5207,1,5,0)
 ;;=5^Majocchi's Granuloma
 ;;^UTILITY(U,$J,358.3,5207,2)
 ;;=^266861
 ;;^UTILITY(U,$J,358.3,5208,0)
 ;;=V02.9^^25^306^1
 ;;^UTILITY(U,$J,358.3,5208,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5208,1,2,0)
 ;;=2^V02.9
 ;;^UTILITY(U,$J,358.3,5208,1,5,0)
 ;;=5^Nasal Staph Carrier
 ;;^UTILITY(U,$J,358.3,5208,2)
 ;;=^295176
 ;;^UTILITY(U,$J,358.3,5209,0)
 ;;=709.3^^25^306^2
 ;;^UTILITY(U,$J,358.3,5209,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5209,1,2,0)
 ;;=2^709.3
 ;;^UTILITY(U,$J,358.3,5209,1,5,0)
 ;;=5^Necrobiosis Lipidica
 ;;^UTILITY(U,$J,358.3,5209,2)
 ;;=^31460
 ;;^UTILITY(U,$J,358.3,5210,0)
 ;;=215.9^^25^306^3
 ;;^UTILITY(U,$J,358.3,5210,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5210,1,2,0)
 ;;=2^215.9
 ;;^UTILITY(U,$J,358.3,5210,1,5,0)
 ;;=5^Neurofibroma
 ;;^UTILITY(U,$J,358.3,5210,2)
 ;;=^267620
 ;;^UTILITY(U,$J,358.3,5211,0)
 ;;=698.4^^25^306^4
 ;;^UTILITY(U,$J,358.3,5211,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5211,1,2,0)
 ;;=2^698.4
 ;;^UTILITY(U,$J,358.3,5211,1,5,0)
 ;;=5^Neurotic Excoriation
 ;;^UTILITY(U,$J,358.3,5211,2)
 ;;=^186786
 ;;^UTILITY(U,$J,358.3,5212,0)
 ;;=448.1^^25^306^5
 ;;^UTILITY(U,$J,358.3,5212,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5212,1,2,0)
 ;;=2^448.1
 ;;^UTILITY(U,$J,358.3,5212,1,5,0)
 ;;=5^Nevus (Birthmark), non-neoplastic
 ;;^UTILITY(U,$J,358.3,5212,2)
 ;;=^269807
 ;;^UTILITY(U,$J,358.3,5213,0)
 ;;=691.8^^25^307^13
 ;;^UTILITY(U,$J,358.3,5213,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5213,1,2,0)
 ;;=2^691.8
 ;;^UTILITY(U,$J,358.3,5213,1,5,0)
 ;;=5^Prurigo Nodularis
 ;;^UTILITY(U,$J,358.3,5213,2)
 ;;=^87342
 ;;^UTILITY(U,$J,358.3,5214,0)
 ;;=696.2^^25^307^2
 ;;^UTILITY(U,$J,358.3,5214,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5214,1,2,0)
 ;;=2^696.2
 ;;^UTILITY(U,$J,358.3,5214,1,5,0)
 ;;=5^Pleva
 ;;^UTILITY(U,$J,358.3,5214,2)
 ;;=^90056
 ;;^UTILITY(U,$J,358.3,5215,0)
 ;;=681.9^^25^307^4
 ;;^UTILITY(U,$J,358.3,5215,1,0)
 ;;=^358.31IA^5^2
 ;;
 ;;$END ROU IBDEI0BS
