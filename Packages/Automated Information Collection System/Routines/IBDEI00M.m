IBDEI00M ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.2)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.2,9,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,9,2,1,0)
 ;;=1^ ^^2^^1^^1
 ;;^UTILITY(U,$J,358.2,9,2,2,0)
 ;;=2^ ^5^1^1^^1
 ;;^UTILITY(U,$J,358.2,9,2,3,0)
 ;;=3^ ^45^1^2^^1
 ;;^UTILITY(U,$J,358.2,10,0)
 ;;=TYPE OF VISIT^12^^R^^^3^0^UBSC^^8^1^^0
 ;;^UTILITY(U,$J,358.2,10,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,10,2,1,0)
 ;;=1^VISIT (mark one only)^40^1^2^^1
 ;;^UTILITY(U,$J,358.2,10,2,2,0)
 ;;=2^CODE^5^1^1^^0
 ;;^UTILITY(U,$J,358.2,10,2,3,0)
 ;;=3^x^^2^^1^^1
 ;;^UTILITY(U,$J,358.2,11,0)
 ;;=DIAGNOSIS CODES^13^^^^^1^0^UBC^^10^0^2^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,11,1,0)
 ;;=^358.21I^2^2
 ;;^UTILITY(U,$J,358.2,11,1,1,0)
 ;;=1^3^1
 ;;^UTILITY(U,$J,358.2,11,1,2,0)
 ;;=2^3^59
 ;;^UTILITY(U,$J,358.2,11,2,0)
 ;;=^358.22I^4^4
 ;;^UTILITY(U,$J,358.2,11,2,1,0)
 ;;=2^CODE^6^1^1^^0
 ;;^UTILITY(U,$J,358.2,11,2,2,0)
 ;;=5^ ^40^1^2^^1
 ;;^UTILITY(U,$J,358.2,11,2,3,0)
 ;;=4^S^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,11,2,4,0)
 ;;=3^P^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,12,0)
 ;;=ICD 9^14^^^^^1^0^BC^^10^0^2^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,12,1,0)
 ;;=^358.21I^2^2
 ;;^UTILITY(U,$J,358.2,12,1,1,0)
 ;;=1^3
 ;;^UTILITY(U,$J,358.2,12,1,2,0)
 ;;=2^3^54
 ;;^UTILITY(U,$J,358.2,12,2,0)
 ;;=^358.22I^4^4
 ;;^UTILITY(U,$J,358.2,12,2,1,0)
 ;;=1^(P)^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,12,2,2,0)
 ;;=3^ ^6^1^1^^1
 ;;^UTILITY(U,$J,358.2,12,2,3,0)
 ;;=4^ ^40^1^2^^1
 ;;^UTILITY(U,$J,358.2,12,2,4,0)
 ;;=2^(S)^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,13,0)
 ;;=CPT CODES^17^^^^^1^0^C^^3^0^2^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,13,1,0)
 ;;=^358.21I^2^2
 ;;^UTILITY(U,$J,358.2,13,1,1,0)
 ;;=2^3^56
 ;;^UTILITY(U,$J,358.2,13,1,2,0)
 ;;=1^3^1
 ;;^UTILITY(U,$J,358.2,13,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,13,2,1,0)
 ;;=1^ ^^2^^1^^1^^0
 ;;^UTILITY(U,$J,358.2,13,2,2,0)
 ;;=2^ ^5^1^1^^1
 ;;^UTILITY(U,$J,358.2,13,2,3,0)
 ;;=3^ ^45^1^2^^1
 ;;^UTILITY(U,$J,358.2,14,0)
 ;;=ICD 9^18^^^^^1^0^BC^^10^0^2^0^^0
 ;;^UTILITY(U,$J,358.2,14,1,0)
 ;;=^358.21I^3^3
 ;;^UTILITY(U,$J,358.2,14,1,1,0)
 ;;=1^2^1
 ;;^UTILITY(U,$J,358.2,14,1,2,0)
 ;;=2^3
 ;;^UTILITY(U,$J,358.2,14,1,3,0)
 ;;=3^2^54
 ;;^UTILITY(U,$J,358.2,14,2,0)
 ;;=^358.22I^4^4
 ;;^UTILITY(U,$J,358.2,14,2,1,0)
 ;;=1^P^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,14,2,2,0)
 ;;=3^ ^7^1^1^^0
 ;;^UTILITY(U,$J,358.2,14,2,3,0)
 ;;=4^ ^48^1^2^^1
 ;;^UTILITY(U,$J,358.2,14,2,4,0)
 ;;=2^S^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,15,0)
 ;;=DIAGNOSIS CODES^21^^^^^3^0^UC^^10^1^^0
 ;;^UTILITY(U,$J,358.2,15,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,15,2,1,0)
 ;;=1^CODE^7^1^1^^0
 ;;^UTILITY(U,$J,358.2,15,2,2,0)
 ;;=2^DIAGNOSIS^31^1^2^^1
 ;;^UTILITY(U,$J,358.2,15,2,3,0)
 ;;=3^x^^2^^2
 ;;^UTILITY(U,$J,358.2,16,0)
 ;;=CPT CODES^22^^^^^2^0^BC^^3^0^2^0^^0
 ;;^UTILITY(U,$J,358.2,16,1,0)
 ;;=^358.21I^2^2
 ;;^UTILITY(U,$J,358.2,16,1,1,0)
 ;;=1^2^1
 ;;^UTILITY(U,$J,358.2,16,1,2,0)
 ;;=2^2^64
 ;;^UTILITY(U,$J,358.2,16,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,16,2,1,0)
 ;;=1^ ^^2^^1^^1
 ;;^UTILITY(U,$J,358.2,16,2,2,0)
 ;;=2^ ^5^1^1^^0
 ;;^UTILITY(U,$J,358.2,16,2,3,0)
 ;;=3^ ^40^1^2^^1
 ;;^UTILITY(U,$J,358.2,17,0)
 ;;=SECONDARY DX^23^^^^^4^0^SC^^10^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,17,2,0)
 ;;=^358.22I^5^4
 ;;^UTILITY(U,$J,358.2,17,2,1,0)
 ;;=4^CODE^7^1^1^^0
 ;;^UTILITY(U,$J,358.2,17,2,2,0)
 ;;=3^DIAGNOSIS^34^1^2^^1
 ;;^UTILITY(U,$J,358.2,17,2,3,0)
 ;;=5^ADD^^2^^1^^1^7^0
 ;;^UTILITY(U,$J,358.2,17,2,5,0)
 ;;=2^S^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,18,0)
 ;;=VISIT TYPE^26^^^^^2^0^C^^8^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,18,1,0)
 ;;=^358.21I^1^1
 ;;^UTILITY(U,$J,358.2,18,1,1,0)
 ;;=1^2
 ;;^UTILITY(U,$J,358.2,18,2,0)
 ;;=^358.22I^4^3
 ;;
 ;;$END ROU IBDEI00M
