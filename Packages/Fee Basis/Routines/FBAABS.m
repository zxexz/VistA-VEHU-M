FBAABS ;AISC/GRR - DISPLAY BATCH STATUS ;4/4/2012
 ;;3.5;FEE BASIS;**132**;JAN 30, 1995;Build 17
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
BT K FBAANQ W !! S DIC="^FBAA(161.7,",DIC(0)="AEQM" D ^DIC G Q:X="^"!(X=""),BT:Y<0 S DA=+Y
 S VAR="DA",VAL=DA,PGM="START^FBAABS" D ZIS^FBAAUTL G Q:FBPOP S:IO=IO(0) FBAANQ=1
START U IO W:$E(IOST,1,2)="C-" @IOF S DIC="^FBAA(161.7,",DIC(0)="AEQM",DR="0:1;ST" D EN^DIQ
 G:$D(FBAANQ) BT
Q D CLOSE^FBAAUTL K DIC,DA,DR,X,Y,FBAANQ,A,D0,DL,DRX,PGM,S,VAL,VAR Q
