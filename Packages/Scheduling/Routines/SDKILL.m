SDKILL ;ALB/LDB - ROUTINE TO KILL VARIABLES ;5/8/91  16:33
 ;;5.3;Scheduling;;Aug 13, 1993
SDM K %,%DT,%Y,APL,COLLAT,COV,D,DA,DFN,DIV,DIV1,DTOUT,FND,G1,HSC,I,I1,J,MXO,MXOK,POP,S,SC,SD,SD17,SDALLE,SDAMBAE,SDATD,SDAPTYP,SDAPP,SDAT16,SDAV,SDC,SDCOL,SDD,SDCT,SDD,SDDECOD,SDEC,SDEMP,SDHX,SDIN,SDINA,SDINP,SDIV,SDLOCK,SDMADE
 K SDMAX,SDMLT,SDNEXT,SDNOT,SDOEL,SDOK,SDPL,SDRE,SDRT,SDSC,SDTTM,SDTY,SDSOH,SDSX,SDSY,SDT,SDTTM,SDW,SDY,SDYC,SDZ,SDZM,SI,SL,SM,SS,ST,STR,STARTDAY,VADM,VAEL,X,X1,X2,Y,Z,ZL
 Q
SDCNP K %T,DFN,DQI,%IS,%ZIS,B0,D,DIROUT,IOP,LEN,ORVP,SDPL,SDSC,X2,XQORQUIT,VA
 Q
SDMULT K CCX,CCXN,DIC,HSI,J,POP,SDMM,SDY,STX,VADM,SDALLE,SDDAPP,SDATD,SDDECOD,SDDIS,SDEMP,SDLOCK,SDNEXT,SDNOT,SDOEL,SDPL,SDRT,SDSC,SDTTM,SDYC,SS,ST,%T,%Y,COV,SDAPP,DA,DIE,DIPGM,DISYS,DP,DFN
 Q
SDC K %,A,ANS,CDATE,DA,DFN,DH,DIC,DO,DOW,FR,I,NOAP,P,SC,SD,SDCNT,SDHTO,SDTIME,SDV1,SDZ,SI,SL,SS,ST,STARTDAY,TO,X,Y,DGPGM,DGVAR,SDSC,VAUTD,VAUTNI,J,J2,SDLE
 K %DT,SDANS,SDJ,ALL,DIV,SDLT,SDV1,DTOUT,SDARRAY,SDBD,SDED,SDVAUTC,SDX,VAUTC,SDCTO,Z,TO
 Q
SDINACT K %,%DT,%H,%T,%Y,C,CTR,D,DIC,DR,ENDATE,H1,H2,HSI,L1,M1,M2,MAX,NSL,SB,SDCL,SDIN,SDL,SDONE,SDPAT,SDRE,SDREB,SDSAV,SDSOH,SDSTRTDT,SLT,SM,SS,STIME,STR,T1,T2,ZDX
 Q
SDCLDOW K CXEND,ALL,DIV,KK,SDIV,VAL,POP
 Q
SDPURG K SD2,VAL,SDLFY,SDAS,DFN,SDLIM,%,S,SDLIM1,A,B,SD1,X,Y,SDPR,SDDISP,SD44,E1,SDZ
 Q
SDSCE K DR,SDAL,SDEL,SDHSC,SDIN,SDINH,SDLA,SDONE,SDPAT,SDRE,SDREB,SDSAV,A,CTR,SD,STIME
 K SDSI,SDZ0,SDZ1,SDZQ,SI,SL,STARTDAY,SLT,HSI,SI,T1,T2,H1,H2,M1,M2,SDCL,NSL,SDCL,SDL,LT,CNT,DH,ZDX,SB,STR
 K SDSOH,MAX,SC,SDSTRTDT,SDIN,SDLA,SDSI,SDINH,SDZQ,DA,POP,DOW,SDRE,S,SDJJ,SDREACT,SM
 Q
SDREACT K A,CTR,D,DIC,SDEL,SDIN,SDREB,SDSAV,SDSOH,SDX,CNT,D0,DA,DH,DIE,DO,DOW,DR,ENDATE,H1,H2,HSI,I1,I2,LT,M1,M2,MAX,NSL,POP,J
 K S,SB,SC,SD,SDCL,SDFSW,SDH,SDINACT,SDL,SDONE,SDPAT,SDRE,SDRE1,SDREACT,SDSTRTDT,SDX1,SDZQ,SI,SL,SLT,SM,SS,STARTDAY,STIME,STR,T1,T2,X1,ZDX
 Q
SDUNC K DIC,X,Y,Z,SC,SL,SD,SI,STARTDAY,CDATE,N1,SS,HOLD,DA(1),DO,DOW,SDREST,SDTEMP,SDZZ,DH,I1,SDFR1
 Q
SDDSSA K %,A,ALL,B,DISP,DIV,DIV1,ENDDATE,I1,I2,I3,I4,POP,SD321,SDEF,SDL,SDP0,SDP1,SDP2,SDP3,SDST,SDT,SDTT,SDVINF,X,Y,Z
 Q
SDENROLL K %,%H,%Y,C,D0,D1,DA,DI,DIC,DIE,DR,X,Y,Z
 Q
SDCD K DIC,DIPGM,DUOUT,%Y,C,DA,%Y1,D0,DI,DIE,DISYS,DQ,DR,I,SC,XX,Y,%X,D1,D2,DIG,DIH,DIU,DIV,HSC
 Q
SDTRANDV D QUIT^VAUTOMA ; AFTER Q1
 Q
SDSCP ;NOTHING NEEDED
 Q
SDIAL K ALL,SDBD,SDED,VAL,VAR,PGM,SD,SD2,SDLT,SDV1,VAUTD ; END^SDIAL
 K ^UTILITY($J)
 Q
SDWARD K PGM,SDY,VAL,VAR,X1 ; END^SDWARD
 Q
