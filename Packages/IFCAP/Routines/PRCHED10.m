PRCHED10 ;WISC/TGH-IFCAP SEGMENT DL -(Partial's) ;1/30/92  3:41 PM
V ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;;
DL(VAR1,PRCHPAR) ;Prism delivery Order Line
 N A2,A3,DAT,DESCLN,SKU,X,Y,I0,I2,I4,ITEM
 S (ITEM,ITEMCNT)=0,TOTAL=$P($G(^PRC(442,VAR1,2,0)),U,4)+7
 S A2=2,A3="DE"
 D NOW^%DTC S X=$P(%,".") D JD^PRCFDLN S DAT=$E(X,1,3)+1700_$E(Y,1,3)
 F  S ITEM=$O(^PRC(442,VAR1,2,ITEM)) K PRCHTP1 Q:ITEM'>0  D
  .S I0=$G(^PRC(442,VAR1,2,ITEM,0))
  .;S DESCLN=$G(^PRC(442,VAR1,2,ITEM,1,0)),DESCLN=$P(DESCLN,U,4)
  .S I2=$G(^PRC(442,VAR1,2,ITEM,2))
  .S I4=$G(^PRC(442,VAR1,2,ITEM,4))
  .;
  .S PRCHTP1(0,20)="|DL"
  .;REC DATE
  .;SKU TOTAL
  .S PRCHTP1(0,2)=$P(I0,U,13) ;NSN
  .S PRCHTP1(0,1)=$P(I0,U) ;ITEM LINE NO.
  .S PRCHTP1(1,8)=$P(I2,U,2) ;CONTRACT #
  .;STATUS
  .S PRCHTP1(1,10)=0
  .D
  ..N I,J S (I,J)=""
  ..S $P(^PRCF(423,PRCFA("CSDA"),52,0),U,3,4)=$P(^PRC(442,VAR1,2,0),U,3,4)
  ..F  S I=$O(PRCHTP1(I)) Q:I=""  F  S J=$O(PRCHTP1(I,J)) Q:J=""  D
  ...S $P(^PRCF(423,PRCFA("CSDA"),52,ITEM,I),U,J)=PRCHTP1(I,J)
  ...Q
