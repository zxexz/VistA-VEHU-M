IBDEI21V ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.4)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.4,373,0)
 ;;=DIABETES/DIABETIC RENAL DISEASE^6^28
 ;;^UTILITY(U,$J,358.4,374,0)
 ;;=FLUID/ELECTROLYTES DISORDER^7^28
 ;;^UTILITY(U,$J,358.4,375,0)
 ;;=GENERAL SYMPTOMS^8^28
 ;;^UTILITY(U,$J,358.4,376,0)
 ;;=GENITAL/URINARY^9^28
 ;;^UTILITY(U,$J,358.4,377,0)
 ;;=HEMATOLOGY^10^28
 ;;^UTILITY(U,$J,358.4,378,0)
 ;;=HYPERTENSION PRIMARY^11^28
 ;;^UTILITY(U,$J,358.4,379,0)
 ;;=HYPERTENSION SECONDAY^12^28
 ;;^UTILITY(U,$J,358.4,380,0)
 ;;=HYPERTENSIVE HEART/RENAL^13^28
 ;;^UTILITY(U,$J,358.4,381,0)
 ;;=INFECTIOUS DISEASE^14^28
 ;;^UTILITY(U,$J,358.4,382,0)
 ;;=NEPHRITIS GLOMERULONEPHRITIS^15^28
 ;;^UTILITY(U,$J,358.4,383,0)
 ;;=NEPHRITIS INTERSTITIAL^16^28
 ;;^UTILITY(U,$J,358.4,384,0)
 ;;=NEPHROTIC SYNDROME^17^28
 ;;^UTILITY(U,$J,358.4,385,0)
 ;;=OBSTRUCTIVE UROPATHY/STONES^18^28
 ;;^UTILITY(U,$J,358.4,386,0)
 ;;=ONCOLOGY^19^28
 ;;^UTILITY(U,$J,358.4,387,0)
 ;;=TRANSPLANTATION^21^28
 ;;^UTILITY(U,$J,358.4,388,0)
 ;;=ACCESS^2^29
 ;;^UTILITY(U,$J,358.4,389,0)
 ;;=DIALYSIS PROCEDURES^3^29
 ;;^UTILITY(U,$J,358.4,390,0)
 ;;=ESRD HOME SERVICES^4^29
 ;;^UTILITY(U,$J,358.4,391,0)
 ;;=HEMODIALYSIS OVERSIGHT^5^29
 ;;^UTILITY(U,$J,358.4,392,0)
 ;;=LAB^7^29
 ;;^UTILITY(U,$J,358.4,393,0)
 ;;=MEDICATIONS^8^29
 ;;^UTILITY(U,$J,358.4,394,0)
 ;;=MONITORING^9^29
 ;;^UTILITY(U,$J,358.4,395,0)
 ;;=OTHER^10^29
 ;;^UTILITY(U,$J,358.4,396,0)
 ;;=PATIENT EDUCATION/TEACHING^11^29
 ;;^UTILITY(U,$J,358.4,397,0)
 ;;=PATIENT MANAGEMENT^12^29
 ;;^UTILITY(U,$J,358.4,398,0)
 ;;=SUPPLIES^13^29
 ;;^UTILITY(U,$J,358.4,399,0)
 ;;=VACCINATIONS^14^29
 ;;^UTILITY(U,$J,358.4,400,0)
 ;;=DAILY DIALYSIS TXMT^1^29
 ;;^UTILITY(U,$J,358.4,401,0)
 ;;=INPATIENT DIALYSIS^6^29
 ;;^UTILITY(U,$J,358.4,402,0)
 ;;=CLINICIAN^1^30
 ;;^UTILITY(U,$J,358.4,403,0)
 ;;=CARDIOVASCULAR^2^31
 ;;^UTILITY(U,$J,358.4,404,0)
 ;;=ENDOCRINE/METABOLIC^10^31
 ;;^UTILITY(U,$J,358.4,405,0)
 ;;=RESPIRATORY^30^31
 ;;^UTILITY(U,$J,358.4,406,0)
 ;;=EENT^9^31
 ;;^UTILITY(U,$J,358.4,407,0)
 ;;=MUSCULOSKELETAL^19^31
 ;;^UTILITY(U,$J,358.4,408,0)
 ;;=NEUROLOGY^20^31
 ;;^UTILITY(U,$J,358.4,409,0)
 ;;=MENTAL HEALTH^18^31
 ;;^UTILITY(U,$J,358.4,410,0)
 ;;=GASTROENTEROLOGY^11^31
 ;;^UTILITY(U,$J,358.4,411,0)
 ;;=GENITOURINARY^12^31
 ;;^UTILITY(U,$J,358.4,412,0)
 ;;=HEMATOLOGY/ONCOLOGY^13^31
 ;;^UTILITY(U,$J,358.4,413,0)
 ;;=INFECTIOUS DISEASE^15^31
 ;;^UTILITY(U,$J,358.4,414,0)
 ;;=DERMATOLOGY^6^31
 ;;^UTILITY(U,$J,358.4,415,0)
 ;;=SIGNS, SYMPTOMS, CONDITIONS^32^31
 ;;^UTILITY(U,$J,358.4,416,0)
 ;;=PAIN^24^31
 ;;^UTILITY(U,$J,358.4,417,0)
 ;;=OTHER REASONS^23^31
 ;;^UTILITY(U,$J,358.4,418,0)
 ;;=HISTORY & STATUS POST^14^31
 ;;^UTILITY(U,$J,358.4,419,0)
 ;;=ACUTE RENAL FAILURE^1^31
 ;;^UTILITY(U,$J,358.4,420,0)
 ;;=CHRONIC KIDNEY DISEASE^4^31
 ;;^UTILITY(U,$J,358.4,421,0)
 ;;=CONTACT/EXPOSURE TO COM DX^5^31
 ;;^UTILITY(U,$J,358.4,422,0)
 ;;=DIABETES W/O COMPLICATIONS^8^31
 ;;^UTILITY(U,$J,358.4,423,0)
 ;;=DIABETES W/ COMPLICATIONS^7^31
 ;;^UTILITY(U,$J,358.4,424,0)
 ;;=INFLAMMATORY/INF LUNG DX^16^31
 ;;^UTILITY(U,$J,358.4,425,0)
 ;;=INTERSTITIAL DISEASE^17^31
 ;;^UTILITY(U,$J,358.4,426,0)
 ;;=OBSTRUCTIVE AIRWAY DISEASE^21^31
 ;;^UTILITY(U,$J,358.4,427,0)
 ;;=ORAL CAVITY^22^31
 ;;^UTILITY(U,$J,358.4,428,0)
 ;;=PERSONAL HX OF CANCER^25^31
 ;;^UTILITY(U,$J,358.4,429,0)
 ;;=PERSONAL HX-DISEASES & INFECTION^26^31
 ;;^UTILITY(U,$J,358.4,430,0)
 ;;=PLEURAL DISEASE^27^31
 ;;^UTILITY(U,$J,358.4,431,0)
 ;;=PNEUMONIA^28^31
 ;;^UTILITY(U,$J,358.4,432,0)
 ;;=PULMONARY VASCULAR DISEASE^29^31
 ;;^UTILITY(U,$J,358.4,433,0)
 ;;=SECONDARY DIABETES^31^31
 ;;^UTILITY(U,$J,358.4,434,0)
 ;;=SLEEP DISORDERS^33^31
 ;;
 ;;$END ROU IBDEI21V
