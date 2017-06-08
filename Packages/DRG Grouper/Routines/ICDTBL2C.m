ICDTBL2C ;ALB/MJB/KUM - GROUPER UTILITY FUNCTIONS;08/09/2010
 ;;18.0;DRG Grouper;**50,49,54,55,61,62,64,79**;Oct 20, 2000;Build 6
DRG200 ;
DRG201 I ICDSD["c" S ICDRG=$S(ICDMCC=2:199,ICDMCC=1:200,1:201) Q
 S ICDRG=$S(ICDMCC=2:199,ICDMCC=1:200,1:201) Q
DRG202 ;
DRG203 S ICDRG=$S(ICDMCC>0:202,1:203) Q
DRG204 S ICDRG=204 Q
DRG205 ;
DRG206 S ICDRG=$S(ICDMCC=2:205,1:206) Q
DRG207 S ICDRG=207 Q
DRG208 I ICDOR["o" D DRG982^ICDTBL9C Q
 S ICDRG=208 Q
DRG215 S ICDRG=215 Q
DRG216 ;valve procedures
 N ICDE1,ICDE2
 S ICDE1=$S($D(ICDOP(" 37.95"))&($D(ICDOP(" 37.96"))):1,1:0),ICDE2=$S($D(ICDOP(" 37.97"))&($D(ICDOP(" 37.98"))):1,1:0)
 S:ICDOR["H" ICDRG=$S(ICDOR["N"&ICDE1:218,ICDOR["N"&ICDE2:218,ICDOR["O":218,1:ICDRG)
 S:ICDOR'["H" ICDRG=$S(ICDOR["N"&ICDE1:221,ICDOR["N"&ICDE2:221,ICDOR["O":221,1:ICDRG)
 I ICDOR["P"&(ICDE1+ICDE2=0) S ICDRG=$S(ICDOR["H":218,1:221)
 S:ICDRG=218 ICDRG=$S(ICDMCC=2:216,ICDMCC=1:217,1:218)
 S:ICDRG=221 ICDRG=$S(ICDMCC=2:219,ICDMCC=1:220,1:221)
 Q
DRG217 D DRG216 Q
DRG218 D DRG216 Q
DRG219 D DRG216 Q
DRG220 D DRG216 Q
DRG221 D DRG216 Q
DRG222 N ICDE1,ICDE2,ICDE3,ICDE4
 S ICDE1=$S($D(ICDOP(" 37.95"))&(($D(ICDOP(" 37.96")))!($D(ICDOP(" 00.54")))):1,1:0)
 S ICDE2=$S($D(ICDOP(" 37.97"))&(($D(ICDOP(" 37.98")))!($D(ICDOP(" 00.54")))):1,1:0)
 S ICDE3=$S($D(ICDOP(" 00.52"))&($D(ICDOP(" 00.54"))):1,1:0)
 ;S ICDE4=$S($D(ICDOP(" 00.54"))&($D(ICDOP(" 37.95"))):1,1:0)
 S ICDE4=$S($D(ICDOP(" 37.74"))&(($D(ICDOP(" 37.96")))!($D(ICDOP(" 37.98")))!($D(ICDOP(" 00.54")))):1,1:0)
 S ICDRG=999
 I $D(ICDOP(" 37.94"))!$D(ICDOP(" 00.51")) I ICDE1+ICDE2+ICDE3+ICDE4=0 D
 . S ICDRG=$S(ICDMCC=2:226,1:227)
 I '$D(ICDOP(" 37.94"))&('$D(ICDOP(" 00.51"))) I ICDE1!ICDE2!ICDE3!ICDE4 D
 . S ICDRG=$S(ICDMCC=2:226,1:227)
 ; "HN" in ICDOR represents OR proc 37.21-.23, 37.26, 88.52-.58
 I (ICDRG=226)!(ICDRG=227) I ICDOR["HN" I '$D(ICDOP(" 37.26")) S ICDRG=$S((ICDPD["A")&(ICDMCC=2):222,ICDPD["A":223,ICDMCC=2:224,1:225)
 I ICDRG=470 D CMS115
 Q
DRG223 D DRG222 Q
DRG224 ;
DRG225 D DRG222 Q
DRG226 ;
DRG227 D DRG222 Q
DRG228 ;
DRG229 ;
DRG230 ;DRGs 228-230 note ICDOR["Oo" = operation and DRG CMS108/MS230 procedure
 I $D(ICDOP(" 35.33")) D DRG221 Q
 I ICDOR["Oo"!($D(ICDOP(" 38.44"))&($D(ICDOP(" 38.45")))) D  Q
 . S ICDRG=$S(ICDMCC=2:228,ICDMCC=1:229,1:230) Q
 G DRG237
DRG231 S ICDRG=999
 I ICDOR["b" D DRG235
 I ICDOR["b" I $D(ICDOP(" 35.96"))!($D(ICDOP(" 00.66"))) D  Q
 . S ICDRG=$S(ICDMCC=2:231,1:232)
 I ICDOR["b" I $D(ICDOP(" 37.21"))!($D(ICDOP(" 37.22")))!($D(ICDOP(" 37.23"))) D DRG233 Q
 ;I ICDOR["b" I $D(ICDOP(" 37.21"))!($D(ICDOP(" 37.22")))!($D(ICDOP(" 37.23"))) D DRG233 Q
 I ICDRG'=231&(ICDRG'=232)&(ICDRG'=233)&(ICDRG'=234)&(ICDRG'=235)&(ICDRG'=236) S ICDRG=999 D DRG237
 Q
DRG232 D DRG231 Q
DRG233 ; called from DRG231
 D MCV
 S ICDRG=$S(ICDMCV:233,ICDMCV1:233,1:234)
 S ICDRG=$S(ICDMCC=2:233,1:234)
 Q
DRG234 D DRG233 Q
DRG235 ;
DRG236 S ICDRG=$S(ICDMCC=2:235,1:236) Q
DRG237 I ICDOR["Oo" D DRG228
 S ICDRG=$S((ICDMCC=2)&(ICDOR[7):237,ICDOR[7:238,1:ICDRG)
 I $D(ICDOP(" 39.73")) S ICDRG=237
 I "228^229^230^237^238"[ICDRG Q
 ;I $D(ICDJJ(478))&('$D(ICDJJ(110))&'($D(ICDJJ(111)))) D DRG478^ICDTBL6C
 D DRG239 I "239^240^241"[ICDRG Q
 I ICDOR["p" D DRG260
 I ICDOR["1" D CMS516
 Q
DRG238 S ICDRG=$S(ICDMCC=2:237,1:238) D  Q
 . I $D(ICDOP(" 39.73")) S ICDRG=237
DRG239 ;239-241
DRG240 ;
DRG241 S ICDRG=$S($D(ICDJJ(241)):241,1:ICDRG)
 I ICDRG=241 S ICDRG=$S(ICDMCC=2:239,ICDMCC=1:240,1:241)
 Q
DRG242 ; called from CMS115
 D MCV
 I ICDMCV!(ICDMCV1) D
 . S ICDRG=$S(ICDMCC=2:242,ICDMCC=1:243,1:244)
 Q
DRG243 D CMS115 Q
DRG244 D CMS115 Q
DRG245 I $D(ICDOP(" 37.95"))!($D(ICDOP(" 37.97")))!($D(ICDOP(" 00.52"))) D DRG265 Q
 E  S ICDRG=245 Q
DRG246 ;
 D MCV
 I ICDMCV!ICDMCV1 S ICDRG=246
 E  S ICDRG=247
 S ICDRG=$S(ICDMCC=2:246,1:247) D  Q
 . I $D(ICDOP(" 00.66")),$D(ICDOP(" 00.43")) S ICDRG=246
 . I $D(ICDOP(" 36.07")),$D(ICDOP(" 00.43")) S ICDRG=246
 . I $D(ICDOP(" 00.66")),$D(ICDOP(" 00.48")) S ICDRG=246
 . I $D(ICDOP(" 36.07")),$D(ICDOP(" 00.48")) S ICDRG=246
 Q
DRG247 D CMS516 Q
DRG248 ;Called from CMS516
 D MCV
 I ICDMCV!(ICDMCV1) S ICDRG=248
 S ICDRG=$S(ICDMCC=2:248,1:249) D  Q
 . I $D(ICDOP(" 00.66")),$D(ICDOP(" 00.43")) S ICDRG=248
 . I $D(ICDOP(" 36.06")),$D(ICDOP(" 00.43")) S ICDRG=248
 . I $D(ICDOP(" 00.66")),$D(ICDOP(" 00.48")) S ICDRG=248
 . I $D(ICDOP(" 36.06")),$D(ICDOP(" 00.48")) S ICDRG=248
 Q
DRG249 ;Called from CMS516
 D MCV
 I 'ICDMCV&('ICDMCV1) S ICDRG=249
 S ICDRG=$S(ICDMCC=2:248,1:249) D  Q
 . I $D(ICDOP(" 00.66")),$D(ICDOP(" 00.43")) S ICDRG=248
 . I $D(ICDOP(" 36.06")),$D(ICDOP(" 00.43")) S ICDRG=248
 . I $D(ICDOP(" 00.66")),$D(ICDOP(" 00.48")) S ICDRG=248
 . I $D(ICDOP(" 36.06")),$D(ICDOP(" 00.48")) S ICDRG=248
 Q
DRG250 ;
DRG251 S ICDRG=$S(ICDMCC=2:250,1:251) Q
DRG252 ;
DRG253 ;
DRG254 S ICDRG=$S(ICDMCC=2:252,ICDMCC=1:253,1:254) Q
DRG255 ;
DRG256 ;
DRG257 S ICDRG=$S(ICDMCC=2:255,ICDMCC=1:256,1:257) Q
DRG258 ;I ICDOR["p" 
DRG259 D CMS115 I "242^243^244^291^292^293"[ICDRG Q
 S ICDRG=$S(ICDMCC=2:258,1:259) Q
DRG260 ;
 D CMS115 I "242^243^244^291^292^293"[ICDRG Q
 D DRG258 I $D(ICDOP(" 00.56")) S ICDRG=264 Q
 I ICDOR["p" S ICDRG=$S(ICDMCC=2:260,ICDMCC=1:261,1:262)
 Q
DRG261 D DRG260 Q
DRG262 D DRG260 Q
DRG263 S ICDRG=263 Q
DRG264 S ICDRG=264 Q
DRG265 S ICDRG=265 Q
DRG280 ;
DRG281 ;
DRG282 I ICDPD="" S ICDRG=282
 I ICDPD["I"&(ICDSD'["I") S ICDRG=$S(ICDMCC=2:280,ICDMCC=1:281,1:282) Q
 I ICDPD["I"&(ICDSD'["c") S ICDRG=$S(ICDMCC=2:280,ICDMCC=1:281,1:282) Q
 I ICDPD["I"&(ICDSD'["S") S ICDRG=$S(ICDMCC=2:280,ICDMCC=1:281,1:282) Q
 I ICDPD["c"&(ICDSD'["I") S ICDRG=$S(ICDMCC=2:280,ICDMCC=1:281,1:282) Q
 I ICDPD["c"&(ICDSD'["c") S ICDRG=$S(ICDMCC=2:280,ICDMCC=1:281,1:282) Q
 I ICDPD["c"&(ICDSD'["S") S ICDRG=$S(ICDMCC=2:280,ICDMCC=1:281,1:282) Q
 I ICDPD["HJV"&(ICDSD["AI"),ICDMCC=2 S ICDRG=281 Q
 S ICDRG=$S(ICDMCC=2&(ICDSD["H"):280,ICDMCC=1&(ICDSD["H"):281,1:282) Q
DRG283 ;
DRG284 ;
DRG285 ;
 I $D(ICDDXT("427.41"))&$D(ICDDXT("427.5")) S ICDMCC=1
 S ICDRG=$S(ICDMCC=2:283,ICDMCC=1:284,1:285) Q
DRG286 ;
DRG287 I ICDMAJ'=""&(ICDMAJ'["A") D DRG982^ICDTBL9C Q
 S ICDRG=$S(ICDMCC=2:286,1:287) Q
DRG288 ;
DRG289 ;
DRG290 S ICDRG=$S(ICDMCC=2:288,ICDMCC=1:289,1:290) Q
DRG291 ;
DRG292 ;
DRG293 I ICDOR["K" D DRG252 Q
 I ICDOR["P" D DRG260 Q
 I (ICDDX(1)=5458!$D(ICDDXT("785.51"))),'ICDEXP S ICDMCC=2
 I (ICDDX(1)=2480&$D(ICDDXT("428.33"))) S ICDMCC=1
 S ICDRG=$S(ICDMCC=2:291,ICDMCC=1:292,1:293) Q
DRG294 ;
DRG295 S ICDRG=$S(ICDMCC>0:294,1:295) Q
DRG296 ;
DRG297 ;
DRG298 I (ICDDX(1)=2561!$D(ICDDXT(" 427.5"))),'ICDEXP S ICDMCC=2
 S ICDRG=$S(ICDMCC=2:296,ICDMCC=1:297,1:298) Q
DRG299 S ICDRG=$S(ICDMCC=2:299,ICDMCC=1:300,1:301) Q
 Q
CMS115 ;convert DRG115^ICDTBL2C code - no MS-DRG 115 existed
 D EN1^ICDDRG5
 I ICDOR[7,'$D(ICDCC2)!('$D(ICDCC3)) S ICDRG=$S(ICDMCC=2:260,ICDMCC=1:261,1:262) Q
 I ICDPD'["I"&(ICDOR'["p")&(ICDCC2=0)&(ICDCC3=0) D  Q
 .I ICDSD["Z" S ICDMCC=0
 .S ICDRG=$S(ICDMCC=2:291,ICDMCC=1:292,1:293)
 I ICDCC2=1!(ICDCC3=1) D DRG242
 I ((ICDRG>241)&(ICDRG<245)) Q
 ; ICDCC2 identifies AICD LEAD OR GNRTR
 I ICDCC2=1!(ICDCC3=1) D  Q
 . S ICDRG=$S(ICDMCC=2:242,ICDMCC=1:243,1:244) Q
 I ICDOR["p" D  Q
 . S ICDRG=$S(ICDMCC=2:242,ICDMCC=1:243,1:244) Q
 Q
CMS516 ;convert DRG516^ICDTBL6C code - no MS-DRG 516 exists
 I $D(ICDOP(" 37.72")),$D(ICDOP(" 37.83")),"242^243^244"[ICDRG Q
 S ICDRG=250
 I '$D(ICDOP(" 36.06"))&'$D(ICDOP(" 92.27"))&'$D(ICDOP(" 36.07")) D DRG251
 E  D DRG248
 ;I $D(ICDOP(" 36.06"))!$D(ICDOP(" 92.27")) D DRG249
 I $D(ICDOP(" 36.07")) D DRG246
 Q
MCV ; checks to see if case qualifies as an MCV (major cardiovascular complications or complex conditions)
 S (ICDMCV,ICDMCV1,ICDMCV2)=0
 ; ICDPD=identifier for prime dx  ICDSD=identifier for any secondary dx
 ; DGDX(1)=prime dx  ICDDX(1)=ien of prime dx ICDDXT=any secondary dx  
 I ICDPD["c"!(ICDSD["c") S ICDMCV=1
 I ICDSD["s" S ICDMCV=1
 ;I DGDX(1)["426.0"!(DGDX(1)["426.53")!(DGDX(1)["426.54") S ICDMCV1=1
 I $G(ICDDX(1))=9056!($G(ICDDX(1))=2548)!($G(ICDDX(1))=2549) S ICDMCV1=1
 I $D(ICDDXT("426.0"))!($D(ICDDXT("426.53")))!($D(ICDDXT("426.54"))) S ICDMCV1=1
 ;I DGDX(1)["411.1"!(DGDX(1)["411.81") S ICDMCV2=1
 I $G(ICDDX(1))=2500!($G(ICDDX(1))=12477) S ICDMCV2=1
 I $D(ICDDXT("411.1"))!($D(ICDDXT("411.81"))) S ICDMCV2=1
 Q
