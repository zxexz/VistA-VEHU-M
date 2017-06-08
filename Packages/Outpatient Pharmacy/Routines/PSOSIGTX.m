PSOSIGTX ;BIR/RTR-Utility to calculate quantity ; 3/23/11 8:25am
 ;;7.0;OUTPATIENT PHARMACY;**46,282**;DEC 1997;Build 18
 ;External reference to PS(51 supported by DBIA 2224
 ;External reference to PS(51.1 supported by DBIA 2225
 ;
EN(PSOSIGX) ;
 N VARIABLE
 Q
SCH ;*282 Centralized Call
 D SCH^PSOSIG
 Q
QTY(PSOQX) ;
 N QDOSE
QTYCP ;CPRS qty call comes through here
 N PSQQUIT,QTSH,PSQ,PSQMIN,PSQMINZ,PSOQRND,PSOLOWER,PSOLOWX,PSOLOWXL,PSOLOWST
 K PSOFRQ S PSQQUIT=0
 I '$G(PSOCPRQT) S QDOSE=0 F PSQ=0:0 S PSQ=$O(PSOQX("DOSE",PSQ)) Q:'PSQ  S QDOSE=PSQ S:'$G(PSOQX("DOSE ORDERED",PSQ)) PSQQUIT=1
 ;Q:PSQQUIT!('QDOSE)
 I '$G(PSOCPRQT) Q:PSQQUIT
 Q:'$G(PSOQX("DAYS SUPPLY"))
 Q:'$G(QDOSE)
 G:QDOSE>1 COMP
TOP ;One Dose for complex and/then
 N PSOQDUR
 Q:'$G(PSOQX("DOSE ORDERED",PSQDOSE))
 Q:'$G(PSOQX("DAYS SUPPLY"))&('$G(PSOQX("DURATION",PSQDOSE)))
 S PSOLOWER=0
 I $G(PSOQX("DURATION",PSQDOSE)) D
 .S PSOLOWX=$L(PSOQX("DURATION",PSQDOSE))
 .S PSOQDUR=$G(PSOQX("DURATION",PSQDOSE))
 .S PSOLOWXL=$S($E(PSOQDUR,PSOLOWX)="M":1,$E(PSOQDUR,PSOLOWX)="H":60,$E(PSOQDUR,PSOLOWX)="S":.01666,$E(PSOQDUR,PSOLOWX)="W":10080,$E(PSOQDUR,PSOLOWX)="L":43200,1:1440)
 .S PSOLOWER=PSOLOWXL*(+$G(PSOQX("DURATION",PSQDOSE)))
 I $G(PSOLOWER),$G(PSOLOWER)>PSODSMXX Q
 S PSOLOWX=$G(PSODSMXX)
 Q:'$G(PSOLOWER)&('$G(PSOLOWX))
 S QTSH=$G(PSOQX("SCHEDULE",PSQDOSE)) D QTS Q:PSQQUIT!('$G(PSOFRQ))
 S PSOLOWST=$S('$G(PSOLOWER):$G(PSOLOWX),'$G(PSOLOWX):$G(PSOLOWER),$G(PSOLOWER)>$G(PSOLOWX):$G(PSOLOWX),$G(PSOLOWX)>$G(PSOLOWER):$G(PSOLOWER),$G(PSOLOWX)=$G(PSOLOWER):$G(PSOLOWER),1:0)
 Q:'$G(PSOLOWST)
 Q:PSOLOWST'>0
 S PSQMIN=+$G(PSOLOWST)
 S PSQMINZ=PSQMIN/PSOFRQ
 S PSOQRND=PSQMINZ*+$G(PSOQX("DOSE ORDERED",PSQDOSE)) Q:'PSOQRND
 S PSODSMXX=PSODSMXX-PSQMIN
 Q:PSODSMXX<0
 D ROUND G QEND
 Q
COMP ;COMPLEX DOSE HERE - ANDS AND THENS
 ;N PSOQAND,PSQL,PSQMNL,PSQMNLX,PSODUTOT,PSODUDIF,PSODUMIS,PSODUREP,PSQ1,PSODUX,PSODUXX,PSODSMIN
 ;PSODUTOT = TOTAL OF ALL DURATIONS
 ;PSODUDIF = DIFF. OF DURATION VS DAYS SUPPLY
 ;PSODUMIS = # OF SEQUENCES MISSING A DURATION IF >1 CAN'T DEFAULT
 ;PSODUREP = SEQUENCE # THAT IS MISSING DURATION
 ;PSODSMIN = MINUTES OF DAYS SUPPLY
 ;PSODSAME = FLAG THAT TELL IF DURATIONS ARE THE SAME
 ;PSODURT = DURATION MINUTES FOR COMPARE
 ;S (PSODUTOT,PSODUDIF,PSODUMIS,PSODUREP,PSODSMIN,PSOQAND)=0
 ;F PSQL=1:1:QDOSE S:$G(PSOQX("CONJUNCTION",PSQL))["A" PSOQAND=1 Q:PSOQAND
 ;I $G(PSOQTHEN) G COMP^PSOSIGTX
 N PSQHOLDX,PSQFLAG,PSQMINLP,PSQMINAR,PSODSMXX,PSOTFLAG,PSODSDEC,PSORNDXX,PSOATQUT,PSQDOSE,PSQDOSEX,PSOQZ,PSOQZX S (PSORNDXX,PSOATQUT,PSODSDEC,PSOTFLAG)=0,PSQDOSE=0,PSQDOSEX=QDOSE
 I '$D(PSOQX("CONJUNCTION",PSQDOSEX)) S PSOQX("CONJUNCTION",PSQDOSEX)="A",PSOTFLAG=1
 S (PSODSMIN,PSODSMXX)=1440*+$G(PSOQX("DAYS SUPPLY"))
 F  S PSQDOSE=$O(PSOQX("CONJUNCTION",PSQDOSE)) Q:$G(PSOATQUT)!($G(PSQDOSE)="")  I $G(PSOQX("CONJUNCTION",PSQDOSE))["T"!(PSQDOSE=PSQDOSEX) S PSOATQUT=1 D
 .;I 1 DO TOP ELSE DO BELOW, SET BEGINNIG AND END COUNTERS, USE THOSE ON LOOPS BELOW, OR THE SINGLE NUMBER FOR UP TOP (CHANGE 1'S TO NUMBERS)
 .I '$G(PSOQZ) S PSOQZ=1
 .I PSQDOSE-PSOQZ=0 D TOP S PSOQZ=PSQDOSE+1 Q
 .D BOT
 .S PSOQZ=PSQDOSE+1
 ;SET LAST CONJUNCTION, MAKE SURE IT'S NOT PASSED IN FROM cprs
 I $G(PSOTFLAG) K PSOQX("CONJUNCTION",PSQDOSEX)
 I PSOATQUT K PSOQX("QTY") Q
 I $G(PSOQX("QTY")) D ROUNDF
 Q
BOT ;
 N PSODUMSS,PSODSAME,PSODURT S (PSODUMSS,PSODSAME,PSODURT,PSODUMIS,PSOQRND,PSODUTOT)=0
 F PSQ1=PSOQZ:1:PSQDOSE D
 .I '$G(PSOQX("DURATION",PSQ1)) S PSODUMIS=PSODUMIS+1,PSODUREP=PSQ1 Q
 .S PSODUX=$L(PSOQX("DURATION",PSQ1))
 .S PSODUMSS=1
 .S PSODUXX=$S($E(PSOQX("DURATION",PSQ1),PSODUX)="M":1,$E(PSOQX("DURATION",PSQ1),PSODUX)="H":60,$E(PSOQX("DURATION",PSQ1),PSODUX)="S":.01666,$E(PSOQX("DURATION",PSQ1),PSODUX)="W":10080,$E(PSOQX("DURATION",PSQ1),PSODUX)="L":43200,1:1440)
 .S PSODUTOT=PSODUTOT+(PSODUXX*(+$G(PSOQX("DURATION",PSQ1))))
 .I '$G(PSODSAME),$G(PSODURT),PSODURT'=(PSODUXX*(+$G(PSOQX("DURATION",PSQ1)))) S PSODSAME=1
 .S PSODURT=(PSODUXX*(+$G(PSOQX("DURATION",PSQ1))))
 ;I PSODUMIS,PSODSAME G QEND ; missing durations, and other durations are all not the same
 I '$G(PSOQX("DAYS SUPPLY")) G QEND ; missing Days Supply
 ;S PSODSMIN=1440*+$G(PSOQX("DAYS SUPPLY"))
 I PSODUMIS,PSODSAME G QEND ; Missing Durations, other are different
 I 'PSODUMIS,PSODSAME,$G(PSODUTOT)>PSODSMIN G QEND ; Every sequence has a duration, some are different, and the total is greater than Days Supply
 I 'PSODSAME,PSODURT>PSODSMIN G QEND ; All have a duration, and it's the same, but it's greater than Days Supply, or Missing Durations with other duration the same but greater than Days Supply
 ;I $G(PSODSMIN),$G(PSODSMIN)<$G(PSODUTOT) G QEND
 ;I '$G(PSODUMIS),$G(PSODSMIN),$G(PSODUTOT)>$G(PSODSMIN) G QEND ; no missing durations, but total durations are greater than days supply
 ;I $G(PSODUMIS),$G(PSODSMIN),$G(PSODSMIN)'>$G(PSODUTOT) G QEND ; 1 missing duration, and total of other durations are not less than days supply
 ;I '$G(PSODSMIN),$G(PSODUMIS) G QEND ; no days supply, m;issing a duration
 I $G(PSODUMIS),PSODUMSS S PSODUDIF=$G(PSODSMIN)-$G(PSODUTOT)
 K PSQMINAR F PSQ=PSOQZ:1:PSQDOSE D  Q:$G(PSQQUIT)
 .I '$G(PSOQX("DOSE ORDERED",PSQ))!($G(PSOQX("SCHEDULE",PSQ))="") S PSQQUIT=1 Q
 .S QTSH=$G(PSOQX("SCHEDULE",PSQ)) D QTS S:'$G(PSOFRQ) PSQQUIT=1 Q:$G(PSQQUIT)
 .I $G(PSOQX("DURATION",PSQ)) S PSQMNL=$L(PSOQX("DURATION",PSQ)) D
 ..S PSQMNLX=$S($E(PSOQX("DURATION",PSQ),PSQMNL)="M":1,$E(PSOQX("DURATION",PSQ),PSQMNL)="H":60,$E(PSOQX("DURATION",PSQ),PSQMNL)="S":.01666,$E(PSOQX("DURATION",PSQ),PSQMNL)="W":10080,$E(PSOQX("DURATION",PSQ),PSQMNL)="L":43200,1:1440)
 ..S PSQMIN=PSQMNLX*(+$G(PSOQX("DURATION",PSQ)))
 ..I $G(PSQMIN) S PSQMINAR(PSQ)=PSQMIN
 .I '$G(PSOQX("DURATION",PSQ)) S PSQMIN=$S($G(PSODURT)&('$G(PSODSAME)):$G(PSODURT),1:$G(PSODSMXX)) I PSQMIN S PSQMINAR(PSQ)=PSQMIN
 .S PSQMINZ=PSQMIN/PSOFRQ
 .S PSOQRND=$S('$G(PSOQRND):PSQMINZ*+$G(PSOQX("DOSE ORDERED",PSQ)),1:$G(PSOQRND)+(PSQMINZ*+$G(PSOQX("DOSE ORDERED",PSQ))))
 .;S PSODSMXX=PSODSMXX-PSQMIN
 S (PSQFLAG,PSQHOLDX)=0 S PSQMINLP="" F  S PSQMINLP=$O(PSQMINAR(PSQMINLP)) Q:PSQMINLP=""  S:$G(PSQHOLDX)&($G(PSQHOLDX)'=$G(PSQMINAR(PSQMINLP))) PSQFLAG=1 S PSQHOLDX=$G(PSQMINAR(PSQMINLP))
 I $G(PSQFLAG) S PSQMINLP="" F  S PSQMINLP=$O(PSQMINAR(PSQMINLP)) Q:PSQMINLP=""  I $G(PSQMINAR(PSQMINLP)) S PSODSMXX=PSODSMXX-PSQMINAR(PSQMINLP)
 I '$G(PSQFLAG) S PSQMINLP="" F  S PSQMINLP=$O(PSQMINAR(PSQMINLP)) Q:PSQMINLP=""!($G(PSQFLAG))  I $G(PSQMINAR(PSQMINLP)) S PSODSMXX=PSODSMXX-PSQMINAR(PSQMINLP),PSQFLAG=1
 K PSQMINAR,PSQFLAG
 I PSODSMXX<0 G QEND
 I $G(PSQQUIT) G QEND
 I $G(PSOQRND) D ROUND
 G QEND
QTS ;*282 Centralized call
 D QTS^PSOSIG
 Q
QEND ;
 K PSOFRQ
 Q
ROUND ;
 Q:'$G(PSOQRND)
 S PSOQX("QTY")=$G(PSOQX("QTY"))+$G(PSOQRND)
 S PSOATQUT=0
 Q
ROUNDF ;
 I PSOQX("QTY")'["." Q
 S PSOQX("QTY")=$P(PSOQX("QTY"),".")+1
 Q
DAY(DATE) ;First 5 digits of FileMan date
 N X
 I DATE'?5N Q -1
 S X=$E(DATE,4,5) I X<1!(X>12) Q -1
 S X=DATE+1+(X=12*88)_"01"
 Q $E($$FMADD^XLFDT(X,-1),6,7)
 ;
QTYX(PSOQX) ;
 N PSOQLP,PSOQLN,PSOQAR,PSOCPRQT,QDOSE,QDOSEX S PSOCPRQT=1 F PSOQLP=0:0 S PSOQLP=$O(PSOQX("DURATION",PSOQLP)) Q:'PSOQLP  D
 .S PSOQAR("DURATION",PSOQLP)=$G(PSOQX("DURATION",PSOQLP))
 .I $E(PSOQX("DURATION",PSOQLP))?1A S PSOQLN=$L(PSOQX("DURATION",PSOQLP)) S PSOQX("DURATION",PSOQLP)=$E(PSOQX("DURATION",PSOQLP),2,PSOQLN)_$E(PSOQX("DURATION",PSOQLP))
 S QDOSE=0 F QDOSEX=0:0 S QDOSEX=$O(PSOQX("DOSE ORDERED",QDOSEX)) Q:'QDOSEX  S QDOSE=QDOSE+1
 I '$G(PSOQX("QTY")) D QTYCP G QPASS
 D QTYCP^PSOSIGDS
QPASS F PSOQLP=0:0 S PSOQLP=$O(PSOQAR("DURATION",PSOQLP)) Q:'PSOQLP  D
 .S PSOQX("DURATION",PSOQLP)=$G(PSOQAR("DURATION",PSOQLP))
 K PSOCPRQT
 Q
DAYS(PSOQX) ;Entry point for Days Supply calc for PSO
 ;Kill days supply here
 Q:'$G(PSOQX("QTY"))
 D QTYOPS^PSOSIGDS
 Q
