DGRPTX22 ; ;07/06/12
 S X=DG(DQ),DIC=DIE
 S ^DPT("C",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
