PSNPPSI3 ;HP/MJE-PPSN update NDF data for parsing DATAO records ; 05 Mar 2014  1:20 PM
 ;;4.0;NATIONAL DRUG FILE;**513**; 30 Oct 98;Build 61
 ;Reference to ^DD supported by DBIA #1258
 ;
 Q
 ;
 ;This routine parses DATAO records which are edits to existing file entries
DATAO ;
 K XFILE,XFLDS
 K FDA
 S FDA(57.231,CTRLXIEN_","_CTRLIEN_",",6)="DATAO",PSNTMPN="DATAO"
 D UPDATE^DIE("","FDA","CTRLIEN")
 K FDA
 D CTRLFILE^PSNPPSMS(0)
 D CTRLSS^PSNPPSMS(0)
 D CTRLIEN^PSNPPSMS(0)
 S (OJJ,FILE)=0,GROOT=$NA(^TMP("PSN PPSN PARSED",$J,"DATAO"))
 ;now load the rest of the data
 F  S FILE=$O(@GROOT@(FILE)) Q:'FILE  D CTRLFILE^PSNPPSMS(FILE) S ROOT=$$ROOT^DILFD(FILE) I ROOT]"" S GROOT1=$NA(@GROOT@(FILE)) F JJ=1:2 Q:'$D(@GROOT1@(JJ))  D
 .S (DIA,NEW)=""
 .S DIA=@GROOT1@(JJ) I $G(@GROOT1@(JJ+1))]"" S NEW=@GROOT1@(JJ+1)
 .S ^TMP("PSN PPSN PARSED",$J,"AE_PRODUCTS",+DIA)=""
 .D CTRLSS^PSNPPSMS($TR(GROOT1,"^")_","_JJ)
 .;
 .I $G(PSNMULTI) D
 ..S (MIENS,MFLDS)="",MIENS=$P(DIA,"^")_",",MFLDS=$P(DIA,"^",3)
 ..I MFLDS'=""&($P(NEW,"^")'=MIENS) S PSNMULTI=0,^TMP("PSN PPSN.WPXRF",$J,FILE,OIENS,OFLDS)=""
 .S IENS=$P(DIA,"^")_",",FLDS=$P(DIA,"^",3),ROOT=FILE K FDA,IEN
 .;
 .I FILE=50.68 D UNMATCH^PSNPPSI2
 .;
 .K RES1
 .I '$G(PSNMULTI) D FIELD^DID(FILE,FLDS,"","TYPE","RES1")
 .I $G(RES1("TYPE"))="WORD-PROCESSING"!$G(PSNMULTI) D  Q
 ..I '$G(PSNMULTI) D
 ...S MJJ=JJ,OIENS=IENS,OFLDS=FLDS
 ...I $D(^TMP("PSN PPSN.WPXRF",$J,FILE,IENS,FLDS)) K ^TMP("PSN PPSN.WP",$J,FILE,OIENS,OFLDS),^TMP("PSN PPSN.WPXRF",$J,FILE,IENS,FLDS)
 ...;Set 5000 file for word processing fields
 ...S PSNWP=$$GET1^DID(FILE,"","","GLOBAL NAME")_$P(DIA,"^")_","  ;"PSNDF(FILE,"_IENS_",1)"
 ...D FIELD^DID(FILE,FLDS,"Z","GLOBAL SUBSCRIPT LOCATION","RES2")
 ...S RES3="",RES3=$P(RES2("GLOBAL SUBSCRIPT LOCATION"),";")
 ...S PSNWP=PSNWP_$S(RES3?1AN.AN:""""_RES3_"""",1:RES3)_")"
 ...I PSNPS="N",'$D(^NDFK(5000,1,4,"B",PSNWP)) S X=$O(^NDFK(5000,1,4," "),-1)+1,^(X,0)=PSNWP,^NDFK(5000,1,4,"B",PSNWP,X)=""
 ..;
 ..I '$P(DIA,"^",3) S ^TMP("PSN PPSN.WP",$J,FILE,OIENS,OFLDS,MJJ)=$$STRIP^PSNPPSNU(DIA),MJJ=MJJ+1
 ..I '$P(NEW,"^",3) S ^TMP("PSN PPSN.WP",$J,FILE,OIENS,OFLDS,MJJ)=$$STRIP^PSNPPSNU(NEW),PSNMULTI=1,MJJ=MJJ+1
 ..I $P(NEW,"^",3)'="" S JJ=JJ-1
 .;
 .S XFILE=FILE
 .I FLDS["," D
 ..I FILE=50.68,$P($P(DIA,"^",3),",")=43 D MULTIPLE^PSNPPSI2 Q  ;new generic multiple .01 field code
 ..S LI=$P(DIA,"^",3) F J=1:1:$L(LI,",")-1 S ROOT=+$P(^DD(ROOT,+$P(LI,",",J),0),"^",2)
 ..S LI=$P(DIA,"^"),IENS="" F J=$L(LI,","):-1:1 S IENS=IENS_$P(LI,",",J)_"," S ^TMP("PSN PPSN PARSED",$J,"AE_PRODUCTS",$P(LI,",",J))=""
 ..S XFLDS=$P(FLDS,",",$L(FLDS,",")-1) I $G(XFLDS)'="" S XFILE=+$P(^DD(FILE,XFLDS,0),"^",2) S:$G(XFILE)="" XFILE=FILE
 ..S FLDS=$P(FLDS,",",$L(FLDS,","))
 .S DA=+IENS
 .D CTRLIEN^PSNPPSMS(IENS)
 .I FILE=50.68,$P($P(DIA,"^",3),",")=43 Q
 .;
 .I PSNPS="N",FILE=50.68 D
 ..D NDFK^PSNPPSNK
 ..I FLDS=31 D
 ...K ORDP,ORDN,ERROR
 ...S ORDP=$$GET1^DIQ(50.68,+IENS_",",31,"I","ERROR")
 ...S ORDN=NEW
 ...S ^TMP("PSN PPSN PARSED",$J,"POST_RUN",5000.608,FILE,+IENS,FLDS)=ORDP_"^"_ORDN
 ..I $P(DIA,"^",3)="14,.01" S ^TMP("PSN PPSN PARSED",$J,"POST_RUN",5000.509,FILE,IENS,FLDS)=NEW
 .;
 .D CLASS:FILE=50.68
 .;new generic multiple .01 field code
 .I FILE=50.68,$P($P(DIA,"^",3),",")=43 Q
 .;
 .I FILE=50.68,$P(DIA,"^",3)="21" D  K FDA
 ..K FDA,ERROR
 ..D NOW^%DTC
 ..S FDA(50.6899,"+1,"_IENS,.01)=$S(NEW="":$P(%,"."),1:NEW),FDA(50.6899,"+1,"_IENS,.02)=$S(NEW="":1,1:0)
 ..D UPDATE^DIE("","FDA","","ERROR") D ERROR^PSNPPSNU:$D(ERROR("DIERR")) K FDA
 .I PSNPS="N" D
 ..I FILE=50.416 D INGRED^PSNPPSNK
 ..I FILE=56 D 56^PSNPPSMS(FILE,DIA,NEW,PSNTMPN)
 .I PSNPS="N",FILE=50.67&($P(DIA,"^",3)=1) D 
 .. S ^TMP("PSN PPSN PARSED",$J,"POST_RUN",50.628,FILE,+DIA,1)=NEW
 .;****************************************************** 47
 .I FILE[50.68,$P(DIA,"^",3)="45,1"!($P(DIA,"^",3)="45,2") K DIE D  Q  ;**COPAY TIERS
 ..K FDA,ERROR
 ..S DA=$P($P(DIA,"^"),",",2),FDA(50.6845,IENS,$P($P(DIA,"^",3),",",2))=NEW D FILE^DIE("","FDA","ERROR") D ERROR^PSNPPSNU:$D(ERROR("DIERR"))
 ..K FDA
 .;50.606 DOSAGE FORM UNITS
 .I FILE[50.606,$P(DIA,"^",3)="8,1" K DIE D  Q
 ..K FDA,ERROR
 ..S DA=$P($P(DIA,"^"),",",2),FDA(50.6068,IENS,$P($P(DIA,"^",3),",",2))=NEW D FILE^DIE("","FDA","ERROR") D ERROR^PSNPPSNU:$D(ERROR("DIERR"))
 ..K FDA
 .;50.606 DISPENSE UNITS PER DOSE
 .I FILE[50.606,$P(DIA,"^",3)="9,1" K DIE D  Q
 ..K FDA,ERROR
 ..S DA=$P($P(DIA,"^"),",",2),FDA(50.6069,IENS,$P($P(DIA,"^",3),",",2))=NEW D FILE^DIE("","FDA","ERROR") D ERROR^PSNPPSNU:$D(ERROR("DIERR"))
 ..K FDA
 .;50
 .I $P(DIA,"^",3)="99.991,.01" D  K FDA Q
 ..K FDA,ERROR
 ..S FDA(ROOT,"+"_IENS,FLDS)=NEW D UPDATE^DIE("","FDA","","ERROR") D ERROR K FDA
 .;
 .I $P(DIA,"^",3)="99.991,.02" D  K FDA Q
 ..K FDA,ERROR
 ..S DA=999999999999 S DA=$O(^PS(FILE,$P(DIA,"^"),"TERMSTATUS",DA),-1) S:DA="" DA=1
 ..I FILE=50.6!(FILE=50.68) S DA=999999999999 S DA=$O(^PSNDF(FILE,+$P(DIA,"^"),"TERMSTATUS",DA),-1)
 ..S $P(IENS,",",1)=DA,FDA(ROOT,IENS,.02)=NEW D UPDATE^DIE("","FDA","IEN","ERROR") D ERROR K FDA
 .;
 .;delete sub-field entries if NEW="", means it was removed from the product in PPS-N
 .I FILE=50.68&($P(DIA,"^",3)="14,.01")&(NEW="") D  Q
 ..N DA,DIK,DIAU
 ..S DA(1)=$P($P(DIA,"^"),","),ROOT3="^PSNDF(50.68,DA(1),2," ;,ROOT3="^"_XPATH_DA(1)_",2,"
 ..S DIK=ROOT3,DA=$P($P(DIA,"^"),",",2) D ^DIK K DIK,DIAU
 .;set fields 14,1 and 14,2
 .I FILE=50.68&($P(DIA,"^",3)["14,") D  Q
 ..S DA(1)=$P($P(DIA,"^"),","),XPATH=$P(^DD(ROOT,.01,0),"^",3),ROOT3="^"_XPATH_DA(1)_",2,"
 ..K FDA,ERROR S FDA(ROOT,IENS,FLDS)=NEW D UPDATE^DIE("","FDA",DA,"ERROR") D ERROR
 .;
 .;HAZARDOUS TO DISPOSE FIELD 102 = ZERO; KILL FIELDS 103,104,105
 .I FILE=50.68&($P(DIA,"^",3)=102),NEW=0 D
 ..S DA=+$P(DIA,"^"),DIE="^PSNDF(50.68,",DR="103///@;104///@" D ^DIE
 ..D WP^DIE(FILE,DA_",",105,,"@")
 .;
 .I IENS["," K FDA,ERROR S FDA(ROOT,IENS,FLDS)=NEW D FILE^DIE("","FDA","ERROR") D ERROR K FDA,ERROR Q
 .K FDA,ERROR S FDA(FILE,IENS,FLDS)=NEW D FILE^DIE("","FDA","ERROR") D ERROR
 .K FDA,ERROR
 K XFILE,XFLDS
 ;
DATAO2 ;
 S JJ=0 F  S JJ=$O(^TMP("PSNN",$J,JJ)) Q:'JJ  S DA=$P(JJ,",",2),DA(1)=+JJ D
 . I '$D(^PSNDF(50.68,DA(1),0)) D ERROR2^PSNPPSNU(PSNTMPN,ROOT,IENS,DA(1),"VA PRODUCT entry does not exist.") Q
 . D ING^PSNXREF
 S FILE="" F  S FILE=$O(^TMP("PSN PPSN.WP",$J,FILE)) Q:FILE=""  D
 . S IENS="" F  S IENS=$O(^TMP("PSN PPSN.WP",$J,FILE,IENS)) Q:IENS=""  D
 .. S FLDS="" F  S FLDS=$O(^TMP("PSN PPSN.WP",$J,FILE,IENS,FLDS)) Q:FLDS=""  D
 ... K TMP,ERR
 ... S JJ=0 F  S JJ=$O(^TMP("PSN PPSN.WP",$J,FILE,IENS,FLDS,JJ)) Q:'JJ  D
 .... S TMP(JJ)=^TMP("PSN PPSN.WP",$J,FILE,IENS,FLDS,JJ)
 ... D WP^DIE(FILE,IENS,FLDS,"","TMP","ERR")
 K ^TMP("PSN PPSN.WP",$J)
 Q
 ;
ERROR ;
 D ERROR^PSNPPSNU:$D(ERROR("DIERR"))
 Q
 ;
CLASS ;
 I $P(DIA,"^",3)=15 D
 .S OLDV=$$GET1^DIQ(50.68,$P(DIA,"^"),15,"I"),VAGEN=$$GET1^DIQ(50.68,$P(DIA,"^"),.05,"I")
 .S VAGENN=$$GET1^DIQ(50.68,$P(DIA,"^"),.05,"E")
 .;Does not record class/edits on new VA Products same as NDFRR3 & PSSMIGRR routine
 .I OLDV'="",(OLDV'=NEW) S ^TMP("PSN PPSN PARSED",$J,"PRODS CHANGED CLASSES",$P(DIA,"^"))=OLDV_"^"_NEW_"^"_VAGEN_"^"_VAGENN
 Q
