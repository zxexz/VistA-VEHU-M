ISIIMP04 ;ISI GROUP/MLS -- APPT API
 ;;1.0;;;Jun 26,2012;Build 30
 Q
APPOINT() ;
 N ERR,VAL,ADATE,SC,DFN
 N:'$G(ISIPARAM("DEBUG")) ISIPARAM
 K ISIRESUL S (ISIRESUL(0),ISIRC)=0
 ;
 ;Validate input array
 S ISIRC=$$VALIDATE^ISIIMP05 Q:+ISIRC<0 ISIRC
 ;Create Appointment
 S ISIRC=$$MAKEAPPT^ISIIMP05 Q:+ISIRC<0 ISIRC
 S ISIRESUL(0)=ISIRC
 ;
 Q ISIRC
 ;
