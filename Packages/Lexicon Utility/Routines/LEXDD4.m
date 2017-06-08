LEXDD4 ;ISL/KER - Display Defaults - List Elements ;04/21/2014
 ;;2.0;LEXICON UTILITY;**80**;Sep 23, 1996;Build 1
 ;               
 ; Global Variables
 ;    ^DIC(49)            ICR  10093
 ;               
 ; External References
 ;    $$GET1^DIQ          ICR   2056
 ;    $$LOW^XLFSTR        ICR  10103
 ;    $$UP^XLFSTR         ICR  10103
 ;               
 ;
 ; Create the Display for a user
NAME ;     Name
 S:'$D(LEXD(0)) LEXD(0)=0
 N LEXDATA,LEXSPC S LEXSPC="",LEXDATA=$$GET1^DIQ(200,+($G(LEXDUZ)),.01)
 N LEXLN,LEXFN
 S LEXDATA=$$FL(LEXDATA)
 K LEXITL D STRING
 Q
SEV ;     Service
 N LEXDATA S LEXDATA=$$GET1^DIQ(200,+($G(LEXDUZ)),29),LEXDATA=+LEXDATA
 Q:'LEXDATA  Q:$P($G(^DIC(49,LEXDATA,0)),U,1)=""
 S LEXDATA=$P($G(^DIC(49,LEXDATA,0)),U,1)
 I $L(LEXDATA) S LEXITL="    Service:   " D STRING
 Q
APP ;     Application Name
 Q:+($G(LEXAP))<1  Q:'$D(^LEXT(757.2,+LEXAP,0))
 N LEXDATA,LEXSPC S LEXDATA=$P(^LEXT(757.2,LEXAP,0),U,1)
 S LEXDATA=LEXDATA_":",LEXSPC="    " K LEXITL D STRING
 Q
DEF ; Defaults for user
 D:$L($G(LEXSUB)) DEFS($G(LEXSUB),$G(LEXSUB(0)),3),BLANK
 D:$L($G(LEXSHOW)) DEFS($G(LEXSHOW),$G(LEXSHOW(0)),2),BLANK
 D:$L($G(LEXDICS)) DEFS($G(LEXDICS),$G(LEXDICS(0)),1),BLANK
 D:$L($G(LEXCTX)) DEFS($G(LEXCTX),$G(LEXCTX(0)),4)
 Q
 ;
DEFS(LEXV,LEXN,LEXO) ; Create local array
 Q:'$L($G(LEXV))  N LEXITL,LEXA,LEXSTLN,LEXSTR
 S:$G(LEXN)[" (" LEXN=$P(LEXN," (",1)
 K LEX S LEX(0)=0 S LEXSTLN=56
 S:$G(LEXO)=1 LEX(1)="        Filter:      "_$G(LEXN),LEX(0)=1
 S:$G(LEXO)=2 LEX(1)="        Display:     "_$G(LEXN),LEX(0)=1
 S:$G(LEXO)=3 LEX(1)="        Vocabulary:  "_$G(LEXN),LEX(0)=1
 S:$G(LEXO)=4 LEX(1)="        Shortcuts:   "_$G(LEXN),LEX(0)=1
 S LEXITL="" D:$G(LEX(1))'="" ARRAY K LEX S LEXITL=""
 ;
 S LEXITL="                     "
 D:$G(LEXO)=1 DICS^LEXDDT1 D:$G(LEXO)=2 SHOW^LEXDDT1
 D:$G(LEXO)=3 SUB^LEXDDT1 D:$G(LEXO)=4 CON^LEXDDT1
 D:$G(LEX(1))'="" ARRAY K LEX
 Q
 ;
 D:$G(LEXO)=1 FV^LEXDDT1 D:$G(LEXO)=2 DV^LEXDDT1
 D:$G(LEXO)=3 VV^LEXDDT1 D:$G(LEXO)=4 CV^LEXDDT1
 S LEXITL="                     " D:$D(LEX(0)) ARRAY K LEX
 Q
BLANK ;     Store a blank line
 N LEXDATA,LEXSPC S (LEXDATA,LEXSPC)="" K LEXITL D STRING
 Q
STRING ;     Store a string LEXDATA
 S:'$D(LEXD(0)) LEXD(0)=0 N LEXCTR,LEXFIL
 S LEXCTR=LEXD(0) S:'$D(LEXSPC) LEXSPC="                     "
 S:$D(LEXITL)&($D(LEXDATA)) LEXFIL=LEXITL
 S:'$D(LEXITL)&($D(LEXDATA)) LEXFIL=LEXSPC
 I $L($G(LEXFIL)) D
 . S LEXCTR=LEXCTR+1,LEXD(LEXCTR)=LEXFIL_LEXDATA,LEXD(0)=LEXCTR
 I '$L($G(LEXFIL)) D
 . S LEXCTR=LEXCTR+1,LEXD(LEXCTR)=LEXDATA,LEXD(0)=LEXCTR
 K LEXSPC,LEXDATA,LEXITL
 Q
ARRAY ;     Store local array LEX
 S:'$D(LEXD(0)) LEXD(0)=0
 N LEXI,LEXCTR,LEXSPC S LEXCTR=LEXD(0),LEXSPC="                     "
 F LEXI=1:1:LEX(0) D
 . S LEXCTR=LEXCTR+1
 . I LEXI=1 S LEXD(LEXCTR)=LEXITL_LEX(LEXI) Q
 . S LEXD(LEXCTR)=LEXSPC_LEX(LEXI)
 S LEXD(0)=LEXCTR
 Q
FL(X) ; First and Last Name, Mixed Case
 I X["," D  Q X
 . N LEXLN,LEXFN
 . S LEXLN=$P(X,",",1)
 . S LEXLN=$$UP^XLFSTR($E(LEXLN,1))_$$LOW^XLFSTR($E(LEXLN,2,$L(LEXLN)))
 . S LEXFN=$P($P(X,",",2)," ",1)
 . S LEXFN=$$UP^XLFSTR($E(LEXFN,1))_$$LOW^XLFSTR($E(LEXFN,2,$L(LEXFN)))
 . S X=LEXFN_" "_LEXLN
 I X'[",",X[" " D  Q X
 . N LEXLN,LEXFN
 . S LEXLN=$P($P(X," ",2)," ",1)
 . S LEXLN=$$UP^XLFSTR($E(LEXLN,1))_$$LOW^XLFSTR($E(LEXLN,2,$L(LEXLN)))
 . S LEXFN=$P(X," ",1)
 . S LEXFN=$$UP^XLFSTR($E(LEXFN,1))_$$LOW^XLFSTR($E(LEXFN,2,$L(LEXFN)))
 . S X=LEXFN_" "_LEXLN
 I X'[",",X'[" " D  Q X
 . S X=$$UP^XLFSTR($E(X,1))_$$LOW^XLFSTR($E(X,2,$L(X)))
 Q X
