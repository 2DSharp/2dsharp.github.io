;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.21
;; Finding the smallest divisor of the given numbers

(define (smallest-divisor n)
  (define (find-divisor test n)
    (cond ((> (square test) n) n)
	  ((= (remainder n test) 0) test)
	  (else (find-divisor (+ test 1) n))))
  (find-divisor 2 n))

(define (show)
  (display (smallest-divisor 199))
  (newline)
  (display (smallest-divisor 1999))
  (newline)
  (display (smallest-divisor 19999)))
