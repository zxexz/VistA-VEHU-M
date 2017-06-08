ENLOG4 ;(WASH ISC)/DH-Continuation of ENLOG3 ;11-13-91
 ;;;;
 ;CLASS 3 SOFTWARE - Not officially supported by the ISC's
CNVT2 S $P(ENDA(0),U,4)=$E(ENFXLN,12,14)
 S X=$E(ENFXLN,15,26),X1="" F K=1:1:12 S X2=$E(X,K) S:X2]" " X1=X1_X2
 S $P(ENDA(1),U,6)=X1
 S $P(ENDA(0),U,5)=1 ;default
 S X=$E(ENFXLN,38) D:X]" " OOD
 S X=$E(ENFXLN,39,42) I X?4N S X1="2"_$E(X,3,4)_$E(X,1,2)_"00",$P(ENDA(1),U,2)=X1
 S X=$E(ENFXLN,43) I X]" " S $P(ENDA(0),U,6)=1 D ACTCD
 S X=$E(ENFXLN,44,55) D:X'?12" " SERIAL
 S X=$E(ENFXLN,56,64) I $E(X,8,9)="00" S X=$E(X,1,7)
 E  S X=$E(X,1,7)_"."_$E(X,8,9)
 S $P(ENDA(1),U,3)=+X
 S X=$E(ENFXLN,77,80) I +X>0 S X1=$E(X,1,2),X2=$E(X,3,4) S $P(ENDA(1),U,5)=$S(+X2<40:3,1:2)_X2_X1_"00"
 S X=$E(ENFXLN,83,84) I +X>0 S $P(ENDA(1),U,4)=+X
 S X=$E(ENFXLN,85,90) I X'?6" " D PO
 S X=$E(ENFXLN,91,103),X1="" I X'?13" " F K=1:1:13 S X2=$E(X,K) S:X2]" " X1=X1_X2
 S:X1]"" $P(ENDA(1),U,7)=X1
 S X=$E(ENFXLN,104) I X]" " S $P(ENDA(2),U,5)=$S(X=1:1,X=2:2,X=3:3,X=4:4,X=5:5,X=6:6,X=9:7,X=0:8,X="O":8,X="A":9,X="C":10,1:"")
 S X=$E(ENFXLN,115,117) S:X'?3" " $P(ENDA(2),U,4)=X
 ;Get spex
 S SPEXCNT=+$E(ENFXLN,125,126)
 K SPEX S SPEX=$E(EN(2),29,50)_EN(3) S K=1,K1=4
BLDSPX S SPEX(K)=$E(SPEX,1,47),SPEX=$E(SPEX,48,100) I $L(SPEX)<47,$D(EN(K1)) S SPEX=SPEX_EN(K1),K=K+1,K1=K1+1
 I K'>SPEXCNT,$L(SPEX) G BLDSPX
 K NAR I $L(SPEX)!($D(EN(K1))) D NAR
 ;Store the record
 S ^ENZ(6914.5,DA,0)=ENDA(0) S:$D(ENDA(1)) ^ENZ(6914.5,DA,1)=ENDA(1) S:$D(ENDA(2)) ^ENZ(6914.5,DA,2)=ENDA(2)
 F K=1:1:9 Q:'$D(SPEX(K))  S ^ENZ(6914.5,DA,20+K)=SPEX(K)
 D:$D(NAR(1)) NARSTR
 D ^ENLOG5
 I $D(^ENZ(6914.5,DA,1)) S X=$P(^(1),U,6) S:X]"" ^ENZ(6914.5,"D",X,DA)=""
 Q
 ;
OOD ;OUT OF DEPT
 I X="A" S $P(ENDA(0),U,5)=4 Q
 I X="B" S $P(ENDA(0),U,5)=4,$P(ENDA(2),U,6)=1 Q
 I X="C" S $P(ENDA(0),U,5)=4,$P(ENDA(2),U,6)=2 Q
 I X="E" S $P(ENDA(0),U,5)=3
 Q
ACTCD I X=9 S $P(ENDA(2),U,7)=1461 Q
 I X="&" S $P(ENDA(2),U,5)=2,$P(ENDA(2),U,7)="1466/7" Q
 I X="R" S $P(ENDA(0),U,6)=2 Q
 I X="G" S $P(ENDA(1),U,8)=1,$P(ENDA(2),U,7)=1468 Q
 I X="H" S $P(ENDA(1),U,8)=2,$P(ENDA(2),U,7)=1463 Q
 I X="P" S $P(ENDA(1),U,8)=3
 Q
SERIAL S X1="" F K=1:1:13 S K1=$E(X,K) I K1?.AN S X1=X1_K1
 S $P(ENDA(2),U,3)=X1
 Q
PO S X1="" F K=1:1:6 S X2=$E(X,K) S:X2]" " X1=X1_X2
 S $P(ENDA(1),U,1)=X1
 Q
NAR ;Parse out narrative
 S (K,X1,X2,NXI)=1,NAR(K)=""
NAR1 S X=$E(SPEX,X1) G:X="" NAR2 I NXI>60,X']" " D NXTLN
 I 'X2,X']" " S X1=X1+1 G NAR1
 S NAR(K)=NAR(K)_X,X2=$S(X]" ":1,1:0),X1=X1+1,NXI=NXI+1
 G NAR1
NAR2 I $D(EN(K1)) S SPEX=EN(K1),K1=K1+1,X1=1
 E  S SPEX=""
 G:$L(SPEX) NAR1
 Q
NXTLN S K=K+1,NAR(K)="",NXI=1,X2=0
 Q
NARSTR F K=1:1 Q:'$D(NAR(K))  S ^ENZ(6914.5,DA,30,K,0)=NAR(K)
 S ^ENZ(6914.5,DA,30,0)="^^"_K_U_K
 Q
 ;ENLOG4
