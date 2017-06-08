SDMAPI3 ;RGI/VSL - APPOINTMENT API; 11/09/2012
 ;;5.3;scheduling;**260003**;08/13/93;Build 8
LSTPATS(RETURN,SEARCH,START,NUMBER) ; Get patients by name
 N RET,DL,IN,DG
 S:'$D(START) START="" S:'$D(SEARCH) SEARCH=""
 S:'$G(NUMBER) NUMBER=""
 S RETURN=0
 D GETPATS^SDMDAL3(.RET,$$UP^XLFSTR(SEARCH),.START,NUMBER)
 S RETURN(0)=RET("DILIST",0)
 S DL="DILIST"
 F IN=1:1:$P(RETURN(0),U,1) D
 . D SENS^DGSEC4(.DG,RET(DL,2,IN),DUZ)
 . S RETURN(IN)=""
 . S RETURN(IN,"ID")=RET(DL,2,IN)
 . S RETURN(IN,"NAME")=RET(DL,"ID",IN,".01")
 . S RETURN(IN,"BIRTHDATE")=$S(DG(1)=2:"*SENSITIVE*",1:RET(DL,"ID",IN,".03"))
 . S RETURN(IN,"SSN")=$S(DG(1)=2:"*SENSITIVE*",1:RET(DL,"ID",IN,".09"))
 . S RETURN(IN,"TYPE")=RET(DL,"ID",IN,"391")
 . S RETURN(IN,"VETERAN")=RET(DL,"ID",IN,"1901")
 S RETURN=1
 Q 1
 ;
GETPAT(RETURN,PATIENT,LVL) ; Get a patient
 N TEXT
 S RETURN=0 S:'$G(LVL) LVL=7
 I '$G(PATIENT) S TEXT(1)="PATIENT" D ERRX^SDAPIE(.RETURN,"INVPARAM",.TEXT) Q 0
 I LVL>1 D SENS^DGSEC4(.DG,PATIENT,DUZ) D ERRX^SDAPIE(.RETURN,"PATSENS",.TEXT) Q 0
 D GETPAT^SDMDAL3(.RETURN,PATIENT,1,1,1)
 S RETURN=1
 Q RETURN
 ;
LSTETNS(RETURN,SEARCH,START,NUMBER) ; Get ethnicities
 N LST
 D LSTETNS^SDMDAL3(.LST,$G(SEARCH),.START,$G(NUMBER))
 D BLDLST^SDMAPI(.RETURN,.LST)
 Q RETURN
 ;
SETETN(RETURN,PAT,ETN) ; Set patient ethnicity.
 D SETETN^SDMDAL3(PAT,$P(ETN,U,1))
 S RETURN=1
 Q 1
 ;
LSTRACES(RETURN,SEARCH,START,NUMBER) ; Get races
 N LST
 D LSTRACES^SDMDAL3(.LST,$G(SEARCH),.START,$G(NUMBER))
 D BLDLST^SDMAPI(.RETURN,.LST)
 Q RETURN
 ;
SETRACE(RETURN,PAT,RACE) ; Set patient race.
 D ADDRACE^SDMDAL3(PAT,+RACE)
 S RETURN=1
 Q 1
 ;
GETPRES(RETURN,PAT) ; Get patient races
 N LST,IND,CNT
 K RETURN
 D GETPRES^SDMDAL3(.LST,PAT)
 S IND=0,CNT=0
 S RETURN(0)=0
 F  S IND=$O(LST(2,IND)) Q:IND=""  D
 . S CNT=CNT+1
 . S RETURN(CNT)="",RETURN(CNT,"ID")=IND
 . S RETURN(CNT,"NAME")=LST(2,IND,.01)
 . S RETURN(0)=CNT_"^*^0^"
 S RETURN=1
 Q 1
 ;
