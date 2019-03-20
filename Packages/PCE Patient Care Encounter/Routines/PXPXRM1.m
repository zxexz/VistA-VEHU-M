PXPXRM1 ;SLC/PKR - Additional APIs for Clinical Reminder indexes. ;11/26/2018
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**211**;Aug 12, 1996;Build 340
 ;
 Q
 ;
 ;====================
VIMMCR(DA,DATA) ;Return data for a specified V Immunization entry. This
 ;version does not return Visit data and external values. It is
 ;optimized for use by Clinical Reminders.
 ;
 N DU,PXCS,PXCSIEN,PXCDIEN,PXCODE,PXIEN,PXTEMP,PXVIMM,PXVISIT,PXX
 S PXTEMP=^AUPNVIMM(DA,0)
 S PXVIMM=$P(PXTEMP,U,1)
 S PXVISIT=$P(PXTEMP,U,3)
 S DATA("VISIT")=PXVISIT
 S (DATA("SERIES"),DATA("VALUE"))=$P(PXTEMP,U,4)
 S DATA("REACTION")=$P(PXTEMP,U,6)
 S DATA("CONTRAINDICATED")=$P(PXTEMP,U,7)
 S DATA("COMMENTS")=$G(^AUPNVIMM(DA,811))
 ;
 S PXTEMP=$G(^AUPNVIMM(DA,12))
 S DATA("EVENT DATE AND TIME")=$P(PXTEMP,U,1)
 S DATA("ORDERING PROVIDER")=$P(PXTEMP,U,2)
 S DATA("ENCOUNTER PROVIDER")=$P(PXTEMP,U,4)
 S DATA("DATE RECORDED")=$P(PXTEMP,U,5)
 S DATA("DOCUMENTER")=$P(PXTEMP,U,6)
 S PXX=+$P(PXTEMP,U,7)
 S DATA("LOT NUMBER")=$S(PXX>0:($P($G(^AUTTIML(PXX,0)),U,1)),1:"")
 S DATA("WARNING ACK")=$P(PXTEMP,U,20)
 ;
 S PXTEMP=$G(^AUTTIML(PXX,0))
 S PXX=+$P(PXTEMP,U,2)
 S DATA("MANUFACTURER")=$S(PXX>0:$P($G(^AUTTIMAN(PXX,0)),U,1),1:"")
 S DATA("EXPIRATION DATE")=$P(PXTEMP,U,9)
 ;
 S PXTEMP=$G(^AUPNVIMM(DA,13))
 S PXX=+$P(PXTEMP,U,1)
 S DATA("INFO SOURCE")=$S(PXX>0:$P($G(^PXV(920.1,PXX,0)),U,1),1:"")
 S PXX=+$P(PXTEMP,U,2)
 S DATA("ADMIN ROUTE")=$S(PXX>0:($P($G(^PXV(920.2,PXX,0)),U,2)_U_$P($G(^PXV(920.2,PXX,0)),U,1)),1:"")
 S PXX=+$P(PXTEMP,U,3)
 S DATA("ADMIN SITE")=$S(PXX>0:($P($G(^PXV(920.3,PXX,0)),U,2)_U_$P($G(^PXV(920.3,PXX,0)),U,1)),1:"")
 S PXX=+$P(PXTEMP,U,12)
 S DATA("DOSE")=$S(PXX>0:PXX,1:"")
 S DU=$P(PXTEMP,U,13)
 S DATA("DOSE UNITS")=$S(DU="":"",1:$$UCUMCODE^LEXMUCUM(DU))
 ;
 S DATA("OVERRIDE REASON")=$G(^AUPNVIMM(DA,16))
 ;
 S PXTEMP=$G(^AUTTIMM(+PXVIMM,0))
 S DATA("IMMUNIZATION")=$P(PXTEMP,U,1)
 S DATA("CVX")=$P(PXTEMP,U,3)
 ;
 S PXTEMP=$G(^AUPNVIMM(DA,812))
 S DATA("PACKAGE")=$P(PXTEMP,U,2)
 S DATA("DATA SOURCE")=$P(PXTEMP,U,3)
 ;
 S PXIEN=0
 F  S PXIEN=$O(^AUTTIMM(PXVIMM,7,PXIEN)) Q:'PXIEN  D
 . S PXTEMP=$P($G(^AUTTIMM(PXVIMM,7,PXIEN,0)),U,1)
 . I PXTEMP="" Q
 . S DATA("VACCINE GROUP",PXIEN,0)=PXTEMP
 ;
 ;S DATA("CODES",Coding System Name)=Code 1 ^ Code 2 ^ ... Code x
 S PXCSIEN=0
 F  S PXCSIEN=$O(^AUTTIMM(PXVIMM,3,PXCSIEN)) Q:'PXCSIEN  D
 . S PXCS=$P($G(^AUTTIMM(PXVIMM,3,PXCSIEN,0)),U,1)
 . I PXCS="" Q
 . S PXCDIEN=0
 . F  S PXCDIEN=$O(^AUTTIMM(PXVIMM,3,PXCSIEN,1,PXCDIEN)) Q:'PXCDIEN  D
 . . S PXCODE=$P($G(^AUTTIMM(PXVIMM,3,PXCSIEN,1,PXCDIEN,0)),U,1)
 . . I PXCODE="" Q
 . . I '$D(DATA("CODES",PXCS)) S DATA("CODES",PXCS)=PXCODE Q
 . . S DATA("CODES",PXCS)=DATA("CODES",PXCS)_U_PXCODE
 ;
 ;DATA("VIS OFFERED",n,0)=IEN ^ Date Offered ^ Name ^ Edition Date ^ Language
 S PXIEN=0
 F  S PXIEN=$O(^TMP("PXVIMM",$J,DA,2,PXIEN)) Q:'PXIEN  D
 . S PXTEMP=$G(^TMP("PXVIMM",$J,DA,2,PXIEN,0))
 . I 'PXTEMP Q
 . S DATA("VIS OFFERED",PXIEN,0)=$P(PXTEMP,U,1,2)
 . S PXTEMP=$G(^AUTTIVIS(+PXTEMP,0))
 . S DATA("VIS OFFERED",PXIEN,0)=DATA("VIS OFFERED",PXIEN,0)_U_$P(PXTEMP,U,1)_U_$P(PXTEMP,U,2)
 . S PXX=$P(PXTEMP,U,4)
 . I PXX S DATA("VIS OFFERED",PXIEN,0)=DATA("VIS OFFERED",PXIEN,0)_U_$$GET1^DIQ(.85,PXX_",","NAME")  ;ICR 6062
 ;
 ;DATA("REMARKS",n,0)=Free text
 M DATA("REMARKS")=^TMP("PXVIMM",$J,DA,11)
 K DATA("REMARKS",0)
 Q
 ;
