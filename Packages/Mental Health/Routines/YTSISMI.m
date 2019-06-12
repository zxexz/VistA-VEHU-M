YTSISMI ;SLC/PIJ - Score ISMI ; 01/08/2016
 ;;5.01;MENTAL HEALTH;**123**;DEC 30,1994;Build 72
 ;
 ;Public, Supported ICRs
 ; #2056 - Fileman API - $$GET1^DIQ
 ;
 Q
 ;
DATA1 ;
 S YSINSNAM=$P($G(YSDATA(2)),U,3)
 I $G(YSINSNAM)="" S YSINSNAM=$G(YS("CODE"),"NO NAME PASSED")
 S NODE=2 F  S NODE=$O(YSDATA(NODE)) Q:NODE=""  D  ; Start at YSDATA(3)
 .S DATA=YSDATA(NODE)
 .S YSQN=$P(DATA,U,1)
 .S YSCDA=$P($G(DATA),U,3)
 .D DESGNTR^YTSCORE(YSQN,.DES)
 .;CHOICE ID's aren't correct, manually map
 .I YSCDA=780 S LEG=1  ; Strongly Disagree
 .I YSCDA=782 S LEG=2  ; Disagree
 .I YSCDA=783 S LEG=3  ; Agree
 .I YSCDA=785 S LEG=4  ; Strongly Agree
 .I (YSCDA<780)!(YSCDA>785) Q  ; skipped answers not scored
 .; Alien
 .I (DES=1)!(DES=5)!(DES=8)!(DES=16)!(DES=17)!(DES=21) D  Q
 ..S ALIEN=ALIEN+1
 ..S TALIEN=TALIEN+LEG
 ..S TOTALSUM=TOTALSUM+LEG
 .; Stereotypes
 .I (DES=2)!(DES=6)!(DES=10)!(DES=18)!(DES=19)!(DES=23)!(DES=29) D  Q
 ..S STEREO=STEREO+1
 ..S TSTEREO=TSTEREO+LEG
 ..S TOTALSUM=TOTALSUM+LEG
 .; Discriminiation
 .I (DES=3)!(DES=15)!(DES=22)!(DES=25)!(DES=28) D  Q
 ..S DISCRIM=DISCRIM+1
 ..S TDISCRIM=TDISCRIM+LEG
 ..S TOTALSUM=TOTALSUM+LEG
 .; Social Withdrawal
 .I (DES=4)!(DES=9)!(DES=11)!(DES=12)!(DES=13)!(DES=20) D  Q
 ..S WITHDRAW=WITHDRAW+1
 ..S TWITHDR=TWITHDR+LEG
 ..S TOTALSUM=TOTALSUM+LEG
 .; Stigma Resistance: reverse score before adding to total
 .I (DES=7)!(DES=14)!(DES=24)!(DES=26)!(DES=27) D  Q
 ..S RESIST=RESIST+1
 ..S TRESIST=TRESIST+(5-LEG)
 ..S TOTALSUM=TOTALSUM+(5-LEG)
 Q
 ;
TOTAL ;
 S TALIEN=$S(ALIEN=0:"All questions skipped",1:$J((TALIEN/ALIEN),0,2))
 S TSTEREO=$S(STEREO=0:"All questions skipped",1:$J((TSTEREO/STEREO),0,2))
 S TDISCRIM=$S(DISCRIM=0:"All questions skipped",1:$J((TDISCRIM/DISCRIM),0,2))
 S TWITHDR=$S(TWITHDR=0:"All questions skipped",1:$J((TWITHDR/WITHDRAW),0,2))
 S TRESIST=$S(RESIST=0:"All questions skipped",1:$J((TRESIST/RESIST),0,2))
 S TOTALSUM=TOTALSUM/(ALIEN+STEREO+DISCRIM+WITHDRAW+RESIST)
 Q
SCORESV ;
 I $D(^TMP($J,"YSG",1)),^TMP($J,"YSG",1)="[ERROR]" D  Q  ;-->out
 .K ^TMP($J,"YSCOR")
 .S ^TMP($J,"YSCOR",1)="[ERROR]"
 .S ^TMP($J,"YSCOR",2)=YSINSNAM_" Scale not found"
 ;
 K ^TMP($J,"YSCOR")
 S ^TMP($J,"YSCOR",1)="[DATA]"
 S ^TMP($J,"YSCOR",2)=$$GET1^DIQ(601.87,589_",",3,"I")_"="_TALIEN
 S ^TMP($J,"YSCOR",3)=$$GET1^DIQ(601.87,590_",",3,"I")_"="_TSTEREO
 S ^TMP($J,"YSCOR",4)=$$GET1^DIQ(601.87,591_",",3,"I")_"="_TDISCRIM
 S ^TMP($J,"YSCOR",5)=$$GET1^DIQ(601.87,592_",",3,"I")_"="_TWITHDR
 S ^TMP($J,"YSCOR",6)=$$GET1^DIQ(601.87,593_",",3,"I")_"="_TRESIST
 S ^TMP($J,"YSCOR",7)=$$GET1^DIQ(601.87,594_",",3,"I")_"="_$J(TOTALSUM,0,2)
 Q
 ;
DLLSTR(YSDATA,YS,YSTRNG) ;
 ;  YSTRNG = 1 Score Instrument
 ;  YSTRNG = 2 get Report Answers and Text
 N DATA,DES,NODE,LEG,YSQN,YSCDA,YSINSNAM
 N ALIEN,STEREO,DISCRIM,WITHDRAW,RESIST
 N TOTAL,TALIEN,TSTEREO,TDISCRIM,TWITHDR,TRESIST,TOTALSUM
 ;
 S (ALIEN,STEREO,DISCRIM,WITHDRAW,RESIST)=0
 S (TOTAL,TALIEN,TSTEREO,TDISCRIM,TWITHDR,TRESIST,TOTALSUM)=0
 ;
 I YSTRNG=2 Q  ; no special text in the report
 ;
 D DATA1
 D TOTAL
 D SCORESV
 Q