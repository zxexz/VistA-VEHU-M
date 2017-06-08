IBDEI00C ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.1)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.1,65,0)
 ;;=PROCEDURES (V2.1)^20^^16^0^133^84^^^1^PROCEDURES^CR^Common CPT-4 procedures^0
 ;;^UTILITY(U,$J,358.1,66,0)
 ;;=HEADER^20^^1^60^12^1^^^2
 ;;^UTILITY(U,$J,358.1,67,0)
 ;;=PATIENT INFORMATION^20^^3^0^132^3^^^2^^^Patient information-name/ssn/age
 ;;^UTILITY(U,$J,358.1,68,0)
 ;;=ICD-9 DIAGNOSES (V2.1)^20^^101^0^133^434^^^1^DIAGNOSIS^CR^Common ICD-9 diagnoses^0
 ;;^UTILITY(U,$J,358.1,69,0)
 ;;=CPT CODES (3 COL)^21^^28^0^132^87^^^1^PLEASE CHECK OFF PROCEDURES PERFORMED THIS VISIT^BCU^Selection list - CPT codes^0
 ;;^UTILITY(U,$J,358.1,70,0)
 ;;=HEADER^21^^1^58^17^1^^^2
 ;;^UTILITY(U,$J,358.1,71,0)
 ;;=PATIENT INFORMATION^21^^3^0^132^3^^^2^^^Patient information-name/ssn/age
 ;;^UTILITY(U,$J,358.1,72,0)
 ;;=TYPE OF VISIT - 1994 CODES^21^^6^0^132^21^^^1^^^Selection list - visit types with their CPT codes^0
 ;;^UTILITY(U,$J,358.1,73,0)
 ;;=DIAGNOSIS CODES^21^^116^0^132^189^^^1^DIAGNOSES^RC^Selection list - ICD-9 dx codes^
 ;;^UTILITY(U,$J,358.1,74,0)
 ;;=CPT CODES (3 COL)^22^^14^0^132^33^^^1^PLEASE CHECK OFF PROCEDURES PERFORMED THIS VISIT^BCU^Selection list - CPT codes^0
 ;;^UTILITY(U,$J,358.1,75,0)
 ;;=HEADER^22^^1^49^30^1^^^2
 ;;^UTILITY(U,$J,358.1,76,0)
 ;;=PATIENT INFORMATION^22^^3^0^132^3^^^2^^^Patient information-name/ssn/age
 ;;^UTILITY(U,$J,358.1,77,0)
 ;;=1995 VISIT TYPES (V2.1)^22^^7^0^132^6^^^1^TYPE OF VISIT^CR^1995 visit types^0
 ;;^UTILITY(U,$J,358.1,78,0)
 ;;=DIAGNOSIS CODES^22^^48^0^132^189^^^1^DIAGNOSES^RC^Selection list - ICD-9 dx codes^
 ;;^UTILITY(U,$J,358.1,79,0)
 ;;=HEADER^23^^1^57^42^1^^^2
 ;;^UTILITY(U,$J,358.1,80,0)
 ;;=PATIENT INFORMATION^23^^3^0^132^3^^^2^^^Patient information-name/ssn/age
 ;;^UTILITY(U,$J,358.1,81,0)
 ;;=PRIMARY DIAGNOSIS^23^^16^0^132^8^^^1^ALWAYS USE AS PRIMARY DIAGNOSIS^CR^Common ICD-9 diagnoses^0
 ;;^UTILITY(U,$J,358.1,82,0)
 ;;=PROCEDURES (V2.1)^23^^7^0^133^8^^^1^MANAGEMENT OF MEDICATION THERAPY^CR^Common CPT-4 procedures^0
 ;;^UTILITY(U,$J,358.1,83,0)
 ;;=DIAGNOSIS CODES^23^^25^0^132^189^^^1^DIAGNOSES^RC^Selection list - ICD-9 dx codes^
 ;;^UTILITY(U,$J,358.1,84,0)
 ;;=HEADER^24^^1^59^14^1^^^2
 ;;^UTILITY(U,$J,358.1,85,0)
 ;;=CPT CODES^24^^16^0^132^18^^^1^FILL IN BUBBLE FOR PROCEDURES PERFORMED^UBRC^Selection list - CPT codes^0
 ;;^UTILITY(U,$J,358.1,86,0)
 ;;=ICD-9 DIAGNOSES (V2.1)^24^^35^0^132^30^^^1^DIAGNOSIS^CR^Common ICD-9 diagnoses^0
 ;;^UTILITY(U,$J,358.1,87,0)
 ;;=PATIENT INFORMATION^24^^3^0^132^3^^^2^^^Patient information-name/ssn/age
 ;;^UTILITY(U,$J,358.1,88,0)
 ;;=1995 VISIT TYPE CODES (V2.1)^24^^6^0^132^9^^^1^TYPE OF VISIT^CR^1995 visit types WITH CODES SHOWN^0
 ;;^UTILITY(U,$J,358.1,89,0)
 ;;=1995 VISIT TYPE CODES (V2.1)^25^^7^0^132^8^^^1^^CRU^1995 visit types WITH CODES SHOWN^0
 ;;^UTILITY(U,$J,358.1,90,0)
 ;;=ICD-9 DIAGNOSES (V2.1)^25^^81^0^132^99^^^1^PLEASE CHECK OFF DIAGNOSES FROM THIS VISIT^BC^Common ICD-9 diagnoses^0
 ;;^UTILITY(U,$J,358.1,91,0)
 ;;=HEADER^25^^2^55^18^1^^^2
 ;;^UTILITY(U,$J,358.1,92,0)
 ;;=PATIENT INFORMATION^25^^4^0^132^3^^^2^^^Patient information-name/ssn/age
 ;;^UTILITY(U,$J,358.1,93,0)
 ;;=CPT CODES^25^^16^0^132^64^^^1^PLEASE CHECK OFF PROCEDURES PERFORMED THIS VISIT^BCU^Selection list - CPT codes^0
 ;;^UTILITY(U,$J,358.1,94,0)
 ;;=WOMEN'S CLINIC PROCEDURES^26^^19^0^132^71^^^1^PROCEDURES^CR^WOMEN'S CLINIC PROCEDURES^0
 ;;^UTILITY(U,$J,358.1,95,0)
 ;;=PATIENT INFORMATION^26^^3^1^132^3^^^2^^^Patient information-name/ssn/age^0
 ;;^UTILITY(U,$J,358.1,96,0)
 ;;=HEADER^26^^1^49^30^1^^^2
 ;;^UTILITY(U,$J,358.1,97,0)
 ;;=1995 VISIT TYPE CODES (V2.1)^26^^7^0^132^11^^^1^TYPE OF VISIT^CR^1995 visit types WITH CODES SHOWN^0
 ;;
 ;;$END ROU IBDEI00C
