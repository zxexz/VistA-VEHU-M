RTQ3 ;MJK/TROY ISC;ADT Link; ; 5/21/87  3:21 PM ; [ 05/03/95  8:27 AM ]
 ;;v 2.0;Record Tracking;;10/22/91 
ADM I $D(RTAPL) D SAVE^RTPSET1,NEXT,RESTORE^RTPSET1 Q
NEXT Q:'$D(^DIC(195.4,1,"MAS"))  S Y=+^("MAS") D APL1^RTPSET S IOP="" D ^%ZIS K IOP S Y=0
 I $D(^RTV(195.9,"ADEV",ION)),$D(^RTV(195.9,+$O(^(ION,0)),0)),$D(^SC(+$P(^(0),U,2),0)),$P(^(0),"^",3)="Z",$D(^DIC(40.9,+$P(^(0),"^",22),0)),$P(^(0),"^",2)="AA" S Y=+$P(^RTV(195.9,+$O(^RTV(195.9,"ADEV",ION,0)),0),U,2)
 I '$D(^SC(Y,0)) W ! S DIC("S")="I $P(^(0),U,3)=""Z"",$D(^DIC(40.9,+$P(^(0),U,22),0)),$P(^(0),U,2)=""AA""" S DIC("A")="Select Admitting Area: ",DIC(0)="IAEMQ",DIC="^SC(" D ^DIC K DIC G Q:Y<0
 I Y S SDSC=+Y D NOW^%DTC S SDTTM=%,SDPL=0 D NEW:$P(DGFC,"^",2),ASK,QUE^RTQ2:$E(X)="Y"
Q K SDSC,SDTTM,SDPL,RTAPL Q
 ;
ASK S RTRD(1)="YES^request records",RTRD(2)="NO^indicate no records to be requested",RTRD("A")="ISSUE REQUEST FOR RECORDS? ",RTRD(0)="S",RTRD("B")=1 D SET^RTRD K RTRD Q
 ;
NEW S RTRD(1)="YES^print barcode labels",RTRD(2)="NO^do not print barcode labels",RTRD("B")=1,RTRD("A")="PRINT BARCODE LABELS FOR PATIENT'S FOLDERS? ",RTRD(0)="S" D SET^RTRD K RTRD Q:$E(X)'="Y"
 ;
NOASK S RTADM="",RTE=DFN_";DPT(",RTA=+RTAPL,RTB=SDSC_";SC(",Y=+$O(^RTV(195.9,"ABOR",RTB,RTA,0)) D SET^RTDPA3:'Y S RTB=Y,RTFR=Y_"^"_$P(^RTV(195.9,Y,0),"^",2,99) S:$P(RTSYS,"^",4)="e" $P(RTFR,"^",4,6)="^^"
 S X="A" D SAVE S X=Y,A=RTA D INST1^RTUTL G NOASKQ:'$D(RTINST) S RTDIV=RTINST K RTINST
 F RTBLD=0:0 S RTBLD=$O(^RTV(195.9,RTB,"RECS",RTBLD)) Q:'RTBLD  I $D(^(RTBLD,0)) S X=^(0) I $D(^DIC(195.2,+X,0)),$P(X,"^",2)]"",$P(X,"^",2)'="n" S RTTY=+X,RTAPL=+$P(X,"^",3) I '$D(^RT("AT",RTTY,RTE)) D TYPE1^RTDPA1
NOASKQ S X="A" D RESTORE K RTSYS,RTDIV,RTA,RTB,RTFR,RTE,RTADM,RTBLD,RTTY,RTAPL Q
 ;
SAVE K RTMASAVE X "I $D("_X_")#2 S RTMASAVE=@X" I @("$D("_X_")>9") S %X=X_"(",%Y="RTMASAVE(" D %XY^%RCR
 Q
 ;
RESTORE S:$D(RTMASAVE)#2 @X=RTMASAVE I $D(RTMASAVE)>9 S %X="RTMASAVE(",%Y=X_"(" D %XY^%RCR
 K RTMASAVE Q
