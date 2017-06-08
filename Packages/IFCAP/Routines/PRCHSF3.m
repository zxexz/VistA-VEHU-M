PRCHSF3 ;WISC/DJM-UPDATING THE LINE ITEM DISCOUNTS ON THE 'AMENDED' 443.6 RECORD ;8/31/95  11:29 AM
V ;;5.1;IFCAP;**118,138**;Oct 20, 2000;Build 18
 ;Per VHA Directive 2004-038, this routine should not be modified.
 ;GO THROUGH ALL LINE ITEMS AND CREATE 'PRCH("AM",PRCHCN)' ARRAY
 ;PRCHCN CAN BE A 'CONTRACT NUMBER' OR '.OM'.
 ;PRCH("AM",PRCHCN) HAS 3 "^" PARTS.
 ;    PART 1 = NUMBER OF LINE ITEMS IN THIS ARRAY ELEMENT.
 ;    PART 2 = TOTAL $AMOUNT OF ALL LINE ITEMS IN ARRAY ELEMENT.
 ;    PART 3 = LISTING OF ALL LINE NUMBERS IN THIS ARRAY ELEMENT.
 ;THE LISTING IS SAVED IN THE FORMAT NEEDED TO USE WITHIN A MUMPS
 ;'FOR' COMMAND.  FOR EXAMPLE: 1:1:2,4,6,8:11,
 ;
 N PRCH,PRCHDSC,PRCHEC,I,PRCHAMX,PRCHCN,PRCHLI,PRCHLCNT,K,TOT,K2,SHIP,OTOT,DIF,PRCHL0,PRCHL3,J,PRCHL1,PRCHL2,PRCHAC
 N PRCHACT,PRCHP,PRCHAMT,Y,PRCHN,PRCHD,PRCHDA,PRCHX,RDIS
 S PRCHPO=$S($D(PRCHPO):PRCHPO,1:D0),PRCHAM=$S($D(PRCHAM):PRCHAM,1:D1)
 D MVDIS^PRCHMA3
 ;REALIGN CONTRACT #/DISCOUNT ENTRIES - added via patch PRC*5.1*138
A1 S PRCH=0 F  S PRCH=$O(^PRC(443.6,PRCHPO,2,PRCH)),PRCHDSC=0 Q:+PRCH'>0  D
 . S PRCHCN=$P($G(^PRC(443.6,PRCHPO,2,PRCH,2)),U,2)
 . F  S PRCHDSC=$O(^PRC(443.6,PRCHPO,3,PRCHDSC)) Q:+PRCHDSC'>0  D
 .. S RDIS=$G(^PRC(443.6,PRCHPO,3,PRCHDSC,0)) Q:RDIS=""
 .. I +RDIS=PRCH,PRCHCN'=$P(RDIS,U,5) S $P(^PRC(443.6,PRCHPO,3,PRCHDSC,0),U,5)=PRCHCN
 K PRCH,PRCHDSC,PRCHCN,RDIS
B ;LOOP THROUGH ALL LINE ITEM ENTRIES AND ADD/UPDATE THE 'PRCH("AM",PRCHCN)' ARRAY.
 S (PRCH,PRCHEC)=0
 F I=1:1 S PRCH=$O(^PRC(443.6,PRCHPO,2,PRCH)) Q:PRCH=""!(PRCH'>0)  D
 .S PRCHAMX=$G(^PRC(443.6,PRCHPO,2,PRCH,2)) I PRCHAMX]""  D
 ..S $P(PRCHAMX,U,6)="",^PRC(443.6,PRCHPO,2,PRCH,2)=PRCHAMX
 ..S PRCHCN=$P(PRCHAMX,U,2),PRCHAMX=+$P(PRCHAMX,U),PRCHLI=I
 ..D CN:PRCHCN]"",OM:PRCHCN=""
 ..Q
 .Q
 S PRCHLCNT=I-1 S:$D(^PRC(443.6,PRCHPO,2,0)) $P(^(0),U,3,4)="1^"_PRCHLCNT
 D UP
TOT ;NOW LETS GET THE TOTAL FOR THIS DOCUMENT.
 S (K,TOT)=0 F  S K=$O(^PRC(443.6,PRCHPO,2,K)) Q:K'>0  S K2=$G(^(K,2)) I K2]"" S TOT=TOT+$P(K2,U)-$P(K2,U,6)
 S SHIP=$P(^PRC(443.6,PRCHPO,0),U,13),TOT=TOT+SHIP,OTOT=$P(^PRC(442,PRCHPO,0),U,15),DIF=TOT-OTOT
 S $P(^PRC(443.6,PRCHPO,6,PRCHAM,0),U,3)=DIF
 S $P(^PRC(443.6,PRCHPO,0),U,15)=TOT
 Q
 ;
