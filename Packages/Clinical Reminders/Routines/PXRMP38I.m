PXRMP38I ;SLC/PKR - Inits for PXRM*2.0*38. ;01/27/2014
 ;;2.0;CLINICAL REMINDERS;**38**;Feb 04, 2005;Build 207
 ;==========================================
PRE ;Pre-init
 ;Disable options and protocols
 D OPTION^PXRMUTIL("DISABLE")
 D PROTOCOL^PXRMUTIL("DISABLE")
 D DELEXE^PXRMEXSI("EXARRAY","PXRMP38E")
 Q
 ;
 ;==========================================
POST ;Post-init
 ;Enable options and protocols
 D OPTION^PXRMUTIL("ENABLE")
 D PROTOCOL^PXRMUTIL("ENABLE")
 D SETPVER^PXRMUTIL("2.0P38")
 ;Install Exchange File entries.
 D SMEXINS^PXRMEXSI("EXARRAY","PXRMP38E")
 D SENDIM^PXRMP38I
 Q
 ;
 ;==========================================
SENDIM ;Send install message.
 N FROM,NODE,PARAM,SYSTEM,SUBJECT,TO,VALUE
 S NODE="PXRM*2.0*38"
 K ^TMP(NODE,$J)
 ;DBIA #1131 for ^XMB("NETNAME")
 S FROM="PXRM*2.0*38 Install@"_^XMB("NETNAME")
 ;DBIA #2541
 S SYSTEM=$$KSP^XUPARAM("WHERE")
 I $$PROD^XUPROD(1) S TO("G.CLINICAL REMINDERS SUPPORT@DOMAIN.EXT")=""
 E  D
 . N MGIEN,MGROUP
 . S MGIEN=$G(^PXRM(800,1,"MGFE"))
 . S MGROUP=$S(MGIEN'="":"G."_$$GET1^DIQ(3.8,MGIEN,.01),1:DUZ)
 . S TO(MGROUP)=""
 S SUBJECT="Install of PXRM*2.0*38"
 S ^TMP(NODE,$J,1,0)="PXRM*2.0*38 has been installed."
 S ^TMP(NODE,$J,2,0)="System is "_SYSTEM
 D SEND^PXRMMSG(NODE,SUBJECT,.TO,FROM)
 Q
 ;
