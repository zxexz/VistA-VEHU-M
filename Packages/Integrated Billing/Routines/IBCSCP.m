IBCSCP ;ALB/MRL - BILLING SCREEN PROCESSOR ;01 JUN 88 12:00
 ;;2.0;INTEGRATED BILLING;**52,51,161,266,432,447**;21-MAR-94;Build 80
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 ;MAP TO DGCRSCP
 ;
 D Q1 W !
 S IBCSCPP=$S($L(IBV1)>1:"1-"_$L(IBV1),1:1)
 F I=$Y:1:20 W !
 S IBPOPOUT=0
 S (ICDVDT,ICPTVDT)=$$BDATE^IBACSV(IBIFN) ;ICD/CPT version date
 ; IB*2.0*447 BI Start
 ;W "<RET> to ",$S(+IBSR<10:"CONTINUE",1:"QUIT") W:$S(+IBSR=9&(IBV1'["0"):0,1:'IBV) ", ",IBCSCPP," to EDIT," W " '^N' for screen N, or '^' to QUIT: " R IBSCNN:DTIME S IBCITOUT='$T G Q:'$T I IBSCNN="" S X1=2 G NOMO
 W "<RET> to ",$S(+IBSR<11:"CONTINUE",1:"QUIT") W:$S(+IBSR=11&(IBV1'["0"):0,1:'IBV) ", ",IBCSCPP," to EDIT," W " '^N' for screen N, or '^' to QUIT: " R IBSCNN:DTIME S IBCITOUT='$T G Q:'$T I IBSCNN="" S X1=2 G NOMO
 ; IB*2.0*447 BI End
 G AN:IBSCNN?1"^"1N.N
 I IBSCNN?1"^".E S IBPOPOUT=1 G Q
 I IBSCNN'?1N.E D ^IBCSCH S X=IBSR,X1=2 G NOMO2
 I IBSCNN?1N1"-"1N S IBDR20=IBSCNN,IBSCNN="" F I=+IBDR20:1:$P(IBDR20,"-",2) S IBSCNN=IBSCNN_I_","
 ; IB*2.0*447 BI Start
 S IBDR20="" F J=1:1 S I=$P(IBSCNN,",",J) Q:I=""!($L(I)>3)  I I<11 S:I'["-"&(IBDR20'[I_",") IBDR20=IBDR20_I_"," I I["-" S I1=$P(I,"-",1),I2=$P(I,"-",2) F I3=I1:1:I2 S IBDR20=IBDR20_I3_"," I I3>11 Q
 ; IB*2.0*447 BI End
 S DGDR1="" F J=1:1 S I=$P(IBDR20,",",J) Q:I=""  I '$E(IBV1,I) S DGDR1=DGDR1_(I+(IBSR*10))_","
 I DGDR1']"" D ^IBCSCH S X=IBSR,X1=2 G NOMO2
 S IBDR20=DGDR1 D ^IBCSCE S X=IBSR,X1=2 G NOMO2
Q K IBSR,IBVV,VADM,IBVI,IBVO,ICDVDT,ICPTVDT
 ;
 ; If Ingenix ClaimsManager found some errors and the user is trying
 ; to exit from these screens, then capture the user's comments.
 ; Exit by time-out or by "^" pop out.
 ; Here, it's important to preserve the value of $T since it is
 ; being looked at by IBCB.
 ;
 S IBCIT("SAVE THE VALUE OF $T")=$T       ; save $T
 I $$CM^IBCIUT1(IBIFN),$P($G(^IBA(351.9,IBIFN,0)),U,2)=4,($G(IBPOPOUT)!$G(IBCITOUT)) D COMMENT^IBCIUT7(IBIFN,1)
 I IBCIT("SAVE THE VALUE OF $T")          ; restore $T
 ;
Q1 K %DT,C,DGA,DGA1,DGA2,DGAD,DGCC,IBSCNN,IBCSCPP,IBDR20,DGDR1,DGST,DGAAC,DGRCD,IBCPTX,IBCITOUT,IBCIT
 K IBA,IBCPT,IBREVC,IBYN,IBZZ,IBABRT,IB,IBDD,IBIDS,IBIR,IBIRN,IBISEX,IBIUTL,IBU,IBUN,IBW,IBWW,DGPT,IBICD,IBHC,IBCC,IBDI,IBDIN,IBDPT,IBUCH
 K DIC,DIWF,DIWL,I,I1,I2,I3,J,X,X1,X2,X3,Y,Z,Z1,Z2
 Q
 ; IB*2.0*447 BI Start
NOMO S I=IBSR,J=1 I +IBSR=11 S X=IBSR G NOMO2
NOMO1 S I=I+1,J=+$E(IBVV,I),X=I S:J&(+X=11) IBSR=X G NOMO2:+X=11 I J G NOMO1
NOMO2 I +IBSR=11&(IBSCNN="") S X1=3,IBSR1=""
 S:(+IBSR=10)&(IBSCNN="") IBSR1="" S X=$P($T(@(IBSR1_X)),";;",X1) G @X
 Q
 ; IB*2.0*447 BI End
 ;
AN S X=+$E(IBSCNN,2,99),X1=$P($T(@X),";;",2) I X1]"",'$E(IBVV,X) S IBSR1="",X1=2 G NOMO2
 ; IB*2.0*447 BI Start
 S Z="INVALID SCREEN NUMBER...VALID SCREENS ARE " F I=1:1:11 I '$E(IBVV,I) S Z=Z_I_$S(I<11:",",1:".")
 ; IB*2.0*447 BI End
 W !,*7 D W H 1 S X=IBSR,X1=2 G NOMO2
W ;I IOST="C-QUME",$L(IBVI)'=2 W Z
 W IBVI,Z,IBVO
 Q
1 ;;^IBCSC1;;^IBCSC2
2 ;;^IBCSC2;;^IBCSC3
3 ;;^IBCSC3;;^IBCSC4
4 ;;^IBCSC4;;^IBCSC5
5 ;;^IBCSC5;;^IBCSC6
6 ;;^IBCSC6;;^IBCSC7
7 ;;^IBCSC7;;^IBCSC8
8 ;;^IBCSC8;;^IBCSC9
9 ;;^IBCSC9;;^IBCSC10
 ; IB*2.0*447 BI Start
10 ;;^IBCSC10;;^IBCSC11
210 ;;^IBCSC102;;^IBCSC11
H10 ;;^IBCSC10H;;^IBCSC11
11 ;;^IBCSC11;;Q^IBCSCP
 ; IB*2.0*447 BI End
PAR ;;^IBCPAR;;^IBCPAR
 ;IBCSCP
