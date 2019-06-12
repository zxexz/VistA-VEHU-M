YTSCDR ;SLC/PIJ - Score CDR ; 01/08/2016
 ;;5.01;MENTAL HEALTH;**123**;DEC 30,1994;Build 72
 ;
 Q
 ;
DATA1   ;
 S YSINSNAM=$P(YSDATA(2),U,3)
 I $G(YSINSNAM)="" S YSINSNAM=$G(YS("CODE"),"NO NAME PASSED")
 S NODE=2 F  S NODE=$O(YSDATA(NODE)) Q:NODE=""  D  ; Start at YSDATA(3)
 .S DATA=YSDATA(NODE)
 .S YSQN=$P(DATA,U,1)
 .S YSCDA=$P($G(DATA),U,3)
 .D DESGNTR^YTSCORE(YSQN,.DES)
 .S LEG=$$GET1^DIQ(601.75,YSCDA_",",4,"I")
 .S TMPANS=LEG
 .D SCOREANS
 Q
 ;
SCOREANS ;
 I (DES=1) D  Q  ; MEMORY
 .S MEM=TMPANS
 .I (TMPANS=0) S CDRSCORE=0
 .I (TMPANS=1) S CDRSCORE="0.5"
 .I (TMPANS=2) S CDRSCORE=1
 .I (TMPANS=3) S CDRSCORE=2
 .I (TMPANS=4) S CDRSCORE=3
 ;
 I (DES=6)&(TMPANS'=0) D  ; Personal Care 
 .S TMPANS=TMPANS+1 ; No ".5" score
 I TMPANS>MEM S HMAJOR=HMAJOR_TMPANS_"^",ABOVE=ABOVE+1
 I TMPANS<MEM S LMAJOR=LMAJOR_TMPANS_"^",BELOW=BELOW+1
 ;
 I MEM=-1 Q
 I (ABOVE>2)&(BELOW>1) S RESULT=CDRSCORE
 I (ABOVE>2)&(BELOW<2) D
 .S CDRSCORE=$$MOSTFREQ(HMAJOR)
 .I ($L(CDRSCORE,U)-1)>0 D  ; tied scores: pick lowest
 ..S CDRSCORE=$P(CDRSCORE,U,1)
 ;
 I (BELOW>2)&(ABOVE>1) S RESULT=CDRSCORE
 I (BELOW>2)&(ABOVE<2) D
 .S CDRSCORE=$$MOSTFREQ(LMAJOR)
 .I ($L(CDRSCORE,U)-1)>0 D  ; tied scores: pick highest
 ..S CDRSCORE=$P(CDRSCORE,U,2)
 ;
 I (MEM=1)&(ABOVE>2) S CDRSCORE=1
 I (MEM=0)&(ABOVE>1) S CDRSCORE="0.5"
 I (CDRSCORE=0)&(MEM>0) S CDRSCORE="0.5"
 Q
 ;
MOSTFREQ(STRINGIN)   ; Returns most frequent score; ties return a blank
 N I
 S I=""
 S ACOUNT=$L(STRINGIN,U)-1
 I ACOUNT=0 Q RESULT
 ;
 F I=1:1:ACOUNT D
 .I $P(STRINGIN,U,I)=0 S GOT0=GOT0+1
 .I $P(STRINGIN,U,I)=1 S GOT1=GOT1+1
 .I $P(STRINGIN,U,I)=2 S GOT2=GOT2+1
 .I $P(STRINGIN,U,I)=3 S GOT3=GOT3+1
 .I $P(STRINGIN,U,I)=4 S GOT4=GOT4+1
 ;
 I (GOT0>GOT1)&(GOT0>GOT2)&(GOT0>GOT3)&(GOT0>GOT4) S RESULT=0
 I (GOT1>GOT0)&(GOT1>GOT2)&(GOT1>GOT3)&(GOT1>GOT4) S RESULT="0.5"
 I (GOT2>GOT0)&(GOT2>GOT1)&(GOT2>GOT3)&(GOT2>GOT4) S RESULT=1
 I (GOT3>GOT0)&(GOT3>GOT1)&(GOT3>GOT2)&(GOT3>GOT4) S RESULT=2
 I (GOT4>GOT0)&(GOT4>GOT1)&(GOT4>GOT2)&(GOT4>GOT3) S RESULT=3
 ;
 ; No clear winner, get the ties
 I RESULT="" D  Q RESULT
 .I (GOT0=2)&((GOT0=GOT1)!(GOT0=GOT2)!(GOT0=GOT3)!(GOT0=GOT4)) S RESULT="0^"
 .I (GOT1=2)&((GOT1=GOT0)!(GOT1=GOT2)!(GOT1=GOT3)!(GOT1=GOT4)) S RESULT=RESULT_"0.5^"
 .I (GOT2=2)&((GOT2=GOT0)!(GOT2=GOT1)!(GOT2=GOT3)!(GOT2=GOT4)) S RESULT=RESULT_"1^"
 .I (GOT3=2)&((GOT3=GOT0)!(GOT3=GOT1)!(GOT3=GOT2)!(GOT3=GOT4)) S RESULT="2^"
 .I (GOT4=2)&((GOT4=GOT0)!(GOT4=GOT1)!(GOT4=GOT2)!(GOT4=GOT3)) S RESULT="3^"
 ;
 Q RESULT
 ;
SCORESV ;
 I $D(^TMP($J,"YSG",1)),^TMP($J,"YSG",1)="[ERROR]" D  Q  ;-->out
 .K ^TMP($J,"YSCOR")
 .S ^TMP($J,"YSCOR",1)="[ERROR]"
 .S ^TMP($J,"YSCOR",2)=$G(YSINSNAM)_" Scale not found"
 ;
 S YSSCNAM=$P($G(^TMP($J,"YSG",3)),U,4)
 K ^TMP($J,"YSCOR")
 S ^TMP($J,"YSCOR",1)="[DATA]"
 S ^TMP($J,"YSCOR",2)=$$GET1^DIQ(601.87,518_",",3,"I")_"="_CDRSCORE
 Q
 ;
DLLSTR(YSDATA,YS,YSTRNG) ;
 ;  YSTRNG = 1 Score Instrument
 ;  YSTRNG = 2 get Report Answers and Text
 N DATA,DES,LEG,NODE,TOTAL,CDRSCORE
 N YSCDA,YSSCNAM,YSINSNAM,YSQN
 N RESULT,HMAJOR,LMAJOR,STRINGIN
 N GOT0,GOT1,GOT2,GOT3,GOT4
 N ABOVE,BELOW,TMPANS,ACOUNT,MEM
 ;
 S (GOT0,GOT1,GOT2,GOT3,GOT4)=0
 S (HMAJOR,LMAJOR)=""
 S (ACOUNT,CDRSCORE,TOTAL)=0
 S (STRINGIN,RESULT)=""
 S MEM=-1
 S (ABOVE,BELOW,TMPANS)=0
 ;
 I YSTRNG=2 Q  ;do nothing, no special text in report
 D DATA1
 D SCORESV
 Q