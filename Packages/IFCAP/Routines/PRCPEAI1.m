PRCPEAI1 ;WISC/RFJ-adjust inventory level to or from non-issuable ;14 Apr 92
 ;;4.0;IFCAP;;9/23/93
 Q
 ;
 ;     |-> input data to move an item to or from nonissuable and
 ;     |-> store the data in tmp($j,"prcpadj","process").  finally
 ;     |-> process all the selected items and the data into an
 ;     |-> adjustment.
 ;
NONISSUE ;move quantity to or from non-issuable
 N %H,%I,DATE,ITEMDA,NONISSUE,TRANNO
 ;
 ;     |-> select item from the inventory point and ask for input.
 ;
 D NOW^%DTC S DATE=X K ^TMP($J,"PRCPADJ","PROCESS")
 F  D  Q:'ITEMDA  W !!!!!
 .   N DOCID,ITEMDATA,ITEMDESC,ITEMNSN,ITEMQTY,QTY,REASON,UNIT,VALUE,VALUEINV,VALUESAL,VOUCHER
 .   W !!,"  >> Select an item number from the ",PRCP("IN")," inventory point. <<"
 .   S ITEMDA=$$ITEM^PRCPUITM(PRCP("I"),0,"","") I 'ITEMDA Q
 .   I $D(^TMP($J,"PRCPADJ","PROCESS",ITEMDA)) S XP="  THIS ITEM WAS PREVIOUSLY SELECTED DURING THIS SELECTION PROCESS.",XP(1)="  OK TO REMOVE THE ADJUSTMENT SO YOU CAN ENTER A NEW ONE",%=1 W !! D YN^PRCPU4 Q:%'=1
 .   K ^TMP($J,"PRCPADJ","PROCESS",ITEMDA)
 .   S ITEMDATA=$G(^PRCP(445,PRCP("I"),1,ITEMDA,0)),UNIT=$$UNITVAL^PRCPUX1($P(ITEMDATA,"^",14),$P(ITEMDATA,"^",5)," per "),ITEMQTY=+$P(ITEMDATA,"^",7)
 .   S ITEMDESC=$$DESCR^PRCPUX1(PRCP("I"),ITEMDA),ITEMNSN=$$NSN^PRCPUX1(ITEMDA)
 .   W !!,"=====================  C U R R E N T   I T E M   D A T A  ====================="
 .   W !!,"ITEM NUMBER: ",ITEMDA,?23,$E(ITEMDESC,1,30),?58,"NSN: ",ITEMNSN
 .   W !!?8,"AVERAGE UNIT COST: ",$J(+$P(ITEMDATA,"^",22),12,3),!?11,"LAST UNIT COST: ",$J(+$P(ITEMDATA,"^",22),12,3)
 .   W !!?9,"ON-HAND QUANTITY: ",+$P(ITEMDATA,"^",7),"       UNIT per ISSUE: ",UNIT,!?4,"NON-ISSUABLE QUANTITY: ",+$P(ITEMDATA,"^",19)
 .   W !!,"****************  E N T E R    A D J U S T M E N T    D A T A  ****************"
 .   W ! D QTY^PRCPEAD2(-ITEMQTY,+$P(ITEMDATA,"^",19)) Q:QTY["^"
 .   I QTY=0 W !!?10,">> THE QUANTITY MOVED TO OR FROM NON-ISSUABLE CANNOT EQUAL 0. <<" Q
 .   S (VALUEINV,VALUESAL)=0
 .   W ! D VOUCHER^PRCPEAD2 Q:$G(DOCID)["^"
 .   W ! D REASON^PRCPEAD2($S(QTY<0:"TO ",1:"FROM ")_"non-issuable") Q:REASON["^"
 .   S ^TMP($J,"PRCPADJ","PROCESS",ITEMDA)=QTY_"^"_VALUESAL_"^"_VALUEINV_"^^"_DOCID_"^"_REASON
 ;
 ;     |-> start processing adjustment if okay.
 ;
 I ITEMDA["^" Q
 I '$O(^TMP($J,"PRCPADJ","PROCESS",0)) W !!?10,">> NO ITEMS HAVE BEEN SELECTED <<" Q
 S XP="ARE YOU READY TO START PROCESSING THE ADJUSTMENTS YOU HAVE MADE",XH="ENTER 'YES' TO PROCESS THE ADJUSTMENTS YOU HAVE MADE,'NO' OR '^' TO EXIT.",%=1 W !! D YN^PRCPU4
 I %'=1 W !!?10,">> NO CHANGES HAVE BEEN MADE TO THE DATABASE <<" Q
 S TRANNO=PRC("SITE"),NONISSUE=1 D CONTINUE^PRCPEAD3
 Q
