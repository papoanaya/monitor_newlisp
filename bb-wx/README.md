Big Brother/Xymon Weather Scripts
========================================================

Motivation
----------
Collects data from the weather underground (wund.com)

Scripts
-------

* xymonnet-temperature.nlsp - Temperature for a given territory

Installation
------------

1.  To configure xymon to show these under
    thrends, the following files need to be configured
    in $XYMONHOME/etc:
    * graphs.cfg
    * xymonserver.cfg
 
2.  The following needs to be configured in the script to 
    get the right weather data with the zip code. 
    * zipcode - Zip Code
	
    Make a note on those being that they need to be entered in the
	script in the following lines:
    
    ``` lisp
        (setq buffer (getWxInformation "08854"))
        (setq values (list (list "Piscataway" (getTemp buffer))))
    ```
 
3.   Add an entry with the following configuration
     parameters for the graph:
	 
         [wx]
	         FNPATTERN ^wx.(.+).rrd
	         TITLE Ambient Temperature
	         YAXIS F
	         DEF:temperature@RRDIDX@=@RRDFN@:temperature:AVERAGE
	         LINE1:temperature@RRDIDX@#@COLOR@:@RRDPARAM@ Temperature
	         GPRINT:temperature@RRDIDX@:LAST: %6.1lf (cur) \:
	         GPRINT:temperature@RRDIDX@:MAX: %6.1lf (max) \:
	         GPRINT:temperature@RRDIDX@:MIN: %6.1lf (min) \:
	         GPRINT:temperature@RRDIDX@:AVERAGE: %6.1lf (avg)\n
   
4.  At the end of the TEST2RRD and GRAPHS variables add
    "wx". This will tell xymon to show the wx
    graphs.

5.  Add this script under the $XYMONHOME/etc for the server and add an a
    appropriate entry under $XYMONHOME/tasks.d/ to enable
    automated execution of this script.
