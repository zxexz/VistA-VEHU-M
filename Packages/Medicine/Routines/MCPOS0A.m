MCPOS0A ;HIRMFO/RMP,DAD-TERM:SUBSPECIALTY ALLIGNER ;5/1/96  13:29
 ;;2.3;Medicine;;09/13/1996
 ;
 D STUFF("MCPTF",694.8)
 Q
 ;
 N COUNT,TEMP,REC,PROC,CODE
 S COUNT=0,TEMP=""
 F  S TEMP=$O(^MCAR(694.8,"B",TEMP)) Q:TEMP=""  D
 . S REC=$O(^MCAR(694.8,"B",TEMP,""))
 . S COUNT=COUNT+1
 . S CODE=$S($D(^MCAR(694.8,REC,1)):$$CODE(REC),1:"")
 . S PROC=$S($D(^MCAR(694.8,REC,2)):$P(^MCAR(697.2,^(2),0),U),1:"")
 . W !,";;",$P(^MCAR(694.8,REC,0),U)_"^"_CODE_"^"_PROC
 . Q
 Q
CODE(REC) ;
 N CNT,ARRAY,TEMP,SUBENTRY
 S CNT=0,(ARRAY)=""
 F  S CNT=$O(^MCAR(694.8,REC,1,CNT)) Q:CNT'?1N.N  D
 . S TEMP=^MCAR(694.8,REC,1,CNT,0),SUBENTRY=""
 . S SUBENTRY=$TR($P(TEMP,U,1,3),U,"~")
 . S:$L(ARRAY)>0 ARRAY=ARRAY_","
 . S ARRAY=ARRAY_SUBENTRY
 . Q
 Q ARRAY
 ;
STUFF(ROUTINE,TFILE) ;routine is set to "MCPTF" and TFILE is
 ;set to 694.8
 N TEMP,COUNT,HOLD,VALUE,LOOP,MCDATA
 S MCDATA(1)=""
 S MCDATA(2)="Update the pointers from the Procedure Term file (#694.8)"
 S MCDATA(3)="to the Procedure/Subspecialty file (#697.2)."
 D MES^XPDUTL(.MCDATA)
 ;
 F LOOP=1:1 S HOLD=$P($T(DATA+LOOP^@(ROUTINE)),";;",2) Q:HOLD=""  D
 . S (DIC,DLAYGO)=TFILE,DIC(0)="L"
 . S (VALUE,X)=$P(HOLD,U)
 . D ^DIC I Y=-1 K DIC,DA Q
 . S DA=+Y
 . S MCPRO=$P(HOLD,U,3),DIE=DIC K DIC
 . S DR=".01///^S X=VALUE;9///^S X=MCPRO"
 . D ^DIE
 . D SCODE($P(HOLD,U,2),DA,TFILE)
 . Q
 Q
 ;
SCODE(STEMP,SDA,FILE) ;
 N ENTRY,CODE,TYPE,DATE,LOOP
 F LOOP=1:1 S ENTRY=$P(STEMP,",",LOOP) Q:ENTRY=""  D
 . K DD,DIC,DINUM,DO
 . S DA(1)=SDA,DIC="^MCAR("_FILE_","_DA(1)_",1,",DIC(0)="L"
 . S DIC("P")=$$GET1^DID(FILE,3,"","SPECIFIER"),DLAYGO=FILE
 . S (X,CODE)=$P(ENTRY,"~"),D="B"
DIC . D IX^DIC I Y=-1 D FILE^DICN
 . I Y=-1 K DIC,DA Q
 . S DIE=DIC,DA=+Y K DIC
 . S TYPE=$P(ENTRY,"~",2)
 . S DATE=$P(ENTRY,"~",3)
 . S DR=".01////^S X=CODE;.02///^S X=TYPE;.03///^S X=DATE"
 . D ^DIE
 . K DIE,DR,DA,Y
 . Q
 Q
