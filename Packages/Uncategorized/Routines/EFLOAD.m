%ZTLOAD ;QUEUE JOB TO TASKMAN ; 14APR1986 12:18 PM;
 ;;5.01;
 I $D(ZTUCI)#2,ZTUCI'="" S X=ZTUCI X ^%ZOSF("UCICHECK") S:0[Y ZTUCI="" G A
 I '($D(ZTUCI)#2) X ^%ZOSF("UCI") S ZTUCI=Y
A I $D(ZTDTH),ZTDTH?1N.N1","1N.N G B
 I $D(ZTDTH),ZTDTH?7N.".".N S X=ZTDTH D CNVRT G B
W S %DT="TEX",(ZTDTH,X)="" R !,"REQUESTED START TIME: NOW// ",X:$S($D(DTIME):DTIME,1:999) G:X["^" B S ZTDTH=$H
 I $P("NOW",X,1)]"" S X=$S(X["?":"?",X'["@":"T@"_X,1:X),%DT(0)=0 D ^%DT K %DT(0) G:Y<1 W S X=+Y D CNVRT
B W !,"ZTRTN= ",ZTRTN,!,"ZTUCI= ",ZTUCI,!,"ZTDTH= ",ZTDTH  I '$D(ZTRTN)!(ZTUCI="")!(ZTDTH="") W !,"QUEUE INFORMATION MISSING - NOT QUEUED" G END
 S ZTSAVE("DUZ(")="" S:'$D(ZTSAVE("ZTDESC")) ZTSAVE("ZTDESC")=$S($D(ZTDESC):"",1:"No description (%ZTLOAD)") L ^%ZTSK
GZTSK S (^%ZTSK(0),ZTSK)=^%ZTSK(0)+1 G:$D(^%ZTSK(ZTSK)) GZTSK
 S ^%ZTSK(ZTSK,0)=$E("^",ZTRTN'["^")_ZTRTN_"^"_$S($D(DUZ)#2:DUZ,1:"")_"^"_ZTUCI_"^"_$H_"^"_ZTDTH_"^^^^^" L
 G QUEUE:'$D(ZTSAVE) I $D(ZTSAVE("*"))#2,$D(^DD("$O")) S X="^%ZTSK(ZTSK,0," X ^DD("$O") G QUEUE
 S ZTK="" F ZTL=1:1 S ZTK=$O(ZTSAVE(ZTK)) Q:ZTK=""  D EVAL
QUEUE L ^%ZTSCH S ^%ZTSCH(ZTDTH,ZTSK)=$S($D(ZTIO)#2:ZTIO,'($D(ION)#2):"",1:ION_";"_IOST_";"_IOM_";"_IOSL) L  ;S ^%ZTSCH("N",ZTUCI,$E("^",ZTRTN'["^")_ZTRTN,ZTSK)=ZTDTH L
END K %ZTA,%ZTB,%ZTC,%H,%DT,ZTL,ZTK,%,%X,%Y,ZTSAVE,ZTDESC,ZTDTH,ZTUCI,X,Y,%,ZTRTN
 Q
EVAL I ZTK["*" D STAR Q
 I +ZTK=ZTK!($E(ZTK,1)=""""),$D(ZTSAVE(ZTK))#2 S @("^%ZTSK(ZTSK,"_ZTK_")=ZTSAVE(ZTK)") Q
 I ZTK'["("!($E(ZTK,$L(ZTK))=")"),$D(@ZTK)#2!(ZTSAVE(ZTK)]"") S ^%ZTSK(ZTSK,0,ZTK)=$S(ZTSAVE(ZTK)]"":ZTSAVE(ZTK),1:@ZTK) Q
 I ZTK["(" S %X=ZTK,%Y="^%ZTSK(ZTSK,0,ZTK," D %XY^%RCR Q
 Q
CNVRT D H^%DTC S X=X_"000",ZTDTH=%H_","_($E(X,9,10)*60+$E(X,11,12)*60) Q
QD Q:'$D(ZTRTN)  S:ZTRTN'["^" ZTRTN="^"_ZTRTN S:'$D(ZTUCI) ZTUCI="" I ZTUCI="" X ^%ZOSF("UCI") S ZTUCI=Y
 L ^%ZTSCH S ZTK=$O(^%ZTSCH("N",ZTUCI,ZTRTN,"")) I ZTK="" S ZTRTN="" G QDEND
 S ZTRTN=ZTK_"^"_^%ZTSCH("N",ZTUCI,ZTRTN,ZTK)_"^"_($O(^(ZTK))]""),ZTRTN=ZTRTN_"^"_$S($D(^%ZTSCH($P(ZTRTN,"^",2),ZTK))#2:^(ZTK),1:"")
QDEND L  K ZTUCI,ZTK Q
STAR S %ZTA=$P(ZTK,"*",1),%ZTB=%ZTA,%ZTC="^%ZTSK(ZTSK,0," I $D(@%ZTB)=0 F %=0:0 S %ZTB=$O(@%ZTB) Q:%ZTB[%ZTA
 S %=$D(@%ZTB) S:%#2 @(%ZTC_"%ZTB)="_%ZTB) I %>9 S %X=%ZTB_"(",%Y=%ZTC_"%ZTB," D %XY^%RCR
 F %=0:0 S %ZTB=$O(@%ZTB) Q:%ZTB=""!(%ZTB'[%ZTA)  S %=$D(@%ZTB) S:%#2 @(%ZTC_"%ZTB)="_%ZTB) I %>9 S %X=%ZTB_"(",%Y=%ZTC_"%ZTB," D %XY^%RCR
 Q
 F %=0:0 S Y=$O(@Y) Q:Y=""  S %=$D(@Y) S:%#2 @(X_"Y)="_Y) I %>9 S %X=Y_"(",%Y=X_"Y," D %XY^%RCR
