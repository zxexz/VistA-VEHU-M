PSSJXR17 ; COMPILED XREF FOR FILE #55.174 ; 03/12/19
 ; 
 S DA(1)=0 S DA=0
A1 ;
 I $D(DIKILL) K DIKLM S:DIKM1=2 DIKLM=1 S:DIKM1'=2&'$G(DIKPUSH(2)) DIKPUSH(2)=1,DA(2)=DA(1),DA(1)=DA,DA=0 G @DIKM1
A S DA(1)=$O(^PS(55,DA(2),"PC",DA(1))) I DA(1)'>0 S DA(1)=0 G END
1 ;
B S DA=$O(^PS(55,DA(2),"PC",DA(1),"PCH",DA)) I DA'>0 S DA=0 Q:DIKM1=1  G A
2 ;
 S DIKZ(0)=$G(^PS(55,DA(2),"PC",DA(1),"PCH",DA,0))
 S X=$P($G(DIKZ(0)),U,1)
 I X'="" K ^PS(55,DA(2),"PC",DA(1),"PCH","B",$E(X,1,30),DA)
 G:'$D(DIKLM) B Q:$D(DIKILL)
END G ^PSSJXR18
