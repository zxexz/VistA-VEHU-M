QAMEDT2 ;HISC/DAD-PROGRAMMER MONITOR EDIT ;9/10/93  13:20
 ;;1.0;Clinical Monitoring System;;09/13/1993
EN1 ;
 K QAMSEPR8 S $P(QAMSEPR8,"=",81)=""
 K DIC,DIDEL,DINUM S DIC="^QA(743,",DIC(0)="AELMNQ",DIC("A")="Select MONITOR: ",DLAYGO=743
 W ! D ^DIC K DIC G:Y'>0 EXIT S QAMD0=+Y
 S QAMFIN=$S($D(^QA(743,QAMD0,0))#2:$P(^(0),"^",5),1:"")
 S QAMMSGS="EW" D ^QAMSANE W !
 I Y=1!(Y=-1&QAMFIN) K DR S DIE="^QA(743,",DR="7//UNDER CONSTRUCTION",DA=QAMD0 D ^DIE G:$D(Y) EXIT
 S QAMFIN=$S($D(^QA(743,QAMD0,0))#2:$P(^(0),"^",5),1:"")
 K DR S DIE="^QA(743,",DR=".01;.02;1;2;3",DA=QAMD0 D ^DIE G:$D(Y)!($D(DA)[0) EN1
 K DR S DIE="^QA(743,",DR="4",DR(2,743.04)=".01;S QAM=+$S($D(^QA(743.91,+X,0))#2:$P(^(0),""^"",2),1:0),Y=$S(QAM:Y,1:""@1"");1;S Y=0;@1;1///@",DA=QAMD0 D ^DIE G:$D(Y) EN1
 G:QAMFIN C1
 S QAMAUTO("OLD6")=$S($D(^QA(743,QAMD0,0))#2:$P(^(0),"^",4),1:"")
 K DR S DIE="^QA(743,",DR="6//YES",DA=QAMD0 D ^DIE G:$D(Y) EN1
 S QAMAUTO("NEW6")=$S($D(^QA(743,QAMD0,0))#2:$P(^(0),"^",4),1:"")
 D:QAMAUTO("OLD6")'=QAMAUTO("NEW6") DELCR
 K ^UTILITY($J,"COND") F QAMD1=0:0 S QAMD1=$O(^QA(743,QAMD0,"COND",QAMD1)) Q:QAMD1'>0  S ^UTILITY($J,"COND",QAMD1)=^QA(743,QAMD0,"COND",QAMD1,0)
 S QAMDFLT=0
20 K DIC,DTOUT,DUOUT,QAMOUT S:$D(^QA(743,QAMD0,"COND",0))[0 ^(0)="^743.01PA^^"
 S DIC="^QA(743,"_QAMD0_",""COND"",",DIC(0)="ELMNQZ",DIC("A")="Select CONDITION: ",DLAYGO=743,(D0,DA(1))=QAMD0
 S Y=+$P(^QA(743,QAMD0,"COND",0),"^",3),Y=$S($D(^QA(743,QAMD0,"COND",Y,0))#2:+^(0),1:0),DIC("B")=$S(QAMDFLT:"",$D(^QA(743.3,Y,0))#2:$P(^(0),"^"),1:"") K:DIC("B")="" DIC("B")
 W !,DIC("A"),$S($D(DIC("B"))#2:DIC("B")_"//",1:"")," " R X:DTIME
 S:('$T)!($E(X)="^") X="^",Y=-1,QAMOUT=1 I '$D(QAMOUT) S:(X="")&($D(DIC("B")))#2 X=DIC("B")
 W:X?1."?" !?5,"You may enter '?CONDITION' (e.g., ?AGE) at the 'Select CONDITION:'",!?5,"prompt to see a description of a condition or range of conditions.",!?5,"Enter '?*' to see the descriptions for all conditions."
 I (X?1."?"1AN.ANP)!(X?1."?"1."*".E) D EN4^QAMUTL1 G 20
 D:$D(QAMOUT)[0 ^DIC K DIC G:($E(X)="?")!((Y'>0)&(X]"")&($E(X)'="^")) 20 S QAMD1=+Y,QAMDFLT=1 S:$D(DTOUT)!$D(DUOUT) QAMOUT=1 G CONT:$D(QAMOUT)!(X="")
 S QAMSVCND=+$G(^QA(743,QAMD0,"COND",QAMD1,0))
 K DR S DIE="^QA(743,"_QAMD0_",""COND"",",DR=".01",DA(1)=QAMD0,DA=QAMD1 D ^DIE G:$D(Y)!($D(DA)[0) 20
 I QAMSVCND'=+$G(^QA(743,QAMD0,"COND",QAMD1,0)) F QA=1:1:5 K ^QA(743,QAMD0,"COND",QAMD1,"P"_QA)
 D EN3^QAMUTL0 G:$D(Y) 20
 K DR S DIE="^QA(743,"_QAMD0_",""COND"",",DR="1",DA(1)=QAMD0,DA=QAMD1 D ^DIE G 20
CONT F QAMD1=0:0 S QAMD1=$O(^UTILITY($J,"COND",QAMD1)) Q:QAMD1'>0  I ^UTILITY($J,"COND",QAMD1)'=$S($D(^QA(743,QAMD0,"COND",QAMD1,0))#2:^(0),1:"") D DELR G ONWARD
 F QAMD1=0:0 S QAMD1=$O(^QA(743,QAMD0,"COND",QAMD1)) Q:QAMD1'>0  I ^QA(743,QAMD0,"COND",QAMD1,0)'=$S($D(^UTILITY($J,"COND",QAMD1))#2:^(QAMD1),1:"") D DELR Q
ONWARD K ^UTILITY($J,"COND") G:$D(QAMOUT) EN1
 G C2:$S($D(^QA(743,QAMD0,"COND",0))[0:1,$P(^(0),"^",4)'>0:1,1:0)
 W !!,QAMSEPR8 S DA=QAMD0 D EN2^QAMUTL0 K DR S DIE="^QA(743,",DR="25",DA=QAMD0 D ^DIE G:$D(Y) EN1
 G:'$D(^QA(743,QAMD0,"COND","AS",1)) C3
 W !!,QAMSEPR8 S DA=QAMD0 D EN5^QAMUTL0 K DR S DIE="^QA(743,",DR="26",DA=QAMD0 D ^DIE G:$D(Y) EN1
C3 W !!,QAMSEPR8 S DA=QAMD0 D EN1^QAMUTL1 K DR S DIE="^QA(743,",DR="64",DA=QAMD0 D ^DIE G:$D(Y) EN1
 W !!,QAMSEPR8,!
C2 K DR S DIE="^QA(743,",DR="50;52",DA=QAMD0 D ^DIE G:$D(Y) EN1
 S QAM=$S($D(^QA(743,QAMD0,1))#2:$P(^(1),"^",3),1:"") K DR S DR="51"_$S(QAM["%":";53",1:"T;53///@")_";63",DIE="^QA(743,",DA=QAMD0 D ^DIE G:$D(Y) EN1
C1 S QAM=$S($D(^QA(743,QAMD0,1))#2:$P(^(1),"^",3),1:"") K DR S DIE="^QA(743,",DR="30;57//NO;58//NO;59//NO;60//NO;61"_$S(QAM["%":"",1:"T")_"//NO",DA=QAMD0 D ^DIE G:$D(Y) EN1
 S QA=$S($D(^QA(743,QAMD0,1))#2:^(1),1:"") I $P(QA,"^",10)+$P(QA,"^",11)+$P(QA,"^",12) K DR S DIE="^QA(743,",DR="62",DA=QAMD0 D ^DIE G:$D(Y) EN1
 K DR S DIE="^QA(743,",DR="200;100;55;56;54//OFF",DA=QAMD0 D ^DIE G:$D(Y) EN1
 S QAMMSGS="EW" D ^QAMSANE G:Y=-1 EN1 W !
 K DR S DIE="^QA(743,",DR="7//UNDER CONSTRUCTION",DA=QAMD0 D ^DIE
 G EN1
EXIT ;
 K %Y,D0,D1,DA,DI,DIC,DIE,DIK,DLAYGO,DQ,DR,J,QA,QAM,QAMAUTO,QAMD0,QAMOUT,QAMFIN,QAMSEPR8,QAMSVCND,X,Y
 Q
DELCR ; *** DELETE CONDITIONS AND RELATIONSHIP
 F QAMD1=0:0 S QAMD1=$O(^QA(743,QAMD0,"COND",QAMD1)) Q:QAMD1'>0  S DA=QAMD1,DA(1)=QAMD0,DIK="^QA(743,"_DA(1)_",""COND""," D ^DIK
DELR K DR S DIE="^QA(743,",DR="25///@;26///@;64///@",DA=QAMD0 D ^DIE
 Q
