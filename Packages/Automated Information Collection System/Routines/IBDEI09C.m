IBDEI09C ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,3920,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3920,1,3,0)
 ;;=3^V57.3
 ;;^UTILITY(U,$J,358.3,3920,1,4,0)
 ;;=4^Speech/Language Therapy
 ;;^UTILITY(U,$J,358.3,3920,2)
 ;;=^338565
 ;;^UTILITY(U,$J,358.3,3921,0)
 ;;=V68.2^^12^173^5
 ;;^UTILITY(U,$J,358.3,3921,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3921,1,3,0)
 ;;=3^V68.2
 ;;^UTILITY(U,$J,358.3,3921,1,4,0)
 ;;=4^Expert Evidence Request
 ;;^UTILITY(U,$J,358.3,3921,2)
 ;;=^295586
 ;;^UTILITY(U,$J,358.3,3922,0)
 ;;=V65.5^^12^173^6
 ;;^UTILITY(U,$J,358.3,3922,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3922,1,3,0)
 ;;=3^V65.5
 ;;^UTILITY(U,$J,358.3,3922,1,4,0)
 ;;=4^Feared Complaint w/ No Diagnosis
 ;;^UTILITY(U,$J,358.3,3922,2)
 ;;=^295564
 ;;^UTILITY(U,$J,358.3,3923,0)
 ;;=V67.00^^12^173^15
 ;;^UTILITY(U,$J,358.3,3923,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3923,1,3,0)
 ;;=3^V67.00
 ;;^UTILITY(U,$J,358.3,3923,1,4,0)
 ;;=4^Surgical Follow-Up
 ;;^UTILITY(U,$J,358.3,3923,2)
 ;;=^322077
 ;;^UTILITY(U,$J,358.3,3924,0)
 ;;=V70.5^^12^173^9
 ;;^UTILITY(U,$J,358.3,3924,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3924,1,3,0)
 ;;=3^V70.5
 ;;^UTILITY(U,$J,358.3,3924,1,4,0)
 ;;=4^Health Exam of Defined Subpopulations
 ;;^UTILITY(U,$J,358.3,3924,2)
 ;;=^295595
 ;;^UTILITY(U,$J,358.3,3925,0)
 ;;=V72.19^^12^173^4
 ;;^UTILITY(U,$J,358.3,3925,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3925,1,3,0)
 ;;=3^V72.19
 ;;^UTILITY(U,$J,358.3,3925,1,4,0)
 ;;=4^Ear & Hearing Exam
 ;;^UTILITY(U,$J,358.3,3925,2)
 ;;=^334219
 ;;^UTILITY(U,$J,358.3,3926,0)
 ;;=V80.3^^12^173^13
 ;;^UTILITY(U,$J,358.3,3926,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3926,1,3,0)
 ;;=3^V80.3
 ;;^UTILITY(U,$J,358.3,3926,1,4,0)
 ;;=4^Screen for Ear Diseases
 ;;^UTILITY(U,$J,358.3,3926,2)
 ;;=^295686
 ;;^UTILITY(U,$J,358.3,3927,0)
 ;;=V72.12^^12^173^11
 ;;^UTILITY(U,$J,358.3,3927,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,3927,1,3,0)
 ;;=3^V72.12
 ;;^UTILITY(U,$J,358.3,3927,1,4,0)
 ;;=4^Hearing Conservation/Treatment
 ;;^UTILITY(U,$J,358.3,3927,2)
 ;;=^335322
 ;;^UTILITY(U,$J,358.3,3928,0)
 ;;=92583^^13^174^32^^^^1
 ;;^UTILITY(U,$J,358.3,3928,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,3928,1,2,0)
 ;;=2^92583
 ;;^UTILITY(U,$J,358.3,3928,1,3,0)
 ;;=3^Select Picture Audiometry
 ;;^UTILITY(U,$J,358.3,3929,0)
 ;;=92555^^13^174^33^^^^1
 ;;^UTILITY(U,$J,358.3,3929,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,3929,1,2,0)
 ;;=2^92555
 ;;^UTILITY(U,$J,358.3,3929,1,3,0)
 ;;=3^Speech Audiometry Threshold
 ;;^UTILITY(U,$J,358.3,3930,0)
 ;;=92556^^13^174^34^^^^1
 ;;^UTILITY(U,$J,358.3,3930,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,3930,1,2,0)
 ;;=2^92556
 ;;^UTILITY(U,$J,358.3,3930,1,3,0)
 ;;=3^Speech Audiometry, Complete
 ;;^UTILITY(U,$J,358.3,3931,0)
 ;;=92564^^13^174^31^^^^1
 ;;^UTILITY(U,$J,358.3,3931,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,3931,1,2,0)
 ;;=2^92564
 ;;^UTILITY(U,$J,358.3,3931,1,3,0)
 ;;=3^SISI Hearing Test
 ;;^UTILITY(U,$J,358.3,3932,0)
 ;;=92572^^13^174^35^^^^1
 ;;^UTILITY(U,$J,358.3,3932,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,3932,1,2,0)
 ;;=2^92572
 ;;^UTILITY(U,$J,358.3,3932,1,3,0)
 ;;=3^Staggered Spondaic Word Test
 ;;^UTILITY(U,$J,358.3,3933,0)
 ;;=92565^^13^174^36^^^^1
 ;;^UTILITY(U,$J,358.3,3933,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,3933,1,2,0)
 ;;=2^92565
 ;;^UTILITY(U,$J,358.3,3933,1,3,0)
 ;;=3^Stenger Test, Pure Tone
 ;;^UTILITY(U,$J,358.3,3934,0)
 ;;=92577^^13^174^37^^^^1
 ;;^UTILITY(U,$J,358.3,3934,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,3934,1,2,0)
 ;;=2^92577
 ;;^UTILITY(U,$J,358.3,3934,1,3,0)
 ;;=3^Stenger Test, Speech
 ;;
 ;;$END ROU IBDEI09C
