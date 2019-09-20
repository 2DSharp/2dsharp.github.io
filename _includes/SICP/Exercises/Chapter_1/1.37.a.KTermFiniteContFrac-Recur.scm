;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.37.a
;; K-Term finite continued fraction
;; Recursive version
(define (cont-frac n d k)
  (define (cont-frac-rev i)
    (if (> i k)
	0
	(/ (n i) (+ (d i) (cont-frac-rev (+ i 1))))))
  (cont-frac-rev 1))
