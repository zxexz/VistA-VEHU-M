PSSJXR30 ; COMPILED XREF FOR FILE #55.0611 ; 03/12/19
 ; 
 S DA(1)=0 S DA=0
A1 ;
 I $D(DISET) K DIKLM S:DIKM1=2 DIKLM=1 S:DIKM1'=2&'$G(DIKPUSH(2)) DIKPUSH(2)=1,DA(2)=DA(1),DA(1)=DA,DA=0 G @DIKM1
A S DA(1)=$O(^PS(55,DA(2),5,DA(1))) I DA(1)'>0 S DA(1)=0 G END
1 ;
B S DA=$O(^PS(55,DA(2),5,DA(1),11,DA)) I DA'>0 S DA=0 Q:DIKM1=1  G A
2 ;
 S DIKZ(0)=$G(^PS(55,DA(2),5,DA(1),11,DA,0))
 S X=$P($G(DIKZ(0)),U,1)
 I X'="" S ^PS(55,DA(2),5,DA(1),11,"B",$E(X,1,30),DA)=""
 S X=$P($G(DIKZ(0)),U,1)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(1101)) KILL^PSGAL5:PSGAL(1101)=X K PSGAL
 S X=$P($G(DIKZ(0)),U,2)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(1102)) KILL^PSGAL5:PSGAL(1102)=X K PSGAL
 S X=$P($G(DIKZ(0)),U,3)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(1103)) KILL^PSGAL5:PSGAL(1103)=X K PSGAL
 S X=$P($G(DIKZ(0)),U,4)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(1104)) KILL^PSGAL5:PSGAL(1104)=X K PSGAL
 S X=$P($G(DIKZ(0)),U,5)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(1105)) KILL^PSGAL5:PSGAL(1105)=X K PSGAL
 S X=$P($G(DIKZ(0)),U,6)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(1106)) KILL^PSGAL5:PSGAL(1106)=X K PSGAL
 S X=$P($G(DIKZ(0)),U,7)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(1107)) KILL^PSGAL5:PSGAL(1107)=X K PSGAL
 S X=$P($G(DIKZ(0)),U,8)
 I X'="" I '$D(DIU(0)) D:$D(PSGAL(1108)) KILL^PSGAL5:PSGAL(1108)=X K PSGAL
 G:'$D(DIKLM) B Q:$D(DISET)
END G ^PSSJXR31
