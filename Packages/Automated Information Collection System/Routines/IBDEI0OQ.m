IBDEI0OQ ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11795,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11795,1,1,0)
 ;;=1^S9454
 ;;^UTILITY(U,$J,358.3,11795,1,2,0)
 ;;=2^Stress Management Class
 ;;^UTILITY(U,$J,358.3,11796,0)
 ;;=97150^^54^679^6^^^^1
 ;;^UTILITY(U,$J,358.3,11796,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11796,1,1,0)
 ;;=1^97150
 ;;^UTILITY(U,$J,358.3,11796,1,2,0)
 ;;=2^Group Therapeutic Procedures
 ;;^UTILITY(U,$J,358.3,11797,0)
 ;;=99078^^54^679^5^^^^1
 ;;^UTILITY(U,$J,358.3,11797,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11797,1,1,0)
 ;;=1^99078
 ;;^UTILITY(U,$J,358.3,11797,1,2,0)
 ;;=2^Group Health Education
 ;;^UTILITY(U,$J,358.3,11798,0)
 ;;=97802^^54^680^2^^^^1
 ;;^UTILITY(U,$J,358.3,11798,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11798,1,1,0)
 ;;=1^97802
 ;;^UTILITY(U,$J,358.3,11798,1,2,0)
 ;;=2^Med Nutr Tx,Init,Ind,per 15min
 ;;^UTILITY(U,$J,358.3,11799,0)
 ;;=97803^^54^680^3^^^^1
 ;;^UTILITY(U,$J,358.3,11799,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11799,1,1,0)
 ;;=1^97803
 ;;^UTILITY(U,$J,358.3,11799,1,2,0)
 ;;=2^Nutr Tx,Reassess,Ind,per 15min
 ;;^UTILITY(U,$J,358.3,11800,0)
 ;;=97804^^54^680^1^^^^1
 ;;^UTILITY(U,$J,358.3,11800,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11800,1,1,0)
 ;;=1^97804
 ;;^UTILITY(U,$J,358.3,11800,1,2,0)
 ;;=2^Med Nutr Tx,Group,per 30min
 ;;^UTILITY(U,$J,358.3,11801,0)
 ;;=99366^^54^681^1^^^^1
 ;;^UTILITY(U,$J,358.3,11801,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11801,1,1,0)
 ;;=1^99366
 ;;^UTILITY(U,$J,358.3,11801,1,2,0)
 ;;=2^Team Conf w/Pt,HCP,per 30min
 ;;^UTILITY(U,$J,358.3,11802,0)
 ;;=96150^^54^682^1^^^^1
 ;;^UTILITY(U,$J,358.3,11802,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11802,1,1,0)
 ;;=1^96150
 ;;^UTILITY(U,$J,358.3,11802,1,2,0)
 ;;=2^Hlth/Behavior Assess,Initial
 ;;^UTILITY(U,$J,358.3,11803,0)
 ;;=96151^^54^682^2^^^^1
 ;;^UTILITY(U,$J,358.3,11803,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11803,1,1,0)
 ;;=1^96151
 ;;^UTILITY(U,$J,358.3,11803,1,2,0)
 ;;=2^Hlth/Behavior Assess,Re-Assess
 ;;^UTILITY(U,$J,358.3,11804,0)
 ;;=96152^^54^682^4^^^^1
 ;;^UTILITY(U,$J,358.3,11804,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11804,1,1,0)
 ;;=1^96152
 ;;^UTILITY(U,$J,358.3,11804,1,2,0)
 ;;=2^Hlth/Behvr Interv,Ind,per 15Min
 ;;^UTILITY(U,$J,358.3,11805,0)
 ;;=96153^^54^682^3^^^^1
 ;;^UTILITY(U,$J,358.3,11805,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11805,1,1,0)
 ;;=1^96153
 ;;^UTILITY(U,$J,358.3,11805,1,2,0)
 ;;=2^Hlth/Behavior Interv,Group
 ;;^UTILITY(U,$J,358.3,11806,0)
 ;;=99605^^54^683^1^^^^1
 ;;^UTILITY(U,$J,358.3,11806,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11806,1,1,0)
 ;;=1^99605
 ;;^UTILITY(U,$J,358.3,11806,1,2,0)
 ;;=2^Med Mgmt,Init,New Pt,15 min
 ;;^UTILITY(U,$J,358.3,11807,0)
 ;;=99607^^54^683^3^^^^1
 ;;^UTILITY(U,$J,358.3,11807,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11807,1,1,0)
 ;;=1^99607
 ;;^UTILITY(U,$J,358.3,11807,1,2,0)
 ;;=2^Med Mgmt,ea addl 15Min
 ;;^UTILITY(U,$J,358.3,11808,0)
 ;;=99606^^54^683^2^^^^1
 ;;^UTILITY(U,$J,358.3,11808,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11808,1,1,0)
 ;;=1^99606
 ;;^UTILITY(U,$J,358.3,11808,1,2,0)
 ;;=2^Med Mgmt,Est,15Min
 ;;^UTILITY(U,$J,358.3,11809,0)
 ;;=97001^^54^684^1^^^^1
 ;;^UTILITY(U,$J,358.3,11809,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11809,1,1,0)
 ;;=1^97001
 ;;^UTILITY(U,$J,358.3,11809,1,2,0)
 ;;=2^PT Evaluation
 ;;^UTILITY(U,$J,358.3,11810,0)
 ;;=97002^^54^684^2^^^^1
 ;;^UTILITY(U,$J,358.3,11810,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,11810,1,1,0)
 ;;=1^97002
 ;;^UTILITY(U,$J,358.3,11810,1,2,0)
 ;;=2^PT Re-Evaluation
 ;;^UTILITY(U,$J,358.3,11811,0)
 ;;=97110^^54^684^3^^^^1
 ;;
 ;;$END ROU IBDEI0OQ
