PRPFNTEG ;ISC/XTSUMBLD KERNEL - Package checksum checker ;4/25/97  8:47 PM
V ;;3.0;PATIENT FUNDS;**6**;JUNE 1, 1989
 ;;7.3;APRIL 25, 1997
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 ;
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
PRPFARC ;;8679859
PRPFBAL ;;11314957
PRPFBUL ;;2455908
PRPFCD ;;12389424
PRPFCD1 ;;8145014
PRPFCVT ;;17611489
PRPFCVT0 ;;2290669
PRPFCVT1 ;;10462878
PRPFDAY ;;4251879
PRPFDEF ;;1977626
PRPFDMT ;;9732150
PRPFDSI ;;12867316
PRPFDSI1 ;;6540639
PRPFDST ;;6584567
PRPFED ;;12821437
PRPFED1 ;;6320822
PRPFED2 ;;3874911
PRPFIENV ;;9390156
PRPFIPRE ;;3331323
PRPFIPST ;;1886457
PRPFMIN ;;4311978
PRPFMUL ;;12303559
PRPFNQ ;;12273575
PRPFOBR ;;10991613
PRPFPNT ;;3531592
PRPFPOST ;;13060982
PRPFPUR1 ;;8495575
PRPFPURG ;;7410896
PRPFQ ;;9199717
PRPFRES ;;9522935
PRPFRPT ;;5087530
PRPFS ;;6926789
PRPFSCV ;;1433523
PRPFSCV1 ;;1624392
PRPFSCV2 ;;4727885
PRPFSCV3 ;;2585917
PRPFSIG ;;2317686
PRPFSIG1 ;;2784076
PRPFSIG2 ;;3975813
PRPFSITE ;;2137552
PRPFSUM ;;248107
PRPFTAT ;;7070713
PRPFTRCK ;;9320919
PRPFU ;;4540248
PRPFU1 ;;2521830
PRPFU2 ;;5136900
PRPFYN ;;1420418
