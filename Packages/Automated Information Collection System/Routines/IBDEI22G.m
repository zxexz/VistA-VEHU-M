IBDEI22G ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.4)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.4,1646,0)
 ;;=OTHER DISORDERS^14^150
 ;;^UTILITY(U,$J,358.4,1647,0)
 ;;=SUBSTANCE RELATED DISORDERS^22^150
 ;;^UTILITY(U,$J,358.4,1648,0)
 ;;=V CODES^23^150
 ;;^UTILITY(U,$J,358.4,1649,0)
 ;;=PREVENTION/COUNSELING/SCREEN^16^150
 ;;^UTILITY(U,$J,358.4,1650,0)
 ;;=DEPRESSION^9^150
 ;;^UTILITY(U,$J,358.4,1651,0)
 ;;=MOOD DISORDERS (OTHER)^11^150
 ;;^UTILITY(U,$J,358.4,1652,0)
 ;;=SCHIZOPHRENIA^18^150
 ;;^UTILITY(U,$J,358.4,1653,0)
 ;;=SOMATIFORM DISORDERS^21^150
 ;;^UTILITY(U,$J,358.4,1654,0)
 ;;=EATING DISORDERS^10^150
 ;;^UTILITY(U,$J,358.4,1655,0)
 ;;=NEUROLEPTIC-INDUCED MOVEMENT DISORD^12^150
 ;;^UTILITY(U,$J,358.4,1656,0)
 ;;=CONTACT W/ HAZARDOUS SUBSTANCES^1^150
 ;;^UTILITY(U,$J,358.4,1657,0)
 ;;=BRAIN DAMAGE MENTAL DISORDERS^6^150
 ;;^UTILITY(U,$J,358.4,1658,0)
 ;;=PSYCHOTHERAPY (INPT OR OUTPT)^6^151
 ;;^UTILITY(U,$J,358.4,1659,0)
 ;;=PSYCHOTHERAPY FOR CRISIS^7^151
 ;;^UTILITY(U,$J,358.4,1660,0)
 ;;=OTHER CODES^3^151
 ;;^UTILITY(U,$J,358.4,1661,0)
 ;;=BEHAVIOR ASSESSMENT/INTERVENTION^1^151
 ;;^UTILITY(U,$J,358.4,1662,0)
 ;;=TEAM CONFERENCE^9^151
 ;;^UTILITY(U,$J,358.4,1663,0)
 ;;=INTERACTIVE COMPLEXITY ADD-ON^2^151
 ;;^UTILITY(U,$J,358.4,1664,0)
 ;;=SUBSTANCE ABUSE^8^151
 ;;^UTILITY(U,$J,358.4,1665,0)
 ;;=PSYCHIATRIC DIAGNOSTIC EVALUATION^5^151
 ;;^UTILITY(U,$J,358.4,1666,0)
 ;;=PROLONGED SERVICE^4^151
 ;;^UTILITY(U,$J,358.4,1667,0)
 ;;=TOBACCO CESSATION COUNSELING^10^151
 ;;^UTILITY(U,$J,358.4,1668,0)
 ;;=ADJUSTMENT DISORDERS^2^152
 ;;^UTILITY(U,$J,358.4,1669,0)
 ;;=ANXIETY DISORDERS^4^152
 ;;^UTILITY(U,$J,358.4,1670,0)
 ;;=AMNESTICS^3^152
 ;;^UTILITY(U,$J,358.4,1671,0)
 ;;=ORGANIC DISORDERS^13^152
 ;;^UTILITY(U,$J,358.4,1672,0)
 ;;=DEMENTIA^8^152
 ;;^UTILITY(U,$J,358.4,1673,0)
 ;;=DELIRIUM^7^152
 ;;^UTILITY(U,$J,358.4,1674,0)
 ;;=BIPOLAR DISORDERS^5^152
 ;;^UTILITY(U,$J,358.4,1675,0)
 ;;=PSYCHOSIS/OTHER^17^152
 ;;^UTILITY(U,$J,358.4,1676,0)
 ;;=PERSONALITY DISORDERS^15^152
 ;;^UTILITY(U,$J,358.4,1677,0)
 ;;=SEXUAL DISORDERS^19^152
 ;;^UTILITY(U,$J,358.4,1678,0)
 ;;=SLEEP DISORDERS^20^152
 ;;^UTILITY(U,$J,358.4,1679,0)
 ;;=OTHER DISORDERS^14^152
 ;;^UTILITY(U,$J,358.4,1680,0)
 ;;=SUBSTANCE RELATED DISORDERS^22^152
 ;;^UTILITY(U,$J,358.4,1681,0)
 ;;=V CODES^23^152
 ;;^UTILITY(U,$J,358.4,1682,0)
 ;;=PREVENTION/COUNSELING/SCREEN^16^152
 ;;^UTILITY(U,$J,358.4,1683,0)
 ;;=DEPRESSION^9^152
 ;;^UTILITY(U,$J,358.4,1684,0)
 ;;=MOOD DISORDERS (OTHER)^11^152
 ;;^UTILITY(U,$J,358.4,1685,0)
 ;;=SCHIZOPHRENIA^18^152
 ;;^UTILITY(U,$J,358.4,1686,0)
 ;;=SOMATIFORM DISORDERS^21^152
 ;;^UTILITY(U,$J,358.4,1687,0)
 ;;=EATING DISORDERS^10^152
 ;;^UTILITY(U,$J,358.4,1688,0)
 ;;=NEUROLEPTIC-INDUCED MOVEMENT DISORD^12^152
 ;;^UTILITY(U,$J,358.4,1689,0)
 ;;=CONTACT W/ HAZARDOUS SUBSTANCES^1^152
 ;;^UTILITY(U,$J,358.4,1690,0)
 ;;=BRAIN DAMAGE MENTAL DISORDERS^6^152
 ;;^UTILITY(U,$J,358.4,1691,0)
 ;;=INPT H&P-NEW ADMISSION^4^153
 ;;^UTILITY(U,$J,358.4,1692,0)
 ;;=INITIAL OBSERVATION^1^153
 ;;^UTILITY(U,$J,358.4,1693,0)
 ;;=INPT CONSULTATIONS^5^153
 ;;^UTILITY(U,$J,358.4,1694,0)
 ;;=INPT-ESTABLISHED PATIENT CARE^6^153
 ;;^UTILITY(U,$J,358.4,1695,0)
 ;;=INPT DISCHARGES^7^153
 ;;^UTILITY(U,$J,358.4,1696,0)
 ;;=SUBSEQUENT OBSERVATION^2^153
 ;;^UTILITY(U,$J,358.4,1697,0)
 ;;=OBSERVATION DISCHARGE^3^153
 ;;^UTILITY(U,$J,358.4,1698,0)
 ;;=INJECTIONS/DRUGS^7^154
 ;;^UTILITY(U,$J,358.4,1699,0)
 ;;=WOUND CARE^14^154
 ;;^UTILITY(U,$J,358.4,1700,0)
 ;;=MD PROCEDURES^1^154
 ;;^UTILITY(U,$J,358.4,1701,0)
 ;;=MUSCLE NERVE TESTS^9^154
 ;;^UTILITY(U,$J,358.4,1702,0)
 ;;=TEAM CONFERENCE^11^154
 ;;^UTILITY(U,$J,358.4,1703,0)
 ;;=ACUPUNCTURE^2^154
 ;;
 ;;$END ROU IBDEI22G
