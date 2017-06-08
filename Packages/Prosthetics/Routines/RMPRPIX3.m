RMPRPIX3 ;HINCIO/ODJ - FILE 661.63 APIs ;3/8/01
 ;;3.0;PROSTHETICS;**61**;Feb 09, 1996
 Q
 ;
 ; Create patient issue transaction record (661.63)
CRE(RMPR60,RMPR6,RMPR11) ;
 N RMPRERR,RMPRFDA,RMPRFME,RMPRIEN,X,Y,DA
 S RMPRERR=0
 S RMPRFDA(661.63,"+1,",.01)=RMPR6("IEN")
 S RMPRFDA(661.63,"+1,",2)=RMPR60("IEN")
 S RMPRFDA(661.63,"+1,",3)=$G(RMPR60("661.2PTR"))
 S RMPRFDA(661.63,"+1,",4)=$G(RMPR11("HCPCS"))
 S RMPRFDA(661.63,"+1,",5)=$G(RMPR11("ITEM"))
 S RMPRFDA(661.63,"+1,",6)=$G(RMPR60("DATE&TIME"))
 S RMPRFDA(661.63,"+1,",7)=$G(RMPR11("STATION"))
 S RMPRFDA(661.63,"+1,",8)=$G(RMPR6("LOCATION"))
 S RMPRFDA(661.63,"+1,",9)=$G(RMPR6("VENDOR"))
 S RMPRFDA(661.63,"+1,",10)=$G(RMPR60("COST"))
 S RMPRFDA(661.63,"+1,",11)=$G(RMPR60("UNIT"))
 S RMPRFDA(661.63,"+1,",12)=$G(RMPR60("QUANTITY"))
 D UPDATE^DIE("","RMPRFDA","RMPRIEN","RMPRFME")
 I $D(RMPRFME) S RMPRERR=99 G CREX
CREX Q RMPRERR
 ;
UPD(RMPR60,RMPR63,RMPR11) ;
 ;update file #661.63, cost and quantity
 N RMDAT,RI
 S RMPRERR=0
 I '$G(RMPR63("IEN")) S RMPRERR=1 G UPDX
 S RI=RMPR63("IEN")
 S RMDAT(661.63,RI_",",12)=RMPR60("QUANTITY")
 S RMDAT(661.63,RI_",",10)=RMPR60("COST")
 D FILE^DIE("K","RMDAT","RMERR")
 I $D(RMERR) S RMPRERR=1
UPDX Q RMPRERR
 ;
 ; Delete patient issue transaction record
DEL(RMPR6) ;
 N RMPRERR,RMPRFDA,RMPRIEN,RMPRFME
 S RMPRERR=0
 S RMPRIEN=$O(^RMPR(661.63,"B",RMPR6("IEN"),""))_","
 S RMPRFDA(661.63,RMPRIEN,.01)="@"
 D FILE^DIE("","RMPRFDA","RMPRFME")
 I $D(RMPRFME) S RMPRERR=99
DELX Q RMPRERR
 ;
 ; Update all fields of patient issue transaction record
UPALL(RMPR60,RMPR63,RMPR11) ;
 N RMPRERR,RMPRFDA,RMPRIEN,RMPRFME
 S RMPRERR=0
 I '$G(RMPR63("IEN")) S RMPRERR=1 G UPALLX
 S RI=RMPR63("IEN")
 S:$D(RMPR11("HCPCS")) RMDAT(661.63,RI_",",4)=RMPR11("HCPCS")
 S:$D(RMPR11("ITEM")) RMDAT(661.63,RI_",",5)=RMPR11("ITEM")
 S:$D(RMPR60("DATE&TIME")) RMDAT(661.63,RI_",",6)=RMPR60("DATE&TIME")
 S:$D(RMPR60("LOCATION")) RMDAT(661.63,RI_",",8)=RMPR60("LOCATION")
 S RMDAT(661.63,RI_",",9)=RMPR60("VENDOR")
 S RMDAT(661.63,RI_",",10)=RMPR60("COST")
 S RMDAT(661.63,RI_",",11)=RMPR60("UNIT")
 S RMDAT(661.63,RI_",",12)=RMPR60("QUANTITY")
 D FILE^DIE("K","RMDAT","RMERR")
UPALLX Q RMPRERR
