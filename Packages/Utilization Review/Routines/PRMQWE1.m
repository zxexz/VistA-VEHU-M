PRMQWE1 ;Chicago ISC/DDA- PRMQ EDIT 1 ;5/9/90  10:31
 ;;1.2;Utilization Review;;
EN1 ; ENTRY POINT FOR OPTION PRMQ EDIT 1, DRG DATA
 W !! S DIC="^PRMQ(513.8,",DIC(0)="AELMNQZ",DLAYGO=513.8 D ^DIC K DIC,DLAYGO G:Y=-1 EXIT
 S D0=+Y D ENLOOK^PRMQW G:PRMQDATE="^"!(PRMQDATE="") XIT
 I $P(PRMQDATE,"^",5)="" S VAIP("E")=$P(PRMQDATE,"^",6) D IN5^VADPT S $P(PRMQDATE,"^",5)=VAIP(13) K VAIP,VAERR
 I $P(PRMQDATE,"^",4)="*" S (PRMQOUT,PRMQD1)=0 F PRMQI=0:0 S PRMQD1=$O(^PRMQ(513.8,PRMQD0,1,"B",$P(PRMQDATE,"^",2),PRMQD1)) Q:PRMQD1'>0  D EN1I Q:PRMQOUT=1
 I $P(PRMQDATE,"^",4)'="*" S DIE="^PRMQ(513.8,",DA=PRMQD0,DR="2///^S X=$P(PRMQDATE,""^"")",DR(2,513.801)=".01;S PRMQD1=DA" D ^DIE K DA,DIE,DR,DIDEL
 I PRMQD1'>0 W !!,"ERROR IN UR RECORD: IEN=",D0,"  DATE: ",$P(PRMQDATE,"^"),! G XIT
 S VAIP("E")=$P(PRMQDATE,"^",5) D IN5^VADPT S PRMQ("ADMPHY")=$P(VAIP(7),"^",2) K VAIP,VAERR S VAIP("E")=$P(PRMQDATE,"^",6) D IN5^VADPT S PRMQ("ATTPHY")=$P(VAIP(7),"^",2) K VAIP,VAERR
 S DIE="^PRMQ(513.8,"_PRMQD0_",1,",(DA,D1)=PRMQD1,DA(1)=PRMQD0,DIDEL=513.801
 S DR=".2//^S X=$S($P(PRMQDATE,""^"",3)=""A"":""NO"",1:""YES"");1.2//^S X=PRMQ(""ADMPHY"");1;S PRMQ(""ATT"")=$S($D(@(DIC_DA_"",7)"")):$P(^(7),""^"",2),1:"""");1.1//^S X=PRMQ(""ATTPHY"");S PRMQ(""ATTPHY"")=X S:PRMQ(""ATT"")=X Y=""@3"""
 S DR(1,513.801,1)="1.15///^S X=""NOW"";@3;2;3;.7;S:X=2 Y=""@1"" D:X=2 ENNOSUR^PRMQW1;4;@1;D EN^PRMQD41 S PRMQDRG=X;H 1;5//^S X=PRMQDRG;S:X="""" Y="""";D ^PRMQDRG S:PRMQSKP=1 Y=""@2"";5.8///^S X=""NOW"";@2;6;S:X=""""!(X=""@"") Y="""""
 S DR(1,513.801,2)="S PRMQALOS=X D EN2^PRMQD41 W ""..."";9.5///@;W ""..."";H 3;W ""..."";9.5//^S X=PRMQNSRD"
 S DR(2,513.81)="1///^S X=PRMQ(""ATTPHY"")"
 S DR(2,513.803)=".01;1;2"
 S DR(2,513.807)="1///^S X=PRMQDRG"
 S PRMQADTT=$P(PRMQDATE,"^",2)
 D ^DIE K DA,DIE,DR,DIDEL
XIT D EXIT G EN1
 Q
EN1I S PRMQ(.2)=$P(^PRMQ(513.8,D0,1,PRMQD1,7),"^",4),PRMQ("D.2")=$E($P(PRMQDATE,"^",3),1),PRMQOUT=$S(PRMQ(.2)=1&(PRMQ("D.2")="T"):1,PRMQ(.2)=2&(PRMQ("D.2")="A"):1,PRMQ(.2)=""&(PRMQ("D.2")="A"):1,1:0)
 Q
EXIT ; KILL VARIABLES AND EXIT
 K %,%DT,%T,%W,%X,%Y,C,D0,D1,DFN,DI,DISYS,DQ,I,PRMQALOS,PRMQDATE,PRMQDFN,PRMQ,PRMQD0,PRMQD1,PRMQE,PRMQX,PRMQXF,PRMQOUT,PRMQDRG,PRMQI,PRMQADTT,PRMQNFLG,PRMQNSRD,PRMQSKP,PRMQPDRG,X,Y
 Q