PSSJXR24 ; COMPILED XREF FOR FILE #55.0108 ; 03/19/19
 ; 
 S DA=0
A1 ;
 I $D(DISET) K DIKLM S:DIKM1=1 DIKLM=1 G @DIKM1
0 ;
A S DA=$O(^PS(55,DA(1),"SCTALK",DA)) I DA'>0 S DA=0 G END
1 ;
 S DIKZ(0)=$G(^PS(55,DA(1),"SCTALK",DA,0))
 S X=$P($G(DIKZ(0)),U,2)
 I X'="" S ^PS(55,"ASTALK",DA(1))=X
 G:'$D(DIKLM) A Q:$D(DISET)
END G ^PSSJXR25
