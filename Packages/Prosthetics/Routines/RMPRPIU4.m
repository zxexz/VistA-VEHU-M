RMPRPIU4 ;HINCIO/ODJ - APIS ;3/8/01
 ;;3.0;PROSTHETICS;**61**;Feb 09, 1996
 Q
 ; Count number of issues
 ;
 ; Item level
ISNI(RMPRSTN,RMPRL,RMPRH,RMPRI,RMPRSDT,RMPREDT,RMPROUP) ;
 N RMPR6,X,X1,X2,RMPRD,RMPRS,RMPRIEN,RMPR6I
 S RMPROUP("QUANTITY")=0
 S RMPROUP("VALUE")=0
 I $G(RMPREDT)="" D NOW^%DTC S RMPREDT=X ;end date def=today
 I $G(RMPRSDT)="" D                      ;start date def=365 days ago
 . S X1=RMPREDT,X2=-365 D C^%DTC
 . S RMPRSDT=X
 . Q
 S RMPRD=RMPRSDT
 F  S RMPRD=$O(^RMPR(661.6,"ASTHIDS",RMPRSTN,3,RMPRH,RMPRI,RMPRD)) Q:RMPRD=""!($P(RMPRD,".",1)>RMPREDT)  D
 . S RMPRS=""
 . F  S RMPRS=$O(^RMPR(661.6,"ASTHIDS",RMPRSTN,3,RMPRH,RMPRI,RMPRD,RMPRS)) Q:RMPRS=""  D
 .. S RMPRIEN=""
 .. F  S RMPRIEN=$O(^RMPR(661.6,"ASTHIDS",RMPRSTN,3,RMPRH,RMPRI,RMPRD,RMPRS,RMPRIEN)) Q:RMPRIEN=""  D
 ... K RMPR6
 ... S RMPR6("IEN")=RMPRIEN
 ... S RMPRERR=$$GET^RMPRPIX6(.RMPR6)
 ... S RMPRERR=$$ETOI^RMPRPIX6(.RMPR6,.RMPR6I)
 ... I RMPRL'=RMPR6I("LOCATION") Q
 ... S RMPROUP("QUANTITY")=RMPR6("QUANTITY")+RMPROUP("QUANTITY")
 ... S RMPROUP("VALUE")=RMPR6("VALUE")+RMPROUP("VALUE")
 ... Q
 .. Q
 . Q
 Q
