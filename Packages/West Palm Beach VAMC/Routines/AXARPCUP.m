AXARPCUP ;WPB/GBH - BROKER CALLS FOR PATCH GUI ; 12/01/99
 ;;2.0;WPB Patch Tracking;10-SEP-1998;;Build 2
GETDUZ(AXAY) ;
 S AXAY=DUZ
 Q
 ;
ISPROG(AXAY) ;
 S AXAY=$S($D(^XUSEC("XUPROGMODE",DUZ)):"YES",1:"NO")
 Q
 ;
PKGS(AXAY) ;
 N COUNT,DA,DIC,DIQ,DR,PKG
 S AXAY(0)=DUZ_U_$P($G(^VA(200,DUZ,0)),U,1)
 S AXAY(0)=AXAY(0)_U_$S($D(^XUSEC("XUPROGMODE",DUZ)):"YES",1:"NO")
 S PKG=""
 F  D  Q:$G(PKG)']""
 .K ^UTILITY("DIQ1",$J)
 .S DIC=548260,DIQ(0)="E"
 .S DR=".01;.02;.03;.032;.04;.042;.05;.052;.06;.062;.17;.18;.19"
 .S PKG=$O(^AXA(548260,"C",PKG)) Q:$G(PKG)']""
 .S DA=$O(^AXA(548260,"C",PKG,0)) Q:+DA'>0
 .D EN^DIQ1
 .S AXAY(PKG)=""
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.01,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.02,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.03,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.032,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.04,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.042,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.05,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.052,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.06,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.062,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.17,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.18,"E"))_U
 .S AXAY(PKG)=AXAY(PKG)_$G(^UTILITY("DIQ1",$J,548260,DA,.19,"E"))
 K ^UTILITY("DIQ1",$J)
 Q
 ;
PCHS(AXAY,AXAX) ;
 S (DA,COUNT)=0
 F  D  Q:+DA'>0
 .K ^UTILITY("DIQ1",$J)
 .S DIC=548261,DIQ(0)="E"
 .S DR=".01;.04;.07;.17;.18;.19;.2;2.01;2.03;2.05;2.07;.08"
 .S (DA,PCHIEN)=$O(^AXA(548261,"ANSP",AXAX,DA)) Q:+DA'>0
 .D EN^DIQ1
 .S AXAY(COUNT)=""
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,.01,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,.04,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,.07,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,.17,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,.18,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,.19,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,.2,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,2.01,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,2.03,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,2.05,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,2.07,"E"))_U
 .S AXAY(COUNT)=AXAY(COUNT)_$G(^UTILITY("DIQ1",$J,548261,DA,.08,"E"))
 .S AXAY(COUNT)=AXAY(COUNT)_U_PCHIEN
 .S COUNT=COUNT+1
 K ^UTILITY("DIQ1",$J)
 Q
 ;
MSGTXT(AXAY,XMZ)        ; Entry point to get message text
 ;
 S COUNT=1,X=""
 S STOP=$P($G(^XMB(3.9,XMZ,2,0)),U,3)
 F Y=1:1:STOP D  Q:$G(X)["$END TXT"
 .S X=$G(^XMB(3.9,XMZ,2,Y,0))
 .Q:$G(X)["$END TXT"
 .S ^TMP("AXAPCH",$J,COUNT)=X_$C(13)
 .S COUNT=COUNT+1
 S AXAY=$NA(^TMP("AXAPCH",$J))
 Q
 ;
MSGCODE(AXAY,XMZ) ;
 ;
 S COUNT=1,X=""
 S BEGIN="$END TXT"
 S KEEP=""
 S STOP=$P($G(^XMB(3.9,XMZ,2,0)),U,3)
 F Y=1:1:STOP D  Q:$G(X)["$END KID"
 .S X=$G(^XMB(3.9,XMZ,2,Y,0))
 .I X["$END TXT" S KEEP="OK"
 .Q:$G(X)["$END TXT"
 .I KEEP="OK" S ^TMP("AXAPCH",$J,COUNT)=X_$C(13)
 .S COUNT=COUNT+1
 S AXAY=$NA(^TMP("AXAPCH",$J))
 Q
 ;
BRESP(AXAY,AXAX) ;
 K AXAY
 S A=0,COUNT=1
 F  S A=$O(^XMB(3.9,AXAX,3,A)) Q:+A'>0  D
 .S RSP=^XMB(3.9,AXAX,3,A,0) D
 ..S Y=$P($G(^XMB(3.9,RSP,0)),U,3) D DD^%DT S SENT=Y
 ..S COUNT=COUNT+1,AXAY(COUNT)=$G(SENT)
 ..S SNDR=$P($G(^XMB(3.9,RSP,0)),U,2)
 ..S SENDER=$P($G(^VA(200,SNDR,0)),U)
 ..S COUNT=COUNT+1,AXAY(COUNT)=$G(SENDER)
 ..S RTEXT=0
 ..F  S RTEXT=$O(^XMB(3.9,RSP,2,RTEXT)) Q:+RTEXT'>0  D
 ...S COUNT=COUNT+1
 ...S ^TMP("AXAPCH",$J,COUNT)=$G(^XMB(3.9,RSP,2,RTEXT,0))_$C(13)
 .S COUNT=COUNT+1,AXAY(COUNT)=""
 S AXAY=$NA(^TMP("AXAPCH",$J))
 Q
 ;
DAYSDIFF(AXAY,AXAX) ;
 ;
 S Z1=$P($G(AXAX),U,1) I Z1="" S AXAY="ERROR" Q
 S Z2=$P($G(AXAX),U,2) I Z2="" S AXAY="ERROR" Q
 S X1="3"_$E(Z1,9,10)_$E(Z1,1,2)_$E(Z1,4,5) I X1'?7N S AXAY="ERROR" Q
 S X2="3"_$E(Z2,9,10)_$E(Z2,1,2)_$E(Z2,4,5) I X2'?7N S AXAY="ERROR" Q
 I X1>X2 S AXAY=$$FMDIFF^XLFDT(X1,X2,3)*-1 Q
 I X2>X1 S AXAY=$$FMDIFF^XLFDT(X2,X1,3) Q
 Q