IBDEI0V3 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,15102,1,4,0)
 ;;=4^366.9
 ;;^UTILITY(U,$J,358.3,15102,1,5,0)
 ;;=5^Cataract NOS
 ;;^UTILITY(U,$J,358.3,15102,2)
 ;;=^20266
 ;;^UTILITY(U,$J,358.3,15103,0)
 ;;=380.4^^81^939^10
 ;;^UTILITY(U,$J,358.3,15103,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15103,1,4,0)
 ;;=4^380.4
 ;;^UTILITY(U,$J,358.3,15103,1,5,0)
 ;;=5^Cerumen Impacton
 ;;^UTILITY(U,$J,358.3,15103,2)
 ;;=^62061
 ;;^UTILITY(U,$J,358.3,15104,0)
 ;;=372.72^^81^939^12
 ;;^UTILITY(U,$J,358.3,15104,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15104,1,4,0)
 ;;=4^372.72
 ;;^UTILITY(U,$J,358.3,15104,1,5,0)
 ;;=5^Conjunctival Hemorrhage
 ;;^UTILITY(U,$J,358.3,15104,2)
 ;;=^27538
 ;;^UTILITY(U,$J,358.3,15105,0)
 ;;=372.30^^81^939^13
 ;;^UTILITY(U,$J,358.3,15105,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15105,1,4,0)
 ;;=4^372.30
 ;;^UTILITY(U,$J,358.3,15105,1,5,0)
 ;;=5^Conjunctivitis NOS
 ;;^UTILITY(U,$J,358.3,15105,2)
 ;;=^27546
 ;;^UTILITY(U,$J,358.3,15106,0)
 ;;=918.1^^81^939^14
 ;;^UTILITY(U,$J,358.3,15106,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15106,1,4,0)
 ;;=4^918.1
 ;;^UTILITY(U,$J,358.3,15106,1,5,0)
 ;;=5^Corneal Abrasion
 ;;^UTILITY(U,$J,358.3,15106,2)
 ;;=^115829
 ;;^UTILITY(U,$J,358.3,15107,0)
 ;;=784.7^^81^939^22
 ;;^UTILITY(U,$J,358.3,15107,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15107,1,4,0)
 ;;=4^784.7
 ;;^UTILITY(U,$J,358.3,15107,1,5,0)
 ;;=5^Nosebleed
 ;;^UTILITY(U,$J,358.3,15107,2)
 ;;=Nosebleed^41658
 ;;^UTILITY(U,$J,358.3,15108,0)
 ;;=365.9^^81^939^16
 ;;^UTILITY(U,$J,358.3,15108,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15108,1,4,0)
 ;;=4^365.9
 ;;^UTILITY(U,$J,358.3,15108,1,5,0)
 ;;=5^Glaucoma NOS
 ;;^UTILITY(U,$J,358.3,15108,2)
 ;;=^51160
 ;;^UTILITY(U,$J,358.3,15109,0)
 ;;=389.9^^81^939^17
 ;;^UTILITY(U,$J,358.3,15109,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15109,1,4,0)
 ;;=4^389.9
 ;;^UTILITY(U,$J,358.3,15109,1,5,0)
 ;;=5^Hearing Loss
 ;;^UTILITY(U,$J,358.3,15109,2)
 ;;=^54552
 ;;^UTILITY(U,$J,358.3,15110,0)
 ;;=465.0^^81^939^18
 ;;^UTILITY(U,$J,358.3,15110,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15110,1,4,0)
 ;;=4^465.0
 ;;^UTILITY(U,$J,358.3,15110,1,5,0)
 ;;=5^Laryngopharyngitis,Acute
 ;;^UTILITY(U,$J,358.3,15110,2)
 ;;=^269876
 ;;^UTILITY(U,$J,358.3,15111,0)
 ;;=386.00^^81^939^19
 ;;^UTILITY(U,$J,358.3,15111,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15111,1,4,0)
 ;;=4^386.00
 ;;^UTILITY(U,$J,358.3,15111,1,5,0)
 ;;=5^Meniere's Disease
 ;;^UTILITY(U,$J,358.3,15111,2)
 ;;=^75724
 ;;^UTILITY(U,$J,358.3,15112,0)
 ;;=471.9^^81^939^20
 ;;^UTILITY(U,$J,358.3,15112,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15112,1,4,0)
 ;;=4^471.9
 ;;^UTILITY(U,$J,358.3,15112,1,5,0)
 ;;=5^Nasal Polyposis
 ;;^UTILITY(U,$J,358.3,15112,2)
 ;;=^81426
 ;;^UTILITY(U,$J,358.3,15113,0)
 ;;=379.54^^81^939^23
 ;;^UTILITY(U,$J,358.3,15113,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15113,1,4,0)
 ;;=4^379.54
 ;;^UTILITY(U,$J,358.3,15113,1,5,0)
 ;;=5^Nystagmus W/ Vestibular Dis
 ;;^UTILITY(U,$J,358.3,15113,2)
 ;;=^269324
 ;;^UTILITY(U,$J,358.3,15114,0)
 ;;=525.9^^81^939^45
 ;;^UTILITY(U,$J,358.3,15114,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15114,1,4,0)
 ;;=4^525.9
 ;;^UTILITY(U,$J,358.3,15114,1,5,0)
 ;;=5^Tooth Pain
 ;;^UTILITY(U,$J,358.3,15114,2)
 ;;=Tooth Pain^123871
 ;;^UTILITY(U,$J,358.3,15115,0)
 ;;=522.5^^81^939^15
 ;;^UTILITY(U,$J,358.3,15115,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15115,1,4,0)
 ;;=4^522.5
 ;;^UTILITY(U,$J,358.3,15115,1,5,0)
 ;;=5^Dental Abscess
 ;;^UTILITY(U,$J,358.3,15115,2)
 ;;=Dental Abscess^91817
 ;;^UTILITY(U,$J,358.3,15116,0)
 ;;=464.00^^81^939^2
 ;;^UTILITY(U,$J,358.3,15116,1,0)
 ;;=^358.31IA^5^2
 ;;
 ;;$END ROU IBDEI0V3
