GMRGTGI2 ;CISC/RM,RTK-PRIME DOCUMENT EDIT (cont.) ;8/23/93
 ;;3.0;Text Generator;;Jan 24, 1996
EN1 ; ENTRY FROM CHOOSING WHETHER TO EDIT THE TERM, EDIT THE SELECTION
 ; ADD A SELECTION OR DELETE A SELECTION.
 ; Y=$S(#:EDIT SEL.,"T"!"t":EDIT TERM,"A"!"a":ADD,#_@:DELETE)
 I 'GMRGINFO("SEL"),Y?1N.N0.1"@" W !,$C(7),"NO SELECTIONS!!" Q
 I Y?1N.N0.1"@"!(Y?1N.N1"D")!(Y?1N.N1"d") I +Y<1!(+Y>GMRGINFO("SEL")) W !?3,$C(7),"CHOOSE A NUMBER IN THE SELECTION LIST ABOVE PLEASE" Q
 G TERM:"Tt"[Y,ADD:"Aa"[Y,DELETE:Y?1N.N1"@",SEL:Y?1N.N,DISPLAY:Y?1N.N1"D"!(Y?1N.N1"d")
 Q
TERM ; EDIT THE ENTRY
 I $P(GMRGINFO("CLAS"),U,2)="PRIME DOCUMENT" W !,"NAME: ",$P(GMRGINFO("TEXT"),U),"// (UNEDITABLE)"
 E  D  Q:GMRGOUT  I $G(GMRGRASK) K GMRGRASK G TERM
 .  K GMRGRASK W !,"NAME:" S (GMRGTX("@"),GMRGTX(1))=0,GMRGTX(0)=$P(GMRGINFO("TEXT"),"^") D EN1^GMRGED3 S X=$S(GMRGTX(0)'="":GMRGTX(0),1:"@") I GMRGOUT S GMRGOUT=0 Q
 .  I X?1P.E,X'?1"[".E,X'?1"<".E W !?3,$C(7),$S(X="@":"CANNOT DELETE",1:"Answer must free text 3-60 characters") S GMRGRASK=1 Q
 .  I X'=$P(GMRGINFO("TEXT"),"^") S GMRGT=X D CHK^GMRGTGI0 Q:GMRGOUT!GMRGDUP  W !,".changing '",$P(GMRGINFO("TEXT"),"^"),"' to '",GMRGT,"'" S DIE="^GMRD(124.2,",DA=GMRGINFO,DR=".01///^S X=GMRGT" D ^DIE I $S($D(Y):1,1:0) S GMRGRASK=1 Q
 .  Q
 S DA=GMRGINFO,DIE="^GMRD(124.2,",DR="[GMRG EDIT TERM]" D ^DIE K DIC
 S X="`"_DA,DIC=DIE,DIC(0)="Q" D ^DIC I +Y>0 K GMRGINFO S GMRGINFO=+Y D INFOSET^GMRGTGI0
 Q
SEL ; EDIT THE SELETION
 S GMRGSEL=$P(GMRGINFO("SEL",+Y),"^",2) D DOWN^GMRGTGI1 Q:GMRGOUT
B D EN2^GMRGTGIF I GMRGUP D UP^GMRGTGI1 S GMRGUP=0 Q
 G:'GMRGOUT B
 Q
ADD ; ADD SELECTIONS
 I $P(GMRGINFO("TYPE"),"^")=3 W !!?3,$C(7),"You cannot add selections to an aggregate term which is of type 'TERM'"
 I  W !?3,"If you want to add selections for this term, then first edit the TYPE",!?3,"of this term and change it to something other than 'TERM'." Q
 W ! S DX=$X,DY=0 X ^%ZOSF("XY") W !,"Select term to add: " R X:DTIME S:'$T!(X="^")!(X="^^") GMRGOUT=1 Q:X=""!GMRGOUT  S GMRGX=X
 S DIC("S")="I GMRGINFO'=+Y,$P(^(0),U,2)'<$P(GMRGINFO(""TYPE""),U) S GMRGZ=$O(^GMRD(124.2,GMRGINFO,1,""B"",+Y,0)) I $S(GMRGZ'>0:1,'$D(^GMRD(124.2,GMRGINFO,1,GMRGZ,0)):1,'$P(^(0),U,6):0,1:1)",DIC(0)="EN",DIC="^GMRD(124.2," D ^DIC
 K DIC G:X?."?" ADD S I(0)=$L(X) F I=1:1:I(0) Q:$E(X)'=" "  S X=$E(X,2,$L(X))
 I X="" W $C(7),"  ??" G ADD
YNOK I +Y>0 W !,"Is this the entry you want" S %=1 D YN^DICN S:%=2 Y=-1 S:%=-1 GMRGOUT=1 S:%=1 GMRGX=X Q:GMRGOUT  I '% W !?5,"Answer Yes if this is the record you meant to select, else answer No." G YNOK
 I +Y'>0 S DIC("DR")=".02;K DIC(""S"");.03///^S X=GMRGPK",DLAYGO=124.2,DIC(0)="EL",X=""""_GMRGX_"""",DIC="^GMRD(124.2," D ^DIC K DIC,DLAYGO G:+Y'>0 ADD
 W ! S:'$D(^GMRD(124.2,GMRGINFO,1,0)) ^(0)="^124.21PI^^0" W "."
 S GMRGZ=$O(^GMRD(124.2,GMRGINFO,1,"B",+Y,0)),GMRGZ(0)=+Y
 I GMRGZ>0 S DA(1)=GMRGINFO,DA=GMRGZ,DIE="^GMRD(124.2,DA(1),1,",DR="5///^S X=0" D ^DIE
 I GMRGZ'>0 S X=+Y,DIC="^GMRD(124.2,DA(1),1,",(D0,DA(1))=GMRGINFO,DLAYGO=124.21,DIC(0)="LZ" K DD D FILE^DICN K DIC,DLAYGO W "." I +Y'>0 W !?3,$C(7),"Could not add this term to the selection list??" G ADD
 K GMRGINFO S GMRGINFO=DA(1) D INFOSET^GMRGTGI0 W "added"
 Q
DELETE ; DELETE SELECTIONS
 W !,"..." G:$P(GMRGRT(0),"^",3)'=GMRGPK STDLFL
 S DA(1)=GMRGINFO,DIK="^GMRD(124.2,DA(1),1,",DA=$P(GMRGINFO("SEL",+Y),"^") D ^DIK G RSINAR
STDLFL S DA(1)=GMRGINFO,DA=$P(GMRGINFO("SEL",+Y),"^"),DIE="^GMRD(124.2,DA(1),1,",DR="5///^S X=1" D ^DIE
RSINAR W "." K GMRGINFO S GMRGINFO=DA(1) D INFOSET^GMRGTGI0 W "deleted"
 Q
DISPLAY ;
 W !!?3,$P(GMRGINFO("SEL",+Y),"^",3) S DA(1)=GMRGINFO,DA=$P(GMRGINFO("SEL",+Y),"^"),DIE="^GMRD(124.2,DA(1),1,",DR=6_"     DISPLAY ORDER" D ^DIE S:$D(Y) GMRGOUT=1 Q:GMRGOUT
 S Y=GMRGINFO K GMRGINFO S GMRGINFO=+Y D INFOSET^GMRGTGI0
 Q
