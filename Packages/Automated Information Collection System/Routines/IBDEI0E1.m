IBDEI0E1 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,6382,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6382,1,4,0)
 ;;=4^070.30
 ;;^UTILITY(U,$J,358.3,6382,1,5,0)
 ;;=5^Hepatitis B, Acute
 ;;^UTILITY(U,$J,358.3,6382,2)
 ;;=^266626
 ;;^UTILITY(U,$J,358.3,6383,0)
 ;;=070.32^^31^410^51
 ;;^UTILITY(U,$J,358.3,6383,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6383,1,4,0)
 ;;=4^070.32
 ;;^UTILITY(U,$J,358.3,6383,1,5,0)
 ;;=5^Hepatitis B, Chronic
 ;;^UTILITY(U,$J,358.3,6383,2)
 ;;=^303249
 ;;^UTILITY(U,$J,358.3,6384,0)
 ;;=070.51^^31^410^52
 ;;^UTILITY(U,$J,358.3,6384,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6384,1,4,0)
 ;;=4^070.51
 ;;^UTILITY(U,$J,358.3,6384,1,5,0)
 ;;=5^Hepatitis C, Acute
 ;;^UTILITY(U,$J,358.3,6384,2)
 ;;=^266632
 ;;^UTILITY(U,$J,358.3,6385,0)
 ;;=070.54^^31^410^53
 ;;^UTILITY(U,$J,358.3,6385,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6385,1,4,0)
 ;;=4^070.54
 ;;^UTILITY(U,$J,358.3,6385,1,5,0)
 ;;=5^Hepatitis C, Chronic
 ;;^UTILITY(U,$J,358.3,6385,2)
 ;;=^303252
 ;;^UTILITY(U,$J,358.3,6386,0)
 ;;=571.41^^31^410^54
 ;;^UTILITY(U,$J,358.3,6386,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6386,1,4,0)
 ;;=4^571.41
 ;;^UTILITY(U,$J,358.3,6386,1,5,0)
 ;;=5^Hepatitis, Chronic Persist
 ;;^UTILITY(U,$J,358.3,6386,2)
 ;;=^259093
 ;;^UTILITY(U,$J,358.3,6387,0)
 ;;=571.1^^31^410^55
 ;;^UTILITY(U,$J,358.3,6387,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6387,1,4,0)
 ;;=4^571.1
 ;;^UTILITY(U,$J,358.3,6387,1,5,0)
 ;;=5^Hepatitis, ETOH Acute
 ;;^UTILITY(U,$J,358.3,6387,2)
 ;;=^2597
 ;;^UTILITY(U,$J,358.3,6388,0)
 ;;=070.59^^31^410^57
 ;;^UTILITY(U,$J,358.3,6388,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6388,1,4,0)
 ;;=4^070.59
 ;;^UTILITY(U,$J,358.3,6388,1,5,0)
 ;;=5^Hepatitis, Other Viral
 ;;^UTILITY(U,$J,358.3,6388,2)
 ;;=^266631
 ;;^UTILITY(U,$J,358.3,6389,0)
 ;;=573.3^^31^410^56
 ;;^UTILITY(U,$J,358.3,6389,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6389,1,4,0)
 ;;=4^573.3
 ;;^UTILITY(U,$J,358.3,6389,1,5,0)
 ;;=5^Hepatitis, Other
 ;;^UTILITY(U,$J,358.3,6389,2)
 ;;=^56268
 ;;^UTILITY(U,$J,358.3,6390,0)
 ;;=555.9^^31^410^15
 ;;^UTILITY(U,$J,358.3,6390,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6390,1,4,0)
 ;;=4^555.9
 ;;^UTILITY(U,$J,358.3,6390,1,5,0)
 ;;=5^Crohn's Disease
 ;;^UTILITY(U,$J,358.3,6390,2)
 ;;=Crohn's Disease^29356
 ;;^UTILITY(U,$J,358.3,6391,0)
 ;;=787.91^^31^410^17
 ;;^UTILITY(U,$J,358.3,6391,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6391,1,4,0)
 ;;=4^787.91
 ;;^UTILITY(U,$J,358.3,6391,1,5,0)
 ;;=5^Diarrhea
 ;;^UTILITY(U,$J,358.3,6391,2)
 ;;=^33921
 ;;^UTILITY(U,$J,358.3,6392,0)
 ;;=562.11^^31^410^19
 ;;^UTILITY(U,$J,358.3,6392,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6392,1,4,0)
 ;;=4^562.11
 ;;^UTILITY(U,$J,358.3,6392,1,5,0)
 ;;=5^Diverticulitis, Colon
 ;;^UTILITY(U,$J,358.3,6392,2)
 ;;=^270274
 ;;^UTILITY(U,$J,358.3,6393,0)
 ;;=562.10^^31^410^20
 ;;^UTILITY(U,$J,358.3,6393,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6393,1,4,0)
 ;;=4^562.10
 ;;^UTILITY(U,$J,358.3,6393,1,5,0)
 ;;=5^Diverticulosis, Colon
 ;;^UTILITY(U,$J,358.3,6393,2)
 ;;=^35917
 ;;^UTILITY(U,$J,358.3,6394,0)
 ;;=532.90^^31^410^21
 ;;^UTILITY(U,$J,358.3,6394,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6394,1,4,0)
 ;;=4^532.90
 ;;^UTILITY(U,$J,358.3,6394,1,5,0)
 ;;=5^Duodenal Ulcer Nos
 ;;^UTILITY(U,$J,358.3,6394,2)
 ;;=^37311
 ;;^UTILITY(U,$J,358.3,6395,0)
 ;;=536.8^^31^410^23
 ;;^UTILITY(U,$J,358.3,6395,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6395,1,4,0)
 ;;=4^536.8
 ;;^UTILITY(U,$J,358.3,6395,1,5,0)
 ;;=5^Dyspepsia
 ;;^UTILITY(U,$J,358.3,6395,2)
 ;;=^37612
 ;;^UTILITY(U,$J,358.3,6396,0)
 ;;=571.0^^31^410^37
 ;;^UTILITY(U,$J,358.3,6396,1,0)
 ;;=^358.31IA^5^2
 ;;
 ;;$END ROU IBDEI0E1
