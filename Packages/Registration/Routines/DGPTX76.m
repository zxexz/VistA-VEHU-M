DGPTX76 ; ;09/25/15
 ;;
1 N X,X1,X2 S DIXR=1147 D X1(U) K X2 M X2=X D X1("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"DXLS")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"DXLS")
 Q
X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79,DION),$P($G(^DGPT(DA,70)),U,10))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
2 N X,X1,X2 S DIXR=1149 D X2(U) K X2 M X2=X D X2("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD1")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD1")
 Q
X2(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.16,DION),$P($G(^DGPT(DA,70)),U,16))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
3 N X,X1,X2 S DIXR=1150 D X3(U) K X2 M X2=X D X3("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD2")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD2")
 Q
X3(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.17,DION),$P($G(^DGPT(DA,70)),U,17))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
4 N X,X1,X2 S DIXR=1151 D X4(U) K X2 M X2=X D X4("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD3")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD3")
 Q
X4(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.18,DION),$P($G(^DGPT(DA,70)),U,18))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
5 N X,X1,X2 S DIXR=1152 D X5(U) K X2 M X2=X D X5("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD4")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD4")
 Q
X5(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.19,DION),$P($G(^DGPT(DA,70)),U,19))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
6 N X,X1,X2 S DIXR=1153 D X6(U) K X2 M X2=X D X6("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD5")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD5")
 Q
X6(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.201,DION),$P($G(^DGPT(DA,70)),U,20))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
7 N X,X1,X2 S DIXR=1154 D X7(U) K X2 M X2=X D X7("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD6")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD6")
 Q
X7(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.21,DION),$P($G(^DGPT(DA,70)),U,21))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
8 N X,X1,X2 S DIXR=1155 D X8(U) K X2 M X2=X D X8("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD7")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD7")
 Q
X8(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.22,DION),$P($G(^DGPT(DA,70)),U,22))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
9 N X,X1,X2 S DIXR=1156 D X9(U) K X2 M X2=X D X9("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD8")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD8")
 Q
X9(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.23,DION),$P($G(^DGPT(DA,70)),U,23))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
10 N X,X1,X2 S DIXR=1157 D X10(U) K X2 M X2=X D X10("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD9")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD9")
 Q
X10(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.24,DION),$P($G(^DGPT(DA,70)),U,24))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
11 N X,X1,X2 S DIXR=1158 D X11(U) K X2 M X2=X D X11("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD10")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD10")
 Q
X11(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.241,DION),$P($G(^DGPT(DA,71)),U,1))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
12 N X,X1,X2 S DIXR=1159 D X12(U) K X2 M X2=X D X12("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD11")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD11")
 Q
X12(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.242,DION),$P($G(^DGPT(DA,71)),U,2))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
13 N X,X1,X2 S DIXR=1160 D X13(U) K X2 M X2=X D X13("F") K X1 M X1=X
 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D KPTFDD^DGPTDDCR(.X,.DA,"D SD12")
 K X M X=X2 I $G(X(1))]"",$G(X(2))]"",$G(X(3))]"",$G(X(4))]"" D
 . D SPTFDD^DGPTDDCR(.X,.DA,"D SD12")
 Q
X13(DION) K X
 S X(1)=$G(@DIEZTMP@("V",45,DIIENS,.01,DION),$P($G(^DGPT(DA,0)),U,1))
 S X(2)=$G(@DIEZTMP@("V",45,DIIENS,2,DION),$P($G(^DGPT(DA,0)),U,2))
 S X(3)=$G(@DIEZTMP@("V",45,DIIENS,11,DION),$P($G(^DGPT(DA,0)),U,11))
 S X(4)=$G(@DIEZTMP@("V",45,DIIENS,79.243,DION),$P($G(^DGPT(DA,71)),U,3))
 S X(5)=$G(@DIEZTMP@("V",45,DIIENS,70,DION),$P($G(^DGPT(DA,70)),U,1))
 S X=$G(X(1))
 Q
