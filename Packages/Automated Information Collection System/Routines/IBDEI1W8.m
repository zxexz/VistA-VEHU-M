IBDEI1W8 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,33298,0)
 ;;=G89.22^^182^2000^15
 ;;^UTILITY(U,$J,358.3,33298,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33298,1,3,0)
 ;;=3^Post-Thoracotomy Pain,Chronic
 ;;^UTILITY(U,$J,358.3,33298,1,4,0)
 ;;=4^G89.22
 ;;^UTILITY(U,$J,358.3,33298,2)
 ;;=^5004156
 ;;^UTILITY(U,$J,358.3,33299,0)
 ;;=G89.28^^182^2000^17
 ;;^UTILITY(U,$J,358.3,33299,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33299,1,3,0)
 ;;=3^Postprocedural Pain,Oth Chronic
 ;;^UTILITY(U,$J,358.3,33299,1,4,0)
 ;;=4^G89.28
 ;;^UTILITY(U,$J,358.3,33299,2)
 ;;=^5004157
 ;;^UTILITY(U,$J,358.3,33300,0)
 ;;=G89.3^^182^2000^9
 ;;^UTILITY(U,$J,358.3,33300,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33300,1,3,0)
 ;;=3^Neoplasm Related Pain,Acute/Chronic
 ;;^UTILITY(U,$J,358.3,33300,1,4,0)
 ;;=4^G89.3
 ;;^UTILITY(U,$J,358.3,33300,2)
 ;;=^5004159
 ;;^UTILITY(U,$J,358.3,33301,0)
 ;;=G89.4^^182^2000^2
 ;;^UTILITY(U,$J,358.3,33301,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33301,1,3,0)
 ;;=3^Chronic Pain Syndrome
 ;;^UTILITY(U,$J,358.3,33301,1,4,0)
 ;;=4^G89.4
 ;;^UTILITY(U,$J,358.3,33301,2)
 ;;=^334079
 ;;^UTILITY(U,$J,358.3,33302,0)
 ;;=M27.0^^182^2000^3
 ;;^UTILITY(U,$J,358.3,33302,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33302,1,3,0)
 ;;=3^Developmental Disorder of Jaws
 ;;^UTILITY(U,$J,358.3,33302,1,4,0)
 ;;=4^M27.0
 ;;^UTILITY(U,$J,358.3,33302,2)
 ;;=^5011722
 ;;^UTILITY(U,$J,358.3,33303,0)
 ;;=M27.9^^182^2000^4
 ;;^UTILITY(U,$J,358.3,33303,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33303,1,3,0)
 ;;=3^Disease of Jaws,Unspec
 ;;^UTILITY(U,$J,358.3,33303,1,4,0)
 ;;=4^M27.9
 ;;^UTILITY(U,$J,358.3,33303,2)
 ;;=^5011737
 ;;^UTILITY(U,$J,358.3,33304,0)
 ;;=R68.84^^182^2000^8
 ;;^UTILITY(U,$J,358.3,33304,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33304,1,3,0)
 ;;=3^Jaw Pain
 ;;^UTILITY(U,$J,358.3,33304,1,4,0)
 ;;=4^R68.84
 ;;^UTILITY(U,$J,358.3,33304,2)
 ;;=^5019556
 ;;^UTILITY(U,$J,358.3,33305,0)
 ;;=N48.9^^182^2000^6
 ;;^UTILITY(U,$J,358.3,33305,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33305,1,3,0)
 ;;=3^Disorder of Penis,Unspec
 ;;^UTILITY(U,$J,358.3,33305,1,4,0)
 ;;=4^N48.9
 ;;^UTILITY(U,$J,358.3,33305,2)
 ;;=^5015743
 ;;^UTILITY(U,$J,358.3,33306,0)
 ;;=N50.9^^182^2000^5
 ;;^UTILITY(U,$J,358.3,33306,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33306,1,3,0)
 ;;=3^Disorder of Male Genital Organs,Unspec
 ;;^UTILITY(U,$J,358.3,33306,1,4,0)
 ;;=4^N50.9
 ;;^UTILITY(U,$J,358.3,33306,2)
 ;;=^5015751
 ;;^UTILITY(U,$J,358.3,33307,0)
 ;;=R10.2^^182^2000^13
 ;;^UTILITY(U,$J,358.3,33307,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33307,1,3,0)
 ;;=3^Pelvic/Perineal Pain
 ;;^UTILITY(U,$J,358.3,33307,1,4,0)
 ;;=4^R10.2
 ;;^UTILITY(U,$J,358.3,33307,2)
 ;;=^5019209
 ;;^UTILITY(U,$J,358.3,33308,0)
 ;;=N94.89^^182^2000^7
 ;;^UTILITY(U,$J,358.3,33308,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33308,1,3,0)
 ;;=3^Female Genital Organs/Menstrual Cycle,Oth Cond
 ;;^UTILITY(U,$J,358.3,33308,1,4,0)
 ;;=4^N94.89
 ;;^UTILITY(U,$J,358.3,33308,2)
 ;;=^5015925
 ;;^UTILITY(U,$J,358.3,33309,0)
 ;;=N23.^^182^2000^18
 ;;^UTILITY(U,$J,358.3,33309,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33309,1,3,0)
 ;;=3^Renal Colic,Unspec
 ;;^UTILITY(U,$J,358.3,33309,1,4,0)
 ;;=4^N23.
 ;;^UTILITY(U,$J,358.3,33309,2)
 ;;=^5015615
 ;;^UTILITY(U,$J,358.3,33310,0)
 ;;=Z71.89^^182^2001^1
 ;;^UTILITY(U,$J,358.3,33310,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33310,1,3,0)
 ;;=3^Activity/Exercise Counseling
 ;;^UTILITY(U,$J,358.3,33310,1,4,0)
 ;;=4^Z71.89
 ;;^UTILITY(U,$J,358.3,33310,2)
 ;;=^5063253
 ;;^UTILITY(U,$J,358.3,33311,0)
 ;;=Z13.89^^182^2001^2
 ;;^UTILITY(U,$J,358.3,33311,1,0)
 ;;=^358.31IA^4^2
 ;;
 ;;$END ROU IBDEI1W8
