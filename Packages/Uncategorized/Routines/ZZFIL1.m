ZZFIL1 ;
LKUP ;
 R "[E]xtended or [C]ondensed Print? ",ZZMODE:10 G:'$T LKUP G:ZZMODE'="E"&(ZZMODE'="C") LKUP
 S DIC="^DIZ(500002,",DIC(0)="AEQMZ" D ^DIC G:Y'>-1 LKUP S N=+Y
 I '$D(^DIZ(500007,"AB",N)) W !,"NO DOCUMENTS WITH THIS KEYWORD ON FILE!" G EXIT
 S %ZIS="FQM" D ^%ZIS Q:IO=""
SETUP ;
 S ZZLNCNT=0,$P(ZZLINE,"=",IOM-3)="="
 S ZZSCLN=IOSL-9
 S (N1,N2,N3,ZZKSTR)=""
 S U="^"
FOLDER ;
 I IO(0)'=IO O IO U IO
 F I1=0:0 S N1=$O(^DIZ(500007,"AB",N,N1)) Q:N1=""  W !,ZZLINE,!,"FOLDER: ",^DIZ(500007,N1,0),!,ZZLINE,! S ZZLNCNT=ZZLNCNT+5 D DOCS
 K ZZLINE
 I IO(0)'=IO X ^%ZIS("C")
 Q
DOCS ;
 F I2=0:0 S N2=$O(^DIZ(500007,"AB",N,N1,N2)) Q:N2=""  S ZZSTR=^DIZ(500007,N1,1,N2,0) D PRTDOC
 Q
PRTDOC ;
 S Y=$P(ZZSTR,U,3) X ^DD("DD")
 W !,"DOC. I.D. : ",$P(ZZSTR,U,1),?IOM\2,"FILED ON: ",Y
 W !,?IOM\2,"FILED BY: ",$P(^DIC(3,$P(ZZSTR,U,2),0),U,1) S ZZLNCNT=ZZLNCNT+2
 I ZZMODE["E" S N4=0 F N3=1:1:3 S N4=$O(^DIZ(500007,N1,1,N2,1,N4)) Q:N4'?.N  I $D(^(0)) W !,?3,"KEYWORD: ",^DIZ(500002,(^DIZ(500007,N1,1,N2,1,N4,0)),0) S ZZLNCNT=ZZLNCNT+1
 I ZZMODE["C" F N3=1:1:3 I $D(^DIZ(500007,N1,1,N2,1,N3,0)) S ZZKSTR=ZZKSTR_^DIZ(500002,^DIZ(500007,N1,1,N2,1,N3,0),0)_$S(N3=3:"",1:", ")
 I ZZMODE["C" W !,?3,"KEYWORDS: ",ZZKSTR S ZZLNCNT=ZZLNCNT+1 S ZZKSTR=""
 W !!
 S ZZLNCNT=ZZLNCNT+2
 I ZZLNCNT>ZZSCLN D NEWPG
 Q
NEWPG ;
 S ZZNXT=$O(^DIZ(500007,"AB",N,N1,N2))
 I $E(IOST)="C" R "HIT RETURN TO CONTINUE, '^' TO EXIT",X:60 Q:X["^"
 I ZZNXT'="" W #!,"*** FOLDER: ",^DIZ(500007,N1,0)," ***",!! S ZZLNCNT=5 Q  
 I $O(^DIZ(500007,"AB",N,N1))'="" W #,"SWITCHING NEWPG AT NEW FOLDER"
 Q
EXIT ;
 Q
