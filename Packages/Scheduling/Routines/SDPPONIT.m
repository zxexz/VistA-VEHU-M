SDPPONIT ; ; 22-OCT-1993
 ;;5.3;Scheduling;**6**;AUG 13, 1993
 ;
 K DIF,DIK,DDF,DDT,DTO,D0,DLAYGO,DIC,DIR,DA,ORVROM,DFR,DTN,DIX,DZ
 S DIFQ=0,ORVROM=22 W !!,"This version of 'SDPPONIT' was created on 22-OCT-1993"
 W !?9,"(at ALBANY ISC VAX DEVELOPMENT, by OE/RR V.2.5)",!
 G Q:DIFQ D ^SDPPONI1 G Q:'$D(DIFQ) S DIK(0)="B"
 D ^SDPPONI2,^SDPPONI3
 L  W !,*7,"OK, Protocol Installation is Complete.",!
 K %ZW,%,%H,D0,DA,DIF,DIFQ,DIG,DIH,DIK,DIU,DIV,DSEC,I,J,KEY,DIY,N,NM,NO,ORVROM,R,X,X0
 Q
 ;
Q W *7,!!,"NO UPDATING HAS OCCURRED!" Q
 ;
IXF ;;SDPP
