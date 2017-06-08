PSGOTR ;BIR/CML3-TRANSFERS RENEW DATA FROM 53.1 TO 55 ;23 SEP 03 / 7:54 AM
 ;;5.0;INPATIENT MEDICATIONS;**110,127,133,129,267,257,255**;16 DEC 97;Build 8
 ;
 ; Reference to ^PS(55 supported by DBIA 2191.
 ;
START(ODA,DA) ; lock record, and write
 N OFD,PVND4,PSGPV S OFD=""
 S OFD=$P($G(^PS(55,PSGP,5,DA,2)),"^",4) K:OFD ^PS(55,"AUD",+OFD,PSGP,+DA)
 S ND2=^PS(53.1,+ODA,2) S ^PS(55,"AUD",+$P(ND2,"^",4),PSGP,DA)=""
 ;PSJ*5*255 - Record renewing provider
 I $P(^PS(53.1,+ODA,0),U,2)]"" S PSGPV=$P(^PS(53.1,+ODA,0),U,2) D
 . N DR,DIE
 . S DR="1////^S X=PSGPV",DIE="^PS(55,"_PSGP_",5,",DA(1)=PSGP D ^DIE
 ;End PSJ*5*255
 F X=6,7 I $D(^PS(53.1,+ODA,X)) S ^PS(55,PSGP,5,DA,X)=^(X)
 I $O(^PS(53.1,+ODA,1,0)) D
 .K ^PS(55,PSGP,5,DA,1)
 .S (C,X)=0 F  S X=$O(^PS(53.1,+ODA,1,X)) Q:'X  S:$D(^(X,0)) C=C+1,^PS(55,PSGP,5,DA,1,C,0)=^(0),^PS(55,PSGP,5,DA,1,"B",+$P($G(^(0)),U),C)=""
 .S ^PS(55,PSGP,5,DA,1,0)="^55.07P^"_C_"^"_C
 F X=3,12 D  S ^PS(55,PSGP,5,DA,X,0)="^55.0"_$S(X=3:8,1:612)_U_CNT_U_CNT
 .S CNT=0 F C=0:0 S C=$O(^PS(53.1,+ODA,X,C)) Q:'C  I $D(^(C,0)) S ^PS(55,PSGP,5,DA,X,C,0)=^(0),CNT=CNT+1
 S $P(^PS(53.1,+ODA,0),"^",19)=DA
 S $P(^PS(55,PSGP,5,DA,0),"^",7)=$P(^PS(53.1,+ODA,0),"^",7)
 N PSGPND0,PSGPND2,RDUZ,OND14 S PSGPND0=^PS(53.1,+ODA,0),PSGPND2=^(2) S RNWDT=$P(PSGPND0,"^",16),PSGOEPR=$P(PSGPND0,"^",2)
 S PSGFD=$P(PSGPND2,"^",4),PSJNOO=$P(^PS(53.1,+ODA,.2),"^",3) S OND14=$$LASTREN^PSJLMPRI(PSGP,+ODA_"P") S RDUZ=$P(OND14,"^",2) S:$P(OND14,"^",3) PSGOEPR=$P(OND14,"^",3)
 I '$G(DUOUT) D
 .I $G(PSJORD)["P" N PSGFDO S PSGFDO=$$LASTREN^PSJLMPRI(PSGP,PSJORD),PSGFDO=$P(PSGFDO,"^",4)
 .D UPDREN^PSGOER(DA_"U",RNWDT,PSGOEPR,$S($G(PSGFDO):PSGFDO,1:PSGFD),PSJNOO,RDUZ)
 S PVND4=$G(^PS(53.1,+ODA,4)) I $P(PVND4,"^"),$P(PVND4,"^",2) D
 .N RNDT S RNDT=$$LASTREN^PSJLMPRI(DFN,+ODA_"P") Q:RNDT>$P(PVND4,"^",2)
 .S $P(^PS(55,DFN,5,DA,4),"^")=$P(PVND4,"^"),$P(^PS(55,DFN,5,DA,4),"^",2)=$P(PVND4,"^",2)
CR ; set x-refs
 I $D(^PS(55,PSGP,5.1)),$P(^(5.1),"^",6) S X=$P(^(5.1),"^",6) I $P(ND2,"^",3),$P(ND2,"^",6)'>X S $P(^(5.1),"^",6)=$P(ND2,"^",3)
 S ^PS(55,PSGP,5,"B",+ODA,DA)="",^PS(55,"AUE",PSGP,DA)=""
 F S="C","O","P","R","OC" K ^PS(55,PSGP,5,"AU",S,+$P(PSGPND2,"^",4),DA)
 ; PSJ*5.0*255/kill old "AU" x-ref of the last stop date
 I $P(OND14,"^",4) F S="C","O","P","R","OC" K ^PS(55,PSGP,5,"AU",S,+$P(OND14,"^",4),DA)
 S ^PS(55,PSGP,5,"AU",$P(PSGPND0,"^",7),+$P(PSGPND2,"^",4),DA)=""
 S ^PS(55,PSGP,5,"AUS",+$P(ND2,"^",4),DA)="" I OFD,OFD'=$P(ND2,"^",4) K ^PS(55,PSGP,5,"AUS",+OFD,DA)
 D CIMOU^PSJIMO1(PSGP,DA,"",ODA)
 I $$PATCH^XPDUTL("PXRM*1.5*12") S X(1)=+$P(ND2,"^",2),X(2)=+$P(ND2,"^",4),DA(1)=PSGP D SPSPA^PSJXRFS(.X,.DA,"UD")
 K DIK S DA(1)=PSGP S DIK="^PS(55,"_DA(1)_",5,",DIK(1)=125 D EN1^DIK K DIK
 S PSGTOL=2,PSGTOO=1 F PSGUOW=0:0 S PSGUOW=$O(^PS(53.41,2,1,PSGUOW)) Q:'PSGUOW  I $D(^(PSGUOW,1,PSGP,1,2,1,+ODA)) K ^(+ODA) D ENL^PSGVDS
DONE I $D(PSGOE2),PSGOE2]"",$D(^TMP("PSJON",$J,PSGOE2)) S ^(PSGOE2)=DA_"U"
 S PSGODA=ODA,PSGORD=DA_"U"
 F Q=0:0 S Q=$O(^PS(53.44,Q)) Q:'Q  I $D(^(Q,1,PSGP,+ODA,0)) S $P(^(0),"^",2)=DA
 I $D(^PS(53.1,+ODA,15,0)) N SIARRAY D
 .M SIARRAY=^PS(55,PSGP,5,+DA,15) I $$DIFFSI^PSJBCMA5(PSGP,+DA_"U") D NEWUDAL^PSGAL5(PSGP,+DA_"U",6000,"SPECIAL INSTRUCTIONS",,.SIARRAY)
 .K ^PS(55,PSGP,5,DA,15) S ^PS(55,PSGP,5,DA,6)=$G(^PS(53.1,+ODA,6)) S ^PS(55,PSGP,5,DA,15,0)="^55.6135^"_$P($G(^PS(53.1,+ODA,15,0)),"^",3)_"^"_$P($G(^PS(53.1,+ODA,15,0)),"^",4)
 .N LN,LNCNT S LNCNT=0,LN=9999 F  S LN=$O(^PS(53.1,+ODA,15,LN),-1) Q:'LN  D
 ..I 'LNCNT,($G(^PS(53.1,+ODA,15,LN,0))="") Q
 ..S ^PS(55,PSGP,5,DA,15,LN,0)=^PS(53.1,+ODA,15,LN,0) S LNCNT=LNCNT+1
 .I LNCNT S $P(^PS(55,PSGP,5,DA,15,0),"^",3,4)=LNCNT_"^"_LNCNT
 .N TXT,LNCNT,SIMSG S LNCNT=$O(^PS(53.1,+ODA,15,""),-1) S SIMSG="Instructions too long. See Order View or BCMA for full text."
 .S PSJTMPTX="",PSJOVRMX=0 S TMPLIN=0 F  S TMPLIN=$O(^PS(55,+DFN,5,DA,15,TMPLIN)) Q:'TMPLIN!(PSJOVRMX)  D
 ..S:($L(PSJTMPTX)+$L($G(^PS(55,+DFN,5,DA,15,TMPLIN,0))))>180 PSJOVRMX=1 Q:$G(PSJOVRMX)  S PSJTMPTX=$G(PSJTMPTX)_$S($G(PSJTMPTX)]"":" ",1:"")_$G(^PS(55,+DFN,5,DA,15,TMPLIN,0))
 .S TXT=$S(PSJOVRMX:SIMSG,1:PSJTMPTX)
 .S:($TR(TXT,"^ ")="")!'($D(^PS(55,PSGP,5,DA,15,1))) TXT="" S ^PS(55,PSGP,5,DA,6)=TXT S $P(^PS(55,PSGP,5,DA,6),"^",2)=$P(^PS(53.1,+ODA,6),"^",2)
 .N LSTLNUM,LSTLNTXT S LSTLNUM=$O(^PS(55,+PSGP,5,+DA,15,""),-1) I LSTLNUM>1 S LSTLNTXT=$G(^PS(55,+PSGP,5,+DA,15,LSTLNUM,0)) I $TR(LSTLNTXT," ")="" D
 ..K ^PS(55,+PSGP,5,+DA,15,LSTLNUM,0)
 L -^PS(53.1,+ODA) L -^PS(55,PSGP,5,+DA) K CNT,ND,ODA,XX,ZND Q
