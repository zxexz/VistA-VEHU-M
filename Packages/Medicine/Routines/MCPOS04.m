MCPOS04 ;HIRMFO/DAD-CONSULT CONVERSION 699 >>>===> 699.5 ;7/5/96  10:33
 ;;2.3;Medicine;;09/13/1996
 ;
 S MCONSULT=+$O(^MCAR(697.2,"B","CONSULT",0))
 S MCFOUND=$S($P($G(^MCAR(697.2,MCONSULT,0)),U)'="CONSULT":0,1:1)
 ;
 I $D(XPDNM) D  G:'MCFOUND EXIT
 . K MCDATA
 . S MCDATA(1)=""
 . S MCDATA(2)="Moving the Consult data from the Endoscopy/Consult"
 . S MCDATA(3)="file (#699) to the Generalized Procedure/Consult"
 . S MCDATA(4)="file (#699.5)."
 . ;
 . I 'MCFOUND D
 .. S MCDATA(5)=""
 .. S MCDATA(6)="The CONSULT entry was not found in the"
 .. S MCDATA(7)="PROCEDURE/SPECIALTY file (#697.2), data cannot"
 .. S MCDATA(8)="be converted without this entry being present."
 .. Q
 . D MES^XPDUTL(.MCDATA) K MCDATA
 . Q
 E  D  G EXIT
 . W !!,"Moving the Consult data from the Endoscopy/Consult"
 . W !,"file (#699) to the Generalized Procedure/Consult"
 . W !,"file (#699.5)."
 . ;
 . I 'MCFOUND D  Q
 .. W !!,"The CONSULT entry was not found in the"
 .. W !,"PROCEDURE/SPECIALTY file (#697.2), data cannot"
 .. W !,"be converted without this entry being present."
 .. Q
 . ;
 . S ZTRTN="TASK^MCPOS04"
 . S ZTDESC="Medicine Consult Conversion"
 . S ZTSAVE("MCONSULT")=""
 . S ZTIO=""
 . W ! D ^%ZTLOAD
 . W !!,"Conversion",$S($G(ZTSK)'>0:" not ",1:" "),"queued."
 . I $G(ZTSK)>0 W !,"Task # ",ZTSK,"."
 . Q
TASK ;
 S MC699D0=0
 F  S MC699D0=$O(^MCAR(699,"D",MCONSULT,MC699D0)) Q:MC699D0'>0  D MAIN
EXIT ;
 I '$D(XPDNM),$D(ZTQUEUED) S ZTREQ="@"
 Q
MAIN ;
 K MCDATA
 F MCNODE=0,.2,15,"PCC","OR","ES","PROV" D
 . S MCDATA(MCNODE)=$G(^MCAR(699,MC699D0,MCNODE))
 . Q
 I $P(MCDATA(0),U,12)'=MCONSULT Q
 S MCDATE=$P(MCDATA(0),U),MCDFN=$P(MCDATA(0),U,2)
 S MCPRC=$P(MCDATA(0),U,12)
 S (MC6995D0,MCIEN)=0
 F  S MCIEN=$O(^MCAR(699.5,"B",MCDATE,MCIEN)) Q:MCIEN'>0!MC6995D0  D
 . S MC=$G(^MCAR(699.5,MCIEN,0))
 . S MCNEWDFN=$P(MC,U,2),MCNEWPRC=$P(MC,U,6)
 . I MCNEWDFN=MCDFN,MCNEWPRC=MCPRC S MC6995D0=MCIEN
 . Q
 I MC6995D0'>0 D
 . K DD,DIC,DINUM,DO
 . S DIC="^MCAR(699.5,",DIC(0)="L",DLAYGO=699.5
 . S DIC("DR")=".02///`"_MCDFN_";.05////"_MCPRC
 . S X=MCDATE D FILE^DICN S MC6995D0=+Y
 . Q
 ;
 I MC6995D0'>0 Q
 S MCINDCOM=$P(MCDATA(0),U,6),MCSUMMRY=$P(MCDATA(.2),U)
 S MCPRCSUM=$P(MCDATA(.2),U,2),MCCONTYP=$P(MCDATA(15),U,11)
 S MCPROVID=$P(MCDATA(0),U,8)
 I MCPROVID'>0 S MCPROVID=$P(MCDATA("PROV"),U)
 K DA,DIC,DIE,DR S MCDRNUM=1
 S DR="2///1"
 I MCINDCOM]"" S DR(1,699.5,MCDRNUM)="3///^S X=$E(MCINDCOM,1,110)",MCDRNUM=MCDRNUM+1
 I $P($G(^VA(200,+MCPROVID,0)),U)]"",$D(^XUSEC("PROVIDER",+MCPROVID))#2 S DR(1,699.5,MCDRNUM)="6///`"_MCPROVID,MCDRNUM=MCDRNUM+1
 I "^A^N^I^"[(U_MCSUMMRY_U) S DR(1,699.5,MCDRNUM)="601///"_MCSUMMRY,MCDRNUM=MCDRNUM+1
 I MCPRCSUM]"" S DR(1,699.5,MCDRNUM)="600///^S X=$E(MCPRCSUM,1,79)",MCDRNUM=MCDRNUM+1
 I $P($G(^MCAR(699.82,+MCCONTYP,0)),U)]"" S DR(1,699.5,MCDRNUM)="31.5///`"_MCCONTYP,MCDRNUM=MCDRNUM+1
 I $P($G(^AUPNVSIT(+$P(MCDATA("PCC"),U),0)),U)]"" S DR(1,699.5,MCDRNUM)="900////"_+$P(MCDATA("PCC"),U),MCDRNUM=MCDRNUM+1
 S ORIFN=+$P(MCDATA("OR"),U),GMRCO=+$P(MCDATA("OR"),U,2)
 I $P($G(^OR(100,ORIFN,0)),U)]"" S DR(1,699.5,MCDRNUM)="1000////"_ORIFN,MCDRNUM=MCDRNUM+1
 I $P($G(^GMR(123,GMRCO,0)),U)]"" S DR(1,699.5,MCDRNUM)="1001////"_GMRCO,MCDRNUM=MCDRNUM+1
 F MCPIECE=1:1:16 D
 . S MCDATA=$P(MCDATA("ES"),U,MCPIECE) Q:MCDATA=""
 . S MCSLASH="///"
 . I "^1^4^13^"[(U_MCPIECE_U) S MCSLASH=MCSLASH_"`" I $P($G(^VA(200,+MCDATA,0)),U)="" Q
 . I "^2^5^"[(U_MCPIECE_U) D
 .. S MCVALCOD(MCPIECE)=$E(MCDATA,1,40)
 .. S MCSLASH=MCSLASH_"^S X="
 .. S MCDATA="MCVALCOD("_MCPIECE_")"
 .. Q
 . I 7=MCPIECE I "^D^PD^RV^ROV^RNV^S^SRV^SROV^"'[(U_MCDATA_U) Q
 . I 10=MCPIECE I MCDATA<0!(MCDATA>999999999) Q
 . I 11=MCPIECE I MCDATA<0!(MCDATA>99999999999999) Q
 . I 16=MCPIECE I MCDATA<0!(MCDATA>999) Q
 . I 14=MCPIECE S X=MCDATA,%DT="TX" D ^%DT S MCDATA=Y
 . I "^3^6^8^9^14^15^"[(U_MCPIECE_U) Q:MCDATA\1'?7N
 . I 12=MCPIECE I MCDATA'=1 Q
 . S DR(1,699.5,MCDRNUM)=(1499+MCPIECE)_MCSLASH_MCDATA
 . S MCDRNUM=MCDRNUM+1
 . Q
 S DIE="^MCAR(699.5,",DA=MC6995D0 D ^DIE ; ALL FLAT FIELDS
 ;
 D ^MCPOS04A ; MULTIPLES
 Q
