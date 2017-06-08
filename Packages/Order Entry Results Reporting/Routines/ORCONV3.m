ORCONV3 ; SLC/MKB - Convert diet orders, UD Order Sets ;6/20/97  11:24
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**14**;Dec 17, 1997
PTR(X) ; -- Returns ptr to 101.41 for prompt OR GTX X
 Q +$O(^ORD(101.41,"AB",$E("OR GTX "_X,1,63),0))
 ;
FH(ORIFN,ORPK) ; -- Called from Dietetics post-init
 N ORVP,TYPE,ADM,IFN,ORDIALOG
 S ORVP=$P($G(^OR(100,+$G(ORIFN),0)),U,2) Q:'ORVP
 S TYPE=$E(ORPK),ADM=+$P(ORPK,";",2),IFN=+$P(ORPK,";",3)
 D 1:TYPE="D",2:TYPE="E",3:TYPE="I",4:TYPE="N",7:TYPE="A",8:TYPE="T"
 S ^OR(100,ORIFN,4)=ORPK,$P(^(0),U,5)=+ORDIALOG_";ORD(101.41,"
 D RESPONSE^ORCSAVE
 Q
1 ; -- Diet order
 N OI,I,P,X,Y,FH0
 S ORDIALOG=+$O(^ORD(101.41,"AB","FHW1",0)) D GETDLG1^ORCD(ORDIALOG)
 S OI=$$PTR("ORDERABLE ITEM"),FH0=$G(^FHPT(+ORVP,"A",ADM,"DI",IFN,0))
 S I=0 F P=2:1:6 S X=$P(FH0,U,P) Q:'X  S Y=$O(^ORD(101.43,"ID",X_";99FHD",0)) S:Y I=I+1,ORDIALOG(OI,I)=Y
 S:$P(FH0,U,9) ORDIALOG($$PTR("START DATE/TIME"),1)=$P(FH0,U,9)
 S:$P(FH0,U,10) ORDIALOG($$PTR("STOP DATE/TIME"),1)=$P(FH0,U,10)
 S:$L($P(FH0,U,8)) ORDIALOG($$PTR("DELIVERY"),1)=$P(FH0,U,8)
 S X=$G(^FHPT(+ORVP,"A",ADM,"DI",IFN,1)) S:$L(X) ORDIALOG($$PTR("FREE TEXT 1"),1)=X
 Q
2 ; -- Early/late tray
 N ORPARAM,FH0,MEAL,TIME,I,X,Y,OI
 S ORDIALOG=+$O(^ORD(101.41,"AB","FHW2",0)) D GETDLG1^ORCD(ORDIALOG)
 S FH0=$G(^FHPT(+ORVP,"A",ADM,"EL",IFN,0)) D EN^FHWOR8(+ORVP,.ORPARAM)
 S MEAL=$P(FH0,U,2),TIME=$P(FH0,U,3)
 S I=$S(MEAL="B":1,MEAL="N":7,MEAL="E":13,1:0) I I D  ;derive tray
 . S X=$P(ORPARAM(1),U,I,I+5),Y=""
 . F I=1:1:6 I $P(X,U,I)=TIME S Y=$S(I<4:"EARLY TRAY",1:"LATE TRAY")
 . S:$L(Y) OI=+$O(^ORD(101.43,"S.E/L T",Y,0)),ORDIALOG($$PTR("ORDERABLE ITEM"),1)=OI
 S ORDIALOG($$PTR("MEAL"),1)=MEAL,ORDIALOG($$PTR("MEAL TIME"),1)=TIME
 S:$L($P(FH0,U,4)) ORDIALOG($$PTR("YES/NO"),1)=($P(FH0,U,4)="Y")
 S:$P(FH0,U) ORDIALOG($$PTR("START DATE"),1)=$P($P(FH0,U),".")
 ;S:$P(FH0,U,?) ORDIALOG($$PTR("STOP DATE"),1)=$P($P(FH0,U,?),".")
 ;S:$L($P(FH0,U,?)) ORDIALOG($$PTR("SCHEDULE"),1)=$P(FH0,U,?)
 Q
