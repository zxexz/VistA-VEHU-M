IBDEI0UL ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,14854,1,2,0)
 ;;=2^29125
 ;;^UTILITY(U,$J,358.3,14854,1,3,0)
 ;;=3^Short Arm Splint; Static
 ;;^UTILITY(U,$J,358.3,14855,0)
 ;;=29126^^80^925^3^^^^1
 ;;^UTILITY(U,$J,358.3,14855,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14855,1,2,0)
 ;;=2^29126
 ;;^UTILITY(U,$J,358.3,14855,1,3,0)
 ;;=3^Short Arm Splint; Dynamic
 ;;^UTILITY(U,$J,358.3,14856,0)
 ;;=29130^^80^925^1^^^^1
 ;;^UTILITY(U,$J,358.3,14856,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14856,1,2,0)
 ;;=2^29130
 ;;^UTILITY(U,$J,358.3,14856,1,3,0)
 ;;=3^Finger Splint
 ;;^UTILITY(U,$J,358.3,14857,0)
 ;;=99078^^80^926^3^^^^1
 ;;^UTILITY(U,$J,358.3,14857,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14857,1,2,0)
 ;;=2^99078
 ;;^UTILITY(U,$J,358.3,14857,1,3,0)
 ;;=3^Group Health Education
 ;;^UTILITY(U,$J,358.3,14858,0)
 ;;=G0109^^80^926^1^^^^1
 ;;^UTILITY(U,$J,358.3,14858,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14858,1,2,0)
 ;;=2^G0109
 ;;^UTILITY(U,$J,358.3,14858,1,3,0)
 ;;=3^Diab Mgmt Trn,Grp,Ea 30Min
 ;;^UTILITY(U,$J,358.3,14859,0)
 ;;=98960^^80^926^4^^^^1
 ;;^UTILITY(U,$J,358.3,14859,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14859,1,2,0)
 ;;=2^98960
 ;;^UTILITY(U,$J,358.3,14859,1,3,0)
 ;;=3^Self-Mgmt Educ/Train,1 Pt,Ea 30Min
 ;;^UTILITY(U,$J,358.3,14860,0)
 ;;=98961^^80^926^5^^^^1
 ;;^UTILITY(U,$J,358.3,14860,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14860,1,2,0)
 ;;=2^98961
 ;;^UTILITY(U,$J,358.3,14860,1,3,0)
 ;;=3^Self-Mgmt Educ/Train,2-4 Pt,Ea 30Min
 ;;^UTILITY(U,$J,358.3,14861,0)
 ;;=98962^^80^926^6^^^^1
 ;;^UTILITY(U,$J,358.3,14861,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14861,1,2,0)
 ;;=2^98962
 ;;^UTILITY(U,$J,358.3,14861,1,3,0)
 ;;=3^Self-Mgmt Educ/Train,5-8 Pt,Ea 30Min
 ;;^UTILITY(U,$J,358.3,14862,0)
 ;;=G0108^^80^926^2^^^^1
 ;;^UTILITY(U,$J,358.3,14862,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14862,1,2,0)
 ;;=2^G0108
 ;;^UTILITY(U,$J,358.3,14862,1,3,0)
 ;;=3^Diab Mgmt Trn,Indiv,Ea 30Min
 ;;^UTILITY(U,$J,358.3,14863,0)
 ;;=95115^^80^927^1^^^^1
 ;;^UTILITY(U,$J,358.3,14863,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14863,1,2,0)
 ;;=2^95115
 ;;^UTILITY(U,$J,358.3,14863,1,3,0)
 ;;=3^Allergy Shot,Single
 ;;^UTILITY(U,$J,358.3,14864,0)
 ;;=95117^^80^927^2^^^^1
 ;;^UTILITY(U,$J,358.3,14864,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14864,1,2,0)
 ;;=2^95117
 ;;^UTILITY(U,$J,358.3,14864,1,3,0)
 ;;=3^Allergy Shot,2 or More
 ;;^UTILITY(U,$J,358.3,14865,0)
 ;;=93010^^80^928^1^^^^1
 ;;^UTILITY(U,$J,358.3,14865,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14865,1,2,0)
 ;;=2^93010
 ;;^UTILITY(U,$J,358.3,14865,1,3,0)
 ;;=3^EKG Interp & Rpt Only-MD
 ;;^UTILITY(U,$J,358.3,14866,0)
 ;;=93000^^80^928^2^^^^1
 ;;^UTILITY(U,$J,358.3,14866,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14866,1,2,0)
 ;;=2^93000
 ;;^UTILITY(U,$J,358.3,14866,1,3,0)
 ;;=3^EKG w/ Interp & Rpt-MD
 ;;^UTILITY(U,$J,358.3,14867,0)
 ;;=99406^^80^929^3^^^^1
 ;;^UTILITY(U,$J,358.3,14867,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14867,1,2,0)
 ;;=2^99406
 ;;^UTILITY(U,$J,358.3,14867,1,3,0)
 ;;=3^Behav Chng Tobacco Use 3-10 Min
 ;;^UTILITY(U,$J,358.3,14868,0)
 ;;=99407^^80^929^4^^^^1
 ;;^UTILITY(U,$J,358.3,14868,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14868,1,2,0)
 ;;=2^99407
 ;;^UTILITY(U,$J,358.3,14868,1,3,0)
 ;;=3^Behav Chng Tobacco Use > 10 Min
 ;;^UTILITY(U,$J,358.3,14869,0)
 ;;=99408^^80^929^1^^^^1
 ;;^UTILITY(U,$J,358.3,14869,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14869,1,2,0)
 ;;=2^99408
 ;;^UTILITY(U,$J,358.3,14869,1,3,0)
 ;;=3^Behav Chng Alc/Subs Abuse 15-30 Min
 ;;^UTILITY(U,$J,358.3,14870,0)
 ;;=99409^^80^929^2^^^^1
 ;;
 ;;$END ROU IBDEI0UL
