ONCPPC5 ;HIRMFO/GWB - PCE Studies of Prostate Cancer - Table V;7/22/96
 ;;2.2;ONCOLOGY;**1**;Jul 31, 2013;Build 8
 K TABLE,HTABLE
 S TABLE("TYPE OF FIRST RECURRENCE")="TOFR"
 S TABLE("DATE OF FIRST RECURRENCE")="DOFR"
 S TABLE("METHODS USED TO DIAGNOSE FIRST RECURRENCE")="MUTDFR"
 S HTABLE(1)="TYPE OF FIRST RECURRENCE"
 S HTABLE(2)="DATE OF FIRST RECURRENCE"
 S HTABLE(3)="METHODS USED TO DIAGNOSE FIRST RECURRENCE"
 S CHOICES=3
 W @IOF D HEAD^ONCPPC0 W !?27,"TABLE V - FIRST RECURRENCE",!
 S DIC="^ONCO(165.5,",DR="70",DA=ONCONUM,DIQ="ONCO" D EN^DIQ1
 S TOFR=""
TOFR S DIE="^ONCO(165.5,",DA=ONCONUM
 S DR="71TYPE OF FIRST RECURRENCE........" D ^DIE G:$D(Y) JUMP
 S TOFR=X
DOFR S DR="70DATE OF FIRST RECURRENCE........" D ^DIE G:$D(Y) JUMP
 I (TOFR=4)!(TOFR=5)!(TOFR=9) D  G PRTC
 .F PIECE=50:1:56 S $P(^ONCO(165.5,ONCONUM,"PRO1"),U,PIECE)=""
MUTDFR W !!,"METHODS USED TO DIAGNOSE FIRST RECURRENCE:",!
 S DR="649  BACKACHE......................" D ^DIE G:$D(Y) JUMP
 S DR="650  BONE SCAN....................." D ^DIE G:$D(Y) JUMP
 S DR="651  LETHARGY......................" D ^DIE G:$D(Y) JUMP
 S DR="652  RECTAL EXAM WITH NEEDLE BIOSPY" D ^DIE G:$D(Y) JUMP
 S DR="653  TUMOR MARKER ELEVATION........" D ^DIE G:$D(Y) JUMP
 S DR="654  WEIGHT LOSS..................." D ^DIE G:$D(Y) JUMP
 S DR="655  OTHER........................." D ^DIE G:$D(Y) JUMP
PRTC W ! K DIR S DIR(0)="E" D ^DIR
 G EXIT
JUMP ;Jump to prompts
 S XX="" R !!,"GO TO: ",X:DTIME I (X="")!(X[U) S OUT="Y" G EXIT
 I X["?" D  G JUMP
 .W !,"CHOOSE FROM:" F I=1:1:CHOICES W !,?5,HTABLE(I)
 I '$D(TABLE(X)) S XX=X,X=$O(TABLE(X)) I ($P(X,XX,1)'="")!(X="") W *7,"??" D  G JUMP
 .W !,"CHOOSE FROM:" F I=1:1:CHOICES W !,?5,HTABLE(I)
 S X=TABLE(X)
 G @X
EXIT K CHOICES,HTABLE,TABLE
 K PIECE
 K DA,DIE,DIR,DIROUT,DIRUT,DR,DTOUT,DUOUT,X,XX,Y
 Q