3 ; -- Isolation
 N OI,FH0 S FH0=$G(^FHPT(+ORVP,"A",ADM,0))
 S ORDIALOG=+$O(^ORD(101.41,"AB","FHW3",0)) D GETDLG1^ORCD(ORDIALOG)
 S OI=+$O(^ORD(101.43,"S.PREC","ISOLATION PROCEDURES",0))
 S ORDIALOG($$PTR("ORDERABLE ITEM"),1)=OI
 S:$P(FH0,U,9) ORDIALOG($$PTR("ISOLATION TYPE"),1)=$P(FH0,U,9)
 Q
4 ; -- NPO
 S ORDIALOG=+$O(^ORD(101.41,"AB","FHW4",0)) D GETDLG1^ORCD(ORDIALOG)
 N OI,FH0,X S FH0=$G(^FHPT(+ORVP,"A",ADM,"DI",IFN,0))
 S OI=+$O(^ORD(101.43,"S.DIET","NPO",0))
 S ORDIALOG($$PTR("ORDERABLE ITEM"),1)=OI
 S:$P(FH0,U,9) ORDIALOG($$PTR("START DATE/TIME"),1)=$P(FH0,U,9)
 S:$P(FH0,U,10) ORDIALOG($$PTR("STOP DATE/TIME"),1)=$P(FH0,U,10)
 S X=$G(^FHPT(+ORVP,"A",ADM,"DI",IFN,1)) S:$L(X) ORDIALOG($$PTR("FREE TEXT 1"),1)=X
 Q
7 ; -- Additional order
 N FH0 S FH0=$G(^FHPT(+ORVP,"A",ADM,"OO",IFN,0))
 S ORDIALOG=+$O(^ORD(101.41,"AB","FHW7",0)) D GETDLG1^ORCD(ORDIALOG)
 S:$L($P(FH0,U,3)) ORDIALOG($$PTR("FREE TEXT 1"),1)=$P(FH0,U,3)
 Q
8 ; -- Tubefeeding
 N PROD,OI,I,X,Y,FH0
 S ORDIALOG=+$O(^ORD(101.41,"AB","FHW8",0)) D GETDLG1^ORCD(ORDIALOG)
 S I=0 F  S I=$O(^FHPT(+ORVP,"A",ADM,"TF",IFN,"P",I)) Q:I'>0  S FH0=$G(^(I,0)) D
 . S PROD=+$P(FH0,U),OI=+$O(^ORD(101.43,"ID",PROD_";99FHT",0)) Q:'OI
 . S ORDIALOG($$PTR("ORDERABLE ITEM"),I)=OI
 . S:$P(FH0,U,2) ORDIALOG($$PTR("STRENGTH FH"),I)=$P(FH0,U,2)
 . I $L($P(FH0,U,3)) D  S ORDIALOG($$PTR("INSTRUCTIONS"),I)=Y
 . . S X=$P(FH0,U,3),Y=$P(X,"/") Q:$L(X,"/")'>1  ;done
 . . S X=$P(X,"/",2),Y=Y_"/"_$S(X="per Day":"QD",X="per Hour":"QH",X="Twice a Day":"BID",X="Three times a Day":"TID",X="Every 2 Hours":"Q2H",X="Every 3 Hours":"Q3H",X="Every 4 Hours":"Q4H",X="Every 6 Hours":"Q6H",1:"")
 S FH0=$G(^FHPT(+ORVP,"A",ADM,"TF",IFN,0))
 S:$L($P(FH0,U,5)) ORDIALOG($$PTR("FREE TEXT 1"),1)=$P(FH0,U,5)
 ;S:$L($P(FH0,U,?)) ORDIALOG($$PTR("CANCEL FUTURE ORDERS"),1)=$P(FH0,U,?)
 Q
 ;
