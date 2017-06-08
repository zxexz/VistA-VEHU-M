ECNTEG ;ISC/XTSUMBLD KERNEL - Package checksum checker ;2960508.110728
 ;;2.0; EVENT CAPTURE ;;8 May 96
 ;;7.3;2960508.110728
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 ;
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
ECAMIS ;;4489460
ECAMIS1 ;;10785092
ECAMIS2 ;;2731621
ECAMIS3 ;;11566170
ECAMIS4 ;;10532907
ECAMIS5 ;;6184017
ECBEN ;;11337987
ECBEN1A ;;2784321
ECBEN1B ;;9353417
ECBEN2A ;;16143247
ECBEN2B ;;7561731
ECBEN2U ;;4010748
ECBENF ;;3923395
ECBEP ;;11459692
ECBEP1A ;;2228961
ECBEP1B ;;16124470
ECBEP2A ;;9723451
ECBEP2B ;;6912493
ECBEPF ;;4019030
ECDEAL ;;11841529
ECDEAL1 ;;1438359
ECDSINAC ;;14214456
ECDSONL ;;234093
ECDSREF ;;3184477
ECDSS ;;13180248
ECDSS1 ;;7504426
ECDSS2 ;;3173984
ECDSS3 ;;2932063
ECDSSA ;;2993277
ECDSSCRN ;;3729527
ECDSSYN ;;11622115
ECDSUTIL ;;1853093
ECDSXREF ;;3363705
ECDUTL ;;4247352
ECED ;;9546738
ECED1 ;;13278201
ECED2 ;;9397816
ECED3 ;;14007833
ECEDF ;;3262078
ECEDU ;;6403945
ECHECK1 ;;6025178
ECINCONV ;;10874633
ECINPR1 ;;490921
ECINPRE ;;393087
ECKILL ;;7793508
ECL ;;2715529
ECLOC ;;8542479
ECOSSUM ;;8492461
ECPAT ;;12632360
ECPROV ;;4556174
ECPROV1 ;;10834694
ECPROV2 ;;2719723
ECPROV3 ;;9473055
ECPROV4 ;;9160973
ECPROV5 ;;7542919
ECPRSUM1 ;;8950081
ECSCR ;;5323033
ECSCRN ;;11461779
ECSECT ;;6688913
ECSUM ;;9673779
ECSUM1 ;;5360670
ECSUM2 ;;4916904
ECSUN ;;9425105
ECSUN1 ;;5762396
ECSUN1N ;;4097969
ECSUN2 ;;5005788
ECSUN2N ;;3196769
ECUN1 ;;4059591
ECUNIT ;;10552311
