IBDEI09L ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,4055,1,4,0)
 ;;=4^BE:20/70-20/160;LE:20/500-20/1000,VF<10
 ;;^UTILITY(U,$J,358.3,4055,2)
 ;;=^268878
 ;;^UTILITY(U,$J,358.3,4056,0)
 ;;=368.41^^14^185^28
 ;;^UTILITY(U,$J,358.3,4056,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4056,1,3,0)
 ;;=3^368.41
 ;;^UTILITY(U,$J,358.3,4056,1,4,0)
 ;;=4^Central Scotoma
 ;;^UTILITY(U,$J,358.3,4056,2)
 ;;=^265366
 ;;^UTILITY(U,$J,358.3,4057,0)
 ;;=368.44^^14^185^39
 ;;^UTILITY(U,$J,358.3,4057,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4057,1,3,0)
 ;;=3^368.44
 ;;^UTILITY(U,$J,358.3,4057,1,4,0)
 ;;=4^Localized Visual Field Defect
 ;;^UTILITY(U,$J,358.3,4057,2)
 ;;=^87688
 ;;^UTILITY(U,$J,358.3,4058,0)
 ;;=368.45^^14^185^34
 ;;^UTILITY(U,$J,358.3,4058,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4058,1,3,0)
 ;;=3^368.45
 ;;^UTILITY(U,$J,358.3,4058,1,4,0)
 ;;=4^Field Defect-Contract/Constrict
 ;;^UTILITY(U,$J,358.3,4058,2)
 ;;=^268846
 ;;^UTILITY(U,$J,358.3,4059,0)
 ;;=368.30^^14^185^26
 ;;^UTILITY(U,$J,358.3,4059,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4059,1,3,0)
 ;;=3^368.30
 ;;^UTILITY(U,$J,358.3,4059,1,4,0)
 ;;=4^Binocular Vision Disorder, NOS
 ;;^UTILITY(U,$J,358.3,4059,2)
 ;;=^14407
 ;;^UTILITY(U,$J,358.3,4060,0)
 ;;=368.31^^14^185^45
 ;;^UTILITY(U,$J,358.3,4060,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4060,1,3,0)
 ;;=3^368.31
 ;;^UTILITY(U,$J,358.3,4060,1,4,0)
 ;;=4^Suppression of Binocular Vision
 ;;^UTILITY(U,$J,358.3,4060,2)
 ;;=^265391
 ;;^UTILITY(U,$J,358.3,4061,0)
 ;;=368.32^^14^185^44
 ;;^UTILITY(U,$J,358.3,4061,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4061,1,3,0)
 ;;=3^368.32
 ;;^UTILITY(U,$J,358.3,4061,1,4,0)
 ;;=4^Simultaneous Vis Percept w/o Fusion
 ;;^UTILITY(U,$J,358.3,4061,2)
 ;;=^268841
 ;;^UTILITY(U,$J,358.3,4062,0)
 ;;=368.34^^14^185^2
 ;;^UTILITY(U,$J,358.3,4062,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4062,1,3,0)
 ;;=3^368.34
 ;;^UTILITY(U,$J,358.3,4062,1,4,0)
 ;;=4^Abnormal Retinal Correspondence
 ;;^UTILITY(U,$J,358.3,4062,2)
 ;;=^268844
 ;;^UTILITY(U,$J,358.3,4063,0)
 ;;=368.40^^14^185^49
 ;;^UTILITY(U,$J,358.3,4063,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4063,1,3,0)
 ;;=3^368.40
 ;;^UTILITY(U,$J,358.3,4063,1,4,0)
 ;;=4^Visual Field Defect, NOS
 ;;^UTILITY(U,$J,358.3,4063,2)
 ;;=^126859
 ;;^UTILITY(U,$J,358.3,4064,0)
 ;;=368.60^^14^185^41
 ;;^UTILITY(U,$J,358.3,4064,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4064,1,3,0)
 ;;=3^368.60
 ;;^UTILITY(U,$J,358.3,4064,1,4,0)
 ;;=4^Night Blindness, NOS
 ;;^UTILITY(U,$J,358.3,4064,2)
 ;;=^83350
 ;;^UTILITY(U,$J,358.3,4065,0)
 ;;=368.62^^14^185^42
 ;;^UTILITY(U,$J,358.3,4065,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4065,1,3,0)
 ;;=3^368.62
 ;;^UTILITY(U,$J,358.3,4065,1,4,0)
 ;;=4^Night Blindness,Acquired
 ;;^UTILITY(U,$J,358.3,4065,2)
 ;;=^265401
 ;;^UTILITY(U,$J,358.3,4066,0)
 ;;=368.63^^14^185^1
 ;;^UTILITY(U,$J,358.3,4066,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4066,1,3,0)
 ;;=3^368.63
 ;;^UTILITY(U,$J,358.3,4066,1,4,0)
 ;;=4^Abnormal Dark Adaptation Curve
 ;;^UTILITY(U,$J,358.3,4066,2)
 ;;=^268858
 ;;^UTILITY(U,$J,358.3,4067,0)
 ;;=368.69^^14^185^40
 ;;^UTILITY(U,$J,358.3,4067,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4067,1,3,0)
 ;;=3^368.69
 ;;^UTILITY(U,$J,358.3,4067,1,4,0)
 ;;=4^Night Blindness NEC
 ;;^UTILITY(U,$J,358.3,4067,2)
 ;;=^87726
 ;;^UTILITY(U,$J,358.3,4068,0)
 ;;=378.83^^14^185^30
 ;;^UTILITY(U,$J,358.3,4068,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4068,1,3,0)
 ;;=3^378.83
 ;;^UTILITY(U,$J,358.3,4068,1,4,0)
 ;;=4^Convergence Insufficiency/Palsy
 ;;^UTILITY(U,$J,358.3,4068,2)
 ;;=^269277
 ;;^UTILITY(U,$J,358.3,4069,0)
 ;;=378.84^^14^185^29
 ;;
 ;;$END ROU IBDEI09L
