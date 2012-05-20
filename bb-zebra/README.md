Big Brother/Xymon Monitoring Script for Trendnet Routers
========================================================

Motivation
----------

Needed to be able to monitor routing traffic patterns.
This is a "pull" script that will log into the router 
and collect the interface statistics for certain
interfaces.

Installation
------------

To configure xymon to show these under trends, the 
following needs to be configured in $XYMONHOME/etc:
* graphs.cfg
* xymonserver.cfg

1.  Add an entry in graphs.cfg with the following configuration
    parameters for the graph.

          [zebranet]
              FNPATTERN ^zebranet.(.+).rrd
              TITLE Router Traffic Satistics                          
              YAXIS Kilobytes
              DEF:in@RRDIDX@=@RRDFN@:up:AVERAGE
              DEF:out@RRDIDX@=@RRDFN@:down:AVERAGE
              LINE1:in@RRDIDX@#@COLOR@:@RRDPARAM@ Input               
              GPRINT:in@RRDIDX@:LAST: %6.1lf (cur) \:
              GPRINT:in@RRDIDX@:MAX: %6.1lf (max) \:
              GPRINT:in@RRDIDX@:MIN: %6.1lf (min) \:
              GPRINT:in@RRDIDX@:AVERAGE: %6.1lf (avg)\n
              LINE1:out@RRDIDX@#@COLOR@:@RRDPARAM@ Output
              GPRINT:out@RRDIDX@:LAST: %6.1lf (cur) \:
              GPRINT:out@RRDIDX@:MAX: %6.1lf (max) \:
              GPRINT:out@RRDIDX@:MIN: %6.1lf (min) \:
              GPRINT:out@RRDIDX@:AVERAGE: %6.1lf (avg)\n
   
   
2.  In xymonserver.cfg, at the end of the TEST2RRD and GRAPHS variables, add
    "zebranet". This will tell xymon to show the zebranet
    graphs.

3.  Add this script under the $XYMONHOME/etc for the server and add an a
    appropriate entry under $XYMONHOME/tasks.d/ to enable
    automated execution of this script.
   


