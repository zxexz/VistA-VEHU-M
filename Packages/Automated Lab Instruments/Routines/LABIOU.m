LABIOU ;SLC/RWF - ROUTINE FOR BIOVATION URINALYSIS KEYPAD ;7/20/90  07:33 ;
 ;;5.2;AUTOMATED LAB INSTRUMENTS;;Sep 27, 1994
 ;CROSS LINK BY ID OR IDE ;use the 1 line format
LA1 S:$D(ZTQUEUED) ZTREQ="@"
 S LANM=$T(+0),TSK=$O(^LAB(62.4,"C",LANM,0)) Q:TSK<1
 Q:'$D(^LA(TSK,"I",0))
 K LATOP D ^LASET Q:'TSK  S X="TRAP^"_LANM,@^%ZOSF("TRAP") S:'$D(LALCT) LALCT="" Q:LALCT="N"
LA2 K TV,TY,Y S TOUT=0,A=1,RMK="" D IN G QUIT:TOUT,LA2:$E(IN,1,2)'="@3" D QC
 F I=35:4:57 S V=$E(Y(1),I,I+2) D NUM I V]"" S X=$S(V>99:$E(V,3),1:""),V=$S(V>99:$E(V,1,2)_0,1:+V),TY(V)=X
 I LALCT="U" F I=0:0 S I=$O(^TMP("LA",$J,I)) Q:I<1  K V X ^TMP("LA",$J,I,2) S:$D(V) @^TMP("LA",$J,I,1)=V
 I LALCT'="U" F I=0:0 S I=$O(TC(I)) Q:I<1  K V X TC(I,2) S:$D(V) @TC(I,1)=V
 S V=$E(Y(1),82,87) D NUM S (ID,IDE,CUP)=+V,TRAY=1
LA3 X LAGEN G LA2:'ISQN
 F I=0:0 S I=$O(TV(I)) Q:I<1  S:TV(I,1)]"" ^LAH(LWL,1,ISQN,I)=TV(I,1)
 I $D(RMK),$L(RMK) D RMK^LASET
 G LA2
QC ;QC TESTING HERE; S BAD=1 IF DONT STORE
 S Y(A)=IN Q
NUM S X="" F JJ=1:1:$L(V) S:$A(V,JJ)>32 X=X_$E(V,JJ)
 S V=X Q
IN S CNT=^LA(TSK,"I",0)+1 IF '$D(^(CNT)) S TOUT=TOUT+1 Q:TOUT>9  H 5 G IN
 S ^LA(TSK,"I",0)=CNT,IN=^(CNT),TOUT=0
 Q
QUIT LOCK ^LA(TSK) H 1 K ^LA(TSK),^LA("LOCK",TSK),^TMP("LA",$J),^TMP($J)
 Q
TRAP D ^LABERR S T=TSK D SET^LAB G @("LA2^"_LANM) ;ERROR TRAP
CODE I LALCT'="U" S:V]"" V=$P($S(TC(I,4)]"":TC(I,4),1:"None$Few$Mod$Many$Profuse$Noted"),"$",V+1) Q
 I LALCT="U" S:V]"" V=$P($S(^TMP("LA",$J,I,4)]"":^(4),1:"None$Few$Mod$Many$Profuse$Noted"),"$",V+1) Q
