;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.39
;; Calculating tangent using cont-frac
;; Based on Lambert's formula
(define (cont-frac n d k)
  (define (cont-frac-rev i)
    (if (> i k)
	0
	(/ (n i) (+ (d i) (cont-frac-rev (+ i 1))))))
  (cont-frac-rev 1))

(define (tan-cf x k)
  (cont-frac (lambda(i)
	       (if (= i 1)
		   x
		   (- (square x))))
	     (lambda (i)
	       (- (* i 2) 1))
	     k))
