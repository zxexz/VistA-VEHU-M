ONCBRP3 ;HINES CIOFO/GWB - 1998 Breast Cancer Study - Table III ;6/1/98
 ;;2.2;ONCOLOGY;**1**;Jul 31, 2013;Build 8
 K TABLE,HTABLE
 S TABLE("35. (M) DNA INDEX/PLOIDY")="DIP"
 S TABLE("36. ESTROGEN RECEPTOR PROTEIN")="ERP"
 S TABLE("37. PROGESTERONE RECEPTOR PROTEIN")="PRP"
 S TABLE("38. (M) ANDROGEN RECEPTOR PROTEIN")="ARP"
 S TABLE("39. TYPE OF TEST")="TT"
 S HTABLE(1)="35. (M) DNA INDEX/PLOIDY"
 S HTABLE(2)="36. ESTROGEN RECEPTOR PROTEIN"
 S HTABLE(3)="37. PROGESTERONE RECEPTOR PROTEIN"
 S HTABLE(4)="38. (M) ANDROGEN RECEPTOR PROTEIN"
 S HTABLE(5)="39. TYPE OF TEST"
 S CHOICES=5
 K DIQ S DIC="^ONCO(165.5,",DR="25.1;25.2",DA=ONCONUM,DIQ="ONC"
 S DIQ(0)="IE" D EN^DIQ1
 S DIE="^ONCO(165.5,",DA=ONCONUM
 W @IOF D HEAD^ONCBRP0
 W !," TABLE III - TUMOR MARKERS AND PROGNOSTIC TESTS"
 W !," ----------------------------------------------"
DIP I $$GET1^DIQ(160,ONCOPA,10,"I")=2 D  G ERP
 .S $P(^ONCO(165.5,ONCONUM,"BRE1"),U,38)=""
 .W !," 35. (M) DNA INDEX/PLOIDY.........: (Data Item for Males Only)"
 S DR="937 35. (M) DNA INDEX PLOIDY........." D ^DIE G:$D(Y) JUMP
ERP W !," 36. ESTROGEN RECEPTOR PROTEIN....: ",ONC(165.5,ONCONUM,25.1,"E")
PRP W !," 37. PROGESTERONE RECEPTOR PROTEIN: ",ONC(165.5,ONCONUM,25.2,"E")
ARP I $$GET1^DIQ(160,ONCOPA,10,"I")=2 D  G TT
 .S $P(^ONCO(165.5,ONCONUM,"BRE1"),U,41)=""
 .W !," 38. (M) ANDROGEN RECEPTOR PROTEIN: (Data Item for Males Only)"
 S DR="940 38. (M) ANDROGEN RECEPTOR PROTEIN" D ^DIE G:$D(Y) JUMP
TT S ERA=$P($G(^ONCO(165.5,ONCONUM,"BRE1")),U,39)
 S PRA=$P($G(^ONCO(165.5,ONCONUM,"BRE1")),U,40)
 I ERA=0,PRA=0 D  G PRTC
 .S $P(^ONCO(165.5,ONCONUM,"BRE1"),U,42)=0
 .W !," 39. TYPE OF TEST.................: Neither ERA nor PRA was done"
 I ERA=9,PRA=9 D  G PRTC
 .S $P(^ONCO(165.5,ONCONUM,"BRE1"),U,42)=9
 .W !," 39. TYPE OF TEST.................: Unknown if ERA/PRA was done"
 S DR="941 39. TYPE OF TEST................." D ^DIE G:$D(Y) JUMP
PRTC W ! K DIR S DIR(0)="E" D ^DIR S:$D(DIRUT) OUT="Y"
 G EXIT
JUMP ;Jump to prompts
 S XX="" R !!," GO TO ITEM NUMBER: ",X:DTIME I (X="")!(X[U) S OUT="Y" G EXIT
 I X["?" D  G JUMP
 .W !," CHOOSE FROM:" F I=1:1:CHOICES W !,?5,HTABLE(I)
 I '$D(TABLE(X)) S:X?1.2N X=X_"." S XX=X,X=$O(TABLE(X)) I ($P(X,XX,1)'="")!(X="") W *7,"??" D  G JUMP
 .W !," CHOOSE FROM:" F I=1:1:CHOICES W !,?5,HTABLE(I)
 S X=TABLE(X)
 G @X
EXIT K CHOICES,HTABLE,TABLE
 K DA,DIE,DIR,DIROUT,DIRUT,DR,DTOUT,DUOUT,X,XX,Y
 Q
