IBDEI1VN ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,33026,1,3,0)
 ;;=3^Osteomyelitis,Chronic,Unspec Site
 ;;^UTILITY(U,$J,358.3,33026,1,4,0)
 ;;=4^M86.60
 ;;^UTILITY(U,$J,358.3,33026,2)
 ;;=^5014630
 ;;^UTILITY(U,$J,358.3,33027,0)
 ;;=M86.40^^182^1994^51
 ;;^UTILITY(U,$J,358.3,33027,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33027,1,3,0)
 ;;=3^Osteomyelitis w/ Draining Sinus,Chronic,Unspec Site
 ;;^UTILITY(U,$J,358.3,33027,1,4,0)
 ;;=4^M86.40
 ;;^UTILITY(U,$J,358.3,33027,2)
 ;;=^5014583
 ;;^UTILITY(U,$J,358.3,33028,0)
 ;;=R50.2^^182^1994^21
 ;;^UTILITY(U,$J,358.3,33028,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33028,1,3,0)
 ;;=3^Fever,Drug-Induced
 ;;^UTILITY(U,$J,358.3,33028,1,4,0)
 ;;=4^R50.2
 ;;^UTILITY(U,$J,358.3,33028,2)
 ;;=^5019507
 ;;^UTILITY(U,$J,358.3,33029,0)
 ;;=R50.9^^182^1994^22
 ;;^UTILITY(U,$J,358.3,33029,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33029,1,3,0)
 ;;=3^Fever,Unspec
 ;;^UTILITY(U,$J,358.3,33029,1,4,0)
 ;;=4^R50.9
 ;;^UTILITY(U,$J,358.3,33029,2)
 ;;=^5019512
 ;;^UTILITY(U,$J,358.3,33030,0)
 ;;=R76.11^^182^1994^1
 ;;^UTILITY(U,$J,358.3,33030,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33030,1,3,0)
 ;;=3^Abnormal Reaction to TB Test w/o Active TB
 ;;^UTILITY(U,$J,358.3,33030,1,4,0)
 ;;=4^R76.11
 ;;^UTILITY(U,$J,358.3,33030,2)
 ;;=^5019570
 ;;^UTILITY(U,$J,358.3,33031,0)
 ;;=Z21.^^182^1994^25
 ;;^UTILITY(U,$J,358.3,33031,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33031,1,3,0)
 ;;=3^HIV Asymptomatic,Infection Status
 ;;^UTILITY(U,$J,358.3,33031,1,4,0)
 ;;=4^Z21.
 ;;^UTILITY(U,$J,358.3,33031,2)
 ;;=^5062777
 ;;^UTILITY(U,$J,358.3,33032,0)
 ;;=K70.0^^182^1995^3
 ;;^UTILITY(U,$J,358.3,33032,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33032,1,3,0)
 ;;=3^Alcoholic Fatty Liver
 ;;^UTILITY(U,$J,358.3,33032,1,4,0)
 ;;=4^K70.0
 ;;^UTILITY(U,$J,358.3,33032,2)
 ;;=^5008784
 ;;^UTILITY(U,$J,358.3,33033,0)
 ;;=K70.11^^182^1995^7
 ;;^UTILITY(U,$J,358.3,33033,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33033,1,3,0)
 ;;=3^Alcoholic Hepatitis w/ Ascites
 ;;^UTILITY(U,$J,358.3,33033,1,4,0)
 ;;=4^K70.11
 ;;^UTILITY(U,$J,358.3,33033,2)
 ;;=^5008786
 ;;^UTILITY(U,$J,358.3,33034,0)
 ;;=K70.10^^182^1995^8
 ;;^UTILITY(U,$J,358.3,33034,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33034,1,3,0)
 ;;=3^Alcoholic Hepatitis w/o Ascites
 ;;^UTILITY(U,$J,358.3,33034,1,4,0)
 ;;=4^K70.10
 ;;^UTILITY(U,$J,358.3,33034,2)
 ;;=^5008785
 ;;^UTILITY(U,$J,358.3,33035,0)
 ;;=K70.2^^182^1995^4
 ;;^UTILITY(U,$J,358.3,33035,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33035,1,3,0)
 ;;=3^Alcoholic Fibrosis & Sclerosis of Liver
 ;;^UTILITY(U,$J,358.3,33035,1,4,0)
 ;;=4^K70.2
 ;;^UTILITY(U,$J,358.3,33035,2)
 ;;=^5008787
 ;;^UTILITY(U,$J,358.3,33036,0)
 ;;=K70.30^^182^1995^2
 ;;^UTILITY(U,$J,358.3,33036,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33036,1,3,0)
 ;;=3^Alcoholic Cirrhosis of Liver w/o Ascites
 ;;^UTILITY(U,$J,358.3,33036,1,4,0)
 ;;=4^K70.30
 ;;^UTILITY(U,$J,358.3,33036,2)
 ;;=^5008788
 ;;^UTILITY(U,$J,358.3,33037,0)
 ;;=K70.31^^182^1995^1
 ;;^UTILITY(U,$J,358.3,33037,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33037,1,3,0)
 ;;=3^Alcoholic Cirrhosis of Liver w/ Ascites
 ;;^UTILITY(U,$J,358.3,33037,1,4,0)
 ;;=4^K70.31
 ;;^UTILITY(U,$J,358.3,33037,2)
 ;;=^5008789
 ;;^UTILITY(U,$J,358.3,33038,0)
 ;;=K70.9^^182^1995^9
 ;;^UTILITY(U,$J,358.3,33038,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33038,1,3,0)
 ;;=3^Alcoholic Liver Disease,Unspec
 ;;^UTILITY(U,$J,358.3,33038,1,4,0)
 ;;=4^K70.9
 ;;^UTILITY(U,$J,358.3,33038,2)
 ;;=^5008792
 ;;^UTILITY(U,$J,358.3,33039,0)
 ;;=K70.40^^182^1995^6
 ;;^UTILITY(U,$J,358.3,33039,1,0)
 ;;=^358.31IA^4^2
 ;;
 ;;$END ROU IBDEI1VN
