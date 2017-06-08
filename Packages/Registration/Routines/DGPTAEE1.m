DGPTAEE1 ;ALB/MTC,HIOFO/FT - Austin Edits EAL Listing Continued ;12/4/14 3:05pm
 ;;5.3;Registration;**338,565,678,729,664,884**;Aug 13, 1993;Build 31
 ;
 ;no external references
 ;
 ;DGPTLINE=1 is icd9 layout
 ;DGPTLINE=2 is icd10 layout
H101(REC) ;-- 101 header //patch 850 made the needed changes for 101 so 884 did have to modify this subrtn. ft 12/2/14
 ; INPUT : REC - Node that contains the error
 N I,X,X1,X2
 S X="ADM    SSN       ADM-DATE-TIME LAST-NAME     INIT SOU FROM  SOP POW MS SX"
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 S X=$E(REC,1,4)_"  "_$E(REC,5,14)_SP_$E(REC,15,16)_SP_$E(REC,17,18)_SP_$E(REC,19,20)_SP_$E(REC,21,24)_SP_$E(REC,31,42)_"   "_$E(REC,43,44)_"   "_$E(REC,45,46)_SP_$E(REC,47,52)_SP_$E(REC,53)_"   "_$E(REC,54)_"   "_$E(REC,55)_"  "_$E(REC,56)
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 S X="",$P(X," ",80)=" " F X1=1:1 S I=$P(DGER,",",X1) Q:I=""  I $P(I,":")<12 S X2=+$P(I,":",2),X=$E(X,1,X2-1)_"#"_$E(X,X2+1,80)
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 S X="BIRTHDATE    POS AGO ION ST-CNTY  ZIP   MT INCOME MST CV CV-END SHAD ERI CNTRY"
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 S X=$E(REC,57,58)_SP_$E(REC,59,60)_SP_$E(REC,61,64)_"   "_$E(REC,65,66)_"    "_$E(REC,67)_"   "_$E(REC,68)_"  "_$E(REC,69,73)_"  "_$E(REC,74,78)_"  "_$E(REC,79,80)_SP_$E(REC,81,86)_"  "_$E(REC,87)_"   "_$E(REC,88)_" "_$E(REC,89,94)
 S X=X_"    "_$E(REC,95)_"  "_$E(REC,96)_"   "_$E(REC,97,99)
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 S X="",$P(X," ",80)=" " F X1=1:1 S I=$P(DGER,",",X1) Q:I=""  I $P(I,":")>11 S X2=+$P(I,":",2),X=$E(X,1,X2-1)_"#"_$E(X,X2+1,80)
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 D WRER^DGPTAEE
 Q
 ;
H401(REC) ;-- 401 header
 ; INPUT : REC - Node that contains the error
 N X,X1,X2
 S X="SURG   SSN       ADM-DATE-TIME SURG-DATE-TIME  SPEC CATEG TECH SOP"
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 S X=$E(REC,1,4)_"  "_$E(REC,5,14)_SP_$E(REC,15,16)_SP_$E(REC,17,18)_SP_$E(REC,19,20)_SP_$E(REC,21,24)_"  "_$E(REC,31,32)_SP_$E(REC,33,34)_SP_$E(REC,35,36)_SP_$E(REC,37,40)_"   "
 S X=X_$E(REC,41,42)_"  "_$E(REC,43)_"   "_$E(REC,44)_"   "_$E(REC,45)_"   "_$E(REC,46)
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 S X="",$P(X," ",80)=" " F X1=1:1 S I=$P(DGER,",",X1) Q:I=""  I $P(I,":")<9 S X2=+$P(I,":",2),X=$E(X,1,X2-1)_"#"_$E(X,X2+1,80)
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 I DGPTLINE=1 D  ;icd9 layout.  ft  12/2/14
 .S X="------------SURGICAL CODES-------------  PHY SSN   TRNSPLNT"
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,47,53)_SP_$E(REC,54,60)_SP_$E(REC,61,67)_SP_$E(REC,68,74)_SP_$E(REC,75,81)_"  "_$E(REC,82,90)_"     "_$E(REC,91)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X="",$P(X," ",80)=" " F X1=1:1 S I=$P(DGER,",",X1) Q:I=""  I $P(I,":")>8 S X2=+$P(I,":",2),X=$E(X,1,X2-1)_"#"_$E(X,X2+1,80)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 I DGPTLINE=2 D  ;icd10 layout.  ft  12/2/14
 .S X="------------SURGICAL CODES-------------"
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,47,53)_SP_$E(REC,55,61)_SP_$E(REC,63,69)_SP_$E(REC,71,77)_SP_$E(REC,79,85)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,87,93)_SP_$E(REC,95,101)_SP_$E(REC,103,109)_SP_$E(REC,111,117)_SP_$E(REC,119,125)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,127,133)_SP_$E(REC,135,141)_SP_$E(REC,143,149)_SP_$E(REC,151,157)_SP_$E(REC,159,167)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,167,173)_SP_$E(REC,175,181)_SP_$E(REC,183,189)_SP_$E(REC,191,197)_SP_$E(REC,199,205)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,207,213)_SP_$E(REC,215,221)_SP_$E(REC,223,229)_SP_$E(REC,231,237)_SP_$E(REC,239,246)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X="",$P(X," ",80)=" " F X1=1:1 S I=$P(DGER,",",X1) Q:I=""  I $P(I,":")>8 S X2=+$P(I,":",2),X=$E(X,1,X2-1)_"#"_$E(X,X2+1,80)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 D WRER^DGPTAEE
 Q
 ;
