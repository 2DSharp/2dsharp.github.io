;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Tower of Hanoi
;; Recursive process
;; Helps move the tower
;; of height disk from spike "from" to spike "to"
;; using spare spike "spare"
(define (move-tower disk from to spare)
  (cond ((not (= disk 0))
	 (move-tower (- disk 1) from spare to) ;; Move the whole bunch to a spare
	 (print "Move disk " disk " from " from " to " to) ;; Move the remaining to the destination
	 (move-tower (- disk 1) spare to from)))) ;; Move the spare bunch to the final destination
      
