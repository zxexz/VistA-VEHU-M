FBNHDIEP ;AISC/GRR-DISPLAY EPISODE OF CARE FOR NURSING HOME ;29AUG88
 ;;3.5;FEE BASIS;;JAN 30, 1995
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
RD1 D GETVET^FBAAUTL1 G:DFN']"" Q
RD2 S DIC("S")="I $P(^(0),U,3)=""A""&($P(^(0),U,2)=DFN)",DIC="^FBAACNH(",DIE=DIC,DIC(0)="AEQMZ",DLAYGO=162.3,DIC("A")="Select Admission Date/Time: " D ^DIC K DIC,DLAYGO G RD1:X="^"!(X=""),RD2:Y<0 S DA=+Y,IFN=DA
 D ^FBNHDEC G RD1
Q K DIC,DIE,DR,DA,DFN,FBTYPE,FTP,Y,X,FBPROG,FBAAAD,FBAT,FBPDT,IFN
 Q
