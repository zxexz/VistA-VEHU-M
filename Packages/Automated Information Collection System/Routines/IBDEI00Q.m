IBDEI00Q ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.2)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.2,45,1,2,0)
 ;;=2^2^54
 ;;^UTILITY(U,$J,358.2,45,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,45,2,1,0)
 ;;=1^ ^^2^^1^^1
 ;;^UTILITY(U,$J,358.2,45,2,2,0)
 ;;=2^ ^5^1^1^^1
 ;;^UTILITY(U,$J,358.2,45,2,3,0)
 ;;=3^ ^40^1^2^^1
 ;;^UTILITY(U,$J,358.2,46,0)
 ;;=TYPE OF VISIT^72^^R^^^3^0^UBSC^^8^1^^0
 ;;^UTILITY(U,$J,358.2,46,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,46,2,1,0)
 ;;=1^VISIT (mark one only)^31^1^2^^1
 ;;^UTILITY(U,$J,358.2,46,2,2,0)
 ;;=2^CODE^5^1^1^^0
 ;;^UTILITY(U,$J,358.2,46,2,3,0)
 ;;=3^x^^2^^1^^1
 ;;^UTILITY(U,$J,358.2,47,0)
 ;;=DIAGNOSIS CODES^73^^^^^1^0^UBC^^10^0^2^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,47,1,0)
 ;;=^358.21I^2^2
 ;;^UTILITY(U,$J,358.2,47,1,1,0)
 ;;=1^3^1
 ;;^UTILITY(U,$J,358.2,47,1,2,0)
 ;;=2^3^59
 ;;^UTILITY(U,$J,358.2,47,2,0)
 ;;=^358.22I^4^4
 ;;^UTILITY(U,$J,358.2,47,2,1,0)
 ;;=2^CODE^6^1^1^^0
 ;;^UTILITY(U,$J,358.2,47,2,2,0)
 ;;=5^ ^40^1^2^^1
 ;;^UTILITY(U,$J,358.2,47,2,3,0)
 ;;=4^S^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,47,2,4,0)
 ;;=3^P^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,48,0)
 ;;=CPT CODES^74^^^^^1^0^UBC^^3^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,48,1,0)
 ;;=^358.21I^3^3
 ;;^UTILITY(U,$J,358.2,48,1,1,0)
 ;;=1^2^4
 ;;^UTILITY(U,$J,358.2,48,1,2,0)
 ;;=2^2
 ;;^UTILITY(U,$J,358.2,48,1,3,0)
 ;;=3^2
 ;;^UTILITY(U,$J,358.2,48,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,48,2,1,0)
 ;;=1^ ^^2^^1^^1
 ;;^UTILITY(U,$J,358.2,48,2,2,0)
 ;;=2^ ^5^1^1^^1
 ;;^UTILITY(U,$J,358.2,48,2,3,0)
 ;;=3^ ^35^1^2^^1
 ;;^UTILITY(U,$J,358.2,49,0)
 ;;=VISIT TYPE^77^^^^^4^0^C^^8^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,49,1,0)
 ;;=^358.21I^1^1
 ;;^UTILITY(U,$J,358.2,49,1,1,0)
 ;;=1^2
 ;;^UTILITY(U,$J,358.2,49,2,0)
 ;;=^358.22I^3^2
 ;;^UTILITY(U,$J,358.2,49,2,1,0)
 ;;=1^^29^1^2^^1
 ;;^UTILITY(U,$J,358.2,49,2,3,0)
 ;;=3^^^2^^1^^1^^1
 ;;^UTILITY(U,$J,358.2,50,0)
 ;;=DIAGNOSIS CODES^78^^^^^1^0^UBC^^10^0^2^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,50,1,0)
 ;;=^358.21I^2^2
 ;;^UTILITY(U,$J,358.2,50,1,1,0)
 ;;=1^3^1
 ;;^UTILITY(U,$J,358.2,50,1,2,0)
 ;;=2^3^59
 ;;^UTILITY(U,$J,358.2,50,2,0)
 ;;=^358.22I^4^4
 ;;^UTILITY(U,$J,358.2,50,2,1,0)
 ;;=2^CODE^6^1^1^^0
 ;;^UTILITY(U,$J,358.2,50,2,2,0)
 ;;=5^ ^40^1^2^^1
 ;;^UTILITY(U,$J,358.2,50,2,3,0)
 ;;=4^S^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,50,2,4,0)
 ;;=3^P^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,51,0)
 ;;=DIAGNOSES^81^^^^^4^0^SC^^10^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,51,2,0)
 ;;=^358.22I^4^3
 ;;^UTILITY(U,$J,358.2,51,2,1,0)
 ;;=4^CODE^7^1^1^^0
 ;;^UTILITY(U,$J,358.2,51,2,2,0)
 ;;=3^DIAGNOSIS^34^1^2^^1
 ;;^UTILITY(U,$J,358.2,51,2,4,0)
 ;;=1^P^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,52,0)
 ;;=CPT CODES^82^^^^^1^0^SC^^3^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,52,1,0)
 ;;=^358.21I^1^1
 ;;^UTILITY(U,$J,358.2,52,1,1,0)
 ;;=1^2^2
 ;;^UTILITY(U,$J,358.2,52,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,52,2,1,0)
 ;;=3^ ^5^1^1^^0
 ;;^UTILITY(U,$J,358.2,52,2,2,0)
 ;;=2^ ^32^1^2^^1
 ;;^UTILITY(U,$J,358.2,52,2,3,0)
 ;;=1^ ^^2^^1^^1^^0
 ;;^UTILITY(U,$J,358.2,53,0)
 ;;=DIAGNOSIS CODES^83^^^^^1^0^UBC^^10^0^2^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,53,1,0)
 ;;=^358.21I^2^2
 ;;^UTILITY(U,$J,358.2,53,1,1,0)
 ;;=1^3^1
 ;;^UTILITY(U,$J,358.2,53,1,2,0)
 ;;=2^3^59
 ;;^UTILITY(U,$J,358.2,53,2,0)
 ;;=^358.22I^4^4
 ;;^UTILITY(U,$J,358.2,53,2,1,0)
 ;;=2^CODE^6^1^1^^0
 ;;^UTILITY(U,$J,358.2,53,2,2,0)
 ;;=5^ ^40^1^2^^1
 ;;^UTILITY(U,$J,358.2,53,2,3,0)
 ;;=4^S^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,53,2,4,0)
 ;;=3^P^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,54,0)
 ;;=CPT CODES^85^^^^^3^0^CU^^3^1^^0
 ;;^UTILITY(U,$J,358.2,54,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,54,2,1,0)
 ;;=1^CODE^5^1^1^^0
 ;;^UTILITY(U,$J,358.2,54,2,2,0)
 ;;=2^PROCEDURE^32^1^2^^1
 ;;
 ;;$END ROU IBDEI00Q
