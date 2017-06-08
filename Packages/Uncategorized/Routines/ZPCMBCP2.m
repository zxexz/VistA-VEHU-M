ZPCMBCP2 ;ENCOUNTER PROGRAM EXTRACTS
 ;AMT
ENENC2 ;FOR HFS ENTRY
 D ^%ZIS
ENENC ; ENTER here for encounter bcp output
 I $D(IO(0))=0 S IOP="HOME" D ^%ZIS
 I IO=IO(0) R !,"Turn screen capture on... Hit return when ready.",XXXX:60
ENENC3 S X=250 X ^%ZOSF("RM")
 I $D(IO)=0 S IOP="HOME" D ^%ZIS
 U IO
 S D0=0 ;go thru OUT patient diagnosis file
 I $D(^ZSQLINT("ENCOUNT","D0"))=1 S D0=$G(^ZSQLINT("ENCOUNT","D0"))
 F  S D0=$O(^SDD(409.43,D0)) Q:D0=""  D GET
EXIT ;
 K FLD,MO,YR,DAY,CENT,CEN,DTXX,REC
 K ENCNODE
 S ^ZSQLINT("ENCOUNT","FINISH")=$H
 K ^ZSQLINT("ENCOUNT","D0")
 D ^%ZISC
 Q
GET ;
 S ENCNODE=$G(^SDD(409.43,D0,0))
 S LINKDA=$P(ENCNODE,"^",2)
 I LINKDA="" Q  ;CAN'T MATCH data to encounter
 S OUTENC=$G(^SCE(LINKDA,0)),DIAGDA=$P(ENCNODE,"^",1)
 S DIAGRANK=$P(ENCNODE,"^",3)
 S DATENC=$P(OUTENC,"^",1),X=DATENC D DTC S DATENC=DTXX
 S CLINDA=$P(OUTENC,"^",3)
 S LOCATDA=$P(OUTENC,"^",4),LOCAT=""
 I LOCATDA'="" S LOCAT=$P($G(^SC(LOCATDA,0)),"^",1)
 S CLISTOP=""
 I CLINDA'="" S CLISTOP=$P($G(^DIC(40.7,CLINDA,0)),"^",4)
 I CLINDA'="" I CLISTOP="" S CLISTOP=$P($G(^DIC(40.7,CLINDA,0)),"^",2)
 S DIAGNAM=""
 I DIAGDA]"" D
 .S DIAGNAM=$P($G(^ICD9(DIAGDA,0)),"^",3),DIAGCODE=$P($G(^ICD9(DIAGDA,0)),"^",1)
 S PATDFN=$P(OUTENC,"^",2)
 I PATDFN="" Q  ;CAN'T FO MUCH WITHOUT THE PATIENT IDENTIFIER
 S SSN=$P($G(^DPT(PATDFN,0)),"^",9)
 S PTNAME=$P($G(^DPT(PATDFN,0)),"^",1)
 D OUTPUT
 ;W X,!
 Q
OUTPUT ;
 ;W "SSN:",SSN," DIAGCODE=",DIAGCODE," DIAGNAME=",DIAGNAM,!
 ;W "PTNAME=",PTNAME," CLINDT=",CLINDA," DATE ENC=",DATENC,!
 ;W "LOCAT=",LOCAT," STOP CODE=",CLISTOP,!
 ;W "**********************",!
 S FLD(1)=SSN,FLD(2)=PTNAME,FLD(3)=DATENC
 S FLD(4)=DIAGCODE,FLD(5)=DIAGRANK,FLD(6)=DIAGNAM
 S FLD(7)=CLISTOP,FLD(8)=LOCAT
 S REC="" F I=1:1:8 S REC=REC_FLD(I)_"^"
 I REC]"" S REC=$E(REC,1,$L(REC)-1)
 W REC,!
 S ^ZSQLINT("ENCOUNT","D0")=D0
 Q
DTC ;DATE CONV Y2K COMPLIANT
 S YR=$E(X,2,3),MO=$E(X,4,5),DAY=$E(X,6,7),CENT=$E(X,1,1)
 I MO="00" S MO="01"
 I DAY="00" S DAY="01"
 S CEN="19" I CENT="3" S CEN="20"
 I CEN="1" S CEN="18"
 S YR=CEN_YR
 S DTXX=MO_"/"_DAY_"/"_YR I DTXX["//" S DTXX=""
 ;W "DTXX=",DTXX
 Q
