ZZGHDVB1 ;TO FIND ^DVB(396.4,"APE" X-REFS MISSING ZERO NODES ;6/15/94,GEH
 ;
S ;
 S (ZDT,ZNUM,ZCASE)=0,ZNAME=""
 F  S ZNUM=$O(^DVB(396.4,"APE",ZNUM)) Q:ZNUM<1  D
 .F  S ZNAME=$O(^DVB(396.4,"APE",ZNUM,ZNAME)) Q:ZNAME=""  D
 ..F  S ZDT=$O(^DVB(396.4,"APE",ZNUM,ZNAME,ZDT)) Q:ZDT<1  D
 ... F  S ZCASE=$O(^DVB(396.4,"APE",ZNUM,ZNAME,ZDT,ZCASE)) Q:ZCASE<1  D
 .... Q:$D(^DVB(396.4,ZCASE,0))
 .... W !,ZNUM,?10,ZNAME,?50,ZDT,?70,ZCASE
 Q
