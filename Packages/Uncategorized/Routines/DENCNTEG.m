DENCNTEG ;ISC/XTSUMBLD KERNEL - Package checksum checker ;2950804.151622
 ;;1.2;DENTAL;**17**;JAN 26, 1989
 ;;0.0;
 ;;7.3;2950804.151622
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 ;
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
DENCI001 ;;2202038
DENCI002 ;;9310168
DENCI003 ;;1109317
DENCI004 ;;2503541
DENCI005 ;;2495550
DENCI006 ;;2547972
DENCI007 ;;4421867
DENCI008 ;;6933414
DENCI009 ;;4747546
DENCINI1 ;;5626501
DENCINI2 ;;5232539
DENCINI3 ;;16092315
DENCINI4 ;;3357711
DENCINI5 ;;989133
DENCINIS ;;2206954
DENCINIT ;;10897447
DENDI001 ;;2200787
DENDI002 ;;4011781
DENDINI1 ;;5626349
DENDINI2 ;;5232543
DENDINI3 ;;16092377
DENDINI4 ;;3357715
DENDINI5 ;;450234
DENDINIS ;;2207217
DENDINIT ;;10879507
DENTA4A ;;15154087
DENTE1 ;;15189210
DENTNP ;;8865322
DENTNPCV ;;2930420
DENTNPFU ;;851590
DENTNPLU ;;2276464
DENTNPMN ;;1988840
DENTNPR2 ;;5581906
DENTNPRE ;;6625817
DENTNPTL ;;3817266
