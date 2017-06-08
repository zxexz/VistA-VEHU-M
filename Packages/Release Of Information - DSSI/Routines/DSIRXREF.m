DSIRXREF ;AMC/EWL - Document Storage Systems Inc; ROI Mumps Xref code ;04/14/2011 11:18
 ;;8.2;RELEASE OF INFORMATION - DSSI;;Nov 08, 2011;Build 25
 ;Copyright 1995-2012, Document Storage Systems, Inc., All Rights Reserved
 ;
 ;DBIA# Supported Reference
 ;----- --------------------------------
 ;      None
 ; These routines are called by FILEMAN Data Dictionary for maintaining the
 ; cross references for FOIA.
 Q
SETAFOIA(ROI) ;Set logic for AFOIA xref on file 19620 field 10.06
 Q:'$G(ROI)
 N CLDT S CLDT=+$P($G(^DSIR(19620,ROI,10)),"^",7)
 I 'CLDT S ^DSIR(19620,"AFOIA",ROI)=""
 Q
KILAFOIA(ROI) ;Kill logic for AFOIA xref on file 19620 field 10.06
 Q:'$G(ROI)
 K ^DSIR(19620,"AFOIA",ROI)
 Q
SETAFCLD(ROI,FCDT) ;Set logic for AFCLD xref on file 19620 field 10.07
 Q:'$G(ROI)
 Q:'$G(FCDT)
 S ^DSIR(19620,"AFCLD",FCDT,ROI)="" K ^DSIR(19620,"AFOIA",ROI) Q
 Q
KILAFCLD(ROI,FCDT) ;Kill logic for AFCLD xref on file 19620 field 10.07
 Q:'$G(ROI)
 Q:'$G(FCDT)
 K ^DSIR(19620,"AFCLD",FCDT,ROI) S ^DSIR(19620,"AFOIA",ROI)=""
 Q
SETAPT(PTR,REC) ; THIS ROUTINE IS USED TO SET THE "APT" INDEX ON 19620 FOR LOOKUPS
 ; THIS IS A MUMPS INDEX THAT IS PROGRAMMATICALLY UPDATED BASED ON THE VALUE IN THE .01 FIELD
 ; THE INDEX VALUES ARE AS FOLLOWS: 
 ; P - REGISTERED PATIENT REQUEST
 ; F - FOIA REQUEST
 ; N - NON-REGISTERED PATIENT REQUEST
 ; B - REGISTERED OR NON-REGISTERED PATIENT REQUEST
 ; INPUT PARAMETERS: 
 ; PTR = ZERO NODE FROM 19620 OR THE .01 FIELD (EITHER WILL WORK
 ; REC = IEN
 N TYP,T1
 S T1=$P($P(PTR,","),".",2)
 S TYP=$S(T1=95:"F",T1=96:"N",1:"P")
 I TYP="P" S ^DSIR(19620,"APT","P",REC)="",^DSIR(19620,"APT","B",REC)=""
 I TYP="N" S ^DSIR(19620,"APT","N",REC)="",^DSIR(19620,"APT","B",REC)=""
 I TYP="F" S ^DSIR(19620,"APT","F",REC)=""
 Q
KILLAPT(REC) ; THIS ROUTINE IS USED TO KILL "APT" INDEX ENTRIES ON 19620
 K ^DSIR(19620,"APT","P",REC),^DSIR(19620,"APT","B",REC),^DSIR(19620,"APT","F",REC)
 Q
