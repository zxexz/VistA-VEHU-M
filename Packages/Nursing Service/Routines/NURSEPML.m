NURSEPML ;HIRMFO/MD,FT-TRAINING REPORT BY LOCATION ;6/5/97
 ;;4.0;NURSING SERVICE;**2,3,10,12,13**;Apr 25, 1997
EN1 S X=$G(^PRSE(452.7,1,"OFF")) Q:X=""!(X=1)
 S X=$G(^DIC(213.9,1,"OFF")) Q:X=""!(X=1)
 S (NURHOSP,NURQUEUE,NUROUT,NURSW1,NURPAGE,NUROUT)=0,NSW2=1
 D EN1^NURSAUTL G QUIT:$G(NUROUT)
 I NURPLSW=1 D EN13^NURSAGSP G:$G(NUROUT) QUIT
 I NURMDSW S DIC(0)="AEQMZ",NURPLSCR=1 D EN5^NURSAGSP G:$G(NUROUT) QUIT
 I NURMDSW=0,NURPLSW=1 S NURPLSCR=1 D PRD^NURSAGSP K NURPLSCR I $G(NUROUT) G QUIT
 D EN10^NURSUT3($G(DUZ)),DATSEL^NURSAGP2 G QUIT:$G(NUROUT) D INS^NURSAGP2 G QUIT:$G(NUROUT)
 I NURPLSW=0!($G(NURSEL(1))=1)!($G(NURSEL(1))="") W ! D EN1^NURSAGSP G QUIT:$G(NUROUT)
 I $G(NURSEL(1))=2 W ! D EN3^NURSAGSP G QUIT:$G(NUROUT)
 D EN5^NURSAGP1 G QUIT:$G(NUROUT)
 W ! S ZTDESC="Nursing Training Report by Location",ZTRTN="START^NURSEPML" D EN7^NURSUT0 G:POP!($D(ZTSK)) QUIT
