A1AIEXT ;NP+BT;ALB ISC; 1/12/88; 10:50am; routine to extract good data from UTILITY GLOBAL after tape extraction (ISC use only)
 ;;Version 1.0
INIT ;
 K KN S (QT,I)="",CN=3
ORDER ;
 D READIN G:I="" EXIT I $L(^UTILITY($J,"EQPTLG",I),",")=CN S CN=CN+1 D KNSET,READIN S:CN>7 FLAG="" D:CN>7 RESET G:QT EXIT G ORDER
 D KNSET,READIN S FLAG=1 D KILLIT,RESET G:QT EXIT G ORDER
READIN ;
 S I=$O(^UTILITY($J,"EQPTLG",I)) Q
RESET ;
 K KN S CN=3 D READIN I I="" S QT=1 Q
 I $L(^UTILITY($J,"EQPTLG",I),",")=CN D KNSET S FLAG="",CN=4 D READIN Q
 I FLAG W ?10,"I=",I,?20,^UTILITY($J,"EQPTLG",I),! K ^UTILITY($J,"EQPTLG",I) D READIN W ?10,"I=",I,?20,^UTILITY($J,"EQPTLG",I),! K ^(I) G RESET
 D READIN G RESET
KNSET ;
 S (KN(I),KN(I+1))="" Q
KILLIT ;
 W !,"LAST I=",I F J=0:0 S J=$O(KN(J)) Q:J=""  W ?10,"J=",J,?20,^UTILITY($J,"EQPTLG",J),! K ^UTILITY($J,"EQPTLG",J)
 Q
EXIT ;
 I CN<8 D KILLIT
 K QT,CN,KN,I,J W !!,*7,"Done!"
 Q