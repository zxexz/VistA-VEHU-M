DENTA15A ;ISC2/HCD,SAW-PRINT/DISPLAY TREATMENT DATA SUMMARY REPORTS BY CLINIC OR PROVIDER(CON'T) ;4/28/89  14:19 ;
 ;VERSION 1.2
 S (A1,A2,A3,A4,A5,A6,A7,A8,AB,H4,H6,X,Z5)="",V=$S(DENT4=1:"$VALUE",1:""),V1=$S(DENT4=1:"TOT $VALUE",1:""),H8=1 D HDR^DENTA15,HDR3,A4,A5 K H8 Q
A4 F I=0:0 D:$Y#(IOSL-3)=0 HOLD1 Q:Z5=U  S X=$O(^UTILITY($J,"DENTR",X)) Q:X=""  S (A5,X1)="",A0=^DIC(220.3,X,0),A1=$P(A0,U,2),A6=$P(A0,U,3) D A41
 Q
A41 F J=0:0 S X1=$O(^UTILITY($J,"DENTR",X,X1)) D:X1="" A4P Q:X1=""  S X2=^(X1),A5=A5+X2 I X=18,+X2>0 S F=1,AB=AB+(A1*$P(X2,"^",2))+(+X2-$P(X2,"^",2))
 Q
A5 D:$Y#(IOSL-3)=0 HOLD1 Q:Z5=U  W !!,"Totals",?35,$J(A4,4),?56,$J(A3,10,2) W:DENT4=1 ?67,$J(A8,11,2) W !!,"Note: This report is used to verify the 240 and 280 report."
 D:$Y>(IOSL-3) HOLD1 Q:Z5=U  W:$D(F)&$D(DENT3) !,?4,"  Total CTVs for extractions are weighted (calculated) as follows: ",!,?6,"4 CTVs for the first extraction 1 CTV for each additional extraction.",! K F D HOLD^DENTA15 Q
HDR3 W !!,"PROCEDURE",?33,"# DONE",?43,"CTV",?50,V,?59,"TOT CTV",?68,V1 Q
A4P S A4=A4+A5,A2=A2+A1,A7=A7+A6,A8=A8+(A6*A5) W !,$E($P(A0,U,1),1,30),?35,$J(A5,4),?40,$J(A1,6,2) W:DENT4=1 ?47,$J(A6,9,2) S A1=A5*A1 S:(X=18)&(+X2>0) A1=AB S A3=A3+A1 W ?57,$J(A1,9,2) W:DENT4=1 ?67,$J(A6*A5,11,2) Q
A6 S (A1,A2,A3,A4,A5,A6,A7,A8,AB,H4,X)="",V=$S(DENT4=1:"$VALUE",1:""),V1=$S(DENT4=1:"TOT $VALUE",1:""),H8=1 D HDR^DENTA15,HDR3,A7,A5 K H8 Q
A7 F I=0:0 S X=$O(^UTILITY($J,"DENTR",DENTPRV,X)) Q:X=""  S:X=18 F=1 S (A5,X1)="",A0=^DIC(220.3,X,0),A1=$P(A0,U,2),A6=$P(A0,U,3) D A9
 Q
A9 F J=0:0 S X1=$O(^UTILITY($J,"DENTR",DENTPRV,X,X1)) D:X1="" A4P Q:X1=""  S X2=^(X1),A5=A5+X2 I X=18,+X2>0 S AB=AB+(A1*$P(X2,"^",2))+(+X2-$P(X2,"^",2))
 Q
HOLD1 D HOLD^DENTA15 D:Z5'=U HDR^DENTA15,HDR3 Q