START ;
 K ^TMP("NURE",$J),^TMP("NURLOC",$J) S (HOLD,HOLD(1),HOLD(2),HOLD(3))=1,(PCNT,SCNT,RCNT,SHRS,SHRS("CON"),SHRS("CEU"),RHRS,RHRS("CON"),RHRS("CEU"),PHRS,PHRS("CON"),PHRS("CEU"))=0
 S NURS132=$S(IOM'<132:1,1:0) F NDA=0:0 S NDA=$O(^NURSF(211.8,"C",NDA)) Q:NDA'>0  F NURNODE4=0:0 S NURNODE4=$O(^NURSF(211.8,"C",NDA,NURNODE4)) Q:NURNODE4'>0  D
 .K NURNODE4(1),NURNODE4(2) Q:'$D(^NURSF(211.8,NURNODE4,0))
 .S NURNODE4(1)=+$P(^NURSF(211.8,NURNODE4,0),"^") Q:NURNODE4(1)'>0  Q:'$D(^NURSF(211.4,"B",NURNODE4(1)))
 .S NURNODE4(2)=$O(^NURSF(211.4,"B",NURNODE4(1),0)) Q:'$D(^NURSF(211.4,NURNODE4(2),"I"))  Q:$E($P(^("I"),"^"))="I"
 .F NURNODE5=0:0 S NURNODE5=$O(^NURSF(211.8,"C",NDA,NURNODE4,NURNODE5)) Q:NURNODE5'>0  I $P($G(^NURSF(211.8,NURNODE4,1,NURNODE5,0)),U)'>DT&(('$P($G(^(0)),U,6))!($P($G(^(0)),U,6)'<DT)) D
 ..S DA=$O(^NURSF(210,"B",NDA,0))  I $P($G(^NURSF(210,+DA,0)),U,2)'="",$P($G(^(0)),U,2)'="R",$D(^VA(200,NDA,0)) W:$R(500)&$E(IOST)="C" "." D SORT
 ..Q
 .Q
 I $O(^TMP("NURE",$J,""))="",'$D(NURSNLOC) S NUROUT=1 S NURPROG=$S($G(NURPROG)=0:NURPROG(1),1:""),NURFAC=$S($G(NURFAC)=0:NURFAC(1),1:"") D NHDR^NURSEPL1 W !!,"THERE IS NO DATA FOR THIS REPORT"
 I $O(^TMP("NURE",$J,""))="",$D(NURSNLOC) S NUROUT=1 S NURPROG=$S($G(NURPROG)=0:NURPROG(1),1:""),NURFAC=$S($G(NURFAC)=0:NURFAC(1),1:"") D NHDR^NURSEPL1 S NL1="" F  S NL1=$O(NURSNLOC(NL1)) Q:NL1=""  D NODATA^NURSUT1
 I $O(^TMP("NURE",$J,""))'="",$D(NURSNLOC) S NURSPEC="" D  I NURSW1=1 D ENDPG^NURSUT1 S NURSW1=0
 .  S (NURY,NURZ,NURX)="" F  S NURY=$O(^TMP("NURE",$J,"L",NURY)) Q:NURY=""  F  S NURZ=$O(^TMP("NURE",$J,"L",NURY,NURZ)) Q:NURZ=""  F  S NURX=$O(^TMP("NURE",$J,"L",NURY,NURZ,NURX)) Q:NURX=""  S ^TMP("NURLOC",$J,NURX)=""
 .  S NL1="" F  S NL1=$O(NURSNLOC(NL1)) Q:NL1=""  I '$D(^TMP("NURLOC",$J,NL1)) D
 .  .  S NURPROG=$S($G(NURPROG)=0:NURPROG(1),1:""),NURFAC=$S($G(NURFAC)=0:NURFAC(1),1:"") D:NURSW1=0 NHDR^NURSEPL1 D NODATA^NURSUT1
 .  .  Q
 .  Q
 D NPRINT^NURSEPL1
QUIT K ^TMP("NURE",$J) D CLOSE^NURSUT1,^NURSKILL
 K NATTEND,NMHOLD Q
SORT ; SORT MI DATA
 Q:NURSZAP>7&(NURSZDA'=DA)  S NURSZORT=1 D EN3^NURSAUTL:NURSZAP>6,EN2^NURSAUTL:NURSZORT&NURSZAP Q:'NURSZORT
 S NURNEN=$S($G(NURSEL(1))=2:1,1:3) D SETPROG^NURAAGS1,SETFAC^NURAAGS1
 W:$E(IOST)="C"&($R(2000)) "." S N1=$S($P(^VA(200,NDA,0),"^")="":"VA # "_NDA,1:$P(^(0),"^"))
 S NLO=$S($D(^NURSF(211.8,+NURNODE4,0)):$P(^(0),U),1:"  BLANK")
 D EN2^NURSUT0 Q:$G(NPSPOS(1))=""  S NURCAT=NPSPOS(1)
 S NPWARD=NLO D EN7^NURSAUTL Q:NPWARD=""  S NL1=$E(NPWARD,1,10)
 S NURSPEC=$S($G(NURSEL(1))=2:$$CAT^NURSUT2(NPSPOS(1)),1:$E(NPWARD,1,10)),NURSPEC(1)=$S($G(NURSEL(1))=2:$E(NPWARD,1,10),1:$$CAT^NURSUT2(NPSPOS(1)))
 I $G(NURSEL(1))'=2,$G(NURHOSP)=0,'$D(NURSNLOC(NL1)) Q
 I $G(NURSEL(1))=2,'$D(^TMP("NURSCAT",$J,NPSPOS(1))) Q
 I NURMDSW,'$G(NURFAC),$G(NURFAC(1))'=$G(NURFAC(2)) Q
 I NURPLSW,'$G(NURPROG),$G(NURPROG(1))'=$G(NURPROG(2)) Q
 S:NURPROG(2)="NURSING" NURPROG(2)=" "_NURPROG(2)
 S NIC2="" F  S NIC2=$O(^PRSE(452,"AA",NIC2)) Q:NIC2=""  S NIC1="" F  S NIC1=$O(^PRSE(452,"AA",NIC2,NDA,NIC1)) Q:NIC1=""  D
 .  I NURSEL'="A"&(NURSEL'=NIC2) Q
 .  I NSW2'=1 S NCD=$O(^PRSE(452,"AA",NIC2,DA(1),NIC1,"")),DA(2)=$O(^PRSE(452,"AA",NIC2,DA(1),NIC1,NCD,"")) D SAVE
 .  E  F NCD1=0:0 S NCD1=$O(^PRSE(452,"AA",NIC2,NDA,NIC1,NCD1)) Q:NCD1'>0  F PDA=0:0 S PDA=$O(^PRSE(452,"AA",NIC2,NDA,NIC1,NCD1,PDA)) Q:PDA'>0  D SAVE
 .  Q
 Q
SAVE ;
 S:$G(NURSORT)="" NURSORT=1
 S NCD=$P($G(^PRSE(452,PDA,0)),U,3)
 I NCD<YRST!(NCD>YREND) Q
 I NSW2'=1 S ^TMP("NURE",$J,NURFAC(2),NURPROG(2),$E(NIC1,1,30),NCD,PDA)="" Q
 E  I $D(NSPC)#2,'(NSPC=NIC1) Q
 S NURECLS(0)=$O(^PRSE(452.1,"B",NIC1,0))
 N X S X=$G(^TMP("NURE",$J,"L",NURFAC(2),NURPROG(2),NURSPEC,NIC1))
 I X="" S X=NURSORT,NURSORT=NURSORT+1,^TMP("NURE",$J,"L",NURFAC(2),NURPROG(2),NURSPEC,NIC1)=X
 S DATA=$G(^PRSE(452,PDA,0)),^TMP("NURE",$J,"L1",X,N1,NURSPEC(1),NCD,PDA)=$P($G(DATA),U,16)_U_$P($G(^PRSE(452,PDA,6)),U,2)_U_$P($G(DATA),U,21)_U_$P($G(DATA),U,6)_U_$P($G(DATA),U,10)
 Q
