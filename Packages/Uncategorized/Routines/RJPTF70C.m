RJPTF701 ;RJ WILM DE -MAKE C701 PTF CARD; 12-12-85
 ;;4.0
 S RJPTF=^DGPT(I,70),J=$P(RJPTF,"^",1),Y="              "
 S RJN701=$E(J,4,7)_$E(J,2,3)_Y I $P(RJPTF,"^",8)'="" S Y=$P(RJPTF,"^",8),X=2 D LJ1 S RJN701=RJN701_Y
 E  S RJN701=RJN701_"   "
 S RJN701=RJN701_$P(^DIC(10,$P(^DPT(RJ,0),"^",6),0),"^",2)_$P(RJPTF,"^",9)
 S Y=$P(^ICD9($P(RJPTF,"^",10),0),"^",1),X=6 D D,LJ S RJN701=RJN701_Y
ENDR S RJN701="C701"_RJCON_RJN701,Y=RJN701,X=80 D LJ S RJN701=Y K RJPTF,J,K,L,X,Y Q
LJ F K=$L(Y):1:X S Y=Y_" "
 Q
LJ1 F K=$L(Y):1:X S Y="0"_Y
 Q
D Q:Y'["."  S L="" F K=1:1:$L(Y) S:$E(Y,K)'="." L=L_$E(Y,K)
 S Y=L Q
