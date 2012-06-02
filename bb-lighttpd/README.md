Big Brother/Xymon Weather Scripts
========================================================

Motivation
----------
Collects data from lighttpd. 

Scripts
-------
* xymonnet-lihttpd.nlsp - Lighttpd

Installation
------------

1.  To configure xymon to show these under
    thrends, the following files need to be configured
    in $XYMONHOME/etc:
    * graphs.cfg
    * clientlaunch.cfg
    * hosts.cfg
    
2.  This script can run on the server or
    client being that it pulls data from 
    the http server. Currently coded as a
    client, but converting it to be a server
    script should not be hard. 
    
3.  Server:
    
    To configure xymon to show these under
    trends, the following needs to be configured
    in $XYMONHOME/etc

    graphs.cfg
 
    Add an entry with the following configuration
    parameters for the graph.
    
        [lighttpd]
 	         TITLE Workers Statistics
 	         YAXIS Count
 	         DEF:busy=lighttpd.BS.rrd:busy:AVERAGE
 	         DEF:idle=lighttpd.IS.rrd:idle:AVERAGE
 	         LINE2:busy#0000FF:Busy Workers
 	         GPRINT:busy:LAST: %6.1lf (cur) \:
 	         GPRINT:busy:MAX: %6.1lf (max) \:
 	         GPRINT:busy:MIN: %6.1lf (min) \:
 	         GPRINT:busy:AVERAGE: %6.1lf (avg)\n
 	         LINE2:idle#FF0000:Idle Workers
 	         GPRINT:idle:LAST: %6.1lf (cur) \:
 	         GPRINT:idle:MAX: %6.1lf (max) \:
 	         GPRINT:idle:MIN: %6.1lf (min) \:
 	         GPRINT:idle:AVERAGE: %6.1lf (avg)\n

        [kbhttpd]
 	         TITLE Kilobytes Served
 	         YAXIS Kilobytes
 	         DEF:kb=kbytes.lighttpd.rrd:kbytes:AVERAGE
 	         LINE2:kb#0000FF:Kilobytes
 	         GPRINT:kb:LAST: %6.1lf (cur) \:
 	         GPRINT:kb:MAX: %6.1lf (max) \:
 	         GPRINT:kb:MIN: %6.1lf (min) \:
 	         GPRINT:kb:AVERAGE: %6.1lf (avg)\n
        [achttpd]
 	         TITLE Total Access
 	         YAXIS Count
 	         DEF:access=access.lighttpd.rrd:access:AVERAGE
 	         LINE2:access#0000FF:Access
 	         GPRINT:access:LAST: %6.1lf (cur) \:
	         GPRINT:access:MAX: %6.1lf (max) \:
 	         GPRINT:access:MIN: %6.1lf (min) \:
 	         GPRINT:access:AVERAGE: %6.1lf (avg)\n 
    
    hosts.cfg 
     
    Add "lighttpd" to the server to be monitored
    
4.  Client:
    
    clientlaunch.cfg
   
    Add this script under the $XYMONCLIENTHOME/ext for the server and add an a
    appropriate entry under $XYMONCLIENTHOME/clientlaunch to enable
    automated execution of this script.
