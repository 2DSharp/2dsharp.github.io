;; SICP- Second Edition
;; Exercise 1.28
;; Author- Dedipyaman Das (2d@twodee.me)
;; Miller Rabin test
;; General procedures
(define (divides? x y)
  (= (remainder x y) 0))
(define (is-even? x)
  (divides? x 2))

(define (miller-rabin-test n)
  ;; Check if it's a nontrivial square of 1
  ;; (a)^2%n = 1 (a != 1 || (n-1))
  (define (nontrivial-square-check num modulo)
    (if (and (not (or (= num 1) (= num (- modulo 1))))
	     (= (remainder (square num) modulo) 1))
	0
	(remainder (square num) modulo)))
  ;; Modified expmod for miller-rabin
  (define (expmod base power modulo)
    (cond ((= power 0) 1)
	  ((is-even? power)
	   (nontrivial-square-check (expmod base (/ power 2) modulo) modulo))
	  (else (remainder (* base (expmod base (- power 1) modulo)) modulo))))
  
  (define (try-mr-test base)
    (= (expmod base (- n 1) n) 1))
  (try-mr-test (+ 1 (random (- n 1)))))

(define (is-prime? n)
  (define (fast-prime? times)
    (cond ((= times 0) true)
	  ((miller-rabin-test n) (fast-prime? (- times 1)))
	  (else false)))
  (fast-prime? 100))
