IBDEI0CG ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,5555,1,2,0)
 ;;=2^67810
 ;;^UTILITY(U,$J,358.3,5555,1,3,0)
 ;;=3^Biopsy of Eyelid
 ;;^UTILITY(U,$J,358.3,5556,0)
 ;;=69100^^26^362^1^^^^1
 ;;^UTILITY(U,$J,358.3,5556,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5556,1,2,0)
 ;;=2^69100
 ;;^UTILITY(U,$J,358.3,5556,1,3,0)
 ;;=3^Biopsy of External Ear
 ;;^UTILITY(U,$J,358.3,5557,0)
 ;;=40490^^26^362^3^^^^1
 ;;^UTILITY(U,$J,358.3,5557,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5557,1,2,0)
 ;;=2^40490
 ;;^UTILITY(U,$J,358.3,5557,1,3,0)
 ;;=3^Biopsy of Lip
 ;;^UTILITY(U,$J,358.3,5558,0)
 ;;=54100^^26^362^5^^^^1
 ;;^UTILITY(U,$J,358.3,5558,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5558,1,2,0)
 ;;=2^54100
 ;;^UTILITY(U,$J,358.3,5558,1,3,0)
 ;;=3^Biopsy of Penis
 ;;^UTILITY(U,$J,358.3,5559,0)
 ;;=11755^^26^362^4^^^^1
 ;;^UTILITY(U,$J,358.3,5559,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5559,1,2,0)
 ;;=2^11755
 ;;^UTILITY(U,$J,358.3,5559,1,3,0)
 ;;=3^Biopsy of Nail Unit
 ;;^UTILITY(U,$J,358.3,5560,0)
 ;;=11100^^26^362^6^^^^1
 ;;^UTILITY(U,$J,358.3,5560,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5560,1,2,0)
 ;;=2^11100
 ;;^UTILITY(U,$J,358.3,5560,1,3,0)
 ;;=3^Biopsy of Skin Lesion
 ;;^UTILITY(U,$J,358.3,5561,0)
 ;;=11101^^26^362^7^^^^1
 ;;^UTILITY(U,$J,358.3,5561,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5561,1,2,0)
 ;;=2^11101
 ;;^UTILITY(U,$J,358.3,5561,1,3,0)
 ;;=3^Biopsy of Skin Lesion,Ea Addl Lesion
 ;;^UTILITY(U,$J,358.3,5562,0)
 ;;=56605^^26^362^8^^^^1
 ;;^UTILITY(U,$J,358.3,5562,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5562,1,2,0)
 ;;=2^56605
 ;;^UTILITY(U,$J,358.3,5562,1,3,0)
 ;;=3^Biopsy of Vulva/Perineum
 ;;^UTILITY(U,$J,358.3,5563,0)
 ;;=56606^^26^362^9^^^^1
 ;;^UTILITY(U,$J,358.3,5563,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5563,1,2,0)
 ;;=2^56606
 ;;^UTILITY(U,$J,358.3,5563,1,3,0)
 ;;=3^Biopsy of Vulva/Perineum,Ea Addl Lesion
 ;;^UTILITY(U,$J,358.3,5564,0)
 ;;=14301^^26^363^1^^^^1
 ;;^UTILITY(U,$J,358.3,5564,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5564,1,2,0)
 ;;=2^14301
 ;;^UTILITY(U,$J,358.3,5564,1,3,0)
 ;;=3^Tissue Rearrangement,30.1-60.0sq cm
 ;;^UTILITY(U,$J,358.3,5565,0)
 ;;=14302^^26^363^2^^^^1
 ;;^UTILITY(U,$J,358.3,5565,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5565,1,2,0)
 ;;=2^14302
 ;;^UTILITY(U,$J,358.3,5565,1,3,0)
 ;;=3^Tissue Rearrangement,Ea Addl 30.0sq cm
 ;;^UTILITY(U,$J,358.3,5566,0)
 ;;=99201^^27^364^1
 ;;^UTILITY(U,$J,358.3,5566,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5566,1,1,0)
 ;;=1^Problem Focus
 ;;^UTILITY(U,$J,358.3,5566,1,2,0)
 ;;=2^99201
 ;;^UTILITY(U,$J,358.3,5567,0)
 ;;=99202^^27^364^2
 ;;^UTILITY(U,$J,358.3,5567,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5567,1,1,0)
 ;;=1^Expanded Problem Focus
 ;;^UTILITY(U,$J,358.3,5567,1,2,0)
 ;;=2^99202
 ;;^UTILITY(U,$J,358.3,5568,0)
 ;;=99203^^27^364^3
 ;;^UTILITY(U,$J,358.3,5568,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5568,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,5568,1,2,0)
 ;;=2^99203
 ;;^UTILITY(U,$J,358.3,5569,0)
 ;;=99204^^27^364^4
 ;;^UTILITY(U,$J,358.3,5569,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5569,1,1,0)
 ;;=1^Comprehensive, Moderate
 ;;^UTILITY(U,$J,358.3,5569,1,2,0)
 ;;=2^99204
 ;;^UTILITY(U,$J,358.3,5570,0)
 ;;=99205^^27^364^5
 ;;^UTILITY(U,$J,358.3,5570,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5570,1,1,0)
 ;;=1^Comprehensive, High
 ;;^UTILITY(U,$J,358.3,5570,1,2,0)
 ;;=2^99205
 ;;^UTILITY(U,$J,358.3,5571,0)
 ;;=99211^^27^365^1
 ;;^UTILITY(U,$J,358.3,5571,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5571,1,1,0)
 ;;=1^Brief Visit
 ;;^UTILITY(U,$J,358.3,5571,1,2,0)
 ;;=2^99211
 ;;
 ;;$END ROU IBDEI0CG
