;; SICP- Second Edition
;; Exercise 1.27
;; Author- Dedipyaman Das (2d@twodee.me)
;; Fooling Fermat test with Charmichael numbers

;; General procedure
(define (divides? x y)
  (= (remainder x y) 0))
(define (is-even? x)
  (divides? x 2))

(define (expmod base power modulo)
  (cond ((= power 0) 1)
	((is-even? power)
	 (remainder (square (expmod base (/ power 2) modulo)) modulo))
	(else (remainder (* base (expmod base (- power 1) modulo)) modulo))))

(define (is-prime? n)
  (define (fermat-test base n)
    (cond ((= base n) true)
	  ((= (expmod base n n) base)
	   (fermat-test (+ base 1) n))
	  (else false)))
  (fermat-test 1 n))
