;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Primality test using divisor search method
;; Starting from 2...sqrt(n)
;; O(sqrt(n))

(define (is-prime? n)
  (define (find-divisor test n)
    (cond ((> (square test) n) n)
	  ((= (remainder n test) 0) test)
	  (else (find-divisor (+ test 1) n))))
  (= (find-divisor 2 n) n))
