ONCMPH ;Hines OIFO/GWB - Multiple primary stuffing logic ;02/22/11
 ;;2.2;ONCOLOGY;**1**;Jul 31, 2013;Build 8
 ;
NA ;"Not applicable" stuffing for:
 ;MULT TUM RPT AS ONE PRIM (165.5,194)
 ;DATE OF MULTIPLE TUMORS  (165.5,195)
 ;MULTIPLICITY COUNTER     (165.5,196)
 S $P(^ONCO(165.5,DA,24),U,14)=11
 W !,"MULT TUM RPT AS ONE PRIM: NA"
 S $P(^ONCO(165.5,DA,24),U,15)=8888888
 W !,"DATE OF MULTIPLE TUMORS: 88/88/8888"
 S $P(^ONCO(165.5,DA,24),U,16)=88
 W !,"MULTIPLICITY COUNTER: 88"
 S Y=83
 Q
 ;
MTRAOP ;MULT TUM RPT AS ONE PRIM (165.5,194)
 I X=1 D   S Y=83 Q
 .S $P(^ONCO(165.5,DA,24),U,15)="0000000"
 .W !,"DATE OF MULTIPLE TUMORS: 00/00/0000"
 .S $P(^ONCO(165.5,DA,24),U,16)="01"
 .W !,"MULTIPLICITY COUNTER: 01"
 I X=11 D  S Y=83 Q
 .S $P(^ONCO(165.5,DA,24),U,15)=8888888
 .W !,"DATE OF MULTIPLE TUMORS: 88/88/8888"
 .S $P(^ONCO(165.5,DA,24),U,16)=88
 .W !,"MULTIPLICITY COUNTER: 88"
 I X=12 D  S Y=83 Q
 .N DATEDXE,DATEDXI
 .S DATEDXE=$$GET1^DIQ(165.5,DA,3,"E")
 .S DATEDXI=$$GET1^DIQ(165.5,DA,3,"I")
 .S $P(^ONCO(165.5,DA,24),U,15)=DATEDXI
 .W !,"DATE OF MULTIPLE TUMORS: ",DATEDXE
 .S $P(^ONCO(165.5,DA,24),U,16)=99
 .W !,"MULTIPLICITY COUNTER: 99"
 Q
 ;
CLEANUP ;Cleanup
 K DA,X,Y
