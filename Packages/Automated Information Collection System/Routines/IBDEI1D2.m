IBDEI1D2 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24111,1,2,0)
 ;;=2^SKIN,MALIGNANT,UNSPEC,SITE UNSPEC
 ;;^UTILITY(U,$J,358.3,24111,2)
 ;;=^340605
 ;;^UTILITY(U,$J,358.3,24112,0)
 ;;=173.91^^133^1468^5
 ;;^UTILITY(U,$J,358.3,24112,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24112,1,1,0)
 ;;=1^173.91
 ;;^UTILITY(U,$J,358.3,24112,1,2,0)
 ;;=2^BCC SKIN, SITE UNSP
 ;;^UTILITY(U,$J,358.3,24112,2)
 ;;=^340491
 ;;^UTILITY(U,$J,358.3,24113,0)
 ;;=173.92^^133^1468^56
 ;;^UTILITY(U,$J,358.3,24113,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24113,1,1,0)
 ;;=1^173.92
 ;;^UTILITY(U,$J,358.3,24113,1,2,0)
 ;;=2^SCC SKIN, SITE UNSP
 ;;^UTILITY(U,$J,358.3,24113,2)
 ;;=^340492
 ;;^UTILITY(U,$J,358.3,24114,0)
 ;;=173.99^^133^1468^57
 ;;^UTILITY(U,$J,358.3,24114,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24114,1,1,0)
 ;;=1^173.99
 ;;^UTILITY(U,$J,358.3,24114,1,2,0)
 ;;=2^SKIN, MALIGNANT SITE UNSP
 ;;^UTILITY(U,$J,358.3,24114,2)
 ;;=^340493
 ;;^UTILITY(U,$J,358.3,24115,0)
 ;;=174.9^^133^1468^9
 ;;^UTILITY(U,$J,358.3,24115,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24115,1,1,0)
 ;;=1^174.9
 ;;^UTILITY(U,$J,358.3,24115,1,2,0)
 ;;=2^BREAST CANCER-FEMALE,UNSPEC
 ;;^UTILITY(U,$J,358.3,24115,2)
 ;;=^267202
 ;;^UTILITY(U,$J,358.3,24116,0)
 ;;=189.0^^133^1468^54
 ;;^UTILITY(U,$J,358.3,24116,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24116,1,1,0)
 ;;=1^189.0
 ;;^UTILITY(U,$J,358.3,24116,1,2,0)
 ;;=2^RENAL CELL CANCER
 ;;^UTILITY(U,$J,358.3,24116,2)
 ;;=^73523
 ;;^UTILITY(U,$J,358.3,24117,0)
 ;;=149.0^^133^1468^49
 ;;^UTILITY(U,$J,358.3,24117,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24117,1,1,0)
 ;;=1^149.0
 ;;^UTILITY(U,$J,358.3,24117,1,2,0)
 ;;=2^PHARYNGEAL CANCER
 ;;^UTILITY(U,$J,358.3,24117,2)
 ;;=^267051
 ;;^UTILITY(U,$J,358.3,24118,0)
 ;;=173.00^^133^1468^24
 ;;^UTILITY(U,$J,358.3,24118,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24118,1,1,0)
 ;;=1^173.00
 ;;^UTILITY(U,$J,358.3,24118,1,2,0)
 ;;=2^LIP CANCER,SKIN NOS
 ;;^UTILITY(U,$J,358.3,24118,2)
 ;;=^340596
 ;;^UTILITY(U,$J,358.3,24119,0)
 ;;=199.1^^133^1468^41
 ;;^UTILITY(U,$J,358.3,24119,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24119,1,1,0)
 ;;=1^199.1
 ;;^UTILITY(U,$J,358.3,24119,1,2,0)
 ;;=2^MALIGNANT NEOPLASM NOS
 ;;^UTILITY(U,$J,358.3,24119,2)
 ;;=^87705
 ;;^UTILITY(U,$J,358.3,24120,0)
 ;;=154.1^^133^1468^53
 ;;^UTILITY(U,$J,358.3,24120,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24120,1,1,0)
 ;;=1^154.1
 ;;^UTILITY(U,$J,358.3,24120,1,2,0)
 ;;=2^RECTAL CANCER
 ;;^UTILITY(U,$J,358.3,24120,2)
 ;;=^267090
 ;;^UTILITY(U,$J,358.3,24121,0)
 ;;=156.0^^133^1468^18
 ;;^UTILITY(U,$J,358.3,24121,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24121,1,1,0)
 ;;=1^156.0
 ;;^UTILITY(U,$J,358.3,24121,1,2,0)
 ;;=2^GALLBLADDER CANCER
 ;;^UTILITY(U,$J,358.3,24121,2)
 ;;=^267098
 ;;^UTILITY(U,$J,358.3,24122,0)
 ;;=199.1^^133^1468^11
 ;;^UTILITY(U,$J,358.3,24122,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24122,1,1,0)
 ;;=1^199.1
 ;;^UTILITY(U,$J,358.3,24122,1,2,0)
 ;;=2^CANCER,UNKNOWN SITE,UNSPEC
 ;;^UTILITY(U,$J,358.3,24122,2)
 ;;=^87705
 ;;^UTILITY(U,$J,358.3,24123,0)
 ;;=V66.7^^133^1469^1
 ;;^UTILITY(U,$J,358.3,24123,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24123,1,1,0)
 ;;=1^V66.7
 ;;^UTILITY(U,$J,358.3,24123,1,2,0)
 ;;=2^Hospice/Palliative Care-USE w/ ea encounter
 ;;^UTILITY(U,$J,358.3,24123,2)
 ;;=^89209
 ;;^UTILITY(U,$J,358.3,24124,0)
 ;;=348.1^^133^1470^2
 ;;^UTILITY(U,$J,358.3,24124,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24124,1,1,0)
 ;;=1^348.1
 ;;^UTILITY(U,$J,358.3,24124,1,2,0)
 ;;=2^ANOXIC BRAIN DAMAGE
 ;;^UTILITY(U,$J,358.3,24124,2)
 ;;=^7979
 ;;^UTILITY(U,$J,358.3,24125,0)
 ;;=348.5^^133^1470^3
 ;;
 ;;$END ROU IBDEI1D2
