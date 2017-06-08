ESPUCP4 ;DALISC/CKA -PRINT UNIFORM CRIME REPORT (CONT)- 3/93
 ;;1.0;POLICE & SECURITY;**11**;Mar 31, 1994
EN Q  ;CALLED FROM ESPUCP3
PRT ;PRINT REPORT CONTINUED- PRINTS 4TH PAGE
 D HDR Q:END
 W !!?25,"VANDALISM"
 W !!,"Total #                     :  ",$G(^UTILITY("DIQ1",$J,912.41,DA,152,"E"))
 W !,"Total $                     :  ",$G(^UTILITY("DIQ1",$J,912.41,DA,158,"E"))
 W !!,?15,"Offender"
 W !!?10,"Employee: ",$G(^UTILITY("DIQ1",$J,912.41,DA,153,"E"))
 W ?30,"Outsider: ",$G(^UTILITY("DIQ1",$J,912.41,DA,154,"E"))
 W !?10,"Patient : ",$G(^UTILITY("DIQ1",$J,912.41,DA,155,"E"))
 W ?30,"Unknown : ",$G(^UTILITY("DIQ1",$J,912.41,DA,156,"E"))
 W !?10,"Visitor : ",$G(^UTILITY("DIQ1",$J,912.41,DA,157,"E"))
 W !!!?25,"VICE SOLICITING       Total # :  ",$G(^UTILITY("DIQ1",$J,912.41,DA,159,"E"))
 W !!,"Bribery                    : ",$G(^UTILITY("DIQ1",$J,912.41,DA,160,"E"))
 W ?40,"Forgery                      : ",$G(^UTILITY("DIQ1",$J,912.41,DA,161,"E"))
 W !,"Fraud                      : ",$G(^UTILITY("DIQ1",$J,912.41,DA,162,"E"))
 W ?40,"Gambling                     : ",$G(^UTILITY("DIQ1",$J,912.41,DA,163,"E"))
 W !,"Solicitation/Prostitution  : ",$G(^UTILITY("DIQ1",$J,912.41,DA,164,"E"))
 W ?40,"Sexual Misconduct            : ",$G(^UTILITY("DIQ1",$J,912.41,DA,165,"E"))
 W !!,?15,"Offender"
 W !!?10,"Employee: ",$G(^UTILITY("DIQ1",$J,912.41,DA,166,"E"))
 W ?30,"Outsider: ",$G(^UTILITY("DIQ1",$J,912.41,DA,167,"E"))
 W !?10,"Patient : ",$G(^UTILITY("DIQ1",$J,912.41,DA,168,"E"))
 W ?30,"Unknown : ",$G(^UTILITY("DIQ1",$J,912.41,DA,169,"E"))
 W !?10,"Visitor : ",$G(^UTILITY("DIQ1",$J,912.41,DA,170,"E"))
 I $Y+15>IOSL D HDR1 Q:END
 W !!!?25,"VIOLATION CHARGES     Total # : ",$G(^UTILITY("DIQ1",$J,912.41,DA,171,"E"))
 W !!,"Courtesy Warnings  Total # : ",$G(^UTILITY("DIQ1",$J,912.41,DA,172,"E"))
 W !!,"Non-Traffic               :  ",$G(^UTILITY("DIQ1",$J,912.41,DA,173,"E"))
 W !,"Moving                    :  ",$G(^UTILITY("DIQ1",$J,912.41,DA,174,"E"))
 W !,"Parking                   :  ",$G(^UTILITY("DIQ1",$J,912.41,DA,175,"E"))
 W !!,?15,"Offender"
 W !!?10,"Employee: ",$G(^UTILITY("DIQ1",$J,912.41,DA,176,"E"))
 W ?30,"Outsider: ",$G(^UTILITY("DIQ1",$J,912.41,DA,177,"E"))
 W !?10,"Patient : ",$G(^UTILITY("DIQ1",$J,912.41,DA,178,"E"))
 W ?30,"Visitor : ",$G(^UTILITY("DIQ1",$J,912.41,DA,179,"E"))
 I $Y+10>IOSL D HDR1 Q:END
 W !!,"USDC Notice        Total # : ",$G(^UTILITY("DIQ1",$J,912.41,DA,180,"E"))
 W !!,"Non-Traffic               :  ",$G(^UTILITY("DIQ1",$J,912.41,DA,181,"E"))
 W !,"Moving                    :  ",$G(^UTILITY("DIQ1",$J,912.41,DA,182,"E"))
 W !,"Parking                   :  ",$G(^UTILITY("DIQ1",$J,912.41,DA,183,"E"))
 W !!,?15,"Offender"
 W !!?10,"Employee: ",$G(^UTILITY("DIQ1",$J,912.41,DA,184,"E"))
 W ?30,"Outsider: ",$G(^UTILITY("DIQ1",$J,912.41,DA,185,"E"))
 W !?10,"Patient : ",$G(^UTILITY("DIQ1",$J,912.41,DA,186,"E"))
 W ?30,"Visitor : ",$G(^UTILITY("DIQ1",$J,912.41,DA,187,"E"))
 QUIT
EX W !!,"Done." Q
HDR ;PRINT HEADING
 I $E(IOST,1,2)="C-" W !,"Press RETURN to continue or '^' to exit: " R X:DTIME S END='$T!(X="^") Q:END
 S PAGE=PAGE+1 W @IOF,!?25,"UNIFORM CRIME REPORT",?70,"PAGE ",$J(PAGE,3)
 W !!,"VA Facility ",$P(^ESP(912.4,ESPIEN,1,1,0),U)
BDT W ?45,"BEGINNING DATE: ",$G(^UTILITY("DIQ1",$J,912.4,ESPIEN,.01,"E"))
EDT W !,"Date/Time Printed",?45,"ENDING DATE: ",$G(^UTILITY("DIQ1",$J,912.4,ESPIEN,.02,"E"))
 D NOW^%DTC S Y=% X ^DD("DD") W !,$P(Y,":",1,2)
 QUIT
HDR1 I $E(IOST,1,2)="C-" W !,"Press RETURN to continue or '^' to exit: " R X:DTIME S END='$T!(X="^") Q:END
 S PAGE=PAGE+1 W @IOF,!?70,"PAGE ",$J(PAGE,3)
 QUIT
