A1AT3 ; TRAVEL PACKAGE ; JCK/ALB ; 20 MAY 87
 ;VERSION 1.0
 ;THIS RTN CALCULATES & PRINTS ALL OBLIGATED TRAVEL TOTALS FOR THE YEAR
 ;
START ;Obtain all name & name reference locations
 F FQ=0:0 S FQ=$N(^DIZ(11669,"C",FQ)) Q:FQ'>0  F NMREF=0:0 S NMREF=$N(^DIZ(11669,"C",FQ,NMREF)) Q:NMREF'>0  S NAME=$P(^DIZ(11669,NMREF,0),"^",1) F FQNODE=0:0 S FQNODE=$N(^DIZ(11669,"C",FQ,NMREF,FQNODE)) Q:FQNODE'>0  D COSTS
 D GDTOT,PRINT,EXIT Q
 ;
COSTS ;Obtain all destination & cost values
 F DESTNODE=0:0 S DESTNODE=$N(^DIZ(11669,NMREF,1,FQNODE,1,DESTNODE)),ACTCST=$S($D(^DIZ(11669,NMREF,1,FQNODE,1,DESTNODE,2)):$P(^(2),"^",2),1:0) G:DESTNODE'>0 FQTOT Q:DESTNODE'>0  D NAMTOT
 Q
 ;
NAMTOT ; Calculate FQ totals per person
 I '$D(^UTILITY("A1ATPKG","TOTALS",NAME)) S ^(NAME)="0.00^0.00^0.00^0.00^0.00"
 S $P(^UTILITY("A1ATPKG","TOTALS",NAME),"^",FQ)=$P(^UTILITY("A1ATPKG","TOTALS",NAME),"^",FQ)+ACTCST Q
 ;
FQTOT ;Calculate all Grand Fiscal totals per quarter
 I '$D(^UTILITY("A1ATPKG","FQTOT")) S ^("FQTOT")="0.00^0.00^0.00^0.00"
 S $P(^UTILITY("A1ATPKG","FQTOT"),"^",FQ)=$P(^UTILITY("A1ATPKG","FQTOT"),"^",FQ)+$P(^UTILITY("A1ATPKG","TOTALS",NAME),"^",FQ)
 ;
 ;Calculate yearly totals per person
 S $P(^UTILITY("A1ATPKG","TOTALS",NAME),"^",5)=$P(^UTILITY("A1ATPKG","TOTALS",NAME),"^",5)+$P(^UTILITY("A1ATPKG","TOTALS",NAME),"^",FQ) Q
 Q
 ;
GDTOT ;Calculate grand yearly total
 I '$D(^UTILITY("A1ATPKG","GDTOT")) S ^("GDTOT")=0.00
 F TOT=1:1:4 S ^UTILITY("A1ATPKG","GDTOT")=^UTILITY("A1ATPKG","GDTOT")+$P(^UTILITY("A1ATPKG","FQTOT"),"^",TOT)
 Q
 ;
PRINT ;Print heading & Travel results
 ;I IO'=IO(0) S IOP=IO D ^%ZIS U IO
 D ^%ZIS Q:POP  U IO
 D A1ATHDR S NAME="" F I=0:0 S NAME=$N(^UTILITY("A1ATPKG","TOTALS",NAME)) Q:NAME=-1  S DATA=^UTILITY("A1ATPKG","TOTALS",NAME) W !,NAME,?32,$P(DATA,U,1),?52,$P(DATA,U,2),?72,$P(DATA,U,3),?92,$P(DATA,U,4),?112,$P(DATA,U,5)
 ;
 ;Print Quarterly & Grand Totals
 ;
 D LINE S DATA1=^UTILITY("A1ATPKG","FQTOT") W !!!,"OBLIGATED TOTALS:",?32,$P(DATA1,U,1),?52,$P(DATA1,U,2),?72,$P(DATA1,U,3),?92,$P(DATA1,U,4),?112,^UTILITY("A1ATPKG","GDTOT")
 ;
 I IO'=IO(0) W @IOF X ^%ZIS("C") D CURRENT^%ZIS Q
 Q
A1ATHDR ;Print Travel Header for all yearly totals
 ;
 W @$S('$D(IOF):"#",IOF]"":IOF,1:"#"),!
 W ?45,"OBLIGATED TRAVEL SUMMARY COSTS FOR FISCAL ",($E(DT,1,3)+1700)
 W !,?45,"----------------------------------------------"
 W !!!,"NAME",?30,"1ST QUARTER",?50,"2ND QUARTER",?70,"3RD QUARTER",?90,"4TH QUARTER",?110,"YEARLY TOTALS" D LINE W !!! Q
 Q
 ;
LINE ;Draw straight line
 W ! F L=1:1:$S($D(IOM):(IOM-1),1:79) W "-"
 Q
EXIT ;Delete variables & quit
 ;
 K ^UTILITY("A1ATPKG")
 K ACTCST,DATA,DATA1,DESTNODE,FQ,FQNODE,I,L,NAME,NMREF,TOT
 Q
