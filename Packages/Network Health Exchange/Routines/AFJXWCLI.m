AFJXWCLI ;FJ/CWS;INQUIRE TO NETWORK HEALTH EXCHANGE;11/8/95
 ;;5.1;Network Health Exchange;;Jan 23, 1996
BEGIN K DA,DIC,Y,X,DIC(0) W @IOF S DIC="^AFJ(537000,",DIC(0)="AEMQ" D ^DIC Q:Y<0  S DA=+Y
 D EN^DIQ R !,"Press Return to continue ",X:DTIME
 G BEGIN
 Q
