HLOTRACE ;ALB/CJM - Client Trace ;Apr 03, 2020@14:48
 ;;1.6;HEALTH LEVEL SEVEN;**146,147,153,10001** ;Oct 13, 1995;Build 3
 ; Original code in the public domain by Dept of Veterans Affairs.
 ; Changes **10001** by Sam Habiel (c) 2020.
 ; Changes indicated inline.
 ; Licensed under Apache 2.0.
 ;;
 ;; HLO CLIENT TRACE Tool
 ;; *** For troubleshooting HLO client issues ***
 ;;     Client runs in the foreground and writes trace statements
 ;;     to the screen.
 ;; 
START ;
 N CONF
 I '$G(DUZ) W !,"Your DUZ must be set!" Q
 D OWNSKEY^XUSRB(.CONF,"XUPROG",DUZ)
 I 'CONF(0) D  Q
 . W !!,"   Sorry, you are not authorized to use this tool.",!!
 ; *10001*
 N CACHE,GTM
 S CACHE=^%ZOSF("OS")["OpenM"
 S GTM=^%ZOSF("OS")["GT.M"
 I 'CACHE,'GTM D  Q
 .W !!,"   Sorry, this tool can only be used under Cache or GT.M",!!
 ; *10001*
 N LINK,PORT,QUE,SUB,WORK,HLMSTATE,HLCSTATE,OLD,MAXTRACE,TRACECNT
 S LINK=$$ASKLINK^HLOUSR
 Q:LINK=""
 S PORT=$$ASKPORT(LINK)
 Q:'PORT
 S SUB=LINK_":"_PORT
 S QUE=$$ASKQUE(SUB)
 Q:QUE=""
 ; ZB /INTERRUPT:NORMAL ;disable CTRL-C breaks ; 10001 don't need this
 L +^HLB("QUEUE","OUT",SUB,QUE):20
 ;
 I '$T W !,"That queue is currently being processed. You need to either stop that link,",!,"stop that queue, or totally stop HLO so that this tool can be used." Q
 I '$O(^HLB("QUEUE","OUT",SUB,QUE,0)) W !,"There are no messages pending on that queue!" Q
 S TRACECNT=0
 S MAXTRACE=$$ASKCOUNT
 Q:(MAXTRACE<1)
 S WORK("QUEUE")=QUE,WORK("LINK")=SUB
 D SETBREAKS
 D DOWORK^HLOCLNT(.WORK)
 D:$G(HLCSTATE("CONNECTED")) CLOSE^HLOT(.HLCSTATE)
 ;
 U $PRINCIPAL
 L -^HLB("QUEUE","OUT",SUB,QUE)
 W !,"DONE!"
 ;
 Q
 ;
SBREAK(EP,ACTION) ; *10001*
 I ^%ZOSF("OS")["OpenM" ZB @EP:"N":1:ACTION
 I ^%ZOSF("OS")["GT.M"  ZB @(EP_":"""_$$CONVQQ^DILIBF(ACTION)_"""")
 QUIT
 ;
SETBREAKS ; *10001* refactored to not use ZB but call SBREAK
 ;
 ;set break in $$STOPPED^HLOQUE to circumvent shutdown of the queue
 D SBREAK("ZB0^HLOQUE","S RET=0")
 ;set break in $$IFSHUT^HLOTLNK to circumvent shutdown of the link
 D SBREAK("ZB0^HLOTLNK","S RET=0")
 ;set break at ZB0 in client (start of DOWORK)
 D SBREAK("ZB0^HLOCLNT","D WRITE^HLOTRACE(""Launching the client process..."")")
 ;set break at ZB1 in client ($$CONNECT)
 D SBREAK("ZB1^HLOCLNT1","D WRITE^HLOTRACE(""Trying to connect..."")")
 ;set break at ZB2 in client (end of $$CONNECT)
 D SBREAK("ZB2^HLOCLNT1","D ZB2^HLOTRACE")
 ;set break at ZB3 in client (ERROR TRAP)
 D SBREAK("ZB3^HLOCLNT","D ZB3^HLOTRACE")
 ;set break at ZB4 in client (FOR loop on the outgoing queue)
 D SBREAK("ZB4^HLOCLNT","D ZB4^HLOTRACE")
 ;set break at ZB5 in client (end of DOWORK, with just cleanup left)
 D SBREAK("ZB5^HLOCLNT","D WRITE3^HLOTRACE(""Cleaning up...."")")
 ;set break at ZB6 in client (start of $$TRANSMIT^HLOCLNT1)
 D SBREAK("ZB6^HLOCLNT1","D WRITE^HLOTRACE(""Beginning to transmit message...."")")
 ;set break at ZB7 in client (end of $$TRANSMIT^HLOCLNT1)
 D SBREAK("ZB7^HLOCLNT1","D WRITE^HLOTRACE(""Message transmitted!"")")
 ;set break at ZB8 in client (start of $$READACK^HLOCLNT1)
 ;ZB ZB8^HLOCLNT1:"N":1:"D WRITE^HLOTRACE(""Beginning to read commit acknowledgment...."")"
 D SBREAK("ZB8^HLOCLNT1","D ZB8^HLOTRACE")
 ;set break at ZB9 in client (end of $$READACK^HLOCLNT1)
 ;ZB ZB9^HLOCLNT1:"N":1:"D WRITE^HLOTRACE(""Commit acknowledgment received!"")"
 D SBREAK("ZB9^HLOCLNT1","D ZB9^HLOTRACE")
 ;set break ZB10 in the client(start of $$READHDR^HLOT)
 D SBREAK("ZB10^HLOT","D ZB10^HLOTRACE")
 ;set break ZB11 in the client(end of $$READHDR^HLOT)
 D SBREAK("ZB11^HLOT","D ZB11^HLOTRACE")
 ;set break ZB12 in the client(start of $$READSEG^HLOT)
 D SBREAK("ZB12^HLOT","D ZB12^HLOTRACE")
 ;set break ZB13 in the client(end of $$READSEG^HLOT)
 D SBREAK("ZB13^HLOT","D ZB13^HLOTRACE")
 ;set break ZB14 in the client(start of $$WRITESEG^HLOT)
 D SBREAK("ZB14^HLOT","D ZB14^HLOTRACE")
 ;set break ZB15 in the client(end of $$WRITESEG^HLOT)
 D SBREAK("ZB15^HLOT","D ZB15^HLOTRACE")
 ;set break ZB16 in the client(start of $$WRITEHDR^HLOT)
 D SBREAK("ZB16^HLOT","D ZB16^HLOTRACE")
 ;set break ZB17 in the client(end of $$WRITEHDR^HLOT)
 D SBREAK("ZB17^HLOT","D ZB17^HLOTRACE")
 ;set break ZB18 in the client(start of $$ENDMSG^HLOT)
 D SBREAK("ZB18^HLOT","D ZB18^HLOTRACE")
 ;set break ZB19 in the client(end of $$ENDMSG^HLOT)
 D SBREAK("ZB19^HLOT","D ZB19^HLOTRACE")
 D SBREAK("ZB20^HLOCLNT","D ZB20^HLOTRACE")
 D SBREAK("ZB21^HLOCLNT","D ZB21^HLOTRACE")
 D SBREAK("ZB22^HLOCLNT","D ZB22^HLOTRACE")
 D SBREAK("ZB23^HLOCLNT","D ZB23^HLOTRACE")
 D SBREAK("ZB24^HLOCLNT1","D ZB24^HLOTRACE")
 D SBREAK("ZB25^HLOCLNT","D WRITE^HLOTRACE(""Calling DEQUE..."")")
 D SBREAK("ZB31^HLOTCP","D WRITE^HLOTRACE(""Beginning READ over TCP..."")")
 D SBREAK("ZB32^HLOTCP","D ZB32^HLOTRACE")
 Q
WRITE(MSG) ;
 N OLD
 S OLD=$IO
 U $PRINCIPAL
 W !,?5,"Time: ",$$NOW^XLFDT,"   ",MSG
 U OLD
 Q
WRITE2(MSG,VALUE) ;
 N OLD,I
 S OLD=$IO
 U $PRINCIPAL
 W !,?5,"Time: ",$$NOW^XLFDT,"   ",MSG
 S I=0
 W:$O(VALUE(0)) !
 F  S I=$O(VALUE(I)) Q:'I  W VALUE(I)
 U OLD
 Q
WRITE3(MSG) ;
 N OLD
 S OLD=$IO
 U $PRINCIPAL
 W !,MSG
 U OLD
 Q
 ;
ZB3 ;
 N CON,MSG
 I ^%ZOSF("OS")["OpenM" S CON=($ZA\8192#2) ; *10001*
 I ^%ZOSF("OS")["GT.M"  S CON=$KEY["ESTABLISHED" ; *10001*
 S MSG="Error encountered, $ECODE="_$ECODE
 D WRITE^HLOTRACE(MSG)
 S MSG=$S(CON:"           TCP connection still active",1:"          TCP connection was dropped")
 D WRITE3^HLOTRACE(MSG)
 D ^%ZTER
 Q
ZB4 ;
 N OLD
 S OLD=$IO
 U $PRINCIPAL
 W !!,"Looking for the next message to transmit..."
 I 'MSGIEN W !!,"No more messages pending on that queue!" S SUCCESS=0 Q
 S TRACECNT=$G(TRACECNT)+1
 I MAXTRACE>1 D
 .W !!,"Message IEN=",MSGIEN," next on queue"
 .I TRACECNT>MAXTRACE D
 ..I $$ASKYESNO^HLOUSR2("Do you want to trace another group of message transmissions","YES") S SUCCESS=1,TRACECNT=1
 ..E  S SUCCESS=0
 .E  S SUCCESS=1
 E  D
 .I '$$ASKYESNO^HLOUSR2("Message IEN="_MSGIEN_" next on queue, do you want to trace its transmission","YES") S SUCCESS=0
 U OLD
 Q
 ;
ZB2 ;
 W !,$S('HLCSTATE("CONNECTED"):"Connection Failed!",1:"Connected!")
 Q
ZB8 ;
 D WRITE^HLOTRACE("Beginning to read commit acknowledgment....")
 Q
ZB9 ;
 I $G(SUCCESS) D
 .D WRITE^HLOTRACE("Commit acknowledgment received!")
 E  D
 .D WRITE^HLOTRACE("Read of commit acknowledgment FAILED!")
 Q
ZB10 ;
 D WRITE^HLOTRACE("Getting message header...")
 Q
ZB11 ;
 I $D(HDR) D WRITE2^HLOTRACE("",.HDR)
 D WRITE^HLOTRACE($S(SUCCESS:"Got message header!",1:"**** FAILED TO READ MESSAGE HEADER! *****"))
 Q
ZB12 ;
 D WRITE^HLOTRACE("Getting next segment...")
 Q
ZB13 I $D(SEG) D WRITE2^HLOTRACE("",.SEG)
 D WRITE^HLOTRACE($S(RETURN:"Got next segment!",$G(HLCSTATE("MESSAGE ENDED")):"No more segments!",1:"**** FAILED TO COMPLETE READING NEXT SEGMENT *****"))
 Q
ZB14 ;
 D WRITE2^HLOTRACE("Writing next segment...",.SEG)
 Q
ZB15 D WRITE^HLOTRACE($S(RETURN:"Completed!",1:"**** FAILED TO COMPLETE *****"))
 Q
ZB16 ;
 D WRITE2^HLOTRACE("Writing header segment...",.HDR)
 Q
ZB17 D WRITE^HLOTRACE($S(SUCCESS:"Completed!",1:"**** FAILED TO COMPLETE *****"))
 Q
ZB18 ;
 D WRITE^HLOTRACE("Writing message terminators and flushing buffer...")
 Q
ZB19 D WRITE^HLOTRACE($S(RETURN:"Completed!",1:"**** FAILED TO COMPLETE *****"))
 Q
ZB20 ;
 D WRITE^HLOTRACE("Message on queue was already transmitted, will be deleted from queue...")
 Q
ZB21 ;
 D WRITE^HLOTRACE("MSA segment shows this is not a commmit ack to the message transmitted...")
 Q
ZB22 ;
 D WRITE^HLOTRACE("Commit ack not CA, message status set to error...")
 Q
ZB23 ;
 D WRITE^HLOTRACE("Setting timestamp of sequence queue...")
 Q
ZB24 ;S HLOCSTATE("CONNECTED")=1
 S HLCSTATE("LINK","SHUTDOWN")=0
 Q
ZB32 D:('$G(RETURN)) WRITE^HLOTRACE("**** FAILED ****")
 D:$G(RETURN) WRITE3^HLOTRACE("")
 D:$G(RETURN) WRITE3^HLOTRACE($G(BUF))
 D:$G(RETURN) WRITE3^HLOTRACE("")
 D:$G(RETURN) WRITE^HLOTRACE("READ over TCP completed! #Characters read: "_$L($G(BUF)))
 Q
 ; 
ASKQUE(SUB) ;
 N DIR,Q1,Q2
 S Q1=$O(^HLB("QUEUE","OUT",SUB,""))
 I Q1="" W !,"There are no outgoing messages queued to that link!",! Q ""
 S Q2=$O(^HLB("QUEUE","OUT",SUB,Q1))
 I Q2="" D
 .S DIR("B")=Q1
 E  I $D(^HLB("QUEUE","OUT",SUB,"DEFAULT")) D
 .S DIR("B")="DEFAULT"
 E  D
 .S DIR("B")=Q1
 S DIR(0)="F^1:20"
 S DIR("A")="What is the name of the queue"
 S DIR("?",1)="To use this tool, there must be messages aleady pending transmission."
 S DIR("?")="Enter the name of the queue, or '^' to exit."
 D ^DIR
 I $D(DIRUT)!(Y="") Q ""
 Q Y
 ;
ASKCOUNT() ;
 N DIR
 S DIR(0)="N^1:100"
 S DIR("A")="Send how many at a time"
 S DIR("B")=1
 S DIR("?",1)="How many messages do you want to transmit at once"
 S DIR("?")="while tracing the client (100 maximum)?"
 D ^DIR
 Q:$D(DTOUT)!$D(DUOUT) -1
 Q X
ASKPORT(LINK) ;
 Q:LINK="" ""
 N PORT,QUEUE
 S QUEUE=$O(^HLB("QUEUE","OUT",LINK_":"))
 Q:$P(QUEUE,":")'=LINK ""
 S PORT=$P(QUEUE,":",2)
 Q:'PORT ""
 S QUEUE=$O(^HLB("QUEUE","OUT",QUEUE))
 Q:$P(QUEUE,":")'=LINK PORT
 S PORT=$$ASKPORT^HLOUSRA(LINK)
 Q PORT
