DILFD ;SFISC/STAFF-LIBRARY OF FUNCTIONS ;11/18/94  11:05
 ;;22.0;VA FileMan;;Mar 30, 1999
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 Q
ROOT(DIC,DA,CP,ERR) ;
 G ENROOT^DIQGU
 ;
FLDNUM(DIEFF,DIEFFDNM) ;
 G FLDNUMX^DIEF1
 ;
VFILE(F,FLAG) ;
 G VFILEX^DIEFU
 ;
VFIELD(F,FLD,FLAG) ;
 G VFIELDX^DIEFU
 ;
RECALL(DIFILE,DIEN,DIUSER) ;SEA/TOAD
 G RECALLX^DICU
 ;
EXTERNAL(DIFILE,DIFIELD,DIFLAGS,DINTERNL,DIMSGA) ;SEA/TOAD
 G XTRNLX^DIDU
 ;
PRD(DIFRFILE,DIFRPRD) ;DCL
 G EN^DIFROMSV
 ;
