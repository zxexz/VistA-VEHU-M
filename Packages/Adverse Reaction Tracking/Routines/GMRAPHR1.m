GMRAPHR1 ;HIRMFO/WAA,FT-ADD/DELETE/EDIT CONCOMITANT DRUGS ;4/6/05  14:18
 ;;4.0;Adverse Reaction Tracking;**5,23**;Mar 29, 1996
EN1 ;
 Q:GMRAOUT
 W @IOF N DIE,DA,GMRAXXX,GMRAX,GMRAGHC
 K ^UTILITY("PSG",$J),^UTILITY("PSIV",$J),GMRARRAY
 S GMRADT=$P(^GMR(120.85,GMRAPA1,0),U)
 D ^GMRADSP7 G:'GMRAPA EXIT
SELECT W ! D LST
 ;SELECT ACTION
 K DIR S DIR(0)="SOMBA^A:ADD;D:DELETE;E:EDIT",DIR("A")="Select Action (A/D/E): "
 S DIR("?",1)="ENTER A TO ADD A NEW DRUG, D TO DELETE A DRUG OR"
 S DIR("?")="E TO EDIT A DRUG ON FILE FOR THIS PATIENT"
 D ^DIR I "^^"[Y S GMRAOUT=$L(Y) G EXIT
 S GMRASEL=Y K DIR
 I GMRASEL="A" S GMRALOOK=0 W ! D ADD K GMRALOOK G:GMRAOUT EXIT K GMRALOOK G SELECT
 I GMRASEL="D" W ! D DEL G:GMRAOUT EXIT G SELECT
 I GMRASEL="E" W ! D EDIT G:GMRAOUT EXIT G SELECT
 G SELECT
EDIT ;EDIT A DRUG
 I '$O(^GMR(120.85,GMRAPA1,13,0)) W !,?3,"YOU CANNOT EDIT WHEN THERE IS NO DATA ON FILE.",$C(7) Q
EDITLST ; DISPLAY TO EDIT FIELD
 W !,"Select the DRUG RX you want to edit:",!
 D LST
EEDT K DA,DO,DIC,DIE,DLAYGO,DR
 S DA(1)=GMRAPA1,DIC="^GMR(120.85,"_DA(1)_",13,",DIC(0)="AMQEZ" D ^DIC K DIC
 I $D(DUOUT)!($D(DTOUT))!(Y=-1) S GMRAOUT=1 G QE
 S DA(1)=GMRAPA1,DIE="^GMR(120.85,"_DA(1)_",13,",DA=+Y,DR=".01;1;2;3;4" D ^DIE
QE K GMRAX,DA,DIE,DR,DIC,DLAYGO
 Q
ADD ;SELECT ON OF THE DRUG OR FREE TEXT
 D DISP^GMRAPHR0 I GMRAOUT S GMRAOUT=GMRAOUT-1 Q:GMRAOUT
 K % I '$D(GMRARRAY) D ADD2 Q:X=""!(X="^")  G ADD
ADDED W !,"Enter the number(s) of the DRUG to ADD or ""N"" for NEW: "
 R GMRAX:DTIME S:'$T GMRAX="^^" I "^^"[GMRAX S GMRAOUT=$L(GMRAX) Q
 I "??"[GMRAX W !,"ENTER THE NUMBER(S) OF THE ENTRY YOU WANT OR ""N"" FOR A NEW DRUG" G:$L(GMRAX)=1 ADDED G ADD
 I GMRAX="n" S GMRAX="N"
 I GMRAX="N" D ADD2 Q:X=""  G ADD
 I '$$VALST^GMRAPHR2(GMRAX,"PH") W !,$C(7),"INVALID SELECTION PLEASE SELECT ONE OF THE DRUGS LISTED OR ""N"" FOR A NEW DRUG" G ADD
 S GMRALST=0 F  S GMRALST=$O(GMRALST(GMRALST)) Q:GMRALST<1  S GMRAX=GMRALST D  Q:GMRAOUT
 .S X=$P(GMRARRAY("PH",GMRAX),U,2)
 .I $D(^GMR(120.85,GMRAPA1,13,"B",X)) D  Q:GMRAOUT!(%-1)  K %
 ..W !,"You already have a ",X," drug on file."
 ..S %=2 F  W !,"Do You still want to add this one" D YN^DICN S:%=-1 %=2,GMRAOUT=1 Q:%  W !,"ENTER YES TO ADD THE DRUG or NO TO SELECT ANOTHER"
 ..Q
 .K DD,DO
 .I '$O(^GMR(120.85,GMRAPA1,13,0)) S ^(0)="^120.8513^^"
 .S DA(1)=GMRAPA1,DIC="^GMR(120.85,"_GMRAPA1_",13,",DIC(0)="L",DLAYGO=120.85 D FILE^DICN Q:(+Y<1)
 .S DA=+Y,DIE=DIC K DIC
 .I $P(GMRARRAY("PH",GMRAX),U)="OP" S DR="3////"_$P(GMRARRAY("PH",GMRAX),U,4)_";4////"_$E($P(GMRARRAY("PH",GMRAX),U,3),1,30)
 .I $P(GMRARRAY("PH",GMRAX),U)="D" D
 ..S DR="1////"_$P(GMRARRAY("PH",GMRAX),U,6)_";2////"_$P($P(GMRARRAY("PH",GMRAX),U,7),".") ;23 Only get date
 ..S DR=DR_";4////"_$P(GMRARRAY("PH",GMRAX),U,3)_" "_$P(GMRARRAY("PH",GMRAX),U,4)_" "_$P(GMRARRAY("PH",GMRAX),U,5)
 ..Q
 .I $P(GMRARRAY("PH",GMRAX),U)="IV" D
 ..S DR="1////"_$P(GMRARRAY("PH",GMRAX),U,6)_";2////"_$P($P(GMRARRAY("PH",GMRAX),U,7),".") ;23 Get date not time
 ..S DR=DR_";4////"_$P(GMRARRAY("PH",GMRAX),U,3)_" IV "_$P(GMRARRAY("PH",GMRAX),U,4)_" "_$P(GMRARRAY("PH",GMRAX),U,5)
 ..Q
 .D ^DIE K DIE,DA,DR,GMRAX
 .Q
 ;G ADD
 Q
ADD2 ;
 I '$O(^GMR(120.85,GMRAPA1,13,0)) S ^(0)="^120.8513^^"
 S DA=GMRAPA1,DIE="^GMR(120.85,",DLAYGO=120.85,DR="13" D ^DIE
 K DIE,DA,DR
 Q
DEL ;
 I '$D(^GMR(120.85,GMRAPA1,13,0)) W !,"THERE ARE NO DRUGS SELECTED FOR THIS PATIENT." Q
 K DA,DO,DIC,DIE,DLAYGO,DR
 S DA(1)=GMRAPA1,DIC="^GMR(120.85,"_DA(1)_",13,",DIC(0)="AMQEZ" D ^DIC
 I $D(DUOUT)!($D(DTOUT))!(Y=-1) S GMRAOUT=1 G DQ
 K DIC,DA,DO
 S DA(1)=GMRAPA1,DIK="^GMR(120.85,"_DA(1)_",13,",DA=+Y D ^DIK W "DELETED.."
DQ K DIC,DIC,DA,DO,DLAYGO,DIK,Y
 Q
LST I '$O(^GMR(120.85,GMRAPA1,13,0)) W !,"THIS PATIENT HAS NO CONCOMITANT DRUGS ON FILE" Q
 W !!,"This patient has the following Drugs selected: ",!
 S GMRAX=0 F GMRAXX=1:1  S GMRAX=$O(^GMR(120.85,GMRAPA1,13,GMRAX)) Q:GMRAX<1  W !,?10,$P(^(GMRAX,0),U)
 W ! K GMRAXX,GMRAX
 Q
EXIT ;EXIT LINE
 K DIR,Y,GMRALST,GMRASEL,GMRABGDT,GMRAENDT,^UTILITY("PSG",$J),^UTILITY("PSIV",$J),GMRARRAY
 Q
