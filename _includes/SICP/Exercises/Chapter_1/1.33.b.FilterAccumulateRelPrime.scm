;; SICP- Second Edition
;; Exercise 1.33.b
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

;; Required procedure, GCD
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity x) x)
;; Procedure to find relative primes to n from low to high limits
(define (prod-rel-prime high)
  (define (relative-prime? n)
    (= (gcd n high) 1))
  (filter-accumulate * relative-prime? 1 identity 1 1+ (- high 1)))
