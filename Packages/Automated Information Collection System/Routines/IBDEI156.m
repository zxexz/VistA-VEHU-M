IBDEI156 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,20146,1,4,0)
 ;;=4^369.23
 ;;^UTILITY(U,$J,358.3,20146,1,5,0)
 ;;=5^One Eye Moderate/Oth Eye NOS
 ;;^UTILITY(U,$J,358.3,20146,2)
 ;;=^268883
 ;;^UTILITY(U,$J,358.3,20147,0)
 ;;=369.24^^105^1245^12
 ;;^UTILITY(U,$J,358.3,20147,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,20147,1,4,0)
 ;;=4^369.24
 ;;^UTILITY(U,$J,358.3,20147,1,5,0)
 ;;=5^One Eye Moderate/Oth Eye Severe
 ;;^UTILITY(U,$J,358.3,20147,2)
 ;;=^268884
 ;;^UTILITY(U,$J,358.3,20148,0)
 ;;=369.25^^105^1245^5
 ;;^UTILITY(U,$J,358.3,20148,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,20148,1,4,0)
 ;;=4^369.25
 ;;^UTILITY(U,$J,358.3,20148,1,5,0)
 ;;=5^Moderate Impairment,Both Eyes
 ;;^UTILITY(U,$J,358.3,20148,2)
 ;;=^268885
 ;;^UTILITY(U,$J,358.3,20149,0)
 ;;=369.3^^105^1245^1
 ;;^UTILITY(U,$J,358.3,20149,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,20149,1,4,0)
 ;;=4^369.3
 ;;^UTILITY(U,$J,358.3,20149,1,5,0)
 ;;=5^Blindness NOS,Both Eyes
 ;;^UTILITY(U,$J,358.3,20149,2)
 ;;=^268886
 ;;^UTILITY(U,$J,358.3,20150,0)
 ;;=369.4^^105^1245^3
 ;;^UTILITY(U,$J,358.3,20150,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,20150,1,4,0)
 ;;=4^369.4
 ;;^UTILITY(U,$J,358.3,20150,1,5,0)
 ;;=5^Legal Blindness,USA Def
 ;;^UTILITY(U,$J,358.3,20150,2)
 ;;=^268887
 ;;^UTILITY(U,$J,358.3,20151,0)
 ;;=93880^^106^1246^2^^^^1
 ;;^UTILITY(U,$J,358.3,20151,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20151,1,2,0)
 ;;=2^Duplex Scan Bil Extracranial Art,Complete
 ;;^UTILITY(U,$J,358.3,20151,1,4,0)
 ;;=4^93880
 ;;^UTILITY(U,$J,358.3,20152,0)
 ;;=93882^^106^1246^3^^^^1
 ;;^UTILITY(U,$J,358.3,20152,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20152,1,2,0)
 ;;=2^Duplex Scan Unilat Extracranial Art,Limited
 ;;^UTILITY(U,$J,358.3,20152,1,4,0)
 ;;=4^93882
 ;;^UTILITY(U,$J,358.3,20153,0)
 ;;=93886^^106^1246^6^^^^1
 ;;^UTILITY(U,$J,358.3,20153,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20153,1,2,0)
 ;;=2^Transcranial Doppler,Intracran Art,Complete
 ;;^UTILITY(U,$J,358.3,20153,1,4,0)
 ;;=4^93886
 ;;^UTILITY(U,$J,358.3,20154,0)
 ;;=93888^^106^1246^7^^^^1
 ;;^UTILITY(U,$J,358.3,20154,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20154,1,2,0)
 ;;=2^Transcranial Doppler,Intracran Art,Limited
 ;;^UTILITY(U,$J,358.3,20154,1,4,0)
 ;;=4^93888
 ;;^UTILITY(U,$J,358.3,20155,0)
 ;;=93890^^106^1246^8^^^^1
 ;;^UTILITY(U,$J,358.3,20155,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20155,1,2,0)
 ;;=2^Vasoreactivity Study
 ;;^UTILITY(U,$J,358.3,20155,1,4,0)
 ;;=4^93890
 ;;^UTILITY(U,$J,358.3,20156,0)
 ;;=93892^^106^1246^5^^^^1
 ;;^UTILITY(U,$J,358.3,20156,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20156,1,2,0)
 ;;=2^Emboli Detection w/o Inj
 ;;^UTILITY(U,$J,358.3,20156,1,4,0)
 ;;=4^93892
 ;;^UTILITY(U,$J,358.3,20157,0)
 ;;=93893^^106^1246^4^^^^1
 ;;^UTILITY(U,$J,358.3,20157,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20157,1,2,0)
 ;;=2^Emboli Detection w/ Inj
 ;;^UTILITY(U,$J,358.3,20157,1,4,0)
 ;;=4^93893
 ;;^UTILITY(U,$J,358.3,20158,0)
 ;;=93895^^106^1246^1^^^^1
 ;;^UTILITY(U,$J,358.3,20158,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20158,1,2,0)
 ;;=2^Carotid Intima Atheroma Eval,Bil
 ;;^UTILITY(U,$J,358.3,20158,1,4,0)
 ;;=4^93895
 ;;^UTILITY(U,$J,358.3,20159,0)
 ;;=93990^^106^1247^1^^^^1
 ;;^UTILITY(U,$J,358.3,20159,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20159,1,2,0)
 ;;=2^Duplex Scan of Hemodialysis Access
 ;;^UTILITY(U,$J,358.3,20159,1,4,0)
 ;;=4^93990
 ;;^UTILITY(U,$J,358.3,20160,0)
 ;;=93965^^106^1248^3^^^^1
 ;;^UTILITY(U,$J,358.3,20160,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20160,1,2,0)
 ;;=2^Noninvasive Bilateral Study,Complete
 ;;^UTILITY(U,$J,358.3,20160,1,4,0)
 ;;=4^93965
 ;;
 ;;$END ROU IBDEI156