PSJQOS ; -- Unit Dose Order Sets
 N ORSETNM,DEFAULT,ORI,ORDA,DITEM,CNT,NODE1,NODE2,NODE3,OI,ORPKG,ORDG,ORTX
 S ORSETNM=$G(^TMP("PSJQOS",$J,"NM")),ORDA=0 Q:'$L(ORSETNM)
 S DEFAULT=$O(^ORD(101.41,"AB","PSJ OR PAT OE",0)) Q:'DEFAULT
 S ORPKG=$O(^DIC(9.4,"C","PSJ",0)),ORDG=$O(^ORD(100.98,"B","UD RX",0))
 S ORI=0 F  S ORI=$O(^TMP("PSJQOS",$J,ORI)) Q:ORI'>0  D
 . S NODE1=$G(^TMP("PSJQOS",$J,ORI,1)),NODE2=$G(^(2)),NODE3=$G(^(3))
 . S OI=+$O(^ORD(101.43,"ID",+NODE1_";99PSP",0)) Q:'OI  S ORTX=$P($G(^ORD(101.43,OI,0)),U)
 . S DITEM=$$PSJQ(ORTX,ORI) Q:'DITEM
 . S ORDA=ORDA+1,ORDA(ORDA)=DITEM,CNT=0
 . D SET^ORCONVRT("ORDERABLE ITEM",OI)
 . D:NODE3 SET^ORCONVRT("DISPENSE DRUG",+NODE3)
 . D:$L($P(NODE1,U,4)) SET^ORCONVRT("INSTRUCTIONS",$P(NODE1,U,4))
 . D:$P(NODE1,U,2) SET^ORCONVRT("ROUTE",$P(NODE1,U,2))
 . D:$L($P(NODE1,U,3)) SET^ORCONVRT("SCHEDULE",$P(NODE1,U,3))
 . I $L(NODE2) K ORTX S ORTX(0)="^^1^"_DT_U,ORTX(1,0)=NODE2 D SET^ORCONVRT("WORD PROCESSING 1","ORTX")
 . S:CNT ^ORD(101.41,DITEM,6,0)="^101.416^"_CNT_U_CNT
PS1 Q:ORDA'>0  I ORDA=1,$G(ORDA(1)) D  Q  ; Single quick order only
 . N DIE,DA,DR,ORNM S DIE="^ORD(101.41,",ORNM="PSJQOS "_ORSETNM
 . S DA=ORDA(1),DR=".01///^S X=ORNM;2///^S X=ORSETNM" D ^DIE
 S DITEM=$$PSJQ(ORSETNM) I DITEM D  ; Order set
 . N I,X F I=1:1:ORDA S X=ORDA(I),^ORD(101.41,DITEM,10,I,0)=I_U_X,^ORD(101.41,DITEM,10,"B",I,I)="",^ORD(101.41,DITEM,10,"D",X,I)="",^ORD(101.41,"AD",X,DITEM,I)=""
 . S ^ORD(101.41,DITEM,10,0)="^101.412AI^"_ORDA_U_ORDA
 Q
 ;
PSJQ(NAME,ITM) ; -- Create new PSJQOS dialog
 N X,Y,DIC,DLAYGO S:'$L(NAME) NAME=ORSETNM
 S DIC="^ORD(101.41,",DIC(0)="LX",DLAYGO=101.41
 S X="PSJQOS "_ORSETNM_$S($G(ITM):" "_ITM,1:"") D ^DIC S:Y'>0 Y=0
 I $P(Y,U,3) D
 . S X=$P(Y,U,2)_U_NAME_"^^"_$S($G(ITM):"Q",1:"O")_U_ORDG_"^2^"_ORPKG
 . S ^ORD(101.41,+Y,0)=X,^ORD(101.41,"C",$$UP^XLFSTR(NAME),+Y)=""
 . S:ORPKG ^ORD(101.41,"APKG",+ORPKG,+Y)=""
 Q +Y
 ;
COLS ; -- Fix column position
 N MENU,ITM,ROW,COL,POS,CW,ORCOL
 S MENU=0 F  S MENU=$O(^ORD(101.41,MENU)) Q:MENU'>0  I $P(^(MENU,0),U,4)="M" S CW=+$G(^(5)) D
 . S:'CW CW=80 K ORCOL D SETCOL(CW) S ITM=0
 . F  S ITM=$O(^ORD(101.41,MENU,10,ITM)) Q:ITM'>0  S POS=$P(^(ITM,0),U) D
 . . K ^ORD(101.41,MENU,10,"B",POS,ITM)
 . . S ROW=$P(POS,"."),COL=$P(POS,".",2) S:'COL COL=1 S COL=ORCOL("B",COL)
 . . S POS=ROW_"."_COL,$P(^ORD(101.41,MENU,10,ITM,0),U)=POS
 . . S ^ORD(101.41,MENU,10,"B",POS,ITM)="" W "."
 Q
 ;
SETCOL(WIDTH) ; -- Set ORCOL(#)=ColPos by WIDTH
 N I,X S:'$G(WIDTH) WIDTH=80
 F I=1:1 S X=(I-1)*WIDTH+1 Q:X'<240  S ORCOL(I)=X,ORCOL=I,ORCOL("B",X)=I
 Q
