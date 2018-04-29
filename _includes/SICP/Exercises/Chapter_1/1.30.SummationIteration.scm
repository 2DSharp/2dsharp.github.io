;; SICP- Second Edition
;; Exercise 1.30
;; Author- Dedipyaman Das (2d@twodee.me)
;; Higher order procedure
;; Iterative version

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ result (term a)))))
  (iter a 0))
	
	
