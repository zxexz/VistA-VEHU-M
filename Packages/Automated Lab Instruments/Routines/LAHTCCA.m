LAHTCCA ;SLC/DLG - HITACHI 717 THRU CCA SYSTEM ;7/20/90  09:16 ;
 ;;5.2;AUTOMATED LAB INSTRUMENTS;;Sep 27, 1994
 ;CROSS LINK BY ID OR IDE
LA1 S:$D(ZTQUEUED) ZTREQ="@" S LANM=$T(+0),TSK=$O(^LAB(62.4,"C",LANM,0)) Q:TSK<1
 Q:'$D(^LA(TSK,"I",0))
 K LATOP D ^LASET Q:'TSK  S X="TRAP^"_LANM,@^%ZOSF("TRAP")
LA2 K TV,Y S TOUT=0,A=1 D IN G QUIT:TOUT,LA2:$E(IN,1)'="H" D QC
 S TOUT=0,BAD=0 F A=2:1 D IN,QC G QUIT:TOUT Q:$E(IN,1)="F"
 F J=2:1:A I $E(Y(J),1)="R" S V=$E(Y(J),2,4) D NUM S TEST=+V,V=$E(Y(J),5,9) D NUM S V=+V F I=0:0 S I=$O(TC(I)) Q:I<1  I TEST=TC(I,4) S:V]"" @TC(I,1)=V ;V COULD BE MODIFIED ON THIS LINE
 S RMK="" F I=2:1:A I $E(Y(I),1)="T" S RMK=RMK_$E(Y(I),5,54)
 S V=$E(Y(1),17,25) D NUM S ID=+V,V=$E(Y(1),2,16) D NUM S IDE=+V,TRAY=+$E(Y(1),36,37),CUP=+$E(Y(1),38,39) S:TRAY=0 TRAY=1 S:CUP=0 CUP=ID
LA3 X LAGEN G LA2:'ISQN ;Can be changed by the cross-link code
 F I=0:0 S I=$O(TV(I)) Q:I<1  S:TV(I,1)]"" ^LAH(LWL,1,ISQN,I)=TV(I,1)
 I $D(RMK),$L(RMK) D RMK^LASET
 G LA2
QC ;QC TESTING HERE; S BAD=1 IF DONT STORE
 S Y(A)=IN Q
NUM S X="" F JJ=1:1:$L(V) S:$A(V,JJ)>32 X=X_$E(V,JJ)
 S V=X Q
IN S CNT=^LA(TSK,"I",0)+1 IF '$D(^(CNT)) S TOUT=TOUT+1 Q:TOUT>9  H 5 G IN
 S ^LA(TSK,"I",0)=CNT,IN=^(CNT),TOUT=0
 S:IN["~" CTRL=$P(IN,"~",2),IN=$P(IN,"~",1)
 Q
OUT S CNT=^LA(TSK,"O")+1,^("O")=CNT,^("O",CNT)=OUT
 LOCK ^LA("Q") S Q=^LA("Q")+1,^("Q")=Q,^("Q",Q)=TSK LOCK
 Q
QUIT LOCK ^LA(TSK) H 1 K ^LA(TSK),^LA("LOCK",TSK)
 Q
TRAP D ^LABERR S T=TSK D SET^LAB G @("LA2^"_LANM) ;ERROR TRAP
