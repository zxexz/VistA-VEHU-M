IBXS110 ; ;03/19/19
 S X=DE(26),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DE(26),DIC=DIE
 K ^DPT("F",$E(X,1,30),DA)
 S X=DE(26),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DPT(D0,.132)):^(.132),1:"") S X=$P(Y(1),U,1),X=X S DIU=X K Y S X=DIV S X=$$NOW^XLFDT() S DIH=$G(^DPT(DIV(0),.132)),DIV=X S $P(^(.132),U,1)=DIV,DIH=2,DIG=.1321 D ^DICR
 S X=DE(26),DIC=DIE
 S IVMX=X,X="IVMPXFR" X ^%ZOSF("TEST") D:$T DPT^IVMPXFR S X=IVMX K IVMX
 S X=DE(26),DIC=DIE
 I ($T(AVAFC^VAFCDD01)'="") S VAFCF=".131;" D AVAFC^VAFCDD01(DA)
 S X=DE(26),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
 S X=DE(26),DIIX=2_U_DIFLD D AUDIT^DIET
