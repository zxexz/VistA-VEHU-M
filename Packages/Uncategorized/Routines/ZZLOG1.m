A1BFLOG1 ;ALBANY ISC;ECF;17MAR92;13:10pm [ 04/13/93  1:25 PM ]
 ;;V1.0
EN ;Logon routine
 D CLEAN
 I $D(^A1BF(11601,1,5)) I $P(^A1BF(11601,1,5),U,1)=1 G EXIT1
 D EN^A1BFCHK1
 D SETUP
 D OPEN I I>4 D NOPEN G AGAIN
 D PARR 
 D READ I $P(A1BFERR,"*",1)'["DSCON" D ERR1 G AGAIN
 D EXIT
 D EN^A1BFLOG2
AGAIN ;
 U IO(0) W !,"RETURN TO START"
 HANG 2 G EN
SETUP ;
 S X=$P(^A1BF(11601,1,0),U,3),X1=$A("@"),X2=$A("\") D DE^XUSHSHP S A1BFACC=X
 S X=$P(^A1BF(11601,1,0),U,4),X1=$A("+"),X2=$A("}") D DE^XUSHSHP S A1BFVER=X
 S U="^" D ^%GUCI S A1BFUVOL=%UCI,A1BFUCI=$P(A1BFUVOL,",",1),A1BFVOL=$P(A1BFUVOL,",",2)
 S A1BFAJOB=0 D ^%ACTJOB F I=1:1:$L(%ACTIVE0) I $E(%ACTIVE0,I)=1 S A1BFAJOB=A1BFAJOB+1
 D ^A1BFDEVU S:'$D(A1BFARR) $P(A1BFARR,"X",12)="X"
 S A1BFCR=0
 Q
CLEAN ;
 S $ZERROR="" S $ZTRAP="" S A1BFERR=""
 Q
OPEN ;
 F I=1:1:5 S %ZIS=0,IOP=A1BFDEV D ^%ZIS Q:'POP 
 U IO X ^%ZOSF("EOFF"),^%ZOSF("TYPE-AHEAD") S X=80 X ^%ZOSF("RM")
 Q
PARR ;
 F I=1:1:10 S A1BFTX=$T(TEXT+I) Q:A1BFTX=""  S A1BFPRMT($E($P(A1BFTX,";",3),$L($P(A1BFTX,";",3))-11,$L($P(A1BFTX,";",3))))=$P(A1BFTX,";",4)_"^"_$P(A1BFTX,";",5)
 Q
READ ;
 S (%H,A1BFSTRH)=$H D YMD^%DTC D
 .I $E(%,1)'="." S %=".0000" Q   ;Probably better flag an error
 .I $L(%)<7 F I=1:1:7 S %=%_"0" Q:$L(%)>6
 S A1BFSTRT=X_% S A1BFINT=X_$E(%,1,3)_(($E(%,4,5)\5)*5)
 S (A1BFLAG,A1BFLAG1)=0
READ1 ;
 S $ZTRAP="READERR^A1BFLOG1"
 U IO:(::1) R *X:0 IF  S:X>31 A1BFARR=$E(A1BFARR,2,12)_$C(X) U IO(0) W $C(X) I $D(A1BFPRMT(A1BFARR)) D @$P(A1BFPRMT(A1BFARR),U,1)
 G READ1
READERR ;
 S A1BFERR=$ZE S $ZTRAP="" S $ZERR=""
 Q
EXIT ;
 S (%H,A1BFSTPH)=$H D YMD^%DTC D
 .I $E(%,1)'="." S %=".0000" Q   ;Probably better flag an error
 .I $L(%)<7 F I=1:1:7 S %=%_"0" Q:$L(%)>6
 S A1BFSTOP=X_%
 X ^%ZIS("C")
 Q
EXIT1 ;
 Q
SENDACC ;
 F I=1:1:$L(A1BFACC) U IO W $E(A1BFACC,I)
 U IO W $C(13)
 Q
SENDVER ;
 F I=1:1:$L(A1BFVER) U IO W $E(A1BFVER,I)
 D SENDCR
 Q
SENDTERM ;
 F I=1:1:500 S X1=X U IO R *X:0 IF  I X_X1="4747" Q
 D SENDCR
 Q
SENDCR ;
 U IO W $C(13)
 S A1BFCR=A1BFCR+1
 Q
SENDREAD ;
 I A1BFLAG=0 F I=1:1:4 U IO W $E("READ",I) S A1BFLAG=1
 D SENDCR
 Q
SENDBASK ;
 F I=1:1:500 S X1=X U IO R *X:0 IF  I X_X1="4747" Q
 F I=1:1:$L(A1BFBASK) U IO W $E(A1BFBASK,I)
 D SENDCR
 Q
SENDMNO ;
 F I=1:1:500 S X1=X U IO R *X:0 IF  I X_X1="4747" Q
 I A1BFLAG1 U IO W "^" D SENDCR Q
 U IO F I=1:1:$L(A1BFMSNO) W $E(A1BFMSNO,I)
 S A1BFLAG1=1 D SENDCR
 Q
SENDACT ; 
 F I=1:1:500 S X1=X U IO R *X:0 IF  I X_X1="4747" Q
 F I=1:1:3 U IO W $E("IGNORE",I)
 D SENDCR
 Q
SENDLOG ;
 F I=1:1:3 U IO W $E("LOG",I)
 U IO W $C(13)
 Q
NOPEN ;
 S $ZERROR=""
 S A1BFTXT(99)="Unable to open device "_A1BFDEV 
 D EN^A1BFMSG1
 Q
ERR1 ;
 S A1BFZERR=$ZERROR S $ZERROR=""
 S A1BFTXT(98)="Problem reading from device "_A1BFDEV
 S A1BFTXT(99)="The error message is "_A1BFZERR
 D EN^A1BFMSG1
 Q
TEXT ;
 ;;ACCESS CODE:;SENDACC;ACCESS CODE
 ;;VERIFY CODE:;SENDVER;VERIFY CODE
 ;;Select TERMINAL TYPE NAME: ;SENDTERM;Terminal Type Prompt
 ;;Select MailMan Menu Option: ;SENDREAD;MailMan Prompt
 ;;Read MAIL BASKET: ;SENDBASK;Basket Select Prompt
 ;; Basket Message: ;SENDMNO;Message Number Prompt
 ;;Select MESSAGE Action:;SENDACT;Message Action Prompt
 ;;Select Mailman Option: ;SENDCR;Close MailMan Menu
 ;;Do you really want to halt? YES//;SENDCR;Halt Prompt
 ;;disconnect requestLocal>;SENDLOG;Local Prompt
