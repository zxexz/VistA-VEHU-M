DGPMX24 ; ;12/05/12
 S X=DG(DQ),DIC=DIE
 S DGPMDDF=6,DGPMDDT=1 D ^DGPMDDCN
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGPM(D0,0)):^(0),1:"") S X=$P(Y(1),U,7),X=X S DIU=X K Y S X="" S DIH=$G(^DGPM(DIV(0),0)),DIV=X S $P(^(0),U,7)=DIV,DIH=405,DIG=.07 D ^DICR
 S X=DG(DQ),DIC=DIE
 S Y=^DGPM(DA,0) I +Y,Y<DT S Y=$P(Y,U,2) I Y<3,$D(DGOWD) S DGHNYT=$S(Y=1:10,1:12) D ^DGPMGLC K DGIDX
