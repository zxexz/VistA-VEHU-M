MCNP2CHK ;HIRMFO/DAD-UNIQUE PROVIDER NAME PRINT ;4/18/96  08:33
 ;;2.3;Medicine;;09/13/1996
 ;
 K %ZIS,IOP S %ZIS="QM" W ! D ^%ZIS G:POP EXIT
 I $D(IO("Q")) D  G EXIT
 . S ZTRTN="TASK^MCNP2CHK"
 . S ZTDESC="Unique New Person Names in Medicine Provider Fields"
 . D ^%ZTLOAD S ZTSK=+$G(ZTSK)
 . I ZTSK>0 W !!,"Task queued, task number ",ZTSK,"."
 . E  W !!,"Task not queued."
 . Q
TASK ;
 D XIT
 F MCLINE=1:1 S MCDATA=$P($T(FILEFLD+MCLINE),";",3) Q:MCDATA=""  D
 . K MCFLD
 . S MCFILE=$P(MCDATA,U),MCFLD(0)=$P(MCDATA,U,2)
 . S ^TMP("MC",$J,MCFILE)=$$GET1^DID(MCFILE,"","","NAME")
 . F MCPIECE=1:1:$L(MCFLD(0),",") D
 .. S MCFLD=$P(MCFLD(0),",",MCPIECE) Q:MCFLD'>0
 .. K MCDD,MCER
 .. D FIELD^DID(MCFILE,MCFLD,"","LABEL;GLOBAL SUBSCRIPT LOCATION","MCDD","MCERR")
 .. S MCFLD(MCFLD)=MCDD("GLOBAL SUBSCRIPT LOCATION")
 .. S ^TMP("MC",$J,MCFILE,MCFLD)=MCDD("LABEL")
 .. Q
 . D GETDATA
 . Q
PRINT ;
 K MCUNDL S MCPAGE=1,MCEXIT=0,$P(MCUNDL,"=",81)=""
 S MCTODAY=$$FMTE^XLFDT($$DT^XLFDT)
 U IO D HEADER
 S MCFILE=0
 F  S MCFILE=$O(^TMP("MC",$J,MCFILE)) Q:MCFILE'>0!MCEXIT  D
 . W !!,^TMP("MC",$J,MCFILE)," file (#",MCFILE,")"
 . S MCFLD=0
 . F  S MCFLD=$O(^TMP("MC",$J,MCFILE,MCFLD)) Q:MCFLD'>0!MCEXIT  D
 .. W !?5,^TMP("MC",$J,MCFILE,MCFLD)," field (#",MCFLD,")"
 .. I $O(^TMP("MC",$J,MCFILE,MCFLD,""))="" D  Q
 ... W !?10,"*** NONE ***"
 ... I $Y>(IOSL-4) D PAUSE,HEADER
 ... Q
 .. S MCPROV=""
 .. F  S MCPROV=$O(^TMP("MC",$J,MCFILE,MCFLD,MCPROV)) Q:MCPROV=""!MCEXIT  D
 ... S MCDATA=^TMP("MC",$J,MCFILE,MCFLD,MCPROV)
 ... W !?10,MCPROV,?50,$J($P(MCDATA,U),6),?65,$S($P(MCDATA,U,2):"YES",1:"NO")
 ... I $Y>(IOSL-4) D PAUSE,HEADER
 ... Q
 .. Q
 . Q
EXIT ;
 D ^%ZISC
XIT K %ZIS,DIR,DIRUT,DIROUT,DTOUT,MC200,MCD0,MCD1,MCDATA,MCDD,MCER,MCEXIT
 K MCFILE,MCFLD,MCLINE,MCNODE,MCPAGE,MCPIECE,MCPROV,MCTODAY,MCUNDL,POP
 K X,Y,ZTDESC,ZTRTN,^TMP("MC",$J)
 Q
GETDATA ;
 S MCD0=0
 F  S MCD0=$O(^MCAR(MCFILE,MCD0)) Q:MCD0'>0  D
 . S MCFLD=0
 . F  S MCFLD=$O(MCFLD(MCFLD)) Q:MCFLD'>0  D
 .. I MCFILE=700,MCFLD=21 D GETMULT Q
 .. S MCNODE=$P(MCFLD(MCFLD),";"),MCPIECE=$P(MCFLD(MCFLD),";",2)
 .. S MC200=$P($G(^MCAR(MCFILE,MCD0,MCNODE)),U,MCPIECE)
 .. D SETTMP(MC200)
 .. Q
 . Q
 Q
GETMULT ;
 S MCD1=0
 F  S MCD1=$O(^MCAR(MCFILE,MCD0,7,MCD1)) Q:MCD1'>0  D
 . S MC200=$P($G(^MCAR(MCFILE,MCD0,7,MCD1,0)),U)
 . D SETTMP(MC200)
 . Q
 Q
SETTMP(MC200) ;
 I MC200="" Q
 S MC200(0)=$P($G(^VA(200,MC200,0)),U) I MC200(0)="" S MC200(0)=MC200
 I $D(^TMP("MC",$J,MCFILE,MCFLD,MC200(0)))[0 D
 . S MCPROV=$D(^XUSEC("PROVIDER",MC200))
 . S ^TMP("MC",$J,MCFILE,MCFLD,MC200(0))=MC200_U_$S(MCPROV[0:0,1:1)
 . Q
 Q
PAUSE ;
 I $E(IOST,1,2)="C-" D
 . N DIR S DIR(0)="E" D ^DIR S MCEXIT=$S(Y'>0:1,1:0)
 . Q
 Q
HEADER ;
 I MCEXIT Q
 W:($E(IOST,1,2)="C-")!(MCPAGE>1) @IOF
 W !?15,"Unique New Person Names in Medicine Provider Fields"
 W ?68,MCTODAY,!?68,"Page: ",MCPAGE S MCPAGE=MCPAGE+1
 W !,"File Name (Number)"
 W !?5,"Field Name (Number)"
 W !?10,"New Person Name",?50,"IEN",?65,"Provider Key",!,MCUNDL
 Q
FILEFLD ;;
 ;;691^39,43
 ;;691.1^62,63,64,65
 ;;691.5^12
 ;;691.6^4,6,10,12,14
 ;;691.7^57,58
 ;;691.8^16,17,19,20
 ;;691.9^24
 ;;692^21
 ;;694^50,51
 ;;698.3^2
 ;;699^6,200,201
 ;;700^10,21,31,34
