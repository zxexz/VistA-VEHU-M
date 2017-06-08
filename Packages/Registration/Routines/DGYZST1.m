DGYZST1 ;ALB/MIR - ADD NEW COUNTIES TO OUTLYING AREAS ; 18 SEP 91
 ;;MAS VERSION 5.1;;**8**;
 ;
 ;this routine will add the new counties to various outlying areas
 ;
 ;  line tag = state code number
 ;      text = name of new STATE file entry
 ;
 ;text lines =  name of new county^county code number
 ;
 ;
EN ;begin addition of counties...
 ;
 W !!,">>>Now adding new STATE file entries with their associated COUNTIES..."
 F DGCD=60,64,68:1:70,74 D ADD
 ;
Q K DA,DGCD,DGCNTY,DGLN,DIC,DIE,DINUM,DR,IFN,NODE,X,Y
 Q
 ;
ADD ;add new states and new counties, if applicable
 I $D(^DIC(5,"C",DGCD)) S NODE=$P($T(@DGCD),";;",2) W !?3,$P(NODE,"^")," - VA STATE CODE ",DGCD," already exists"
 S Y="" I '$D(^DIC(5,"C",DGCD)) S NODE=$P($T(@DGCD),";;",2),X=$P(NODE,"^",1),DIC(0)="L",DIC("DR")="1////^S X=$P(NODE,""^"",2);2////^S X=DGCD",DIC="^DIC(5," S:'$D(^DIC(5,DGCD)) DINUM=DGCD K DD,DO D FILE^DICN
 I +Y>0 W !?3,X," added as new state (VA STATE CODE ",DGCD,")" S IFN=+Y
 F IFN=0:0 S IFN=$O(^DIC(5,"C",DGCD,IFN)) Q:'IFN  S:'$D(^DIC(5,IFN,1,0)) ^(0)="^5.01I^^" F DGLN=1:1 S NODE=$P($T(@DGCD+DGLN),";;",2) Q:NODE="QUIT"  I '$D(^DIC(5,IFN,1,"C",$P(NODE,"^",2))) S X=$P(NODE,"^",1) D COUNTY
 Q
 ;
COUNTY ;add counties
 K DINUM S DIC="^DIC(5,"_IFN_",1,",DIC(0)="L",X=$P(NODE,"^",1),DA(1)=IFN D ^DIC S DA=+Y
 W !?5,"...",$P(NODE,"^",1)," added as a new county (VA COUNTY CODE ",$P(NODE,"^",2),")"
 I DA>0 S DIE=DIC,DA(1)=IFN,DR="2////"_$P(NODE,"^",2) D ^DIE
 Q
 ;
 ;
60 ;;AMERICAN SAMOA^AS
 ;;EASTERN^010
 ;;MANU'A^020
 ;;ROSE ISLAND^030
 ;;SWAINS ISLAND^040
 ;;WESTERN^050
 ;;ALL OTHER^999
 ;;QUIT
 ;
74 ;;JOHNSTON ATOLL^ZZ
 ;;JOHNSTON ISLAND^200
 ;;MIDWAY ISLANDS^300
 ;;WAKE ISLAND^450
 ;;NAVASSA ISLAND^350
 ;;BAKER ISLAND^050
 ;;HOWLAND ISLAND^100
 ;;JARVIS ISLAND^150
 ;;KINGMAN REEF^250
 ;;PALMYRA ATOLL^400
 ;;ALL OTHER^999
 ;;QUIT
 ;
64 ;;FEDERATED STATES OF MICRONESIA^FS
 ;;CHUUK^002
 ;;KOSRAE^005
 ;;POHNEPI^040
 ;;YAP^060
 ;;QUIT
 ;
68 ;;MARSHALL ISLANDS^YY
 ;;AILINGINAE^007
 ;;AILINGLAPLAP^010
 ;;AILUK^030
 ;;ARNO^040
 ;;AUR^050
 ;;BIKAR^060
 ;;BIKINI^070
 ;;BOKAK^073
 ;;EBON^080
 ;;ENEWETAK^090
 ;;ERIKUB^100
 ;;JABAT^110
 ;;JALUIT^120
 ;;JEMO^130
 ;;KILI^140
 ;;KWAJALEIN^150
 ;;LAE^160
 ;;LIB^170
 ;;LIKIEP^180
 ;;MAJURO^190
 ;;MALOELAP^300
 ;;MEJIT^310
 ;;MILI^320
 ;;NAMORIK^330
 ;;NAMU^340
 ;;RONGELAP^350
 ;;RONGRIK^360
 ;;TOKE^385
 ;;UJAE^390
 ;;UJELANG^400
 ;;UTRIK^410
 ;;WOTHO^420
 ;;WOTJE^430
 ;;QUIT
 ;
69 ;;NORTHERN MARIANA ISLANDS^XX
 ;;NORTHERN ISLANDS^085
 ;;ROTA^100
 ;;SAIPAN^110
 ;;TINIAN^120
 ;;QUIT
 ;
70 ;;PALAU (TRUST TERRITORY)^WW
 ;;AIMELIIK^002
 ;;AIRAI^004
 ;;ANGAUR^010
 ;;KAYANGEL^100
 ;;KOROR^150
 ;;MELEKEOK^212
 ;;NGARAARD^214
 ;;NGARCHELONG^218
 ;;NGARDMAU^222
 ;;NGAREMLENGUI^223
 ;;NGATPANG^224
 ;;NGCHESAR^226
 ;;NGIWAL^228
 ;;PELELIU^350
 ;;SONSOROL^370
 ;;HATOBOHEI^050
 ;;NGEREMLENQUIT^227
 ;;QUIT
