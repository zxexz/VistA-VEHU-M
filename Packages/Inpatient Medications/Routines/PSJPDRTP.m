PSJPDRTP ;BIR/MV-PRINT PADE TRANSACTION REPORT  ;11/15/2015
 ;;5.0;INPATIENT MEDICATIONS;**317**;16 DEC 97;Build 130
 ;
 ; Reference to ^%ZISC is supported by DBIA 10089.
 ; Reference to ^VA(200 is supported by DBIA 10060.
 ; Reference to ^XLFDT is supported by DBIA 10103
 ; Reference to ^DG(40.8 is supported by DBIA 728.
 ; Reference to ^PSDRUG is supported by DBIA 2192.
 ; Reference to ^VA(200 is supported by DBIA 10060.
 ; Reference to ^DPT supported by DBIA 10035
 Q
 ;
EN(PSJINP) ; Write PADE Inventory Report
 ; Required : PSJINP array
 ;   Input    PSJINP("PADEV")         = PADE device(s) (pointer to PADE DISPENSING DEVICE #58.63) selected by user
 ;            PSJINP("PSDRG")         = Drug(s) (pointer to DRUG #50) selected by user
 ;            PSJINP("PSJCSUB")       = CS Federal Schedule(s) selected by user
 ;            PSJINP("PSJDEV",CABIEN) = Pointer to PADE DISPENSING DEVICE (#58.63) file
 ;            PSJINP("PSJDELM")       = (D)elimited or formatted (R)eport, selected by user
 ;            PSJINP("PSJDIV")        = Division (pointer to MEDICAL CENTER DIVISION #40.8) selected by user
 ;            PSJINP("PSJPSYS"        = PADE INVENTORY SYSTEM (#58.601) selected by user
 ;            PSJINP("PSJSUM"         = (S)ummary or (D)etail report, selected by user
 ;
 N PSJDELIM,PSJQUIT,PSJLNCNT,PSJIOSL,PSJPTOT,DTOUT,DUOUT
 S PSJIOSL=$S($G(IOSL):IOSL-3,1:20)
 S PSJDELIM=$G(PSJINP("PSJDELM"))
 U IO
 I PSJDELIM="D" D DELIM(.PSJINP)
 I PSJDELIM="R" D FORMAT(.PSJINP,PSJIOSL)
 Q
 ;
DELIM(PSJINP) ; Output delimited report
 N PSJPGTOT,PSJLNCNT,PSJPGCNT
 S PSJLNCNT=1,PSJPTOT=1,PSJPGCNT=1
 D SRHEAD(.PSJINP,PSJLNCNT,PSJPTOT,PSJPGCNT)
 S PSJPGCNT="" F  S PSJPGCNT=$O(^TMP($J,"PSJPDRTR",PSJPGCNT)) Q:PSJPGCNT=""  D
 .S PSJLNCNT=0 F  S PSJLNCNT=$O(^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)) Q:'PSJLNCNT!$G(PSJQUIT)  D
 ..N PSJLNRAW,PSJLNFMT   ; Get output, remove unused pieces in delimited
 ..S PSJLNRAW=$G(^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT))
 ..S PSJLNFMT=$P(PSJLNRAW,"^",1,16)_"^"_$P(PSJLNRAW,"^",19)
 ..W !,PSJLNFMT
 D ^%ZISC
 D EXIT
 Q
 ;
FORMAT(PSJINP,PSJIOSL) ; Output formatted report
 N CABNAME,PSJPGTOT,PSJPGCNT,PSJDASH,PSJLNCNT,PSJDLN,PSJCOL
 S PSJLNCNT=1
 S $P(PSJDASH,"-",131)=""
 S PSJPGTOT=$$PGTOT()
 D SETCOLS(.PSJINP,.PSJCOL)
 S PSJPGCNT=0 F  S PSJPGCNT=$O(^TMP($J,"PSJPDRTR",PSJPGCNT)) Q:'PSJPGCNT!$G(PSJQUIT)  D
 .S PSJDLN=0 F  S PSJDLN=$O(^TMP($J,"PSJPDRTR",PSJPGCNT,PSJDLN)) Q:'PSJDLN!$G(PSJQUIT)  D
 ..N LINE,USER,WITNESS
 ..S LINE=$G(^TMP($J,"PSJPDRTR",PSJPGCNT,PSJDLN))
 ..I $E(LINE,1,9)="Run Date:" D CONT2^PSJPDRIP(PSJPGCNT,.PSJQUIT) S LINE=$P(LINE,"^")_PSJPGTOT
 ..; Remove User ID and Witness ID from Formatted Report
 ..S USER=$P($P(LINE,"^",8),"(") S $P(LINE,"^",8)=USER
 ..S WITNESS=$P($P(LINE,"^",9),"(") S $P(LINE,"^",9)=WITNESS
 ..U IO W !?PSJCOL(1),$P(LINE,"^"),?PSJCOL(2),$P(LINE,"^",2),?PSJCOL(3),$P(LINE,"^",3),?PSJCOL(4),$P(LINE,"^",4),?PSJCOL(5),$P(LINE,"^",5)
 ..W ?PSJCOL(6),$P(LINE,"^",6),?PSJCOL(7),$P(LINE,"^",7),?PSJCOL(8),$P(LINE,"^",8),?PSJCOL(9),$P(LINE,"^",9) I $G(PSJCOL(10)) W ?PSJCOL(10),$P(LINE,"^",10)
 D CONT2^PSJPDRIP(PSJPGCNT,.PSJQUIT,1) ; Press return to continue
 D ^%ZISC
 D EXIT
 Q
 ;
PROCSUM(PSJINP) ; Gather report data
 N PSJLNCNT,PSLNOD,PSLNHSTR,PSLNDSTR,PSTMPHDR,II,PSJCOL,PSJI,QTY
 N PSJUSRID,PSJWITID,PSJDASH,PSJPGCNT,PSJIOSL,PSJPGTOT,TABMAR,PSDRWR
 S PSJIOSL=$S($G(IOSL):IOSL-2,1:20)
 D SETCOLS^PSJPDRTP(.PSJINP,.PSJCOL)
 S $P(TABMAR," ",40)=" "
 S $P(PSJDASH,"-",131)=""
 S PSJLNCNT=1,PSJPGCNT=0
 D SRHEAD(.PSJINP,.PSJLNCNT,.PSJPGCNT,.PSJPGTOT) ; Report Header
 ; Loop through each record from File 58.6 returned in ^TMP($J,"TSCREEN", reformat and set in output global ^TMP($J,"PSJPDRTR"
 S PSJI=0 F  S PSJI=$O(^TMP($J,"TSCREEN","DILIST",PSJI)) Q:'PSJI  D
 .N PSJCOMM,PSJCABST,PSALTDRG,PSDLOC,PSJSUBDR,PSDRGID
 .S PSLNOD=^TMP($J,"TSCREEN","DILIST",PSJI,0)
 .; Ignore quantities for WASTE transactions - Display "NA"
 .I $P(PSLNOD,"^",7)="WASTE" S $P(PSLNOD,"^",9)="NA",$P(PSLNOD,"^",11)="NA",(QTY,$P(PSLNOD,"^",10))="NA"
 .S PSALTDRG="" I $P(PSLNOD,"^",2)="" S PSALTDRG=$P(PSLNOD,"^",19)
 .S PSJCABST=$$CABST^PSJPDRIP(PSJINP("PSJPSYS"),$P(PSLNOD,"^",3))
 .S PSDLOC=$P(PSLNOD,"^",5) I PSDLOC="~~" S PSDLOC=$S($P(PSLNOD,"^",7)="WASTE":"N/A",1:"UNK")
 .S PSJSUBDR=$TR($P(PSLNOD,"^",22),"~~") S:PSJSUBDR="" PSJSUBDR="N/A"
 .S PSDRWR=$P(PSLNOD,"^",21) S:$TR(PSDRWR,"~")="" PSDRWR="N/A"
 .S PSDLOC=PSDRWR_"_"_PSJSUBDR_"_"_PSDLOC
 .S PSDRGID=+$P($G(^PS(58.6,+PSLNOD,0)),"^",3)
 .S PSLNHSTR="Item: "_$S(PSALTDRG]"":"*"_PSALTDRG,1:$P(PSLNOD,"^",2))_$S($G(PSDRGID):"("_PSDRGID_")",1:"")_"^^^^^     PADE: "_$P(PSLNOD,"^",3)_PSJCABST_"^^ Item Location: "_$G(PSDLOC)
 .I PSJLNCNT>($G(PSJIOSL)-1) D PHEAD(.PSJINP,.PSJLNCNT,.PSJPGCNT,.PSJPGTOT,1) D
 ..; If same drug spans multiple pages, print "Cont" text
 ..I PSLNHSTR=PSTMPHDR D CONTRAN("(Cont) "_PSLNHSTR,PSJPGCNT,.PSJLNCNT,.PSJINP)
 .; If we're working on a new drug, print the sub-header (e.g., Transaction Date, Type, Qty, etc.)
 .I PSLNHSTR'=$G(PSTMPHDR) D
 ..S PSTMPHDR=PSLNHSTR
 ..I PSJLNCNT>($G(PSJIOSL)-6) D PHEAD(.PSJINP,.PSJLNCNT,.PSJPGCNT,.PSJPGTOT,1)
 ..D CONTRAN(PSLNHSTR,PSJPGCNT,.PSJLNCNT,.PSJINP)
 .; Arrange the data into output format, set into ^TMP($J,"PSJPDRTR"
 .S PSLNDSTR=$$BLDSTR(.PSJINP,PSLNOD,.PSJCOMM)
 .I PSJINP("PSJDELM")="D" N PSDLDRG,PSDLCAB,PSDLPAR,PSDLOC D
 ..S PSDLDRG=$P(PSLNHSTR,"^"),PSDLCAB=$P(PSLNHSTR,"^",6),PSDLPAR=$TR($P($P(PSLNHSTR,"PAR Qty: ",2),"Location:")," ",""),PSDLOC=$P(PSLNHSTR,"Location: ",2)
 ..S PSDLDRG=$P(PSDLDRG,"Item: ",2),PSDLCAB=$P(PSDLCAB,"PADE: ",2)
 ..S PSLNDSTR=PSDLDRG_"^"_PSDLCAB_"^"_PSDLOC_"^"_PSLNDSTR
 .I PSJLNCNT=1 D
 ..S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="Drug^Cabinet^Location^Date^Transaction Type^Override^Begin Balance^Qty^End Balance^Patient^Patient ID^User^User ID^Witness^Witness ID^^^Comment"
 ..S PSJLNCNT=PSJLNCNT+1
 .S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=PSLNDSTR,PSJLNCNT=PSJLNCNT+1
 .; If formatted output, print comment on separate line
 .I ($G(PSJCOMM)'=""),$G(PSJINP("PSJDELM"))="R" S PSJCOMM="     Comment: "_PSJCOMM,^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=PSJCOMM,PSJLNCNT=PSJLNCNT+1
 Q
 ;
BLDSTR(PSJINP,PSLNOD,PSJCOMM) ; Build output data string
 ; INPUT:  PSJINP() = array of user report input/selections
 ;         PSLNOD   = header node from PADE INBOUND TRANSACTION file (#58.6), by way of LIST^DIC call output in ^TMP($J,"TSCREEN"
 ; OUTPUT: PSLNDSTR  = string of report output to be stored in ^TMP($J,"PSJPDRTR"
 ;
 S PSLNDSTR=$$BLDSTR^PSJPDRU1(.PSJINP,PSLNOD,.PSJCOMM)
 Q PSLNDSTR
 ;
SRHEAD(PSJINP,PSJLNCNT,PSJPGCNT,PSJPGTOT) ; Report Header
 Q:$G(PSJINP("PSJDELM"))="D"
 N PSPGCNT,PSJDIV,CSCHED,PSJTMP,PADECAB,PADEDRG,PSJII,PSJPAT,PSJDASH,USRSTR,TRANSTR,OVRIDE,PSJCABS,PSJSUM,PSJPTSTR
 S $P(PSJDASH,"-",131)=""
 S PSJPGTOT=$S($G(PSJPGTOT):+$G(PSJPGTOT),1:1)
 S PSJDIV=$G(PSJINP("PSJDIV"))
 S PSJSUM=$G(PSJINP("PSJSUM"))
 S PSJLNCNT=1,PSJPGCNT=PSJPGCNT+1
 D PHEAD(.PSJINP,.PSJLNCNT,.PSJPGCNT,.PSJPGTOT)
 S CSCHED=$$CSCHED(.PSJINP)
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="CS/Non-CS: "_$S($G(PSJINP("PSJCSUB"))="ALL":"ALL",$G(PSJINP("PSJCSUB"))="N":"N",1:$G(CSCHED)),PSJLNCNT=PSJLNCNT+1
 S PSJCABS=$$CABSTR(.PSJINP)
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="PADE"_$S(PSJCABS[",":"(s): ",1:": ")_PSJCABS,PSJLNCNT=PSJLNCNT+1
 S PSJPTSTR=$$PTSTR(.PSJINP)
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="Patient: "_PSJPTSTR,PSJLNCNT=PSJLNCNT+1
 S PADEDRG=$$DRGSTR(.PSJINP)
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="Item"_$S(PADEDRG[",":"(s): ",1:": ")_PADEDRG,PSJLNCNT=PSJLNCNT+1
 S USRSTR=$$USRSTR(.PSJINP)
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="User: "_USRSTR,PSJLNCNT=PSJLNCNT+1
 S TRANSTR=$$TRANSTR^PSJPDRIP(.PSJINP)
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="Transaction Type: "_TRANSTR,PSJLNCNT=PSJLNCNT+1
 S OVRIDE=$S($G(PSJINP("PSJOVR")):"Y",1:"N")
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="Override Transactions Only?: "_OVRIDE,PSJLNCNT=PSJLNCNT+1
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=PSJDASH,PSJLNCNT=PSJLNCNT+1
 Q
 ;
PHEAD(PSJINP,PSJLNCNT,PSJPGCNT,PSJPGTOT,PSADDPG) ; Page header
 Q:$G(PSJINP("PSJDELM"))="D"
 N PSJDIV,PAD,LINE,PDASH,PSDIVOUT,PSDCNT,PSDIVSTR
 S $P(PDASH,"-",131)=""
 S $P(PAD," ",80)=""
 S PSJLNCNT=0
 ;  Don't increment page count when called from Report Header
 I $G(PSADDPG) S PSJPGCNT=$G(PSJPGCNT)+1
 S PSDIVSTR=$G(PSJINP("PSJDIV"))
 I PSDIVSTR'="ALL" S PSDIVSTR="",PSJDIV=0,PSDCNT=0 F PSDCNT=0:1 S PSJDIV=$O(PSJINP("PSJDIV",PSJDIV)) Q:'PSJDIV  D
 .S PSDIVOUT=$P($G(^DG(40.8,+PSJDIV,0)),"^")
 .S PSDIVSTR=$S(PSDCNT:PSDIVSTR_","_PSDIVOUT,1:PSDIVOUT)
 S LINE="Run Date: "_$P($TR($$FMTE^XLFDT($$NOW^XLFDT,2),"@"," "),":",1,2)_$E(PAD,1,25)_"PADE Transaction Report Summary"_$E(PAD,1,30)_"Page "_PSJPGCNT_" of ^",PSJLNCNT=PSJLNCNT+1
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=LINE,PSJLNCNT=PSJLNCNT+1
 S LINE="Run By: "_$P($G(^VA(200,+$G(DUZ),0)),"^")_$E(PAD,1,20)_"Division: "_PSDIVSTR
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=LINE,PSJLNCNT=PSJLNCNT+1
 I $G(PSADDPG)  S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=PDASH,PSJLNCNT=PSJLNCNT+1
 Q
EXIT ; Clean up.
 N PSJOB
 K ^TMP($J,"PSJPDRTR"),^TMP($J,"TSCREEN")
 F PSJOB=$J,+$G(ZTSK) K ^TMP(PSJOB,"PSJPAT")
 K ZTSK
 Q
 ;
POCKDRG(PSJPSYS,PSJCAB,DRUG,DRWPCK) ; Get Drawer.Pocket location of DRUG in PSJCAB cabinet
 N CABIEN,DRGIEN,DRWIEN,DRWNAM,PCKIEN,PCKNAM,ND,LOCNAM,I
 Q:'$G(PSJPSYS)!'$G(PSJCAB)!'$G(PSJCAB)
 S CABIEN=$$FIND1^DIC(58.6011,","_PSJPSYS_",","MXQ",+$G(PSJCAB),,,"ERR")
 S DRWIEN=0 F  S DRWIEN=$O(^PS(58.601,PSJPSYS,"DEVICE",CABIEN,"DRAWER",DRWIEN)) Q:'DRWIEN  S DRWNAM=$P(^(DRWIEN,0),"^") D
 .S PCKIEN=0 F  S PCKIEN=$O(^PS(58.601,PSJPSYS,"DEVICE",CABIEN,"DRAWER",DRWIEN,"SUB",PCKIEN)) Q:'PCKIEN  S ND=^(PCKIEN,0) I $P(ND,"^",5)=DRUG D
 ..S PCKNAM=DRWNAM_"_"_$P(ND,"^",3)
 ..F I=1:1:$L(PCKNAM,"_") S:$P(PCKNAM,"_",I)'="~~" LOCNAM=$G(LOCNAM)_$P(PCKNAM,"_",I)_"_"
 ..S:$E(LOCNAM,$L(LOCNAM))="_" LOCNAM=$E(LOCNAM,1,$L(LOCNAM)-1)
 ..S DRWPCK(DRUG,LOCNAM)=$P(ND,"^",2)
 Q
 ;
PGTOT() ; Return calculated number of pages for this report
 N PGTOT S PGTOT=$O(^TMP($J,"PSJPDRTR",999999),-1)
 Q PGTOT
 ;
CSCHED(PSJINP) ; Return string of CS Federal Schedules from array PSJINP("PSJCSUB",SCHEDULE)
 K CSCHED N PSJTMP
 S CSCHED=$G(PSJINP("PSJCSUB")) I '(CSCHED="N") S CSCHED="CS (" D
 .S PSJTMP="" F  S PSJTMP=$O(PSJINP("PSJCSUB",PSJTMP)) Q:PSJTMP=""  S CSCHED=CSCHED_PSJTMP_","
 .I $E(CSCHED,$L(CSCHED))="," S CSCHED=$E(CSCHED,1,$L(CSCHED)-1)_")"
 Q CSCHED
 ;
CABSTR(PSJINP) ; Return string of PADE cabinets from array PSJINP("PADEV",CABINET)
 K CABSTR N PSJTMP,PSJII
 I $G(PSJINP("PADEV"))="ALL" Q "ALL"
 S PSJTMP="" F PSJII=0:1 S PSJTMP=$O(PSJINP("PADEV",PSJTMP)) Q:PSJTMP=""  D
 .S CABSTR=$S(PSJII:CABSTR_",",1:"")_PSJTMP
 Q CABSTR
 ;
DRGSTR(PSJINP) ; Return string of PADE drugs selected by user from PSJINP("PSDRG",DRUG IEN)
 N PADEDRG
 I $G(PSJINP("PSDRG"))="ALL" Q "ALL"
 S PADEDRG="",PSJTMP="" F PSJII=0:1 S PSJTMP=$O(PSJINP("PSDRG",PSJTMP)) Q:PSJTMP=""  D
 .I $G(PSJTMP),$D(^PSDRUG(+PSJTMP)) S PADEDRG=$S(PSJII:(PADEDRG_","),1:"")_$P($G(^PSDRUG(+PSJTMP,0)),"^") Q
 .I $E(PSJTMP)="*" S PADEDRG=$S(PSJII:(PADEDRG_","),1:"")_PSJTMP
 S:$E(PADEDRG,$L(PADEDRG)) PADEDRG=$E(PADEDRG,1,$L(PADEDRG)=1)
 Q PADEDRG
 ;
PTSTR(PSJINP) ; Return string of patients selected by user from PSJINP("PSJPAT",DFN)
 N PSJTMP,PATSTR,PSJII,PSJDONE
 S PATSTR=""
 I $G(^TMP($J,"PSJPAT"))="ALL"!($G(^TMP($J,"PSJPAT"))="NONE") Q $G(^TMP($J,"PSJPAT"))
 S PSJTMP="" F PSJII=0:1 S PSJTMP=$O(^TMP($J,"PSJPAT",PSJTMP)) Q:PSJTMP=""!$G(PSJDONE)  D
 .I $L($G(PATSTR))+$L(^TMP($J,"PSJPAT",PSJTMP))>250 S PATSTR=PATSTR_">> more..." S PSJDONE=1 Q
 .S PATSTR=$S(PSJII:(PATSTR_","),1:"")_^TMP($J,"PSJPAT",PSJTMP)
 Q PATSTR
 ;
USRSTR(PSJINP) ; Return string of Users selected by user from PSJINP("PSJUSER")
 N PSJTMP,USRSTR,PSJII,PSJDONE
 I $G(PSJINP("PSJUSER"))="ALL" Q PSJINP("PSJUSER")
 S PSJTMP="" F PSJII=0:1 S PSJTMP=$O(PSJINP("PSJUSER",PSJTMP)) Q:PSJTMP=""!$G(PSJDONE)  D
 .I $L($G(USRSTR))+PSJINP("PSJUSER",PSJTMP)>250 S USRSTR=USRSTR_">> more..." S PSJDONE=1 Q
 .S USRSTR=$S(PSJII:(USRSTR_","),1:"")_PSJINP("PSJUSER",PSJTMP)_" ("_PSJTMP_")"
 Q USRSTR
 ;
TSCREEN(PSJY,PSJINP) ; Screen PADE TRANSACTION file (#58.6) using user input criteria
 ;
 N PSJOK,PSJTDT,PSJPSYSE,PSJDIV,PSJBDT,PSJEDT,PSJCAB,PSJCSUB,PSJDRG,PSJSUM,PSJUSER,PSJTCAB,PSJDELM,PSJTPAT,PSJTADRG,PSJTADNM,PSJXPTNM,PSJOVQ
 N PSJTDT,PSJTCAB,PSJTDRUG,PSJTSUB,PSJPTYP,PSJPAT,PSJTNOD0,PSJTORD,PSJOVR,PSJTRANS,PSJTTRAN,PSJTUSR,PSJTNOD1,PSJPTFLG,PSJOB,PSJTNOD3,PSJTSYS
 S PSJOK=1
 S PSJTNOD0=$G(^PS(58.6,+PSJY,0))
 S PSJTNOD1=$G(^PS(58.6,+PSJY,1))
 S PSJTNOD3=$G(^PS(58.6,+PSJY,3))
 S PSJPSYSE=$G(PSJINP("PSJPSYSE"))
 S PSJTSYS=$P(PSJTNOD1,"^",3)
 I (PSJPSYSE'=""),(PSJTSYS'="") Q:(PSJPSYSE'=PSJTSYS) 0
 S PSJDIV=$G(PSJINP("PSJDIV"))
 S PSJBDT=$G(PSJINP("PSJBDT"))
 S PSJEDT=$G(PSJINP("PSJEDT"))
 M PSJCAB=PSJINP("PADEV")
 M PSJCSUB=PSJINP("PSJCSUB")
 M PSJDRG=PSJINP("PSDRG")
 S PSJSUM=$G(PSJINP("PSJUM"))
 M PSJUSER=PSJINP("PSJUSER")
 M PSJTRANS=PSJINP("PSJTRANS")
 M PSJPAT=PSJINP("PSJPAT")
 D CNVTYP^PSJPDRIP(.PSJTRANS,.PSJPTYP)
 S PSJDELM=$G(PSJINP("PSJDELM"))
 S PSJOVR=$G(PSJINP("PSJOVR"))
 ;  Transaction Date
 S PSJTDT=$P(PSJTNOD0,"^")
 I PSJBDT>PSJTDT!(PSJEDT<PSJTDT) Q 0
 ;  PADE Device (Cabinet)
 S PSJTCAB=$P(PSJTNOD0,"^",2) Q:PSJTCAB="" 0
 I '$D(PSJCAB(PSJTCAB)) Q 0
 ;  Drug Item
 S PSJTDRUG=$P(PSJTNOD0,"^",3)
 ; Alternate Drug ID and Name
 S PSJTADRG=$P(PSJTNOD1,"^",7),PSJTADNM=$P(PSJTNOD1,"^",6)
 I '($G(PSJDRG)="ALL") Q:PSJTDRUG=""&(PSJTADRG="") 0
 I '($G(PSJDRG)="ALL") I '$D(PSJDRG(+PSJTDRUG))&'$D(PSJDRG("*"_PSJTADNM)) Q 0
 ;  Controlled Substance Schedule
 S PSJTSUB=$$GETCLASS^PSJPDRIN(PSJTDRUG)
 I 'PSJTDRUG&$L($G(PSJTADRG)) S PSJTSUB=0
 Q:PSJTSUB="" 0
 I '$D(PSJCSUB(PSJTSUB)) Q 0
 ;  Transaction Type
 S PSJTTRAN=$P(PSJTNOD0,"^",5) Q:PSJTTRAN="" 0
 I '$D(PSJPTYP(PSJTTRAN)) Q 0
 ;  Patient
 S PSJTPAT=$P(PSJTNOD0,"^",15) S PSJTPAT=$S(PSJTPAT="":+PSJTPAT,1:PSJTPAT)
 I 'PSJTPAT S PSJTPAT=$P(PSJTNOD3,"^",7) S PSJTPAT=$S(PSJTPAT="":+PSJTPAT,1:PSJTPAT)
 S PSJXPTNM=$P(PSJTNOD3,"^",4) I 'PSJTPAT&(PSJXPTNM]"") S PSJTPAT="*"
 S PSJPTFLG=$$PTTRFLG^PSJPDRU1(.PSJINP)
 ;  If only "NO PATIENT" selected, quit if patient in transaction
 S PSJOB=$S($G(PSJINP("PSJTSK")):PSJINP("PSJTSK"),1:$J)
 I PSJPTFLG=2,'$D(^TMP(PSJOB,"PSJPAT",PSJTPAT)) Q 0
 ;  If not "NO PATIENT", and not "ALL" patients, 
 I 'PSJPTFLG,(PSJTPAT'=""),(PSJTPAT'=0) Q 0
 ;  User
 S PSJTUSR=$P($G(^PS(58.6,+PSJY,5)),"^") Q:PSJTUSR="" 0
 I ($G(PSJUSER)'="ALL")&($D(PSJUSER)>1)&'$D(PSJUSER(PSJTUSR)) Q 0
 ;  Overrides
 S PSJTORD=$P($G(^PS(58.6,+PSJY,1)),"^")
 I PSJOVR D  Q:$G(PSJOVQ) 0
 .I '$$PTRNSTYP^PSJPAD7I(PSJTTRAN) S PSJOVQ=1 Q
 .I (PSJTORD'="")&(PSJTORD'="OVERRIDE") S PSJOVQ=1 Q
 Q 1
 ;
SETCOLS(PSJINP,COL) ; Report column widths
 S COL(1)=0,COL(2)=15,COL(3)=26,COL(4)=30,COL(5)=38,COL(6)=46,COL(7)=53,COL(8)=84,COL(9)=108
 Q
 ;
SECTHD1() ; Sub-header line 1
 N STRING
 S STRING="Transaction^Trans^^  Beg^^  End^^Transaction^Witnessed"
 Q STRING
 ;
SECTHD2() ; Sub-header line 2
 N STRING
 S STRING="Date/Time^Type^O-R^  Bal^  Qty^  Bal^Patient^By^By"
 Q STRING
 ;
CONTRAN(PSLNHSTR,PSJPGCNT,PSJLNCNT,PSJINP) ; Print "Continued" message when listing spans multiple pages
 ; Don't output "Cont" text if delimited output
 Q:($G(PSJINP("PSJDELM"))="D")
 I PSJLNCNT>($G(PSJIOSL)-6) D PHEAD(.PSJINP,.PSJLNCNT,.PSJPGCNT,.PSJPGTOT,1)
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="",PSJLNCNT=PSJLNCNT+1
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=PSLNHSTR,PSJLNCNT=PSJLNCNT+1
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)="",PSJLNCNT=PSJLNCNT+1
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=$$SECTHD1^PSJPDRTP(),PSJLNCNT=PSJLNCNT+1
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=$$SECTHD2^PSJPDRTP(),PSJLNCNT=PSJLNCNT+1
 S ^TMP($J,"PSJPDRTR",PSJPGCNT,PSJLNCNT)=PSJDASH,PSJLNCNT=PSJLNCNT+1
 Q