;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.38
;; Euler's expansion using cont-frac
(define (cont-frac n d k)
  (define (cont-frac-rev i)
    (if (> i k)
	0
	(/ (n i) (+ (d i) (cont-frac-rev (+ i 1))))))
  (cont-frac-rev 1))

(define (euler-exp k)
  (+ 2 (cont-frac (lambda (i) 1.0)
		  (lambda (i)
		    (if
		     (= (remainder (- i 2) 3) 0)
		     (/ (* 2 (+ i 1)) 3)
		     1.0))
		  k)))

