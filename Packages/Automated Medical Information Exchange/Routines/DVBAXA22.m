DVBAXA22 ; ;08/28/09
 ;;
1 N X,X1,X2 S DIXR=289 D X1(U) K X2 M X2=X D X1("F") K X1 M X1=X
 K X M X=X2 D
 . N DIEZCOND,DIEXARR M DIEXARR=X S DIEZCOND=1
 . I '$P($G(^DPT(DA,.52)),"^",15) S X=$$CVELIG^DGCV(DA)
 . S DIEZCOND=$G(X) K X M X=DIEXARR Q:'DIEZCOND
 . D SETCV^DGCV(DA,X2(1))
 Q
X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",2,DIIENS,.327,DION),$P($G(^DPT(DA,.32)),U,7))
 S X(2)=$G(@DIEZTMP@("V",2,DIIENS,.5294,DION),$P($G(^DPT(DA,.52)),U,14))
 S X(3)=$G(@DIEZTMP@("V",2,DIIENS,.322021,DION),$P($G(^DPT(DA,.322)),U,21))
 S X(4)=$G(@DIEZTMP@("V",2,DIIENS,.322018,DION),$P($G(^DPT(DA,.322)),U,18))
 S X(5)=$G(@DIEZTMP@("V",2,DIIENS,.322012,DION),$P($G(^DPT(DA,.322)),U,12))
 S X(6)=$G(@DIEZTMP@("V",2,DIIENS,.5291,DION),$P($G(^DPT(DA,.52)),U,11))
 S X(7)=$G(@DIEZTMP@("V",2,DIIENS,.322019,DION),$P($G(^DPT(DA,.322)),U,19))
 S X(8)=$G(@DIEZTMP@("V",2,DIIENS,.322016,DION),$P($G(^DPT(DA,.322)),U,16))
 S X(9)=$G(@DIEZTMP@("V",2,DIIENS,.32201,DION),$P($G(^DPT(DA,.322)),U,10))
 S X=$G(X(1))
 Q
2 N X,X1,X2 S DIXR=633 D X2(U) K X2 M X2=X D X2("F") K X1 M X1=X
 D
 . D KSERV^DGSRVICE(.X,.DA,"LAST")
 K X M X=X2 D
 . D SSERV^DGSRVICE(.X,.DA,"LAST")
 Q
X2(DION) K X
 S X(1)=$G(@DIEZTMP@("V",2,DIIENS,.326,DION),$P($G(^DPT(DA,.32)),U,6))
 S X(2)=$G(@DIEZTMP@("V",2,DIIENS,.327,DION),$P($G(^DPT(DA,.32)),U,7))
 S X=$G(X(1))
 Q
