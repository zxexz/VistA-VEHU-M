IBDEI18X ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,22082,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22082,1,4,0)
 ;;=4^V45.81
 ;;^UTILITY(U,$J,358.3,22082,1,5,0)
 ;;=5^S/P CABG
 ;;^UTILITY(U,$J,358.3,22082,2)
 ;;=^97129
 ;;^UTILITY(U,$J,358.3,22083,0)
 ;;=459.81^^125^1387^86
 ;;^UTILITY(U,$J,358.3,22083,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22083,1,4,0)
 ;;=4^459.81
 ;;^UTILITY(U,$J,358.3,22083,1,5,0)
 ;;=5^Venous Insufficiency
 ;;^UTILITY(U,$J,358.3,22083,2)
 ;;=^125826
 ;;^UTILITY(U,$J,358.3,22084,0)
 ;;=V45.01^^125^1387^78
 ;;^UTILITY(U,$J,358.3,22084,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22084,1,4,0)
 ;;=4^V45.01
 ;;^UTILITY(U,$J,358.3,22084,1,5,0)
 ;;=5^S/P Pacer Placement
 ;;^UTILITY(U,$J,358.3,22084,2)
 ;;=^303419
 ;;^UTILITY(U,$J,358.3,22085,0)
 ;;=427.31^^125^1387^13
 ;;^UTILITY(U,$J,358.3,22085,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22085,1,4,0)
 ;;=4^427.31
 ;;^UTILITY(U,$J,358.3,22085,1,5,0)
 ;;=5^Atrial Fibrillation
 ;;^UTILITY(U,$J,358.3,22085,2)
 ;;=^11378
 ;;^UTILITY(U,$J,358.3,22086,0)
 ;;=427.89^^125^1387^15
 ;;^UTILITY(U,$J,358.3,22086,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22086,1,4,0)
 ;;=4^427.89
 ;;^UTILITY(U,$J,358.3,22086,1,5,0)
 ;;=5^Bradycardia
 ;;^UTILITY(U,$J,358.3,22086,2)
 ;;=Bradycardia^87896
 ;;^UTILITY(U,$J,358.3,22087,0)
 ;;=427.9^^125^1387^21
 ;;^UTILITY(U,$J,358.3,22087,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22087,1,4,0)
 ;;=4^427.9
 ;;^UTILITY(U,$J,358.3,22087,1,5,0)
 ;;=5^Cardiac Dysrythmia
 ;;^UTILITY(U,$J,358.3,22087,2)
 ;;=^10166
 ;;^UTILITY(U,$J,358.3,22088,0)
 ;;=427.0^^125^1387^70
 ;;^UTILITY(U,$J,358.3,22088,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22088,1,4,0)
 ;;=4^427.0
 ;;^UTILITY(U,$J,358.3,22088,1,5,0)
 ;;=5^Paroxysmal Supravent Tachycardia
 ;;^UTILITY(U,$J,358.3,22088,2)
 ;;=^90479
 ;;^UTILITY(U,$J,358.3,22089,0)
 ;;=427.81^^125^1387^79
 ;;^UTILITY(U,$J,358.3,22089,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22089,1,4,0)
 ;;=4^427.81
 ;;^UTILITY(U,$J,358.3,22089,1,5,0)
 ;;=5^Sick Sinus Syndrome
 ;;^UTILITY(U,$J,358.3,22089,2)
 ;;=^110852
 ;;^UTILITY(U,$J,358.3,22090,0)
 ;;=785.0^^125^1387^81
 ;;^UTILITY(U,$J,358.3,22090,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22090,1,4,0)
 ;;=4^785.0
 ;;^UTILITY(U,$J,358.3,22090,1,5,0)
 ;;=5^Tachycardia
 ;;^UTILITY(U,$J,358.3,22090,2)
 ;;=Tachycardia^117041
 ;;^UTILITY(U,$J,358.3,22091,0)
 ;;=785.1^^125^1387^69
 ;;^UTILITY(U,$J,358.3,22091,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22091,1,4,0)
 ;;=4^785.1
 ;;^UTILITY(U,$J,358.3,22091,1,5,0)
 ;;=5^Palpitations
 ;;^UTILITY(U,$J,358.3,22091,2)
 ;;=Palpitations^89281
 ;;^UTILITY(U,$J,358.3,22092,0)
 ;;=424.1^^125^1387^9
 ;;^UTILITY(U,$J,358.3,22092,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22092,1,4,0)
 ;;=4^424.1
 ;;^UTILITY(U,$J,358.3,22092,1,5,0)
 ;;=5^Aortic Stenosis
 ;;^UTILITY(U,$J,358.3,22092,2)
 ;;=Aortic Stenosis^9330
 ;;^UTILITY(U,$J,358.3,22093,0)
 ;;=424.0^^125^1387^62
 ;;^UTILITY(U,$J,358.3,22093,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22093,1,4,0)
 ;;=4^424.0
 ;;^UTILITY(U,$J,358.3,22093,1,5,0)
 ;;=5^Mitral Valve Prolapse
 ;;^UTILITY(U,$J,358.3,22093,2)
 ;;=^78367
 ;;^UTILITY(U,$J,358.3,22094,0)
 ;;=394.0^^125^1387^61
 ;;^UTILITY(U,$J,358.3,22094,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22094,1,4,0)
 ;;=4^394.0
 ;;^UTILITY(U,$J,358.3,22094,1,5,0)
 ;;=5^Mitral Stenosis
 ;;^UTILITY(U,$J,358.3,22094,2)
 ;;=Mitral Stenosis^78404
 ;;^UTILITY(U,$J,358.3,22095,0)
 ;;=394.9^^125^1387^38
 ;;^UTILITY(U,$J,358.3,22095,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,22095,1,4,0)
 ;;=4^394.9
 ;;^UTILITY(U,$J,358.3,22095,1,5,0)
 ;;=5^Heart Dis Mitral Valve
 ;;
 ;;$END ROU IBDEI18X