H501(REC) ;-- 501 header
 ; INPUT : REC - Node that contains the error
 N X,X1,X2
 S X="DIAG   SSN       ADM-DATE-TIME MOVE DATE-TIME MPCR CODE SPC LVE PASS SCI"
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 S X=$E(REC,1,4)_"  "_$E(REC,5,14)_SP_$E(REC,15,16)_SP_$E(REC,17,18)_SP_$E(REC,19,20)_SP_$E(REC,21,24)_SP_$E(REC,31,32)_SP_$E(REC,33,34)_SP_$E(REC,35,36)_SP_$E(REC,37,40)_SP
 S X=X_"  "_$E(REC,41,46)_"  "_$E(REC,47,48)_"  "_$E(REC,49,51)_"  "_$E(REC,52,54)_"  "_$E(REC,55)
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 S X="",$P(X," ",80)=" " F X1=1:1 S I=$P(DGER,",",X1) Q:I=""  I $P(I,":")<10 S X2=+$P(I,":",2),X=$E(X,1,X2-1)_"#"_$E(X,X2+1,80)
 S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 I DGPTLINE=1 D  ;icd9 layout. ft  12/2/14
 .S X="-----------DIAGNOSTIC CODES------------"
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,56,62)_SP_$E(REC,63,69)_SP_$E(REC,70,76)_SP_$E(REC,77,83)_SP_$E(REC,84,90)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X="",$P(X," ",80)=" " F X1=1:1 S I=$P(DGER,",",X1) Q:I=""  I $P(I,":")=10 S X2=+$P(I,":",2),X=$E(X,1,X2-1)_"#"_$E(X,X2+1,80)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X="SSN ATTY PHY PHY LOC  CDE BSI LI SI DRUG A4 A5   SC AO IR SWAC"
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,91,99)_"    "_$E(REC,100,105)_"    "_$E(REC,106,107)_"  "_$E(REC,108)_"   "_$E(REC,109)_"  "_$E(REC,110)_SP_$E(REC,111,114)_"  "_$E(REC,115)_SP_$E(REC,116,119)_"  "_$E(REC,120)_"  "_$E(REC,121)_"  "_$E(REC,122)_"  "_$E(REC,123)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X="",$P(X," ",80)=" " F X1=1:1 S I=$P(DGER,",",X1) Q:I=""  I $P(I,":")>10 S X2=+$P(I,":",2),X=$E(X,1,X2-1)_"#"_$E(X,X2+1,80)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 I DGPTLINE=2 D  ;icd10 layout. ft  12/2/14
 .S X="-----------DIAGNOSTIC CODES------------"
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,56,63)_SP_$E(REC,64,71)_SP_$E(REC,72,79)_SP_$E(REC,80,87)_SP_$E(REC,88,95)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,96,103)_SP_$E(REC,104,111)_SP_$E(REC,112,119)_SP_$E(REC,120,127)_SP_$E(REC,128,135)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,136,143)_SP_$E(REC,144,151)_SP_$E(REC,152,159)_SP_$E(REC,160,167)_SP_$E(REC,168,175)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,176,183)_SP_$E(REC,184,191)_SP_$E(REC,192,199)_SP_$E(REC,200,207)_SP_$E(REC,208,215)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X=$E(REC,216,223)_SP_$E(REC,224,231)_SP_$E(REC,232,239)_SP_$E(REC,240,247)_SP_$E(REC,248,255)_SP_$E(REC,265,270)_SP_$E(REC,271,272)_SP_$E(REC,273)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 .S X="",$P(X," ",80)=" " F X1=1:1 S I=$P(DGER,",",X1) Q:I=""  I $P(I,":")>9 S X2=+$P(I,":",2),X=$E(X,1,X2-1)_"#"_$E(X,X2+1,80)
 .S VALMCNT=VALMCNT+1,^TMP("AD",$J,VALMCNT,0)=X
 D WRER^DGPTAEE
 Q
 ;
