XMXADDR4 ;ISC-SF/GMB-XMXADDRG (cont.) ;04/17/2002  13:50
 ;;8.0;MailMan;;Jun 28, 2002
DISTR(XMDUZ,XMG,XMSTRIKE,XMPREFIX,XMLATER) ;
 ; XMGN     Distribution group name
 N XMGM,XMGN
 S XMGM=""
 F  S XMGM=$O(^XMB(3.8,XMG,7,"B",XMGM)) Q:'XMGM  D  I XMLATER,'$G(XMIA) Q
 . I '$D(^XMB(3.816,XMGM)) D DELETE1(XMG,7,XMGM) Q
 . S XMGN=$P(^XMB(3.816,XMGM,0),U,1) Q:XMGN=""
 . I ".S.s.D.d.H.h.G.g."'[("."_$E(XMGN,1,2)) S XMGN="G."_XMGN
 . W:$G(XMIA) !,$$EZBLD^DIALOG(39080),XMGN ;Distribution List:
 . D:'XMLATER EXPDISTR(XMDUZ,XMG,XMGM,XMGN,XMSTRIKE,XMPREFIX,XMLATER)
 Q
EXPDISTR(XMDUZ,XMG,XMGM,XMGN,XMSTRIKE,XMPREFIX,XMLATER) ;
 N XMI,XMDOMAIN
 ;S:".G.g."'[("."_$E(XMGM,1,2)) XMLATER=""  ; XMLATER not appropriate for Servers or Devices.
 S XMI=0
 F  S XMI=$O(^XMB(3.816,XMGM,1,"B",XMI)) Q:'XMI  D
 . Q:XMI=^XMB("NUM")
 . S XMDOMAIN=$P($G(^DIC(4.2,XMI,0)),U,1) Q:XMDOMAIN=""
 . N XMERROR,XMIA,XMVIA
 . D DNS^XMXADDRD(XMDUZ,XMDOMAIN,.XMVIA)
 . I $D(XMERROR) S ^TMP("XM",$J,"GRPERR",XMG,"D",XMGN_"@"_XMDOMAIN)=$$GETERR Q
 . S XMGMBRS=1
 . D SETEXP^XMXADDR(XMGN_"@"_XMDOMAIN,XMVIA,XMSTRIKE,XMPREFIX,XMLATER)
 Q
FAXGROUP(XMDUZ,XMG,XMSTRIKE,XMPREFIX,XMLATER) ;
 N XMGM,XMI
 S XMGM=""
 F  S XMGM=$O(^XMB(3.8,XMG,9,"B",XMGM)) Q:XMGM=""  D  I XMLATER,'$G(XMIA) Q
 . S XMGN=$P($G(^AKF("FAXG",XMGM,0)),U)
 . I XMGN="" D DELETE1(XMG,9,XMGM) Q
 . W:$G(XMIA) !,$$EZBLD^DIALOG(39081),XMGN ;Fax Group:
 . S XMI=""
 . F  S XMI=$O(^AKF("FAXG",XMGM,2,"B",XMI)) Q:XMI=""  D FAX(XMDUZ,XMI,XMSTRIKE,XMPREFIX,XMLATER)
 Q
FAX(XMDUZ,XMG,XMSTRIKE,XMPREFIX,XMLATER) ;
 N XMGN
 S XMGN=$P($G(^AKF("FAXR",XMG,0)),U)
 Q:XMGN=""
 W:$G(XMIA) !,$$EZBLD^DIALOG(39082),XMGN ;Fax Recipient:
 ;D SETEXP^XMXADDR("F."_XMGN,XMG,XMSTRIKE,XMPREFIX,"")  ; XMLATER not appropriate
 D:'XMLATER SETEXP^XMXADDR("F."_XMGN,XMG,XMSTRIKE,XMPREFIX,XMLATER)
 S XMGMBRS=1
 Q
FAXINDIV(XMDUZ,XMG,XMSTRIKE,XMPREFIX,XMLATER) ;
 ; XMGM     Group member
 N XMGM,XMCNT
 S XMGM="",XMCNT=0
 F  S XMGM=$O(^XMB(3.8,XMG,8,"B",XMGM)) Q:XMGM=""  D  I XMLATER,'$G(XMIA) Q
 . I '$D(^AKF("FAXR",XMGM)) D DELETE1(XMG,8,XMGM) Q
 . D FAX(XMDUZ,XMGM,XMSTRIKE,XMPREFIX,XMLATER)
 Q
DELETE1(XMGIEN,XMNODE,XMGM) ;
 N DIK,DA
 L +^XMB(3.8,XMGIEN,XMNODE):0 E  Q
 S DA=$O(^XMB(3.8,XMG,XMNODE,"B",XMGM,0))
 S DA(1)=XMGIEN
 S DIK="^XMB(3.8,"_DA(1)_","_XMNODE_","
 D ^DIK
 L -^XMB(3.8,XMGIEN,XMNODE)
 Q
