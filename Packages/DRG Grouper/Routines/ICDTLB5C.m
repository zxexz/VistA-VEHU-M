ICDTLB5C ;ALB/EG/ADL - GROUPER UTILITY FUNCTIONS FY 2007; 10/23/00 11:49am ; 6/28/05 4:05pm
 ;;18.0;DRG Grouper;**24**;Oct 20, 2000;Build 5
 ;;ADL;UPDATE FOR CSV PROJECT;Mar 12, 2003
DRG334 S ICDRG=$S(ICDCC:334,1:335) Q
DRG335 S ICDRG=$S(ICDCC:334,1:335) Q
DRG336 S ICDRG=$S(ICDCC:336,1:337) Q
DRG337 S ICDRG=$S(ICDCC:336,1:337) Q
DRG338 I SEX="M" D  Q
 .S ICDRG=$S(ICDPD["M":338,AGE="":470,AGE>17:339,SEX="":470,1:340),ICDRTC=$S(ICDRG=470:3,SEX="":4,1:ICDRTC) Q
 I SEX="F" D  Q
 .I ICDOR["O" D DRG354 Q
 .I ICDOR["Ogz" D DRG363 Q
 .I ICDOR=""!(ICDOR["N") D DRG366
 Q
DRG339 D DRG338 Q
DRG340 D DRG338 Q
DRG342 S ICDRG=$S(AGE>17:342,1:343) I AGE="" S ICDRG=470,ICDRTC=3
 Q
DRG343 S ICDRG=$S(AGE>17:342,1:343) I AGE="" S ICDRG=470,ICDRTC=3
 Q
DRG344 S ICDRG=$S(ICDPD["M":344,1:345) Q
DRG345 S ICDRG=$S(ICDPD["M":344,1:345) Q
DRG346 S ICDRG=$S(ICDCC:346,1:347) I ICDMDC=13 S ICDRG=$S(ICDRG=346:366,1:367)
 Q
DRG347 S ICDRG=$S(ICDCC:346,1:347) I ICDMDC=13 S ICDRG=$S(ICDRG=346:366,1:367)
 Q
DRG348 S ICDRG=$S(ICDCC:348,1:349) Q
DRG349 S ICDRG=$S(ICDCC:348,1:349) Q
DRG350 S ICDRG=$S(SEX="M":350,1:368) I SEX="" S ICDRG=470,ICDRTC=4
 Q
DRG351 S ICDRG=$S('$D(ICDODRG)&(ICDORNR>0):468,SEX="":470,SEX="F":369,1:351),ICDRTC=$S(ICDRG=470:4,1:ICDRTC) Q
DRG352 S ICDRG=$S(SEX="M":352,ICDPD["P":368,1:369) I SEX="" S ICDRG=470,ICDRTC=4
 Q
DRG354 S ICDRG=$S(ICDPD["M":$S(ICDPD["o":357,ICDCC:354,1:355),ICDCC:358,1:359) Q
DRG355 D DRG354 Q
DRG357 S ICDRG=$S(ICDPD["M":$S(ICDPD["o":357,ICDCC:354,1:355),ICDCC:358,1:359) D:'ICDOPCT DRG368 Q
DRG358 D DRG357 Q
DRG359 D DRG357 Q
DRG363 S ICDRG=$S(ICDPD["M":363,1:364) Q
DRG364 S ICDRG=$S(ICDPD["M":363,1:364) Q
DRG366 S ICDRG=$S(ICDCC:366,1:367) Q
DRG367 S ICDRG=$S(ICDCC:366,1:367) Q
DRG368 S ICDRG=$S(SEX="F":368,1:470) I SEX="" S ICDRG=470,ICDRTC=4
 Q
DRG369 S ICDRG=$S(SEX="F":369,1:470) I SEX="" S ICDRTC=4 Q
DRG370 S ICDRG=$S(ICDOR["c"&(ICDCC):370,ICDOR["c":371,ICDOR'["s"&(ICDOR'["g")&(ICDSD["v"!(ICDPD["v")):372,ICDOR'["s"&(ICDOR'["g"):373,ICDOR["s":374,ICDOR["g":375,1:470) Q
DRG371 S ICDRG=$S(ICDPD["D"&(ICDCC):370,ICDPD["D":371,1:469) I $D(ICDOR)<11!(ICDOR["n") D DRG372
 Q
DRG372 S ICDRG=$S(ICDPD["v"!(ICDSD["v"):372,ICDOR["s":374,ICDOR["g":375,1:373) Q
DRG373 S ICDRG=$S(ICDPD["D"&(ICDPD["v"!(ICDPD["D"&(ICDSD["v"))):372,1:373) Q
DRG374 S ICDRG=$S($D(ICDPDRG(374)):374,1:"") Q
DRG375 S ICDRG=$S(ICDPD["D"!(ICDSD["D"):375,1:"") Q
DRG376 S ICDRG=$S(ICDOR["O":377,1:376) Q
DRG377 S ICDRG=$S(ICDOR["O":377,1:376) Q
DRG380 S ICDRG=$S(ICDOR["d":381,1:380) Q
DRG381 S ICDRG=$S('$D(ICDPDRG(381)):"",ICDOR["d":381,1:380) Q
DRG383 S ICDRG=$S(ICDPD["F"&(ICDSD["u"):383,ICDSD["u"!(ICDPD["v"):383,ICDPD["u":383,1:384) Q
DRG384 D DRG383 Q
DRG387 ;
 S ICDRG=$S(ICDPD["E":386,ICDSD["E":386,ICDPD["Hp"&(ICDSD["J"):387,ICDPD["J"&(ICDSD["Hp"):387,ICDPD["p"!(ICDSD["p")&((ICDPD'["J")!(ICDSD'["J")):388,1:"") D:ICDRG="" DRG389 Q
DRG388 D DRG387 Q
DRG389 S ICDRG=$S(ICDPD["HR"&(ICDSD["J"):389,ICDPD["J"&(ICDSD["HR"):389,ICDSD["J":389,ICDPD["J":389,'$D(ICDODRG)&('$D(ICDSDRG)):391,1:390) D:ICDRG=391 DRG391 Q
DRG390 D DRG389 Q
DRG391 S ICDRG=$S(ICDPD["E"!(ICDSD["E"):386,ICDPD["J"&(ICDPD["p"):387,ICDSD["J"&(ICDSD["p"):387,ICDPD["p"&(ICDPD'["J"):388,ICDSD["p"&(ICDSD'["J"):388,ICDPD["J"!(ICDSD["J"):389,1:"") I ICDRG'="" Q
 I ICDPD["R" D  Q:ICDRG=391
 .I '$D(ICDDX(2)) S ICDRG=391 Q
 .;ALL SECONDARIES CONTAIN "R", DRG=>391
 .N I
 .F I=1:1 Q:'$D(ICDDX(I))  S ICDRG=$S($P($$ICDDX^ICDCODE(ICDDX(1),ICDDATE),"^",3)["R":391,1:390) Q:ICDRG=390
 I ICDSD["R"&('$D(ICDDX(3))) S ICDRG=391 Q
 S ICDRG=390
 Q
DRG392 S ICDRG=$S(AGE>17:392,1:393) I AGE="" S ICDRG=470,ICDRTC=3
 Q
DRG393 S ICDRG=$S(AGE>17:392,1:393) I AGE="" S ICDRG=470,ICDRTC=3
 Q
DRG395 S ICDRG=$S(AGE>17:395,1:396) I AGE="" S ICDRG=470,ICDRTC=3
 Q
DRG396 S ICDRG=$S(AGE>17:395,1:396) I AGE="" S ICDRG=470,ICDRTC=3
 Q
DRG398 S ICDRG=$S(ICDCC:398,1:399) Q
DRG399 S ICDRG=$S(ICDCC:398,1:399) Q
DRG400 I ICDPD["L"&(ICDMAJ'[3) D DRG401 Q:"401^402^403^404^405^470^473"[ICDRG
 S ICDRG=$S(ICDPD["L":400,ICDCC:406,1:407) Q
DRG401 S ICDRG=$S(ICDPD["l":$S(AGE="":470,AGE<18:405,1:473),ICDOR["O"!(ICDORNI["O"):$S(ICDCC:401,1:402),ICDCC:403,1:404),ICDRTC=$S(ICDRG=470:3,1:ICDRTC)
 Q
DRG402 D DRG401
 Q