CHKDISCH(RETURN,ENS,DFN,OENS) ; Check discharge
 N SC,TXT,IND,APTS,ERR,APT
 S RETURN=0,ERR=0
 S SC=$O(ENS(""))
 S TXT(1)=ENS(SC,"NAME")
 I OENS(SC,"STATUS")]"" D ERRX^SDAPIE(.RETURN,"PATDARD",.TXT) Q RETURN
 I '$D(OENS(SC,"EN")) D ERRX^SDAPIE(.RETURN,"PATDNEN",.TXT) Q RETURN
 F IND=0:0 S IND=$O(ENS(SC,"EN",IND)) Q:IND=""!(ERR>0)  D
 . Q:$D(ENS(SC,"EN",IND,"DISCHARGE"))&(ENS(SC,"EN",IND,"DISCHARGE")=OENS(SC,"EN",IND,"DISCHARGE"))
 . D LSTPAPTS^SDMDAL1(.APTS,DFN,ENS(SC,"EN",IND,"DISCHARGE"),9999999)
 . F APT=0:0 S APT=$O(APTS(APT)) Q:APT=""!(ERR>0)  D
 . . I APTS(APT,"SC")=SC,$P(APTS(APT,"SDATA"),U,2)'["C",$P(APTS(APT,"SDATA"),U,2)'["N" S ERR=1
 I ERR D ERRX^SDAPIE(.RETURN,"PATDHFA") Q RETURN
 S RETURN=1
 Q RETURN
 ;
DISCH(RETURN,ENS,DFN) ; Discharge from clinic
 N OENS,IND,SC,NENS
 S RETURN=0
 S SC=$O(ENS(""))
 S %=$$GETPENRL(.OENS,DFN,SC)
 S %=$$CHKDISCH(.RETURN,.ENS,DFN,.OENS)
 Q:RETURN=0 0
 F IND=0:0 S IND=$O(ENS(SC,"EN",IND)) Q:IND=""  D
 . S:ENS(SC,"EN",IND,"DISCHARGE")'=OENS(SC,"EN",IND,"DISCHARGE") NENS(SC,"EN",IND,"DISCHARGE")=ENS(SC,"EN",IND,"DISCHARGE")
 . S:ENS(SC,"EN",IND,"REASON")'=OENS(SC,"EN",IND,"REASON") NENS(SC,"EN",IND,"REASON")=$E(ENS(SC,"EN",IND,"REASON"),1,80)
 S NENS(SC,"IEN")=ENS(SC,"IEN")
 D BEFORE^SCMCEV3(DFN)
 D UPDENRL^SDMDAL3(.NENS,DFN)
 D AFTER^SCMCEV3(DFN)
 D INVOKE^SCMCEV3(DFN)
 S RETURN=1
 Q 1
 ;
GETPENRL(RETURN,DFN,SC,STAT) ; Get patient enrollments filtered by status
 N ENS,EN,IND,CLN,SSC
 D GETCENRL^SDMDAL3(.ENS,DFN,$G(SC))
 F SSC=0:0 S SSC=$O(ENS(SSC)) Q:SSC=""  D
 . Q:$G(STAT)>0&($P(ENS(SSC,0),U,3)]"")
 . S RETURN(SSC,"STATUS")=$P(ENS(SSC,0),U,3)
 . S RETURN(SSC,"IEN")=$P(ENS(SSC,0),U,1)
 . D GETCLN^SDMDAL1(.CLN,SSC)
 . S RETURN(SSC,"NAME")=CLN(.01)
 . F IND=0:0 S IND=$O(ENS(SSC,IND)) Q:IND=""  D
 . . S EN=ENS(SSC,IND)
 . . S RETURN(SSC,"EN",IND,"ENROLLMENT")=$P(EN,U,1)
 . . S RETURN(SSC,"EN",IND,"OA")=$P(EN,U,2)
 . . S RETURN(SSC,"EN",IND,"DISCHARGE")=$P(EN,U,3)
 . . S RETURN(SSC,"EN",IND,"REASON")=$P(EN,U,4)
 . . S RETURN(SSC,"EN",IND,"REVIEW")=$P(EN,U,5)
 I $G(SC)>0 D
 . Q:$D(RETURN(SC))
 . D GETCLN^SDMDAL1(.CLN,SC)
 . S RETURN(SC,"NAME")=CLN(.01)
 Q 1
 ;
