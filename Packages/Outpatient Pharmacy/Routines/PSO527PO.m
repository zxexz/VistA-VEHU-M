PSO527PO ;ALB/BLB - eRx utilities ; 5/03/2018 11:25am
 ;;7.0;OUTPATIENT PHARMACY;**527**;DEC 1997;Build 30
 ;
 N FDA,DIK,DRU02IEN
 S DRU02IEN=$$PRESOLV^PSOERXA1("DRU02","REJ")
 I DRU02IEN D
 .S FDA(52.45,DRU02IEN_",",.02)="Non-formulary drug"
 .D FILE^DIE(,"FDA") K FDA
 S DIK="^PS(52.49,",DIK(1)=".04^EPAT" D ENALL^DIK K DIK
 S DIK="^PS(52.49,",DIK(1)="2.1^EPROV" D ENALL^DIK K DIK
 I '$D(^PS(52.45,"C","ERX","W")) D
 .S FDA(52.45,"+1,",.01)="W"
 .S FDA(52.45,"+1,",.02)="WAIT"
 .S FDA(52.45,"+1,",.03)="ERX"
 .D UPDATE^DIE(,"FDA") K FDA
UPSTATUS ;
 N BDATE,EDATE,RXDATE,RXSTAT,RXSTATE,ERXIEN,VALCNT,PSOINST
 S BDATE=$$FMADD^XLFDT(DT,-1000)
 S EDATE=DT_".9999"
 S PSOINST=0 F  S PSOINST=$O(^PS(52.49,"F",PSOINST)) Q:'PSOINST  D
 .S RXDATE=BDATE
 .F  S RXDATE=$O(^PS(52.49,"F",PSOINST,RXDATE)) Q:'RXDATE!(RXDATE>EDATE)!(RXDATE="")  D
 ..S RXSTAT=0 F  S RXSTAT=$O(^PS(52.49,"F",PSOINST,RXDATE,RXSTAT)) Q:'RXSTAT  D
 ...S RXSTATE=$$GET1^DIQ(52.45,RXSTAT,.01,"E")
 ...I ((RXSTATE="RJ")!(RXSTATE="RM")!(RXSTATE="PR")) Q
 ...S ERXIEN=0
 ...F  S ERXIEN=$O(^PS(52.49,"F",PSOINST,RXDATE,RXSTAT,ERXIEN)) Q:'ERXIEN  D
 ....I $$GET1^DIQ(52.49,ERXIEN,1.3,"I"),$$GET1^DIQ(52.49,ERXIEN,1.5,"I"),$$GET1^DIQ(52.49,ERXIEN,1.7,"I") D
 .....D UPDSTAT^PSOERXU1(ERXIEN,"W")
 Q