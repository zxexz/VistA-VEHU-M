DENTDBL ;WASH ISC/TJK-UTILITY TO ASTERIK OUT ENTRIES ON SCREEN ;12/07/90  9:10 AM;12/06/91  9:38 AM
 ;;1.2;DENTAL;***15**;Oct 08, 1992
START Q:'$D(DJBLO)  Q:DJBLO=""  F DJBNO=1:1 S DJBITEM=$P(DJBLO,",",DJBNO) Q:DJBITEM=""  D
    .Q:'$D(DJJ(DJBITEM))  S DJDB=""
    .S $P(DJDB,"*",$P(DJJ(DJBITEM),U)+1)=""
    .S @($P(DJJ(DJBITEM),U,2))
    .K DJP1,DJP2,DJP8
    .X XY W DJDB S DJBHOLD=DJJ(DJBITEM),DJBITEM1=DJBITEM K DJJ(DJBITEM),V(DJBITEM)
 S DY=16,DX=10 X XY W DJHIN,"[Asterisks (*) indicate field n/a to this record]"
 G EXIT:$D(DJJ(V))
 S DJNX=$O(DJJ(V)) I DJNX="" S DY=17,DX=0 X XY W "Press <RETURN> to Continue" S V=DJBITEM1,DJJ(V)=DJBHOLD,DJNX=DJBITEM1,$P(DJJ(V),U,1,2)="2^DY=17,DX=27"
 E  S V=DJNX
EXIT K DJBLO,DJBNO,DJDB,DJBITEM,DJBITEM1,DJBHOLD
 Q
