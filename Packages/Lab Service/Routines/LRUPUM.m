LRUPUM ;AVAMC/REG - USER MANUAL ;3/9/94  13:31
 ;;5.2;LAB SERVICE;;Sep 27, 1994
 D END S DIC="^LAB(68.45,",DIC(0)="AEQM" D ^DIC K DIC G:Y<1 END S LRI=+Y,LRN=$P(Y,U,2)
 I '$O(^LAB(68.45,LRI,1,0)) W $C(7),!,"No data elements selected for ",LRN G END
 S ZTRTN="QUE^LRUPUM" D BEG^LRUTL Q:POP!($D(ZTSK))
QUE U IO S DIWL=10,DIWR=IOM-5,LRL=DIWR-DIWL-5,DIWF="W",(LR("Q"),LR("F"),LRQ)=0,LRQ(1)=^DD("SITE") D L^LRU D H S LR("F")=1
 F LRA=0:0 S LRA=$O(^LAB(68.45,LRI,1,LRA)) Q:'LRA  D:$Y>(IOSL-5) H Q:LR("Q")  S LRE=^(LRA,0),LRX=$P(LRE,","),LRY=$P(LRE,",",2) I LRX]"",LRY]"" D W
 D END,END^LRUTL Q
W S X=$S($D(^DD(LRX,LRY,0)):^(0),1:"") Q:X=""  W !,LRE,?16,$P(X,"^") I $P(X,"^",2)["S" S LRD=$P(X,"^",3),LRC=";" D B
 F LRO=3,12 S LRD=$S($D(^DD(LRX,LRY,LRO)):^(LRO),1:""),LRC=" " I LRD]"" D B
 K ^TMP($J) S LRB=0 F LRZ=0:1 S LRB=$O(^DD(LRX,LRY,21,LRB)) Q:'LRB  D:$Y>(IOSL-5) H1 Q:LR("Q")  S X=^DD(LRX,LRY,21,LRB,0) D ^DIWP
 Q:LR("Q")  D:LRZ ^DIWW Q
B Q:LR("Q")  I $L(LRD)<LRL W !?DIWL-1,LRD,! W:LRC=" " ! D:$Y>(IOSL-6) H1 Q
 S LRK="",Z=1 F %=1:1 Q:'$L(LRD)  D:$L(LRK)>LRL C S:LRK]"" LRK=LRK_LRC S LRK=LRK_$P(LRD,LRC),LRD=$P(LRD,LRC,2,99),Z=Z+1
 W:LRK]"" !?DIWL-1,LRK,! W:LRC=" " ! Q
C S LRK=$P(LRK,LRC,1,Z) D:$Y>(IOSL-6) H1 Q:LR("Q")  W !?DIWL-1,LRK S Z=1,LRK="" Q
 ;
H Q:LR("Q")  I IOST?1"C".E,LR("F") D M^LRU Q:LR("Q")
 S LRQ=LRQ+1,X="N",%DT="T" D ^%DT,D^LRU W @IOF,!,Y,?25,LRQ(1),?73,"Pg ",LRQ,!,"DATA ELEMENTS FOR ",LRN,!,LR("%") Q
 ;
H1 D H Q:LR("Q")  W !,LRE,?16,$P(^DD(LRX,LRY,0),"^")," (Continued)" Q
 ;
EN ;Edit USER GROUP MANUAL file
 D END W ! S (DIC,DIE)="^LAB(68.45,",DIC(0)="AEQLM",DLAYGO=68
 D ^DIC K DIC G:Y<1 END S DA=+Y,DR=".01:99" D ^DIE K DLAYGO G EN
 ;
END D V^LRU Q
