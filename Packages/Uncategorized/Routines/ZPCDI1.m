ZPCDI1 ;ZPCDI CONTINUED
PROCLEV ;PROCESS MULTIPLE LEVELS
 S LEV=$L(FIELDNUM,",")-1 ;GET THE MULTIPLE LEVEL
 ;W !,"LEV=",LEV,"FLD=",X
 I LEV=0 Q  ;THIS IS A Non Multiple field
 I LEV=1 D  Q
 .S FLDCNT=FLDCNT+1
 .S FIELDNM1=$P(FIELDNUM,",")_",",ZPATH=FIELDNM1
 .;S ^DIPT(TNUM,"F",FLDCNT)=ZPATH_"W "_$C(34)_"*ENDREC*"_$C(34)_";C1;Z~"
 .I FIELDNUM[",.01"&(FLDTYPE'["W") D  Q
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_DBNAM_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0;Z;~"
 ..S FLDCNT=FLDCNT+1,FNM2=$P(FNAME,".",1)
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_FNM2_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0,"_SNGQT_"->"_SNGQT_",D1;Z;~"
 ..S FLDCNT=FLDCNT+1,^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"="_$C(34)_";C1;~"_FIELDNUM_"~" Q
WP .I FLDTYPE["W" D  Q  ;Word Processing template setup
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=$C(34)_WPIND_TABNAME_"."_FNAME_"="_$C(34)_";C1;~"_FIELDNUM_"~"
 ..;S ^DIPT(TNUM,"F",FLDCNT)=$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_DBNAM_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0;Z;~"
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)="W "_$C(34)_"|*ENDWP*|"_$C(34)_";C1;Z~"
 ..Q
 .S FLDCNT=FLDCNT+1
 .S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"="_$C(34)_";C1;~"_FIELDNUM_"~"
 .Q
LEV2 ;
 I LEV=2 D  Q
 .K F F M=1:1:3 S F(M)=$P(FIELDNUM,",",M)
 .S FIELDNM1=F(1)_","_F(2)_"," ;CHOP LAST FIELD
 .S ZPATH=FIELDNM1
 .; *** LEVEL 2 NON FIELD SETUP
 .I FIELDNUM[",.01"&(FLDTYPE'["W") D  Q  ;Level 2 non WP field template setup
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_DBNAM_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0;Z;~"
 ..S FLDCNT=FLDCNT+1,FNM=$P(FNAME,".",1)
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_FNM2_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0,"_SNGQT_"->"_SNGQT_",D1;Z;~"
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_FNM_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0,"_SNGQT_"->"_SNGQT_",D1,"_SNGQT_"->"_SNGQT_",D2;~"
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"="_$C(34)_";C1;~"_FIELDNUM_"~" Q
WP2 .I FIELDNUM[",.01"&(FLDTYPE["W") D  Q  ;Lev2 WP template setup
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_DBNAM_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0;Z;~"
 ..S FNM=$P(FNAME,".",1)
 ..;S ^DIPT(TNUM,"F",FLDCNT)=$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_FNM2_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0,"_SNGQT_"->"_SNGQT_",D1;Z;~"
 ..S FLDCNT=FLDCNT+1
 ..S FLDCNT=FLDCNT+1,^DIPT(TNUM,"F",FLDCNT)=$C(34)_WPIND_TABNAME_"."_FNAME_"="_$C(34)_";C1;~"_FIELDNUM_"~" Q
 ..S FLDCNT=FLDCNT+1,^DIPT(TNUM,"F",FLDCNT)="W "_$C(34)_"|*ENDWP*|"_$C(34)_";C1;Z~"
 ..Q
 .;HERE FOR REGULAR FIELD THAT IS PART OF THE MULTIPLE
 .S FLDCNT=FLDCNT+1
 .S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"="_$C(34)_";C1;~"_FIELDNUM_"~"
LEV3 ;LEVEL 3 FIELDS
 I LEV=3 D  Q
 .K F F M=1:1:4 S F(M)=$P(FIELDNUM,",",M)
 .S FIELDNM1=F(1)_","_F(2)_","_F(3)_"," ;CHOP LAST FIELD
 .S ZPATH=FIELDNM1
 .I FIELDNUM[",.01"&(FLDTYPE'["W") D  Q  ;
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND__TABNAME_"."_FNAME_"[KEY_"_DBNAM_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0;Z;~"
 ..S FLDCNT=FLDCNT+1,FNM=$P(FNAME,".",1)
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_FNM2_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0,"_SNGQT_"->"_SNGQT_",D1;Z;~"
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_FNM_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0,"_SNGQT_"->"_SNGQT_",D1,"_SNGQT_"->"_SNGQT_",D2,"_SNGQT_"->"_SNGQT_"D3;~"
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"="_$C(34)_";C1;~"_FIELDNUM_"~"
 ..Q
WP3 .I FIELDNAM[",.01"&(FLDTYPE["W") D  Q  ;Lev3 WP template setup
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)=$C(34)_WPIND_TABNAME_"."_FNAME_"[KEY_"_DBNAM_"]:>"_$C(34)_";C1;~"_FIELDNM1_"W D0;Z;!~"
 ..S FLDCNT=FLDCNT+1,FNM=$P(FNAME,".",1)
 ..S ^DIPT(TNUM,"F",FLDCNT)=$C(34)_WPIND_TABNAME_"."_FNAME_"="_$C(34)_";C1;~"_FIELDNUM_"~"
 ..S FLDCNT=FLDCNT+1
 ..S ^DIPT(TNUM,"F",FLDCNT)="W "_$C(34)_"|*ENDWP*|"_$C(34)_";C1;Z~"
 ..Q
 .;HERE FOR REGULAR FIELD THAT IS PART OF THE MULTIPLE
 .S FLDCNT=FLDCNT+1
 .S ^DIPT(TNUM,"F",FLDCNT)=FIELDNM1_$C(34)_WPIND_TABNAME_"."_FNAME_"="_$C(34)_";C1;~"_FIELDNUM_"~"
 Q
