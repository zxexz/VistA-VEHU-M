GMRVSAS0 ;HIRMFO/RM,YH-CALCULATE ABNORMAL V/S ;09/11/96
 ;;4.0;Vitals/Measurements;**11**;Apr 25, 1997
EN1 ; SENT GMRVX = "T","P","R","BP","CG","PO2" AS VITAL TYPE CODE, GMRVX(0) AS VITAL
 ; DATA.  RETURN GMRVX(1)=0 IF WITHING NORMAL RANGE, 1 IF ABNORMAL
 N GMRVSBSH,GMRVSBSL,GMRVHI,GMRVLO,GMRVADAT,GMRVBP2
 S GMRVX(1)=0 Q:'$D(GMRVX)#2  Q:'$D(GMRVX)\2  Q:GMRVX(0)=""  Q:'$D(^GMRD(120.57,1,1))
 I "TPRBPCGPO2"']GMRVX Q
 S GMRVSBSH=$S(GMRVX="T":1,GMRVX="P":3,GMRVX="R":5,GMRVX="CVP":11,GMRVX="B"!(GMRVX="BP"):7,1:0) Q:GMRVX'="PO2"&(GMRVSBSH'>0)
 S GMRVSBSL=$S(GMRVX="T":2,GMRVX="P":4,GMRVX="R":6,GMRVX="CVP":12,GMRVX="PO2":13,GMRVX="B"!(GMRVX="BP"):9,1:0) Q:GMRVSBSL'>0
 I GMRVX="BP"!(GMRVX="B") S GMRVSBSH(0)=8,GMRVSBSL(0)=10
 S GMRVADAT=^GMRD(120.57,1,1)
 S GMRVHI=$S(GMRVSBSH>0:$P(GMRVADAT,"^",GMRVSBSH),1:0),GMRVLO=$S(GMRVSBSL>0:$P(GMRVADAT,"^",GMRVSBSL),1:0)
 I GMRVX="PO2" S:GMRVX(0)'>GMRVLO GMRVX(1)=1 Q
 I GMRVX="BP"!(GMRVX="B") S GMRVHI(0)=$P(GMRVADAT,"^",GMRVSBSH(0)),GMRVLO(0)=$P(GMRVADAT,"^",GMRVSBSL(0)),GMRVBP2=$S($P(GMRVX(0),"/",3)="":$P(GMRVX(0),"/",2),1:$P(GMRVX(0),"/",3))
 S GMRVX(1)=0
 I $P(GMRVX(0),"/")'<GMRVHI!($P(GMRVX(0),"/")'>GMRVLO) S GMRVX(1)=1
 Q:(GMRVX="BP"!(GMRVX="B"))&($G(GMRVBP2)="")
 I (GMRVX="BP"!(GMRVX="B")),(GMRVBP2'<GMRVHI(0)!(GMRVBP2'>GMRVLO(0))) S GMRVX(1)=1
 Q
