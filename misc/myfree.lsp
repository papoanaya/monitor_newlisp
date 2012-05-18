#!/opt/bin/env newlisp
(define (get-item line)
  (int (nth 1 (parse line))))


(setq fp (open  "/proc/meminfo" "r" ))
(while (setq memitem (read-line fp))
       (cond 
	((find "MemTotal:" memitem)
	 (setq total (get-item memitem)))
	((find "MemFree:" memitem)
	 (setq free (get-item memitem)))
	((and (find "Cached:" memitem) 
	      (not (find "SwapCached:" memitem)))
	 (setq cached (get-item memitem)))
	((find "SwapTotal:" memitem)
	 (setq swap-total (get-item memitem)))
	((find "SwapFree:" memitem)
	 (setq swap-free (get-item memitem)))
	((find "Buffers:" memitem)
	 (setq buffers (get-item memitem)))
	)
       )
       
(setq used (- total free))
(setq bufcache (+ buffers cached))
(setq adjused (- used bufcache))
(setq adjfree (- total adjused))
(setq swap-used (- swap-total swap-free))
(println "\t\ttotal\tused\tfree\tshared\tbuffers\tcached")
(println (format "Mem:\t\t%d\t%d\t%d\t%d\t%d\t%d"
		 total
		 used
		 free
		 0
		 buffers
		 cached))
(println (format "-/+ buffers/cache:\t%d\t%d"
		 adjused
		 adjfree))
(println (format "Swap:\t\t%d\t%d\t%d"
		 swap-total
		 swap-used
		 swap-free))
(exit)

	  
