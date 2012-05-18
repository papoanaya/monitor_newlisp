;;
;; Web Sequence Diagram Interface
;;

(define (url-encode str) 
    (replace {([^a-zA-Z0-9])} str (format "%%%2X" (char $1)) 0))
    
    
    (define (url-decode str)
        (replace "+" str " ") ; optional
	    (replace "%([0-9A-F][0-9A-F])" str (format "%c" (int
(append "0x" $1))) 1))


(define (getSequenceDiagram text outputfile (style "default") )
  (set 'request (list (eval 'text) (eval 'style)) )
    (set 'urladdress "http://www.websequencediagrams.com/index.php")
      (set 'urldata (join (list "message=" text "&style=" (url-encode
style) )))
  (set 'result (post-url  urladdress urldata ) )
    (set 'expr (regex "(\\?img=[a-zA-Z0-9]+)" result ))
      (if (nil? expr)
            (write-line "Something went wrong")
	          (let ()
		           (set 'image (get-url (join (list
"http://www.websequencediagrams.com/" (first expr) ) )) )
         (write-file outputfile image) 
	       )
	         )
		 )
		 
		 (getSequenceDiagram "alice->bob: authentication
request \n bob-->alice: response" "c:\\out.png" "qsd")
