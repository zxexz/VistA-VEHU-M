IBDEI0X8 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,16154,1,4,0)
 ;;=4^300.00
 ;;^UTILITY(U,$J,358.3,16154,1,5,0)
 ;;=5^Anxiety NOS
 ;;^UTILITY(U,$J,358.3,16154,2)
 ;;=^9200
 ;;^UTILITY(U,$J,358.3,16155,0)
 ;;=719.49^^81^955^9
 ;;^UTILITY(U,$J,358.3,16155,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16155,1,4,0)
 ;;=4^719.49
 ;;^UTILITY(U,$J,358.3,16155,1,5,0)
 ;;=5^Arthralgia
 ;;^UTILITY(U,$J,358.3,16155,2)
 ;;=^276885
 ;;^UTILITY(U,$J,358.3,16156,0)
 ;;=719.46^^81^955^11
 ;;^UTILITY(U,$J,358.3,16156,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16156,1,4,0)
 ;;=4^719.46
 ;;^UTILITY(U,$J,358.3,16156,1,5,0)
 ;;=5^Arthralgia, Knee
 ;;^UTILITY(U,$J,358.3,16156,2)
 ;;=^272403
 ;;^UTILITY(U,$J,358.3,16157,0)
 ;;=719.41^^81^955^12
 ;;^UTILITY(U,$J,358.3,16157,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16157,1,4,0)
 ;;=4^719.41
 ;;^UTILITY(U,$J,358.3,16157,1,5,0)
 ;;=5^Arthralgia, Shoulder
 ;;^UTILITY(U,$J,358.3,16157,2)
 ;;=^272398
 ;;^UTILITY(U,$J,358.3,16158,0)
 ;;=719.45^^81^955^10
 ;;^UTILITY(U,$J,358.3,16158,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16158,1,4,0)
 ;;=4^719.45
 ;;^UTILITY(U,$J,358.3,16158,1,5,0)
 ;;=5^Arthralgia, Hip
 ;;^UTILITY(U,$J,358.3,16158,2)
 ;;=^272402
 ;;^UTILITY(U,$J,358.3,16159,0)
 ;;=493.90^^81^955^13
 ;;^UTILITY(U,$J,358.3,16159,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16159,1,4,0)
 ;;=4^493.90
 ;;^UTILITY(U,$J,358.3,16159,1,5,0)
 ;;=5^Asthma NOS
 ;;^UTILITY(U,$J,358.3,16159,2)
 ;;=^330091
 ;;^UTILITY(U,$J,358.3,16160,0)
 ;;=724.5^^81^955^16
 ;;^UTILITY(U,$J,358.3,16160,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16160,1,4,0)
 ;;=4^724.5
 ;;^UTILITY(U,$J,358.3,16160,1,5,0)
 ;;=5^Back Pain, Chronic
 ;;^UTILITY(U,$J,358.3,16160,2)
 ;;=^12250
 ;;^UTILITY(U,$J,358.3,16161,0)
 ;;=600.00^^81^955^14
 ;;^UTILITY(U,$J,358.3,16161,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16161,1,4,0)
 ;;=4^600.00
 ;;^UTILITY(U,$J,358.3,16161,1,5,0)
 ;;=5^BPH w/o Obstruction
 ;;^UTILITY(U,$J,358.3,16161,2)
 ;;=^334276
 ;;^UTILITY(U,$J,358.3,16162,0)
 ;;=490.^^81^955^18
 ;;^UTILITY(U,$J,358.3,16162,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16162,1,4,0)
 ;;=4^490.
 ;;^UTILITY(U,$J,358.3,16162,1,5,0)
 ;;=5^Bronchitis NOS
 ;;^UTILITY(U,$J,358.3,16162,2)
 ;;=^17164
 ;;^UTILITY(U,$J,358.3,16163,0)
 ;;=682.8^^81^955^21
 ;;^UTILITY(U,$J,358.3,16163,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16163,1,4,0)
 ;;=4^682.8
 ;;^UTILITY(U,$J,358.3,16163,1,5,0)
 ;;=5^Cellulitis NEC
 ;;^UTILITY(U,$J,358.3,16163,2)
 ;;=^271896
 ;;^UTILITY(U,$J,358.3,16164,0)
 ;;=585.9^^81^955^22
 ;;^UTILITY(U,$J,358.3,16164,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16164,1,4,0)
 ;;=4^585.9
 ;;^UTILITY(U,$J,358.3,16164,1,5,0)
 ;;=5^Chronic Renal Insufficiency
 ;;^UTILITY(U,$J,358.3,16164,2)
 ;;=^332812
 ;;^UTILITY(U,$J,358.3,16165,0)
 ;;=428.0^^81^955^19
 ;;^UTILITY(U,$J,358.3,16165,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16165,1,4,0)
 ;;=4^428.0
 ;;^UTILITY(U,$J,358.3,16165,1,5,0)
 ;;=5^CHF
 ;;^UTILITY(U,$J,358.3,16165,2)
 ;;=^54758
 ;;^UTILITY(U,$J,358.3,16166,0)
 ;;=496.^^81^955^20
 ;;^UTILITY(U,$J,358.3,16166,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16166,1,4,0)
 ;;=4^496.
 ;;^UTILITY(U,$J,358.3,16166,1,5,0)
 ;;=5^COPD
 ;;^UTILITY(U,$J,358.3,16166,2)
 ;;=^24355
 ;;^UTILITY(U,$J,358.3,16167,0)
 ;;=414.01^^81^955^23
 ;;^UTILITY(U,$J,358.3,16167,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16167,1,4,0)
 ;;=4^414.01
 ;;^UTILITY(U,$J,358.3,16167,1,5,0)
 ;;=5^Coronary Artery Disease
 ;;^UTILITY(U,$J,358.3,16167,2)
 ;;=^303281
 ;;^UTILITY(U,$J,358.3,16168,0)
 ;;=311.^^81^955^25
 ;;^UTILITY(U,$J,358.3,16168,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,16168,1,4,0)
 ;;=4^311.
 ;;
 ;;$END ROU IBDEI0X8