DELETE2(XMGIEN,XMNODE,DA) ;
 N DIK
 L +^XMB(3.8,XMGIEN,XMNODE):0 E  Q
 S DA(1)=XMGIEN
 S DIK="^XMB(3.8,"_DA(1)_","_XMNODE_","
 D ^DIK
 L -^XMB(3.8,XMGIEN,XMNODE)
 Q
GRPERR(XMDUZ,XMG,XMGN) ; Send a bulletin about errors in groups.
 N XMGIEN,XMPARM,XMINSTR
 S XMINSTR("FROM")=.5
 S XMPARM(1)=XMGN
 S XMGIEN=0
 F  S XMGIEN=$O(^TMP("XM",$J,"GRPERR",XMGIEN)) Q:'XMGIEN  D
 . N XMTXT,XMI,XMTO
 . S XMI=0
 . I XMGIEN'=XMG D
 . . N XMPARM S XMPARM(1)=$P($G(^XMB(3.8,XMGIEN,0)),U,1),XMPARM(2)=XMGIEN
 . . S XMI=XMI+1,XMTXT(XMI)=""
 . . S XMI=XMI+1,XMTXT(XMI)=$$EZBLD^DIALOG(39083,.XMPARM) ;Problems in member group: |1| (IEN=|2|)
 . I $D(^TMP("XM",$J,"GRPERR",XMGIEN,"L")) D GRPTXT(XMGIEN,"L",39084,.XMTXT,.XMI) ;Local Member:
 . I $D(^TMP("XM",$J,"GRPERR",XMGIEN,"R")) D GRPTXT(XMGIEN,"R",39085,.XMTXT,.XMI) ;Remote Member:
 . I $D(^TMP("XM",$J,"GRPERR",XMGIEN,"D")) D GRPTXT(XMGIEN,"D",39086,.XMTXT,.XMI) ;Distribution List Domain:
 . I $D(^TMP("XM",$J,"GRPERR",XMGIEN,"C")) D GRPTXT(XMGIEN,"C",39087,.XMTXT,.XMI) ;Circular Group Reference:
 . S XMTO(XMDUZ)=""  ; Person sending the message
 . D GRPADDR(XMG,.XMTO)
 . I XMG'=XMGIEN D GRPADDR(XMGIEN,.XMTO)
 . D TASKBULL^XMXBULL(XMDUZ,"XM GROUP ERROR",.XMPARM,"XMTXT",.XMTO,.XMINSTR)
 Q
GRPTXT(XMGIEN,XMTYPE,XMPROB,XMTXT,XMI) ;
 N XMNAME
 S XMNAME=""
 F  S XMNAME=$O(^TMP("XM",$J,"GRPERR",XMGIEN,XMTYPE,XMNAME)) Q:XMNAME=""  D
 . S XMI=XMI+1,XMTXT(XMI)=""
 . S XMI=XMI+1,XMTXT(XMI)=$$EZBLD^DIALOG(XMPROB)_XMNAME
 . S XMI=XMI+1,XMTXT(XMI)=$$EZBLD^DIALOG(39088)_^TMP("XM",$J,"GRPERR",XMGIEN,XMTYPE,XMNAME) ;Error:
 Q
GRPADDR(XMGIEN,XMTO) ;
 N I
 S I=$P($G(^XMB(3.8,XMGIEN,3)),U,1) S:I XMTO(I)="" ; Organizer
 S I=$P($G(^XMB(3.8,XMGIEN,0)),U,7) S:I XMTO(I)="" ; Coordinator
 Q:'$D(^XMB(3.8,XMGIEN,4,"B"))
 S I=0
 F  S I=$O(^XMB(3.8,XMGIEN,4,"B",I)) Q:'I  D
 . S XMTO(I)="" ; Authorized sender
 Q
SETERR(XMIA,XMFORMAT,XMDIALOG,XMP1,XMP2,XMP3) ;
 S XMERROR=XMDIALOG
 I $D(XMP1) S XMERROR(1)=XMP1
 I $D(XMP2) S XMERROR(2)=XMP2
 I $D(XMP3) S XMERROR(3)=XMP3
 I XMIA D WRIERR(XMFORMAT)
 Q
WRIERR(XMFORMAT) ;
 I XMFORMAT="" W $$GETERR Q
 I XMFORMAT'="P" D EN^DDIOL($$GETERR,"",XMFORMAT) Q
 N XMTEXT
 D BLD^DIALOG(XMERROR,.XMERROR,"","XMTEXT","F")
 D MSG^DIALOG("WE","","","","XMTEXT")
 Q
GETERR() ;
 Q $$EZBLD^DIALOG(XMERROR,.XMERROR)
