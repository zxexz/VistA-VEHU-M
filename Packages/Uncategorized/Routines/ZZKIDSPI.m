ZZKIDSPI ; SEB - Post-Installation routines for KIDS packages
 ;;;;;;Build 1
 Q
 ;
US10340 ; Reindex PATIENT MOVEMENT file (#405) for user story #10340
 S DIK="^DGPM(",DA=4711 D IX^DIK
 S DA=4712 D IX^DIK
 Q
 ;
US10492 ; Reindex EDMUND HILLARY in NEW PERSON (#200) file
 S DIK="^VA(200,",DA=10000000276 D IX^DIK
 Q
 ;
US10800 ; Reindex new entries in PRF LOCAL FLAG (#26.11) and PRF ASSIGNMENT (#26.13) files
 S DIK="^DGPF(26.11," F DA=2,3 D IX^DIK
 S DIK="^DGPF(26.13," F DA=116:1:118 D IX^DIK
 S DIK="^DGPF(26.14," F DA=219:1:225 D IX^DIK
 Q
 ;
US10955 ; Reindex NOPRIV,USER in NEW PERSON (#200) file
 S DIK="^VA(200,",DA=10000000280 D IX^DIK
 Q
 ;
US10785 ; Reindex CHIEF,MIS ASU rules for revoked documents
 S DIK="^USR(8930.1," F DA=274:1:276 D IX^DIK
 ;
US10822 ; Reindex new orders for ONEHUNDREDEIGHTYNINE,PATIENT and BCMA,TWENTYSIX-PATIENT
 S DIK="^OR(100," F DA=39052:1:39066 D IX^DIK
 Q
 ;
US10990 ; Reindex REGISTERED NURSE ASU rule and new REGISTERED NURSE users
 S DIK="^USR(8930.1," F DA=259,271,272,273 D ^DIK
 S DIK="^USR(8930.1,",DA=277 D IX^DIK
 S DIK="^USR(8930,",DA=622 D IX^DIK
 S DIK="^USR(8930.3," F DA=774:1:779 D IX^DIK
 S DIK="^VA(200," F DA=20168,20174,20178,20181,20213,20214 D IX^DIK
 Q
 ;
US12720 ; Reindex lab and radiology data for Patient Safety scenario patient
 S DIK="^OR(100," F DA=39208:1:39210,39213 D IX^DIK
 S DIK="^LR(",DA=675 D ^DIK
 S DIK="^LRO(69,",DA=3160202 D ^DIK
 S DIK="^RAO(75.1,",DA=2816 D ^DIK
 S DIK="^RADPT(",DA=100865 D ^DIK
 Q
 ;
US12085 ; Reindex two problems for TWOHUNDREDNINE,PATIENT
 S DIK="^AUPNPROB(" F DA=971,975 D IX^DIK
 S DIK="^AUTNPOV(" F DA=886,890 D IX^DIK
 Q
 ;
US13708 ; Reindex allergies and orders for TWOHUNDREDELEVEN & TWOHUNDREDTWELVE
 S DIK="^GMR(120.8," F DA=998:1:1000 D IX^DIK
 S DIK="^GMR(120.86," F DA=100157,100158 D IX^DIK
 S DIK="^OR(100," F DA=39311,39312 D IX^DIK
 Q
 ;
