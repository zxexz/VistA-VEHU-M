A1CKC5 ; ;07/06/12
 S X=DE(5),DIC=DIE
 X ^DD(2,.36215,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,2),X=X S DIU=X K Y S X="" X ^DD(2,.36215,1,1,2.4)
 S X=DE(5),DIC=DIE
 S DFN=DA D EN^DGMTCOR K DGMTCOR
 S X=DE(5),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X='$$TOTCHK^DGLOCK2(DA) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,20),X=X S DIU=X K Y S X="" X ^DD(2,.36215,1,3,2.4)
 S X=DE(5),DIC=DIE
 D AUTOUPD^DGENA2(DA)
