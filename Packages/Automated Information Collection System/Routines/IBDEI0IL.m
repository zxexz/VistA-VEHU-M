IBDEI0IL ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,8704,1,5,0)
 ;;=5^Foot Pain
 ;;^UTILITY(U,$J,358.3,8704,2)
 ;;=Foot Pain^89086
 ;;^UTILITY(U,$J,358.3,8705,0)
 ;;=723.1^^35^489^24
 ;;^UTILITY(U,$J,358.3,8705,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8705,1,4,0)
 ;;=4^723.1
 ;;^UTILITY(U,$J,358.3,8705,1,5,0)
 ;;=5^Neck Pain
 ;;^UTILITY(U,$J,358.3,8705,2)
 ;;=Neck Pain^21917
 ;;^UTILITY(U,$J,358.3,8706,0)
 ;;=719.41^^35^489^33
 ;;^UTILITY(U,$J,358.3,8706,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8706,1,4,0)
 ;;=4^719.41
 ;;^UTILITY(U,$J,358.3,8706,1,5,0)
 ;;=5^Shoulder Pain
 ;;^UTILITY(U,$J,358.3,8706,2)
 ;;=^272398
 ;;^UTILITY(U,$J,358.3,8707,0)
 ;;=719.45^^35^489^19
 ;;^UTILITY(U,$J,358.3,8707,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8707,1,4,0)
 ;;=4^719.45
 ;;^UTILITY(U,$J,358.3,8707,1,5,0)
 ;;=5^Hip Pain
 ;;^UTILITY(U,$J,358.3,8707,2)
 ;;=Hip Pain^272402
 ;;^UTILITY(U,$J,358.3,8708,0)
 ;;=786.52^^35^489^10
 ;;^UTILITY(U,$J,358.3,8708,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8708,1,4,0)
 ;;=4^786.52
 ;;^UTILITY(U,$J,358.3,8708,1,5,0)
 ;;=5^Chest Wall Pain
 ;;^UTILITY(U,$J,358.3,8708,2)
 ;;=^89126
 ;;^UTILITY(U,$J,358.3,8709,0)
 ;;=719.46^^35^489^22
 ;;^UTILITY(U,$J,358.3,8709,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8709,1,4,0)
 ;;=4^719.46
 ;;^UTILITY(U,$J,358.3,8709,1,5,0)
 ;;=5^Knee Pain
 ;;^UTILITY(U,$J,358.3,8709,2)
 ;;=^272403
 ;;^UTILITY(U,$J,358.3,8710,0)
 ;;=346.90^^35^489^23
 ;;^UTILITY(U,$J,358.3,8710,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8710,1,4,0)
 ;;=4^346.90
 ;;^UTILITY(U,$J,358.3,8710,1,5,0)
 ;;=5^Migraine
 ;;^UTILITY(U,$J,358.3,8710,2)
 ;;=^293880
 ;;^UTILITY(U,$J,358.3,8711,0)
 ;;=729.1^^35^489^25
 ;;^UTILITY(U,$J,358.3,8711,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8711,1,4,0)
 ;;=4^729.1
 ;;^UTILITY(U,$J,358.3,8711,1,5,0)
 ;;=5^Neuropathic Pain
 ;;^UTILITY(U,$J,358.3,8711,2)
 ;;=Neuropathic Pain^80160
 ;;^UTILITY(U,$J,358.3,8712,0)
 ;;=625.9^^35^489^29
 ;;^UTILITY(U,$J,358.3,8712,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8712,1,4,0)
 ;;=4^625.9
 ;;^UTILITY(U,$J,358.3,8712,1,5,0)
 ;;=5^Pelvic Pain (Female)
 ;;^UTILITY(U,$J,358.3,8712,2)
 ;;=^123993
 ;;^UTILITY(U,$J,358.3,8713,0)
 ;;=388.70^^35^489^14
 ;;^UTILITY(U,$J,358.3,8713,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8713,1,4,0)
 ;;=4^388.70
 ;;^UTILITY(U,$J,358.3,8713,1,5,0)
 ;;=5^Ear Pain
 ;;^UTILITY(U,$J,358.3,8713,2)
 ;;=Ear Pain^37811
 ;;^UTILITY(U,$J,358.3,8714,0)
 ;;=526.9^^35^489^20
 ;;^UTILITY(U,$J,358.3,8714,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8714,1,4,0)
 ;;=4^526.9
 ;;^UTILITY(U,$J,358.3,8714,1,5,0)
 ;;=5^Jaw Pain
 ;;^UTILITY(U,$J,358.3,8714,2)
 ;;=Jaw Pain^66177
 ;;^UTILITY(U,$J,358.3,8715,0)
 ;;=789.01^^35^489^5
 ;;^UTILITY(U,$J,358.3,8715,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8715,1,4,0)
 ;;=4^789.01
 ;;^UTILITY(U,$J,358.3,8715,1,5,0)
 ;;=5^Abdominal Pain, RUQ
 ;;^UTILITY(U,$J,358.3,8715,2)
 ;;=Abdominal Pain, RUQ^303318
 ;;^UTILITY(U,$J,358.3,8716,0)
 ;;=789.02^^35^489^3
 ;;^UTILITY(U,$J,358.3,8716,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8716,1,4,0)
 ;;=4^789.02
 ;;^UTILITY(U,$J,358.3,8716,1,5,0)
 ;;=5^Abdominal Pain, LUQ
 ;;^UTILITY(U,$J,358.3,8716,2)
 ;;=Abdominal Pain, LUQ^303319
 ;;^UTILITY(U,$J,358.3,8717,0)
 ;;=789.03^^35^489^4
 ;;^UTILITY(U,$J,358.3,8717,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8717,1,4,0)
 ;;=4^789.03
 ;;^UTILITY(U,$J,358.3,8717,1,5,0)
 ;;=5^Abdominal Pain, RLQ
 ;;^UTILITY(U,$J,358.3,8717,2)
 ;;=Abdominal PainLLQ^303320
 ;;^UTILITY(U,$J,358.3,8718,0)
 ;;=789.04^^35^489^2
 ;;^UTILITY(U,$J,358.3,8718,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8718,1,4,0)
 ;;=4^789.04
 ;;
 ;;$END ROU IBDEI0IL