CHKCIN(RETURN,DFN,SD,STATUS) ; Check in check
 N DT
 S RETURN=0
 S %=$$CHKSPCI(.RETURN,DFN,SD,STATUS) Q:'% 0
 S DT=$$NOW^XLFDT
 I $P(SD,".")>DT D ERRX^SDAPIE(.RETURN,"APTCITS") Q 0
 Q 1
 ;
CHKSPCI(RETURN,DFN,SD,STATUS) ; Check if status permit check in
 N IND,STAT,STATS
 S RETURN=0
 D LSTCIST1^SDMDAL2(.STAT)
 D BLDLST^SDMAPI(.STATS,.STAT)
 S IND=0
 F  S IND=$O(STATS(IND)) Q:IND=""!(RETURN=1)  D
 . I STATS(IND,"ID")=STATUS S RETURN=1 Q
 I 'RETURN D ERRX^SDAPIE(.RETURN,"APTCIPE")
 Q RETURN
 ;
CHKNS(RETURN,APT0,STATUS,LVL) ; Check no-show
 N STAT
 S RETURN=1
 S %=$$CHKSPNS(.RETURN,+STATUS) Q:'% 0
 S STAT=$P(APT0,U,2)
 I STAT="I" S RETURN=0 D ERRX^SDAPIE(.RETURN,"APTNSIA") Q RETURN
 I LVL>1,STAT["A" S RETURN=0 D ERRX^SDAPIE(.RETURN,"APTNSAR",,2) Q RETURN
 I LVL>1,STAT]"",STAT'["A" S RETURN=0 D ERRX^SDAPIE(.RETURN,"APTNSAL",,2) Q RETURN
 Q RETURN
 ;
CHKSPNS(RETURN,STATUS) ; Check if status of appt permits no-show
 N IND,STAT,STATS
 S RETURN=0
 D LSTNSTA1^SDMDAL2(.STAT)
 D BLDLST^SDMAPI(.STATS,.STAT)
 S IND=0
 F  S IND=$O(STATS(IND)) Q:IND=""!(RETURN=1)  D
 . I STATS(IND,"ID")=STATUS S RETURN=1 Q
 I 'RETURN D ERRX^SDAPIE(.RETURN,"APTNSCE")
 Q RETURN
 ;
CHKCAN(RETURN,DFN,SC,SD) ; Verify cancel
 N APT,RET,%
 S RETURN=0
 D GETAPTS^SDMDAL2(.APT,DFN,.SD)
 I APT("APT",SD,"STATUS")["C" D  Q RETURN
 . D ERRX^SDAPIE(.RETURN,"APTCAND")
 I $$ISAPTCO^SDMAPI4(,DFN,SD) D  Q RETURN
 . D ERRX^SDAPIE(.RETURN,"APTCCHO")
 S %=$$CLNRGHT^SDMAPI1(.RET,+SC)
 I RET=0 D  Q RETURN
 . S TXT(1)=RET("CLN"),TXT(2)=$C(10)
 . D ERRX^SDAPIE(.RETURN,"APTCRGT",.TXT)
 I '$$CHKSPC(.STAT,DFN,SD) D  Q RETURN
 . D ERRX^SDAPIE(.RETURN,"APTCNPE",.TXT)
 S RETURN=1
 Q RETURN
 ;
CHKSPC(RETURN,DFN,SD) ; Check if status permit cancelation
 N APT0,STATUS,IND,STAT,STATS
 S RETURN=0
 S APT0=$$GETAPT0^SDMDAL2(DFN,SD)
 S STATUS=+$$STATUS^SDAM1(DFN,SD,+$G(APT0),$G(APT0))
 D LSTCSTA1^SDMDAL2(.STAT)
 D BLDLST^SDMAPI(.STATS,.STAT)
 S IND=0
 F  S IND=$O(STATS(IND)) Q:IND=""!(RETURN=1)  D
 . I STATS(IND,"ID")=STATUS S RETURN=1 Q
 Q RETURN
 ;
