IBDEI22E ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.4)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.4,1530,0)
 ;;=PAIN^19^140
 ;;^UTILITY(U,$J,358.4,1531,0)
 ;;=PERSONALITY DISORDERS^20^140
 ;;^UTILITY(U,$J,358.4,1532,0)
 ;;=SCHIZOPHRENIC DISORDERS^23^140
 ;;^UTILITY(U,$J,358.4,1533,0)
 ;;=SUBSTANCE ABUSE^24^140
 ;;^UTILITY(U,$J,358.4,1534,0)
 ;;=SCREENING^25^140
 ;;^UTILITY(U,$J,358.4,1535,0)
 ;;=SYMPTOMS^26^140
 ;;^UTILITY(U,$J,358.4,1536,0)
 ;;=OTHER DIAGNOSES^29^140
 ;;^UTILITY(U,$J,358.4,1537,0)
 ;;=V-CODES^30^140
 ;;^UTILITY(U,$J,358.4,1538,0)
 ;;=TELEHEALTH-SECONDARY ONLY^31^140
 ;;^UTILITY(U,$J,358.4,1539,0)
 ;;=FACE-TO-FACE^1^141
 ;;^UTILITY(U,$J,358.4,1540,0)
 ;;=INTERVENTION^2^141
 ;;^UTILITY(U,$J,358.4,1541,0)
 ;;=CCHT VIDEO^4^141
 ;;^UTILITY(U,$J,358.4,1542,0)
 ;;=OTHER^5^142
 ;;^UTILITY(U,$J,358.4,1543,0)
 ;;=CARDIOLOGY/EKG^1^142
 ;;^UTILITY(U,$J,358.4,1544,0)
 ;;=HT EDUCATION^4^142
 ;;^UTILITY(U,$J,358.4,1545,0)
 ;;=CCHT MONTHLY MONITOR^3^142
 ;;^UTILITY(U,$J,358.4,1546,0)
 ;;=CCHT HOME VISIT^2^142
 ;;^UTILITY(U,$J,358.4,1547,0)
 ;;=PRIMARY DIAGNOSIS^1^143
 ;;^UTILITY(U,$J,358.4,1548,0)
 ;;="A" MISC DIAGNOSIS^1^144
 ;;^UTILITY(U,$J,358.4,1549,0)
 ;;="B" MISC DIAGNOSIS^4^144
 ;;^UTILITY(U,$J,358.4,1550,0)
 ;;="C" MISC DIAGNOSIS^7^144
 ;;^UTILITY(U,$J,358.4,1551,0)
 ;;="D" MISC DIAGNOSIS^8^144
 ;;^UTILITY(U,$J,358.4,1552,0)
 ;;="E/F" MISC DIAGNOSIS^11^144
 ;;^UTILITY(U,$J,358.4,1553,0)
 ;;="H" MISC DIAGNOSIS^13^144
 ;;^UTILITY(U,$J,358.4,1554,0)
 ;;="I" MISC DIAGNOSIS^14^144
 ;;^UTILITY(U,$J,358.4,1555,0)
 ;;="J/K/L" MISC DIAGNOSIS^15^144
 ;;^UTILITY(U,$J,358.4,1556,0)
 ;;="M" MISC DIAGNOSIS^16^144
 ;;^UTILITY(U,$J,358.4,1557,0)
 ;;="N/O" MISC DISGNOSIS^17^144
 ;;^UTILITY(U,$J,358.4,1558,0)
 ;;="P" MISC DIAGNOSIS^18^144
 ;;^UTILITY(U,$J,358.4,1559,0)
 ;;="V/W/X/Y/Z" MISC DIAGNOSIS^28^144
 ;;^UTILITY(U,$J,358.4,1560,0)
 ;;="S" MISC DIAGNOSIS^22^144
 ;;^UTILITY(U,$J,358.4,1561,0)
 ;;=CANCER (NOT MELANOMA)^6^144
 ;;^UTILITY(U,$J,358.4,1562,0)
 ;;="G" MISC DIAGNOSIS^12^144
 ;;^UTILITY(U,$J,358.4,1563,0)
 ;;="R" DIAGNOSES^21^144
 ;;^UTILITY(U,$J,358.4,1564,0)
 ;;="T/U" MISC DIAGNOSIS^27^144
 ;;^UTILITY(U,$J,358.4,1565,0)
 ;;=ADJUSTMENT REACTION^2^144
 ;;^UTILITY(U,$J,358.4,1566,0)
 ;;=ANXIETY DISORDER^3^144
 ;;^UTILITY(U,$J,358.4,1567,0)
 ;;=BIPOLAR DISORDER^5^144
 ;;^UTILITY(U,$J,358.4,1568,0)
 ;;=DEMENTIA^9^144
 ;;^UTILITY(U,$J,358.4,1569,0)
 ;;=DEPRESSION^10^144
 ;;^UTILITY(U,$J,358.4,1570,0)
 ;;=PAIN^19^144
 ;;^UTILITY(U,$J,358.4,1571,0)
 ;;=PERSONALITY DISORDERS^20^144
 ;;^UTILITY(U,$J,358.4,1572,0)
 ;;=SCHIZOPHRENIC DISORDERS^23^144
 ;;^UTILITY(U,$J,358.4,1573,0)
 ;;=SUBSTANCE ABUSE^24^144
 ;;^UTILITY(U,$J,358.4,1574,0)
 ;;=SCREENING^25^144
 ;;^UTILITY(U,$J,358.4,1575,0)
 ;;=SYMPTOMS^26^144
 ;;^UTILITY(U,$J,358.4,1576,0)
 ;;=OTHER DIAGNOSES^29^144
 ;;^UTILITY(U,$J,358.4,1577,0)
 ;;=V-CODES^30^144
 ;;^UTILITY(U,$J,358.4,1578,0)
 ;;=TELEHEALTH-SECONDARY ONLY^31^144
 ;;^UTILITY(U,$J,358.4,1579,0)
 ;;=OTHER^5^145
 ;;^UTILITY(U,$J,358.4,1580,0)
 ;;=HT EDUCATION^4^145
 ;;^UTILITY(U,$J,358.4,1581,0)
 ;;=CCHT MONTHLY MONITOR^3^145
 ;;^UTILITY(U,$J,358.4,1582,0)
 ;;=CCHT HOME VISIT^2^145
 ;;^UTILITY(U,$J,358.4,1583,0)
 ;;=TELEPSYCH^5^145
 ;;^UTILITY(U,$J,358.4,1584,0)
 ;;=CASE MANAGEMENT^1^145
 ;;^UTILITY(U,$J,358.4,1585,0)
 ;;=PRIMARY DIAGNOSIS^1^146
 ;;^UTILITY(U,$J,358.4,1586,0)
 ;;=SCREENING FOR MENTAL/DEVELOPMENT^25^147
 ;;^UTILITY(U,$J,358.4,1587,0)
 ;;=PERSONAL HX OF MALIGNANCY^22^147
 ;;^UTILITY(U,$J,358.4,1588,0)
 ;;=ACQUIRED ABSENCE OF ORGAN^2^147
 ;;^UTILITY(U,$J,358.4,1589,0)
 ;;=PERSONS SEEKING CONSULT^23^147
 ;;^UTILITY(U,$J,358.4,1590,0)
 ;;=FAMILY CIRCUMSTANCES^9^147
 ;;
 ;;$END ROU IBDEI22E