LI ;CREAT THE ENTRY FOR THE 3rd "^" PIECE OF PRCH("AM",PRCHCN) HERE.
 S PRCHL0=$P(PRCH("AM",PRCHL3),U,3) Q:PRCHL0=""  F J=1:1 S PRCHL1=$E(PRCHL0,$L(PRCHL0)-J) Q:PRCHL1'=+PRCHL1
 S PRCHL2=$E(PRCHL0,$L(PRCHL0)-J+1,$L(PRCHL0)-1),PRCHL2=PRCHL2+1 I PRCHL2'=PRCHLI S PRCHLI=PRCHL0_PRCHLI Q
 I PRCHL1=":" S PRCHLI=$E(PRCHL0,1,$L(PRCHL0)-J)_PRCHLI Q
 S PRCHLI=$E(PRCHL0,1,$L(PRCHL0)-1)_":1:"_PRCHLI
 Q
 ;
CN ;CREATE THE 'PRCH("AM",PRCHCN)' ARRAY ELEMENT HERE, ALL THREE PARTS, FOR LINE ITEMS WITH A CONTRACT NUMBER.
 S:'$D(PRCH("AM",PRCHCN)) PRCH("AM",PRCHCN)="",PRCHEC=PRCHEC+1 S PRCHL3=PRCHCN
 D LI S PRCH("AM",PRCHCN)=($P(PRCH("AM",PRCHCN),U,1)+1)_U_($P(PRCH("AM",PRCHCN),U,2)+PRCHAMX)_U_PRCHLI_",",^PRC(443.6,PRCHPO,2,"AC",$E(PRCHCN,1,30),PRCH)=""
 Q
 ;
OM ;CREATE THE 'PRCH("AM",PRCHCN)' ARRAY ELEMENT HERE, ALL THREE PARTS, FOR LINE ITEMS WITHOUT A CONTRACT NUMBER.
 S:'$D(PRCH("AM",".OM")) PRCH("AM",".OM")="",PRCHEC=PRCHEC+1 S PRCHL3=".OM" D LI S PRCH("AM",".OM")=($P(PRCH("AM",".OM"),U,1)+1)_U_($P(PRCH("AM",".OM"),U,2)+PRCHAMX)_U_PRCHLI_","
 Q
 ;
UP ;NOW LETS DO THE ACTUAL UPDATING OF THE DISCOUNT FOR EACH LINE ITEM.
 ;
 S PRCH=0
 F I=1:1 S PRCH=$O(^PRC(443.6,PRCHPO,3,PRCH)) Q:PRCH=""!(PRCH'>0)  S PRCHCN=$S($P(^(PRCH,0),U,5)]"":$P(^(0),U,5),1:".OM"),PRCHAC=$P(^(0),U,1),PRCHACT=$P(^(0),U,4),PRCHP=$P(^(0),U,2) D SET
 Q
 ;
SET ;DECIDE THE LINE ITEM NUMBERS TO DO THE DISCOUNT ADJUSTMENT.
 G:PRCHAC="Q" PCTQ
 I PRCHAC[":" S PRCHAC=$P(PRCHAC,":",1)_":1:"_$P(PRCHAC,":",2)
 ;
PCT ;FOR EACH 'LINE ITEM NUMBER' WITH A DISCOUNT DO IT HERE.
 S PRCHAMT=0,Y="F J="_PRCHAC_" S PRCHN=J D PCT1" X Y
 S PRCHAMT=PRCHAMT*100+.5\1/100,$P(PRCH("AM",PRCHCN),U,2)=$P(PRCH("AM",PRCHCN),U,2)-PRCHAMT
 Q
 ;
PCT1 S PRCHN=$O(^PRC(443.6,PRCHPO,2,"B",PRCHN,0)),PRCHD=+$P($G(^PRC(443.6,PRCHPO,2,PRCHN,2)),U,1)
 I $E(PRCHP,1)="$" S PRCHDA=$P(PRCHP,"$",2)/PRCHACT
 E  S PRCHDA=$J(PRCHD*(PRCHP/100),0,2)
 S PRCHAMT=PRCHAMT+PRCHDA,$P(^PRC(443.6,PRCHPO,2,PRCHN,2),U,6)=PRCHDA
 Q
 ;
PCTQ ;COME HERE IF THE USER SELECTED A 'QUANTITY' DISCOUNT.
 ;
 S (PRCHAMT,PRCHCN,PRCHX)=0,PRCHACT=PRCHLCNT F K=0:0 S PRCHCN=$O(PRCH("AM",PRCHCN)) Q:PRCHCN=""  S PRCHAC=$E($P(PRCH("AM",PRCHCN),U,3),1,$L($P(PRCH("AM",PRCHCN),U,3))-1) D PCT S PRCHX=PRCHX+PRCHAMT
 S $P(^PRC(443.6,PRCHPO,3,PRCH,0),U,3)=PRCHX
 Q
