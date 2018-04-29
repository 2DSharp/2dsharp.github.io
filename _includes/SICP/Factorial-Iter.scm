;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Factorial implementation
;; Iterative process
;; Iteratively multiplying current number to the previous product
(define (factorial n)
  (define (fact-iter counter product)
    (if (> counter n)
	product
	(fact-iter (+ 1 counter) (* counter product))))
  (fact-iter 1 1))
