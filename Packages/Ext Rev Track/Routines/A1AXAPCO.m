A1AXAPCO ;SLL/ALB ISC; Action Plan CO Approved/Disapproved Triggered Message;1/20/88
 ;;VERSION 1.0
 ;
ENST ;
 D TKL1^A1AXAPRD,TKL2
 S A1AXQ=$N(^XMB(3.8,"B","EXT REV FAC",0))
 S A1AXRC="" F A1AXI=0:0 S A1AXRC=$O(^XMB(3.8,A1AXQ,1,"B",A1AXRC)) Q:A1AXRC=""!(A1AXRC'?.N)  S A1AXFC=0 F A1AXJ=0:0 S A1AXFC=$O(^DIC(3,A1AXRC,2,A1AXFC)) Q:A1AXFC'?.N!(A1AXFC="")  D:A1AXFC=^DIZ(11830,D0,"F") SENT
 G EXIT
ENCO ;
 D TKL1^A1AXAPRD,TKL2
 S A1AXQ=$N(^XMB(3.8,"B","EXT REV CO",0))
 S A1AXRC="" F A1AXI=0:0 S A1AXRC=$O(^XMB(3.8,A1AXQ,1,"B",A1AXRC)) Q:A1AXRC=""!(A1AXRC'?.N)  D SENT
EXIT ;
 K ^UTILITY($J,"AC"),P,S,R,Y,XMDUZ,XMY,XMSUB,XMTXT,A1AXNM,A1AXRC,A1AXQ,A1AXFC,A1AXI,A1AXJ,I,A1AXR1,A1AXY
 Q
TKL2 ;
 S ^UTILITY($J,"AC",201,0)="CO COMMENT:"
 S A1AXR1=0 F I=1:1 S A1AXR1=$O(^DIZ(11830,D0,"P",D1,"S",D2,"R",D3,3,A1AXR1)) Q:A1AXR1=""  S ^UTILITY($J,"AC",201+I,0)=^(A1AXR1,0)
 S ^UTILITY($J,"AC",300,0)=" "
 S A1AXY="" I $D(^DIZ(11830,D0,"P",D1,"S",D2,"R",D3,9)) S A1AXY=$P(^(9),"^",3) S:A1AXY="A" A1AXY="APPROVED" S:A1AXY="D" A1AXY="DISAPPROVED"
 S Y="" I $D(^DIZ(11830,D0,"P",D1,"S",D2,"R",D3,7)) S Y=$P(^(7),"^",2) X ^DD("DD")
 S ^UTILITY($J,"AC",301,0)="CO APPROVAL/DISAPPROVAL: "_A1AXY,^UTILITY($J,"AC",302,0)="CO APPROVAL/DISAPPROVAL DATE: "_Y
 S ^UTILITY($J,"AC",2,0)="CO has "_A1AXY_" the following ACTION PLAN at VAMC "_A1AXF
 S XMTEXT="^UTILITY($J,""AC"","
 Q
SENT ;
 K XMY S XMY(A1AXRC)="" S XMDUZ=.5,XMSUB="**ACTION PLAN CO "_A1AXY_" AT "_A1AXF_"**"
 D ^XMD K XMY
 Q