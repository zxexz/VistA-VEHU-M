IBXS35 ; ;03/19/19
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"MP")):^("MP"),1:"") S X=$P(Y(1),U,7),X=X S DIU=X K Y S X=DIV N %I,%H,% D NOW^%DTC S X=% X ^DD(399,473,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGCR(399,D0,"MP")):^("MP"),1:"") S X=$P(Y(1),U,8),X=X S DIU=X K Y S X=DIV S X=$S(($D(DUZ)#2):DUZ,1:"") X ^DD(399,473,1,2,1.4)
