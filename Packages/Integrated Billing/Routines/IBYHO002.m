IBYHO002 ; ; 21-NOV-1995
 ;;Version 2.0 ; INTEGRATED BILLING ;**43**; 21-MAR-94
 F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,"PRO",1343,20)
 ;;=D VP^IBCNSJ5
 ;;^UTILITY(U,$J,"PRO",1343,99)
 ;;=56567,42107
 ;;^UTILITY(U,$J,"PRO",1343,"MEN","IBCNSC PLAN LIST")
 ;;=1343^VP^1^^^View/Edit Plan
 ;;^UTILITY(U,$J,"PRO",1344,0)
 ;;=IBCNSJ UPDATE ANNUAL BENEFITS^Annual Benefits^^A^^^^^^^^INTEGRATED BILLING
 ;;^UTILITY(U,$J,"PRO",1344,15)
 ;;=I $G(IBFASTXT) S VALMBCK="Q"
 ;;^UTILITY(U,$J,"PRO",1344,20)
 ;;=D AB^IBCNSJ5
 ;;^UTILITY(U,$J,"PRO",1344,99)
 ;;=56567,42107
 ;;^UTILITY(U,$J,"PRO",1344,"MEN","IBCNSC PLAN DETAIL")
 ;;=1344^AB^6
 ;;^UTILITY(U,$J,"PRO",1344,"MEN","IBCNSC PLAN LIST")
 ;;=1344^AB^2
 ;;^UTILITY(U,$J,"PRO",1345,0)
 ;;=IBCNSJ INS CO INACTIVATE PLAN^(In)Activate Plan^^A^^^^^^^^INTEGRATED BILLING
 ;;^UTILITY(U,$J,"PRO",1345,20)
 ;;=D IA^IBCNSJ5
 ;;^UTILITY(U,$J,"PRO",1345,99)
 ;;=56567,42105
 ;;^UTILITY(U,$J,"PRO",1345,"MEN","IBCNSC PLAN DETAIL")
 ;;=1345^IP^5
 ;;^UTILITY(U,$J,"PRO",1345,"MEN","IBCNSC PLAN LIST")
 ;;=1345^IP^3
 ;;^UTILITY(U,$J,"PRO",1346,0)
 ;;=IBCNSJ SWITCH PLANS^Change Plan^^A^^^^^^^^INTEGRATED BILLING
 ;;^UTILITY(U,$J,"PRO",1346,20)
 ;;=D CP^IBCNSJ5
 ;;^UTILITY(U,$J,"PRO",1346,99)
 ;;=56567,42107
 ;;^UTILITY(U,$J,"PRO",1346,"MEN","IBCNSC PLAN DETAIL")
 ;;=1346^CP^7
 ;;^UTILITY(U,$J,"PRO",1347,0)
 ;;=IBCNSJ INS CO PLANS^Plans^^A^^^^^^^^INTEGRATED BILLING
 ;;^UTILITY(U,$J,"PRO",1347,4)
 ;;=^^^PL
 ;;^UTILITY(U,$J,"PRO",1347,15)
 ;;=S VALMBG=1
 ;;^UTILITY(U,$J,"PRO",1347,20)
 ;;=D PL^IBCNSJ5
 ;;^UTILITY(U,$J,"PRO",1347,99)
 ;;=56567,42106
 ;;^UTILITY(U,$J,"PRO",1347,"MEN","IBCNSC INSURANCE CO")
 ;;=1347^PL^34
 ;;^UTILITY(U,$J,"PRO",1348,0)
 ;;=IBCNSJ PLAN COMMENT^Plan Comments^^A^^^^^^^^INTEGRATED BILLING
 ;;^UTILITY(U,$J,"PRO",1348,15)
 ;;=
 ;;^UTILITY(U,$J,"PRO",1348,20)
 ;;=D PC^IBCNSJ5
 ;;^UTILITY(U,$J,"PRO",1348,99)
 ;;=56567,42106
 ;;^UTILITY(U,$J,"PRO",1348,"MEN","IBCNSC PLAN DETAIL")
 ;;=1348^PC^4
 ;;^UTILITY(U,$J,"PRO",1349,0)
 ;;=IBCNSJ PLAN UR INFO^UR Info^^A^^^^^^^^INTEGRATED BILLING
 ;;^UTILITY(U,$J,"PRO",1349,15)
 ;;=S VALMBG=1
 ;;^UTILITY(U,$J,"PRO",1349,20)
 ;;=D IT1^IBCNSP1
 ;;^UTILITY(U,$J,"PRO",1349,99)
 ;;=56567,42106
 ;;^UTILITY(U,$J,"PRO",1349,"MEN","IBCNSC PLAN DETAIL")
 ;;=1349^UI^2
