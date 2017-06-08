MDPFTP2 ; HOIFO/NCA - PFT REPORT-VOLUMES ;3/15/04  10:00
 ;;1.0;CLINICAL PROCEDURES;**2**;Apr 01, 2004
 D SETVAR G FLOW:'$D(^MCAR(700,+MDR,3)),FLOW:'$O(^(3,0)) S MCX=0
 S HEAD1="VOLUMES" D HEAD1,HEAD2
VOL S MCMAIN=0,MCX=$O(^MCAR(700,+MDR,3,MCX)) G FLOW:MCX'?1N.N S MCREC=^(MCX,0),TYPE=$P(MCREC,U) S:(TYPE="I")!(TYPE="B") MCMAIN=1
 S ND="AV",ND1=3 D PRETEST S SS=""
 D SETNODE(MDGRS," ")
 S SS="     "_$S(TYPE="B":"BODY BOX",TYPE="I":"INERT GAS DILUTION",TYPE="N":"NITROGEN WASH OUT",1:"X-RAY PLANIMETRY") D PREVDATE
 I $P(MCREC,U,6)'="" S SS="(NOTES): "_$P(MCREC,U,6) D SETNODE(MDGRS,SS) S SS=""
 S ACT=$P(MCREC,U,2) I ACT S MEAS="TLC",UNITS="L",PRED=TLC X:$D(MCRC1) MCRC1 S PC=2,CI95=$S(PRED:PRED-CTLC,1:"") D PRTLINE S:MCMAIN MCTLCN=ACT,MCITL=CI95,MCIPTL=PRED
 S ACT=$P(MCREC,U,3) I ACT S MEAS="VC",UNITS="L",PRED=VC X:$D(MCRC1) MCRC1 S PC=3,CI95=$S(PRED:PRED-CVC,1:"") D PRTLINE S:MCMAIN MCVCN=ACT
 S ACT=$P(MCREC,U,4) I ACT S MEAS="FRC",UNITS="L",PRED=FRC X:$D(MCRC3) MCRC3 S PC=4,CI95=$S(PRED:PRED+CFRC,1:"") D PRTLINU
 S ACT=$P(MCREC,U,5) I ACT S MEAS="RV",UNITS="L",PRED=RV X:$D(MCRC3) MCRC3 S PC=5,CI95=$S(PRED:PRED+CRV,1:"") D PRTLINU
 I $P(MCREC,U,2),$P(MCREC,U,5) S SS="     "_"RV/TLC"_"       %" S ACT=$P(MCREC,U,5)/$P(MCREC,U,2) S SS=SS_$J(" ",35-$L(SS))_$J(ACT*100,5,0) D SETNODE(MDGRS,SS) S:MCMAIN&(ACT>.35) MCIRV=1
 G VOL
FLOW K CTLC,CVC,CFRC,CRV G ^MDPFTP2A
EXIT Q
SETVAR S (MCVCN,MCTLCN,MCMVVN,MCIRV,MCIFA,MCIFL,MCIPTL,MCIFE,MCIFV,MCIDA,MCIDL,MCIDP,MCIAO2,MCIAO1,MCITL)="",MCDL=2,MCLNG=5,PRED=0 Q
PRTLINE S MCP1=$G(MCP1),MCP2=$G(MCP2),SS=""
 S SS="     "_MEAS,SS=SS_$J(" ",18-$L(SS))_UNITS,SS=SS_$J("",25-$L(SS))_$S(PRED:$J(PRED,MCLNG,MCDL),1:"")
 S SS=SS_$J(" ",35-$L(SS))_$J(ACT,MCLNG,MCDL),SS=SS_$J(" ",45-$L(SS))_$S(PRED:$J(ACT/PRED*100,5,1),1:"")
 S:$P(MCP1,U,PC) SS=SS_$J(" ",55-$L(SS))_$J($P(MCP1,U,PC),MCLNG,MCDL) S:$P(MCP2,U,PC) SS=SS_$J(" ",65-$L(SS))_$J($P(MCP2,U,PC),MCLNG,MCDL)
 S:(CI95)&(CI95'=PRED) SS=SS_$J(" ",72-$L(SS))_" "_$J(CI95,6,2)
 D SETNODE(MDGRS,SS) S SS="" Q
PRTLINU S SS="" S SS="     "_MEAS,SS=SS_$J(" ",18-$L(SS))_UNITS,SS=SS_$J(" ",25-$L(SS))_$S(PRED:$J(PRED,MCLNG,MCDL),1:"")
 S SS=SS_$J(" ",35-$L(SS))_$J(ACT,MCLNG,MCDL),SS=SS_$J(" ",45-$L(SS))_$S(PRED:$J(ACT/PRED*100,5,1),1:"")
 S:$P(MCP1,U,PC) SS=SS_$J(" ",55-$L(SS))_$J($P(MCP1,U,PC),MCLNG,MCDL) S:$P(MCP2,U,PC) SS=SS_$J(" ",65-$L(SS))_$J($P(MCP2,U,PC),MCLNG,MCDL)
 S:(CI95)&(CI95'=PRED) SS=SS_$J(" ",72-$L(SS))_"U"_$J(CI95,6,2)
 D SETNODE(MDGRS,SS) S SS=""
 Q
HEAD1 D SETNODE(MDGRS," "),SETNODE(MDGRS," ")
 S SS=$J(" ",15)_"UNITS"_"     "_$S('$D(MCSP):"PRED",1:"")
 S SS=SS_$J(" ",35-$L(SS))_"ACTUAL"_"     "_$S('$D(MCSP):"%PRED",1:"")
 S SS=SS_$J(" ",55-$L(SS))_"PREV1"_"     "_"PREV2"
 I '$D(MCSP) S SS=SS_$J(" ",73-$L(SS))_"CI"
 D SETNODE(MDGRS,SS) S SS=""
 Q
HEAD2 D SETNODE(MDGRS,HEAD1_$E(MCDOT,1,80-$L(HEAD1))) Q
PREVDATE F I="RDATE1","RDATE2" I $D(@I),@I S X=9999999.9999-@I S TAB=$S(I="RDATE1":55,1:65) S SS=SS_$J(" ",TAB-$L(SS))_+$E(X,4,5)_"/"_+$E(X,6,7)_"/"_$E(X,2,3)
 D SETNODE(MDGRS,SS) S SS=""
 Q
PRETEST S (MCP1,MCP2,MCP1S0,MCP2S0,MCP1S1,MCP1S2,MCP2S1,MCP2S2,RDATE1,RDATE2)=""
 Q:'$O(^MCAR(700,ND,DFN,TYPE,RDATE))  S RDATE1=$O(^(RDATE)),PD11=$O(^(RDATE1,0)),PD1=$O(^(PD11,0))
 S (MCP1,MCP1S0)=^MCAR(700,PD11,ND1,PD1,0) I ND="AS" S:$D(^(1)) MCP1S1=^(1) S:$D(^(2)) MCP1S2=^(2)
 K PD1,PD11 Q:'$O(^MCAR(700,ND,DFN,TYPE,RDATE1))  S RDATE2=$O(^(RDATE1)),PD21=$O(^(RDATE2,0)),PD2=$O(^(PD21,0))
 S (MCP2,MCP2S0)=^MCAR(700,PD21,ND1,PD2,0) I ND="AS" S:$D(^(1)) MCP2S1=^(1) S:$D(^(2)) MCP2S2=^(2)
 K PD2,PD21 Q
SETNODE(NODE,VALUE) ;Set the node with the string
 S MDLNE=MDLNE+1,@NODE@(MDLNE,0)=VALUE
 Q
