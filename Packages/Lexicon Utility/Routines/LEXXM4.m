LEXXM4 ;ISL/KER - Convert Text to Mix Case (4) ;12/19/2014
 ;;2.0;General Lexicon Utilities;**80,86**;Sep 23, 1996;Build 1
 ;               
 ; Global Variables
 ;    None
 ;               
 ; External References
 ;    None
 ;               
 ; Local Variables NEWed or KILLed Elsewhere
 ;     LEXCTL,LEXIN,LEXNXT,LEXPRE,LEXUSE Newed in LEXXM
 ;     Y set and returned to LEXXM
 ;               
T4 ; 4 Characters
 N XU,CHR,NUM,TRL,PRE,UIN,NXT,USE,P1,P2 S PRE=$G(LEXPRE),NXT=$G(LEXNXT),USE=$G(LEXUSE),UIN=$G(UIN),XU=$$UP(X),CHR=$E(XU,1)
 ;   Exceptions
 S P1=$E(XU,1,($L(XU)-2)),P2=$E(XU,($L(XU)-1),$L(XU)) I "^CC^ML^GM^"[("^"_P2_"^"),$E(P1,$L(P1))?1N S Y=$$LO(XU) Q
 S NUM=$E(XU,1,2),TRL=$E(XU,3,4) I +NUM=NUM,((TRL="TH")!(TRL="ST")!(TRL="RD")) S Y=$$LO(XU) Q:$L($G(Y))
 S:$E(XU,1)?1U&($E(XU,4)?1N) Y=XU Q:$L($G(Y))  S:$E(XU,1)?1N&($E(XU,4)?1U) Y=XU Q:$L($G(Y))
 I "SIZE"=XU&(PRE="ANY") S Y=$$LO(X) Q
 S:XU="NASH"&(UIN["NONALCOHOLIC STEATOHEPATITIS"!(USE["NONALCOHOLIC STEATOHEPATITIS")) Y=XU Q:$L($G(Y))
 S:XU="NASH"&(UIN["NON-ALCOHOLIC STEATOHEPATITIS"!(USE["NON-ALCOHOLIC STEATOHEPATITIS")) Y=XU Q:$L($G(Y))
 S:XU="ALPS"&(USE["AUTOIMMUNE") Y=XU Q:$L($G(Y))
 I XU="MESA",$G(LEXCTL)["(MESA)" S Y=XU Q
 S:XU="TRAM"&((UIN["TRANSVERSE")!(UIN["BREAST")) Y=XU Q:$L($G(Y))
 S:XU="OPEN"&((UIN["OPEN HEART")) Y=$$MX(XU) Q:$L($G(Y))
 S:XU="DRIL"&(UIN["DISTAL REVASCULARIZATION")&(UIN["INTERVAL LIGATION") Y=$$UP(XU) Q:$L($G(Y))
 S:XU="TRAM"&((UIN["PROTEIN")!(UIN["GENE")!(UIN["ENDOPLASMIC RETICULUM"))&(UIN'["ACCIDENT")&(UIN'["VEHICLE") Y="TraM" Q:$L($G(Y))
 S:XU="TIPS"&($G(LEXIN)["(TIPS)") Y=XU S:XU="TIPS"&($G(LEXCTL)["(TIPS") Y=XU S:XU="TIPS"&($G(LEXCTL)["TIPS)") Y=XU Q:$L($G(Y))
 ;   Special Case
 S:XU="APOA" Y="ApoA" S:XU="BBVI" Y="BbvI" S:XU="BPTH" Y="bPTH" Q:$L($G(Y))
 S:XU="BSUE" Y="BsuE" S:XU="PCO2" Y="pCO2" S:XU="CGMP" Y="cGMP" Q:$L($G(Y))
 S:XU="COTE" Y="CotE" S:XU="DATP" Y="dATP" S:XU="DCMP" Y="dCMP" Q:$L($G(Y))
 S:XU="DCTP" Y="dCTP" S:XU="DGMP" Y="dGMP" S:XU="DGTP" Y="dGTP" Q:$L($G(Y))
 S:XU="DSBA" Y="dsbA" S:XU="DTDP" Y="dTDP" S:XU="DTTP" Y="dTTP" Q:$L($G(Y))
 S:XU="DUMP" Y="dUMP" S:XU="DURD" Y="dUrd" S:XU="DUTP" Y="dUTP" Q:$L($G(Y))
 S:XU="ECAI" Y="EcaI" S:XU="ECOK" Y="EcoK" S:XU="ERBB" Y="erbB" Q:$L($G(Y))
 S:XU="FELV" Y="FeLV" S:XU="FMET" Y="fMet" S:XU="GNRH" Y="GnRH" Q:$L($G(Y))
 S:XU="GPII" Y="gpII" S:XU="HARG" Y="hArg" S:XU="HELA" Y="HeLa" Q:$L($G(Y))
 S:XU="HGRF" Y="hGRF" S:XU="HHAI" Y="HhaI" S:XU="HPAI" Y="HpaI" Q:$L($G(Y))
 S:XU="HPTH" Y="hPTH" S:XU="KPNI" Y="KpnI" S:XU="MCRB" Y="McrB" Q:$L($G(Y))
 S:XU="MESH" Y="MeSH" S:XU="MRNA" Y="mRNA" S:XU="NHET" Y="NHEt" Q:$L($G(Y))
 S:XU="NHME" Y="NHMe" S:XU="OBZL" Y="OBzl" S:XU="OTBU" Y="OtBu" Q:$L($G(Y))
 S:XU="PGLU" Y="pGlu" S:XU="PSTI" Y="PstI" S:XU="REGA" Y="regA" Q:$L($G(Y))
 S:XU="RRNA" Y="rRNA" S:XU="SCEI" Y="SceI" S:XU="TAQI" Y="TaqI" Q:$L($G(Y))
 S:XU="TRFA" Y="TrfA" S:XU="TRKA" Y="trkA" S:XU="TRKB" Y="trkB" Q:$L($G(Y))
 S:XU="TRNA" Y="tRNA" Q:$L($G(Y))
 ;   Lower Case
 I "LESS"=XU&($E(NXT,1,4)="THAN") S Y=$$LO(X) Q
 I "^ALSO^AREA^BEEN^BEST^DONE^DTMN^EACH^EVEN^FIVE^FOUR^FROM^"[("^"_XU_"^") S Y=$$LO(X) Q
 I "^HAVE^HERE^HOUR^INTO^IT'S^KIND^LATE^LEFT^LESS^LIKE^LOST^"[("^"_XU_"^") S Y=$$LO(X) Q
 I "^MANY^MERE^MORE^MOST^MUST^NINE^NOTE^ONLY^OPEN^OURS^OVER^"[("^"_XU_"^") S Y=$$LO(X) Q
 I "^PART^PLUS^SAME^SEEN^SITE^SOME^SUCH^SURE^TAKE^THAN^THAN^"[("^"_XU_"^") S Y=$$LO(X) Q
 I "^THAT^THEN^THEY^THIS^THUS^UPON^USED^WERE^WHAT^WHEN^WHOM^"[("^"_XU_"^") S Y=$$LO(X) Q
 I "^WITH^"[("^"_XU_"^") S Y=$$LO(X) Q
 ;   Mixed Case
 I "^BATH^CITH^CITY^EAST^ERIE^FORT^HOME^IOWA^IRON^JUAN^JULY^"[("^"_XU_"^") S Y=$$MX(X) Q
 I "^JUNE^KELL^LAKE^LOMA^LONG^LYON^PALM^PALO^PARK^RENO^ROCK^"[("^"_XU_"^") S Y=$$MX(X) Q
 I "^SALT^SIDE^TYPE^WACO^WEST^YORK^"[("^"_XU_"^") S Y=$$MX(X) Q
 ;   Uppercase
 I CHR?1N!("^A^B^C^D^E^F^"[("^"_CHR_"^")) D  Q:$L($G(Y))
 . I "^A1B5^A1BG^A4A7^A4A8^A6K7^ABL1^AICD^ABSV^ACKQ^ACTH^AIDS^AJCC^"[("^"_XU_"^") S Y=XU Q
 . I "^ALLA^AML1^ANCA^ANIT^ARPP^ASHD^ASPE^ATLV^BADR^BCL2^BDEM^"[("^"_XU_"^") S Y=XU Q
 . I "^BMIC^BMWD^BPDE^BPDE^BUSI^CABG^CAP1^CAP2^CAPD^CBFB^CCPD^"[("^"_XU_"^") S Y=XU Q
 . I "^CD34^CENP^CGRP^CHCT^COOH^COPD^CORF^CPAP^CPAP^CPEP^CPRS^"[("^"_XU_"^") S Y=XU Q
 . I "^CPT1^CPT2^CRNA^CROS^DENT^DEXA^DGGE^DGHI^DGPW^DGY1^DGY3^"[("^"_XU_"^") S Y=XU Q
 . I "^DGYA^DGYB^DGYC^DGYD^DGYF^DGYG^DGYJ^DGYK^DGYL^DGYN^DGYO^"[("^"_XU_"^") S Y=XU Q
 . I "^DGYP^DGYQ^DGYR^DGYS^DGYU^DGYV^DGYW^DGYX^DGYZ^DHEA^DIPK^"[("^"_XU_"^") S Y=XU Q
 . I "^DMAC^DMBA^DMBA^DMSO^DOPS^DSAP^DSIP^DTAP^DTPA^DVBA^DVBC^"[("^"_XU_"^") S Y=XU Q
 . I "^DVBQ^DVBT^DVBU^DVBW^DVBX^DVBY^EADT^EBNA^EBUS^ECMO^EDTA^"[("^"_XU_"^") S Y=XU Q
 . I "^EEOA^EEOP^ENXE^ENXF^ENXG^ENXI^ENXJ^ENXK^ERCC^ERCP^ERCP^"[("^"_XU_"^") S Y=XU Q
 . I "^ESBL^ESRD^ESRD^ESWL^ETV1^ETV6^FANA^FBAA^FEV1^FITC^FKBP^FLI1^"[("^"_XU_"^") S Y=XU Q
 . I "^FP22^"[("^"_XU_"^") S Y=XU Q
 I "^G^H^I^J^K^L^"[("^"_CHR_"^") D  Q:$L($G(Y))
 . I "^G6PD^GABA^GATA^GECD^GECP^GECS^GERD^GHRH^GJB2^GLUT^GMAA^GMD1^"[("^"_XU_"^") S Y=XU Q
 . I "^GMN1^GMN2^GMN3^GMN4^GMN5^GMPL^GMPT^GMRA^GMRC^GMRD^GMRE^"[("^"_XU_"^") S Y=XU Q
 . I "^GMRG^GMRP^GMRQ^GMRR^GMRS^GMRV^GMRY^GP22^GRSA^GYKI^HBHC^"[("^"_XU_"^") S Y=XU Q
 . I "^HBIG^HCFA^HCMV^HCO2^HCPS^HETE^HIAA^HIDA^HISA^HLPC^HMSN^HPLC^"[("^"_XU_"^") S Y=XU Q
 . I "^HPSA^HPFH^HSAN^HTLV^IADL^IBDE^IBDP^IBQL^IBQY^IBY3^IBY4^IBY5^"[("^"_XU_"^") S Y=XU Q
 . I "^IBY6^IBY7^IBY8^IBY9^IBYA^IBYB^IBYC^IBYD^IBYE^IBYF^IBYG^"[("^"_XU_"^") S Y=XU Q
 . I "^IBYH^IBYK^IBYL^IBYN^ICPT^IDDM^IGIV^IIIA^IIIA^IIIB^IIIC^"[("^"_XU_"^") S Y=XU Q
 . I "^IIID^IIIE^IORT^IMRT^INTP^IPPB^IPPB^ISUP^KAFO^LAAM^LATS^LBRN^LBRT^"[("^"_XU_"^") S Y=XU Q
 . I "^LBRY^LEXX^LHRH^LR00^LR01^LR03^LRAR^LRLS^LTCH^LVEF^"[("^"_XU_"^") S Y=XU Q
 I "^M^N^O^P^Q^"[("^"_CHR_"^") D  Q:$L($G(Y))
 . I "^MAGE^MAGI^MCAD^MCXX^MEDA^MEDB^MEDC^MEDF^MESA^MESH^MHPE^"[("^"_XU_"^") S Y=XU Q
 . I "^MIBB^MLH1^MLH1^MLH2^MLH3^MLH4^MLH5^MLVP^MMPI^MMRV^MPTP^"[("^"_XU_"^") S Y=XU Q
 . I "^MPTP^MPTP^MQSA^MRCP^MRSA^MSH1^MSH2^MSH3^MSH4^MSH5^MSH6^"[("^"_XU_"^") S Y=XU Q
 . I "^MSLT^MTLU^MYCN^NADH^NADP^NAPS^NARP^NBDC^NDPH^NETT^NETT^NGFI^"[("^"_XU_"^") S Y=XU Q
 . I "^NIST^NMES^NRDC^NSCL^NURA^NURC^NURE^NURQ^NURX^OERR^OHCS^"[("^"_XU_"^") S Y=XU Q
 . I "^ONCO^PABA^PAPP^PAPS^PAX3^PAX7^PDAC^PICC^PLA1^PLA2^PLA3^"[("^"_XU_"^") S Y=XU Q
 . I "^PMMA^POMC^PORP^PRCA^PRCP^PRMQ^PRPF^PRSX^PRX0^PRX1^PRX8^"[("^"_XU_"^") S Y=XU Q
 . I "^PRXB^PRXC^PRXE^PRXF^PRXG^PRXI^PRXJ^PRXK^PRXP^PRYA^PRYB^"[("^"_XU_"^") S Y=XU Q
 . I "^PRYC^PRYD^PRYF^PRYH^PRYJ^PRYL^PRYN^PRYP^PSA1^PSAP^PSD1^"[("^"_XU_"^") S Y=XU Q
 . I "^PSGW^PSIV^PSJ1^PSJ4^PSOA^PSOB^PSOC^PSOD^PSOE^PSOG^PSOH^"[("^"_XU_"^") S Y=XU Q
 . I "^PSOJ^PSOL^PSOY^PSW1^PSXC^PTCA^PTEN^PTLD^PTSD^PUVA^PUVB^QAN1^"[("^"_XU_"^") S Y=XU Q
 . I "^QAR1^QAR2^QARF^QARY^"[("^"_XU_"^") S Y=XU Q
 I "^R^S^T^U^V^W^X^Y^Z^"[("^"_CHR_"^") D  Q:$L($G(Y))
 . I "^RAAA^RAAB^RAAC^RAAE^RAAF^RARA^RAST^RMPC^RMPF^RMPJ^RMPR^RMPT^"[("^"_XU_"^") S Y=XU Q
 . I "^RTEM^RTYB^RTYC^RTYD^RVEF^RXIV^RXOP^RXUD^SARS^SACH^SBCE^SCAD^"[("^"_XU_"^") S Y=XU Q
 . I "^SCID^SCL1^SCL2^SDHB^SDHD^SDYA^SDYM^SDYN^SDYP^SEXA^SGOT^SGPT^"[("^"_XU_"^") S Y=XU Q
 . I "^SHBG^SIRS^SISI^SMAR^SNAP^SOWA^SOWC^SOWK^SRIF^SRIH^SROA^"[("^"_XU_"^") S Y=XU Q
 . I "^SRRS^SRRT^SSCP^SSX1^SSX2^STEC^TAPA^TATA^TCDD^TCDD^TCF3^TDAP^"[("^"_XU_"^") S Y=XU Q
 . I "^TENS^TFE3^THBR^TIMP^TIUJ^TIUW^TIUX^TLSO^TLSO^TORP^TP53^"[("^"_XU_"^") S Y=XU Q
 . I "^UDPG^UMLS^VALM^VAPR^VDDR^VEEM^VIIA^VIII^VLDL^VRSA^VSIT^"[("^"_XU_"^") S Y=XU Q
 . I "^WHFO^WMMT^XIII^XQOR^XUFI^XVII^XXII^YS01^ZIFT^"[("^"_XU_"^") S Y=XU Q
 Q
 ;          
LO(X) ; Lower Case
 Q $TR(X,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz")
UP(X) ; Uppercase
 Q $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
MX(X) ; Mix Case
 Q $TR($E(X,1),"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")_$TR($E(X,2,$L(X)),"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz")
LD(X) ; Leading Character
 Q $TR($E(X,1),"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")_$E(X,2,$L(X))
TRIM(X) ; Trim Spaces
 S X=$G(X) F  Q:$E(X,1)'=" "  S X=$E(X,2,$L(X))
 F  Q:$E(X,$L(X))'=" "  S X=$E(X,1,($L(X)-1))
 N LEXCTL,LEXIN,LEXNXT,LEXPRE,LEXUSE,Y
 Q X
