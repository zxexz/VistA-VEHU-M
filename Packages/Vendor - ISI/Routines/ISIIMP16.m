ISIIMP16 ;ISI GROUP/MLS -- MEDS Import API
 ;;1.0;;;Jun 26,2012;Build 30
 Q
MEDS(ISIRESUL,ISIMISC)       
 N ERR,VAL
 N:'$G(ISIPARAM("DEBUG")) ISIPARAM
 K ISIRESUL S (ISIRESUL(0),ISIRC)=0
 ;
 ;Validate setup & parameters
 S ISIRC=$$VALIDATE^ISIIMP17 Q:+ISIRC<0 ISIRC
 ;Create patient record
 S ISIRC=$$MAKEMEDS^ISIIMP17 Q:+ISIRC<0 ISIRC
 Q ISIRC