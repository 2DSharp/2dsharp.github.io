;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.37.b
;; K-Term finite continued fraction
;; Iterative version
(define (cont-frac n d k)
  (define (cont-frac-iter n d counter result)
    (if (= counter 0)
	result
	(cont-frac-iter n d (- counter 1) (/ (n counter) (+ (d counter) result)))))
  (cont-frac-iter n d k 0))
