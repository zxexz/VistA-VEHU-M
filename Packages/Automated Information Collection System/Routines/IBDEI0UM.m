IBDEI0UM ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,14870,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14870,1,2,0)
 ;;=2^99409
 ;;^UTILITY(U,$J,358.3,14870,1,3,0)
 ;;=3^Behav Chng Alc/Subs Abuse > 30 Min
 ;;^UTILITY(U,$J,358.3,14871,0)
 ;;=99420^^80^930^1^^^^1
 ;;^UTILITY(U,$J,358.3,14871,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14871,1,2,0)
 ;;=2^99420
 ;;^UTILITY(U,$J,358.3,14871,1,3,0)
 ;;=3^Health Risk Assessment Test
 ;;^UTILITY(U,$J,358.3,14872,0)
 ;;=G0101^^80^931^10^^^^1
 ;;^UTILITY(U,$J,358.3,14872,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14872,1,2,0)
 ;;=2^G0101
 ;;^UTILITY(U,$J,358.3,14872,1,3,0)
 ;;=3^PELVIC EXAM & CLIN BREAST SCRN
 ;;^UTILITY(U,$J,358.3,14873,0)
 ;;=Q0091^^80^931^9^^^^1
 ;;^UTILITY(U,$J,358.3,14873,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14873,1,2,0)
 ;;=2^Q0091
 ;;^UTILITY(U,$J,358.3,14873,1,3,0)
 ;;=3^PAP SMEAR
 ;;^UTILITY(U,$J,358.3,14874,0)
 ;;=Q0111^^80^931^13^^^^1
 ;;^UTILITY(U,$J,358.3,14874,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14874,1,2,0)
 ;;=2^Q0111
 ;;^UTILITY(U,$J,358.3,14874,1,3,0)
 ;;=3^Wet mounts/ w preparations  
 ;;^UTILITY(U,$J,358.3,14875,0)
 ;;=83986^^80^931^6^^^^1
 ;;^UTILITY(U,$J,358.3,14875,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14875,1,2,0)
 ;;=2^83986
 ;;^UTILITY(U,$J,358.3,14875,1,3,0)
 ;;=3^FemExam pH & amines test card
 ;;^UTILITY(U,$J,358.3,14876,0)
 ;;=58100^^80^931^5^^^^1
 ;;^UTILITY(U,$J,358.3,14876,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14876,1,2,0)
 ;;=2^58100
 ;;^UTILITY(U,$J,358.3,14876,1,3,0)
 ;;=3^ENDOMETRIAL BIOPSY
 ;;^UTILITY(U,$J,358.3,14877,0)
 ;;=57500^^80^931^2^^^^1
 ;;^UTILITY(U,$J,358.3,14877,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14877,1,2,0)
 ;;=2^57500
 ;;^UTILITY(U,$J,358.3,14877,1,3,0)
 ;;=3^CERVICAL BIOPSY
 ;;^UTILITY(U,$J,358.3,14878,0)
 ;;=58300^^80^931^7^^^^1
 ;;^UTILITY(U,$J,358.3,14878,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14878,1,2,0)
 ;;=2^58300
 ;;^UTILITY(U,$J,358.3,14878,1,3,0)
 ;;=3^INSERT IUD
 ;;^UTILITY(U,$J,358.3,14879,0)
 ;;=58301^^80^931^11^^^^1
 ;;^UTILITY(U,$J,358.3,14879,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14879,1,2,0)
 ;;=2^58301
 ;;^UTILITY(U,$J,358.3,14879,1,3,0)
 ;;=3^REMOVE IUD
 ;;^UTILITY(U,$J,358.3,14880,0)
 ;;=57460^^80^931^1^^^^1
 ;;^UTILITY(U,$J,358.3,14880,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14880,1,2,0)
 ;;=2^57460
 ;;^UTILITY(U,$J,358.3,14880,1,3,0)
 ;;=3^BX OF CERVIX W/SCOPE LEEP
 ;;^UTILITY(U,$J,358.3,14881,0)
 ;;=57461^^80^931^4^^^^1
 ;;^UTILITY(U,$J,358.3,14881,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14881,1,2,0)
 ;;=2^57461
 ;;^UTILITY(U,$J,358.3,14881,1,3,0)
 ;;=3^CONZ OF CERVIX W/SCOPE LEEP
 ;;^UTILITY(U,$J,358.3,14882,0)
 ;;=76830^^80^931^12^^^^1
 ;;^UTILITY(U,$J,358.3,14882,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14882,1,2,0)
 ;;=2^76830
 ;;^UTILITY(U,$J,358.3,14882,1,3,0)
 ;;=3^Transvaginal US Non-OB
 ;;^UTILITY(U,$J,358.3,14883,0)
 ;;=57520^^80^931^3^^^^1
 ;;^UTILITY(U,$J,358.3,14883,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14883,1,2,0)
 ;;=2^57520
 ;;^UTILITY(U,$J,358.3,14883,1,3,0)
 ;;=3^CONIZATION OF CERVIX
 ;;^UTILITY(U,$J,358.3,14884,0)
 ;;=11981^^80^931^8^^^^1
 ;;^UTILITY(U,$J,358.3,14884,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14884,1,2,0)
 ;;=2^11981
 ;;^UTILITY(U,$J,358.3,14884,1,3,0)
 ;;=3^INSERT NON-BIODEGRD DRUG IMPLT SQ
 ;;^UTILITY(U,$J,358.3,14885,0)
 ;;=99395^^80^932^1^^^^1
 ;;^UTILITY(U,$J,358.3,14885,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,14885,1,2,0)
 ;;=2^99395
 ;;^UTILITY(U,$J,358.3,14885,1,3,0)
 ;;=3^Preventive Med,Est Pt 18-39
 ;;^UTILITY(U,$J,358.3,14886,0)
 ;;=99396^^80^932^2^^^^1
 ;;
 ;;$END ROU IBDEI0UM
