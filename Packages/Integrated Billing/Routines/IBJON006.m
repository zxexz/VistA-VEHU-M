IBJON006 ; ; 04-JAN-1996
 ;;Version 2.0 ; INTEGRATED BILLING ;**39**; 21-MAR-94
 F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,"PRO",1380,10,11,0)
 ;;=1464^VI^31
 ;;^UTILITY(U,$J,"PRO",1380,10,11,"^")
 ;;=IBJT NS VIEW INS CO REDISPLAY
 ;;^UTILITY(U,$J,"PRO",1380,10,12,0)
 ;;=1316^VP^32
 ;;^UTILITY(U,$J,"PRO",1380,10,12,"^")
 ;;=IBJT NS VIEW EXP POL SCREEN
 ;;^UTILITY(U,$J,"PRO",1380,10,13,0)
 ;;=1317^AB^33
 ;;^UTILITY(U,$J,"PRO",1380,10,13,"^")
 ;;=IBJT NS VIEW AN BEN SCREEN
 ;;^UTILITY(U,$J,"PRO",1380,10,14,0)
 ;;=1369^EL^34
 ;;^UTILITY(U,$J,"PRO",1380,10,14,"^")
 ;;=IBJT PT ELIGIBILITY SCREEN
 ;;^UTILITY(U,$J,"PRO",1380,10,15,0)
 ;;=1207^EX^37
 ;;^UTILITY(U,$J,"PRO",1380,10,15,"^")
 ;;=IBJ EXIT
 ;;^UTILITY(U,$J,"PRO",1380,15)
 ;;=I $G(IBPRVSCR)'="IBCNSC",$G(IBFASTXT)>2 S VALMBCK="Q"
 ;;^UTILITY(U,$J,"PRO",1380,20)
 ;;=K IBFASTXT
 ;;^UTILITY(U,$J,"PRO",1380,26)
 ;;=D BM^IBJU1(21,17),SHOW^VALM
 ;;^UTILITY(U,$J,"PRO",1380,28)
 ;;=Select Action: 
 ;;^UTILITY(U,$J,"PRO",1380,99)
 ;;=56512,43645
 ;;^UTILITY(U,$J,"PRO",1381,0)
 ;;=IBJT NS VIEW EXP POL MENU^Policy Menu^^M^^^^^^^^INTEGRATED BILLING
 ;;^UTILITY(U,$J,"PRO",1381,4)
 ;;=26^4
 ;;^UTILITY(U,$J,"PRO",1381,10,0)
 ;;=^101.01PA^14^16
 ;;^UTILITY(U,$J,"PRO",1381,10,1,0)
 ;;=1318^BC^11
 ;;^UTILITY(U,$J,"PRO",1381,10,1,"^")
 ;;=IBJT BILL CHARGES SCREEN
 ;;^UTILITY(U,$J,"PRO",1381,10,2,0)
 ;;=1321^DX^12
 ;;^UTILITY(U,$J,"PRO",1381,10,2,"^")
 ;;=IBJT BILL DX SCREEN
 ;;^UTILITY(U,$J,"PRO",1381,10,3,0)
 ;;=1326^PR^13
 ;;^UTILITY(U,$J,"PRO",1381,10,3,"^")
 ;;=IBJT BILL PROCEDURES SCREEN
 ;;^UTILITY(U,$J,"PRO",1381,10,5,0)
 ;;=1349^CI^17
 ;;^UTILITY(U,$J,"PRO",1381,10,5,"^")
 ;;=IBJT CLAIM SCREEN SKIP
 ;;^UTILITY(U,$J,"PRO",1381,10,6,0)
 ;;=1334^AR^21
 ;;^UTILITY(U,$J,"PRO",1381,10,6,"^")
 ;;=IBJT AR ACCOUNT PROFILE SCREEN
 ;;^UTILITY(U,$J,"PRO",1381,10,7,0)
 ;;=1375^CM^22
 ;;^UTILITY(U,$J,"PRO",1381,10,7,"^")
 ;;=IBJT AR COMMENT HISTORY SCREEN
 ;;^UTILITY(U,$J,"PRO",1381,10,8,0)
 ;;=1371^IR^23
 ;;^UTILITY(U,$J,"PRO",1381,10,8,"^")
 ;;=IBJT CT/IR COMMUNICATIONS LIST SCREEN
 ;;^UTILITY(U,$J,"PRO",1381,10,9,0)
 ;;=1373^HS^24
 ;;^UTILITY(U,$J,"PRO",1381,10,9,"^")
 ;;=IBJT HS HEALTH SUMMARY
 ;;^UTILITY(U,$J,"PRO",1381,10,10,0)
 ;;=1342^AL^27
 ;;^UTILITY(U,$J,"PRO",1381,10,10,"^")
 ;;=IBJT ACTIVE LIST SCREEN SKIP
 ;;^UTILITY(U,$J,"PRO",1381,10,11,0)
 ;;=1314^VI^31
 ;;^UTILITY(U,$J,"PRO",1381,10,11,"^")
 ;;=IBJT NS VIEW INS CO SCREEN
 ;;^UTILITY(U,$J,"PRO",1381,10,12,0)
 ;;=1462^VP^32
 ;;^UTILITY(U,$J,"PRO",1381,10,12,"^")
 ;;=IBJT NS VIEW EXP POL REDISPLAY
 ;;^UTILITY(U,$J,"PRO",1381,10,13,0)
 ;;=1317^AB^33
 ;;^UTILITY(U,$J,"PRO",1381,10,13,"^")
 ;;=IBJT NS VIEW AN BEN SCREEN
 ;;^UTILITY(U,$J,"PRO",1381,10,14,0)
 ;;=1369^EL^34
 ;;^UTILITY(U,$J,"PRO",1381,10,14,"^")
 ;;=IBJT PT ELIGIBILITY SCREEN
 ;;^UTILITY(U,$J,"PRO",1381,10,15,0)
 ;;=1207^EX^37
 ;;^UTILITY(U,$J,"PRO",1381,10,15,"^")
 ;;=IBJ EXIT
 ;;^UTILITY(U,$J,"PRO",1381,15)
 ;;=I $G(IBPRVSCR)'="IBCNSVP",$G(IBFASTXT)>2 S VALMBCK="Q"
 ;;^UTILITY(U,$J,"PRO",1381,20)
 ;;=K IBFASTXT
 ;;^UTILITY(U,$J,"PRO",1381,26)
 ;;=D BM^IBJU1(21,17),SHOW^VALM
 ;;^UTILITY(U,$J,"PRO",1381,28)
 ;;=Select Action: 
 ;;^UTILITY(U,$J,"PRO",1381,99)
 ;;=56512,43649
 ;;^UTILITY(U,$J,"PRO",1382,0)
 ;;=IBJT NS VIEW AN BEN MENU^Annual Benefits Menu^^M^^^^^^^^INTEGRATED BILLING
 ;;^UTILITY(U,$J,"PRO",1382,4)
 ;;=26^4
 ;;^UTILITY(U,$J,"PRO",1382,10,0)
 ;;=^101.01PA^14^16
 ;;^UTILITY(U,$J,"PRO",1382,10,1,0)
 ;;=1318^BC^11
 ;;^UTILITY(U,$J,"PRO",1382,10,1,"^")
 ;;=IBJT BILL CHARGES SCREEN
 ;;^UTILITY(U,$J,"PRO",1382,10,2,0)
 ;;=1321^DX^12
 ;;^UTILITY(U,$J,"PRO",1382,10,2,"^")
 ;;=IBJT BILL DX SCREEN
 ;;^UTILITY(U,$J,"PRO",1382,10,3,0)
 ;;=1326^PR^13
 ;;^UTILITY(U,$J,"PRO",1382,10,3,"^")
 ;;=IBJT BILL PROCEDURES SCREEN
 ;;^UTILITY(U,$J,"PRO",1382,10,5,0)
 ;;=1349^CI^17
 ;;^UTILITY(U,$J,"PRO",1382,10,5,"^")
 ;;=IBJT CLAIM SCREEN SKIP
 ;;^UTILITY(U,$J,"PRO",1382,10,6,0)
 ;;=1334^AR^21
 ;;^UTILITY(U,$J,"PRO",1382,10,6,"^")
 ;;=IBJT AR ACCOUNT PROFILE SCREEN
 ;;^UTILITY(U,$J,"PRO",1382,10,7,0)
 ;;=1375^CM^22
 ;;^UTILITY(U,$J,"PRO",1382,10,7,"^")
 ;;=IBJT AR COMMENT HISTORY SCREEN
 ;;^UTILITY(U,$J,"PRO",1382,10,8,0)
 ;;=1371^IR^23
 ;;^UTILITY(U,$J,"PRO",1382,10,8,"^")
 ;;=IBJT CT/IR COMMUNICATIONS LIST SCREEN
