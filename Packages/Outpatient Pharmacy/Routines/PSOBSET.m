PSOBSET ;BHAM ISC/CCG - BLACK LINE RESOLVER ; 10/24/92 13:23
 ;;7.0;OUTPATIENT PHARMACY;**10,268**;DEC 1997;Build 9
ENLBL ;SET UP ^PS(52.9 ENTRY FROM ^PSOLBL
 K ^PSOBPPL($J)
 S ^PSOBPPL($J)=PPL,PSOBPC="," G:^PSOBPPL($J)="" Q^PSOBSET1 S ZZX=0 D IO G:ZZX Q^PSOBSET1 S PSOBPS=PSOSITE G:PSOBPS="" Q^PSOBSET1 G:'$D(^PS(59,PSOBPS,0)) Q^PSOBSET1
 S PSOBVR1=$G(RXP),PSOBCP=$G(COPIES),PSOBVR2=$G(SIDE),PSOBR="L"
LP S P=P+1,PSOBRX=$P(^PSOBPPL($J),",",P),PSOBVR1=$P(PSOBRX,"*",2),PSOBRX=$P(PSOBRX,"*",1) G:PSOBRX="" Q^PSOBSET1 G:'$D(^PSRX(PSOBRX,0)) LP S PSOBDPT=$P(^PSRX(PSOBRX,0),"^",2) G ^PSOBSET1
NWIO L +^PS(52.9,0):$S(+$G(^DD("DILOCKTM"))>0:+^DD("DILOCKTM"),1:3) G:'$T NWIO S Z=$P(^PS(52.9,0),"^",3),ZX=$P(^(0),"^",4)
LP3 S Z=Z+1,ZX=ZX+1 G:$D(^PS(52.9,Z,0)) LP3 S ^PS(52.9,0)=$P(^PS(52.9,0),"^",1,2)_"^"_Z_"^"_ZX L -^PS(52.9,0) S ^PS(52.9,Z,0)=PSOBIO,^PS(52.9,Z,1,0)="^52.9001PI^^",^PS(52.9,"B",PSOBIO,Z)="" Q
IO I $D(IOS),IOS]"" G IO1
 S IOP=IO,%ZIS="N",ZZX=1 D ^%ZIS K IOP Q:ION=""
IO1 S PSOBIO=IOS
 D:'$D(^PS(52.9,"B",PSOBIO)) NWIO S PSOBIO=$O(^PS(52.9,"B",PSOBIO,0)),(ZZX,P)=0,(PSOBVR1,PSOBCP,PSOBVR2)="" Q
GP S PSOBR="P" G ^PSOBSET1
EN1P S ZZX=0 D IO G:ZZX Q^PSOBSET1 S PSOBPC=",",PSOBPS=PSOSITE,PSOBDPT=DFN,(^PSOBPPL($J),PSOBPPL1)="" S:$D(PSODTCUT) PSOBVR1=PSODTCUT S:$D(PSOPRPAS) PSOBVR2=PSOPRPAS S:$D(NEW1) ^PSOBPPL($J)=NEW1 S:$D(NEW11) PSOBPPL1=NEW11 G GP
SSUS S ZZX=0 D IO G:ZZX Q^PSOBSET1 S PSOBPS=PSOSITE,PSOBR="L",PSOBS="",PSOBII=0,PSOBPC="," K ZRXP
 F ZII=0:0 S ZII=$O(^TMP($J,"PSOSU",XAK,ZII)) Q:'ZII  S RX=^(ZII),PSOBVR1=$P(RX,"^",5),ZZRXP=$P(RX,"^",3),RX=+RX D S1
S0 I 'PSOBII F ZII=0:0 S ZII=$O(^PSOBPPL($J,ZII)) Q:'ZII  S:^PSOBPPL($J,ZII)'="" PSOBVR1=^PSOBPPL($J,ZII) S ^PSOBPPL($J)=^PSOBPPL($J,ZII,1),P=0 D LP
 K ZRXP,ZZRXP,PSOBII,RX,PSOBPS,PSOBS G Q^PSOBSET1
S1 I $D(ZRXP),ZZRXP=ZRXP G S2
 S PSOBII=PSOBII+1,^PSOBPPL($J,PSOBII,1)="",^PSOBPPL($J,PSOBII)=ZZRXP
S2 S ZRXP=ZZRXP,^PSOBPPL($J,PSOBII,1)=^PSOBPPL($J,PSOBII,1)_RX_"*"_PSOBVR1_"," Q
SUS S ZZX=0 D IO G:ZZX Q^PSOBSET1 S PSOBPS=PSOSITE,PSOBR="L",PSOBS="",PSOBII=0,PSOBPC="," K ZRXP
 F ZII=0:0 S ZII=$O(^PS(52.5,"C",ZI,ZII)) Q:'ZII  I $D(^PS(52.5,ZII,0)),+$P(^(0),"^",6)=PSOSITE,'$D(^("P")) S RX=^(0),ZZRXP=$P(RX,"^",3),PSOBVR1=$P(RX,"^",5),RX=+RX D S1
 G S0
