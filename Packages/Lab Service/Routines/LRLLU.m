LRLLU ;SLC/RWF - LOAD LIST UTILITY ; 6/2/86  8:10 AM ;
 ;;5.2;LAB SERVICE;;Sep 27, 1994
ACC Q:'$D(^LRO(68,LRAA,1,LRAD,1,LRAN,0))  ;REMOVE ALL TESTS FROM LOAD LISTS
 S LRTEST=0 F  S LRTEST=$O(^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRTEST)) Q:LRTEST<1  D LRTEST:$P(^(LRTEST,0),U,3)
 Q
LRTEST S X=$S($D(^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRTEST,0)):^(0),1:"") Q:X=""
 S T=+X,X=$P(X,U,3),L1=+$P(X,";",1),L2=+$P(X,";",2),L3=+$P(X,";",3)
 S X=$S($D(^LRO(68.2,L1,1,L2,1,L3,0)):^(0),1:"")
 I $P(X,U,1)=LRAA,$P(X,U,2)=LRAD,$P(X,U,3)=LRAN K ^LRO(68.2,L1,1,L2,1,L3)
 I $T!(X="") S $P(^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRTEST,0),U,3)=""
 K L1,L2,L3 Q
