;; SICP- Second Edition
;; Exercise 1.33.a
;; Author- Dedipyaman Das (2d@twodee.me)
;; Filter-accumulate
;; To further abstract and extract specific values based on filters

(define (filter-accumulate combiner filter? null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (cond ((filter? a) (term a))
	     (else null-value))
       (filter-accumulate combiner filter? null-value term (next a) next b))))

;; Required procedures
(define (divides? x y)
  (= (remainder x y) 0))
(define (is-even? x)
  (divides? x 2))

;; Prime number check based on Miller-Rabbin test
(define (prime? n)
  (define (miller-rabin-test n)
  ;; Check if it's a nontrivial square of 1
  ;; (a)^2%n = 1 (a != 1 || (n-1))
  (define (nontrivial-square-check num modulo)
    (if (and (not (or (= num 1) (= num (- modulo 1))))
	     (= (remainder (square num) modulo) 1))
	0
	(remainder (square num) modulo)))
  (define (expmod base power modulo)
    (cond ((= power 0) 1)
	  ((is-even? power)
	   (nontrivial-square-check (expmod base (/ power 2) modulo) modulo))
	  (else (remainder (* base (expmod base (- power 1) modulo)) modulo))))
  (define (try-mr-test base)
    (= (expmod base (- n 1) n) 1))
  (try-mr-test (+ 1 (random (- n 1)))))
  ;; Iterate to gain confidence
  (define (fast-prime? times)
    (cond ((= times 0) true)
	  ((miller-rabin-test n) (fast-prime? (- times 1)))
	  (else false)))
  (fast-prime? 100))

;; Procedure to find sum of squares of primes from low to high limits
(define (sum-sq-prime low high)
  (filter-accumulate + prime? 0 square low 1+ high))
