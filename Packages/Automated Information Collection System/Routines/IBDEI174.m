IBDEI174 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,21137,0)
 ;;=33235^^117^1323^42^^^^1
 ;;^UTILITY(U,$J,358.3,21137,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21137,1,2,0)
 ;;=2^33235
 ;;^UTILITY(U,$J,358.3,21137,1,3,0)
 ;;=3^Rem Transv Elec Atria/Vent(Dual)
 ;;^UTILITY(U,$J,358.3,21138,0)
 ;;=33240^^117^1323^22^^^^1
 ;;^UTILITY(U,$J,358.3,21138,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21138,1,2,0)
 ;;=2^33240
 ;;^UTILITY(U,$J,358.3,21138,1,3,0)
 ;;=3^Insert Single/Dual Pulse Gen
 ;;^UTILITY(U,$J,358.3,21139,0)
 ;;=33241^^117^1323^60^^^^1
 ;;^UTILITY(U,$J,358.3,21139,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21139,1,2,0)
 ;;=2^33241
 ;;^UTILITY(U,$J,358.3,21139,1,3,0)
 ;;=3^Subq Remove Sgl/Dual Pulse Gen
 ;;^UTILITY(U,$J,358.3,21140,0)
 ;;=33244^^117^1323^64^^^^1
 ;;^UTILITY(U,$J,358.3,21140,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21140,1,2,0)
 ;;=2^33244
 ;;^UTILITY(U,$J,358.3,21140,1,3,0)
 ;;=3^Transv Remove Sgl/Dual Elec
 ;;^UTILITY(U,$J,358.3,21141,0)
 ;;=33249^^117^1323^16^^^^1
 ;;^UTILITY(U,$J,358.3,21141,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21141,1,2,0)
 ;;=2^33249
 ;;^UTILITY(U,$J,358.3,21141,1,3,0)
 ;;=3^Ins/Reposit Lead, Insert Pulse Gen
 ;;^UTILITY(U,$J,358.3,21142,0)
 ;;=93285^^117^1323^13^^^^1
 ;;^UTILITY(U,$J,358.3,21142,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21142,1,2,0)
 ;;=2^93285
 ;;^UTILITY(U,$J,358.3,21142,1,3,0)
 ;;=3^ILR Device Eval Progr
 ;;^UTILITY(U,$J,358.3,21143,0)
 ;;=93291^^117^1323^15^^^^1
 ;;^UTILITY(U,$J,358.3,21143,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21143,1,2,0)
 ;;=2^93291
 ;;^UTILITY(U,$J,358.3,21143,1,3,0)
 ;;=3^ILR Device Interrogate
 ;;^UTILITY(U,$J,358.3,21144,0)
 ;;=93294^^117^1323^31^^^^1
 ;;^UTILITY(U,$J,358.3,21144,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21144,1,2,0)
 ;;=2^93294
 ;;^UTILITY(U,$J,358.3,21144,1,3,0)
 ;;=3^PM Device Interrogate Remote
 ;;^UTILITY(U,$J,358.3,21145,0)
 ;;=93280^^117^1323^32^^^^1
 ;;^UTILITY(U,$J,358.3,21145,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21145,1,2,0)
 ;;=2^93280
 ;;^UTILITY(U,$J,358.3,21145,1,3,0)
 ;;=3^PM Device Progr Eval,Dual
 ;;^UTILITY(U,$J,358.3,21146,0)
 ;;=93288^^117^1323^30^^^^1
 ;;^UTILITY(U,$J,358.3,21146,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21146,1,2,0)
 ;;=2^93288
 ;;^UTILITY(U,$J,358.3,21146,1,3,0)
 ;;=3^PM Device Eval in Person
 ;;^UTILITY(U,$J,358.3,21147,0)
 ;;=93279^^117^1323^34^^^^1
 ;;^UTILITY(U,$J,358.3,21147,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21147,1,2,0)
 ;;=2^93279
 ;;^UTILITY(U,$J,358.3,21147,1,3,0)
 ;;=3^PM Device Progr Eval,Sngl
 ;;^UTILITY(U,$J,358.3,21148,0)
 ;;=93282^^117^1323^9^^^^1
 ;;^UTILITY(U,$J,358.3,21148,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21148,1,2,0)
 ;;=2^93282
 ;;^UTILITY(U,$J,358.3,21148,1,3,0)
 ;;=3^ICD Device Prog Eval,1 Sngl
 ;;^UTILITY(U,$J,358.3,21149,0)
 ;;=93289^^117^1323^7^^^^1
 ;;^UTILITY(U,$J,358.3,21149,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21149,1,2,0)
 ;;=2^93289
 ;;^UTILITY(U,$J,358.3,21149,1,3,0)
 ;;=3^ICD Device Interrogatate
 ;;^UTILITY(U,$J,358.3,21150,0)
 ;;=93292^^117^1323^66^^^^1
 ;;^UTILITY(U,$J,358.3,21150,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21150,1,2,0)
 ;;=2^93292
 ;;^UTILITY(U,$J,358.3,21150,1,3,0)
 ;;=3^WCD Device Interrogate
 ;;^UTILITY(U,$J,358.3,21151,0)
 ;;=93295^^117^1323^8^^^^1
 ;;^UTILITY(U,$J,358.3,21151,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21151,1,2,0)
 ;;=2^93295
 ;;^UTILITY(U,$J,358.3,21151,1,3,0)
 ;;=3^ICD Device Interrogate Remote
 ;;^UTILITY(U,$J,358.3,21152,0)
 ;;=93283^^117^1323^10^^^^1
 ;;^UTILITY(U,$J,358.3,21152,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,21152,1,2,0)
 ;;=2^93283
 ;;
 ;;$END ROU IBDEI174
