DZen Monitoring Script for Linux
========================================================

Motivation
----------

Series of personal monitoring scripts to be used
with dzen2. These are only tested in linux systems.

Installation
------------

1. Obtain and install dzen2. It can be obtained from 
   http://sites.google.com/site/gotmor/dzen . Make sure 
   that utilities are compiled as well being that
   gdbar and gdbarcpu are used by the script.

2. Obtain and install newlisp from 
   http://www.newlisp.org . 

3. Copy the monitoring script in your path and make it 
   executable (i. e. chmod 755 fullmon.nlsp). 

4. In the script, adjust the mountpoints and the
   suffix of the filesystems that need to be monitored.
   This is done by modifying:
   ```lisp
       (setq suffix-list '("sd"))
       (setq mountpoint-list '("cemnt"))
   ```
   in the script. 

5. Execute the script (./fullmon.nlsp) When it runs, 
   it should get the statistics from the system and display 
   them as bars on top of the screen.  

