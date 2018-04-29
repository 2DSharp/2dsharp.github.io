;; SICP- Second Edition
;; Exercise 1.16
;; Author- Dedipyaman Das (2d@twodee.me)
;; Fast exponentiation using successive squaring
;; Iterative method
(define (square x) (* x x))
(define (is-even? x)
  (= (remainder x 2) 0))

(define (fast-exp a n)
  (define (exp-iter a n result)
    (cond ((= n 0) result)
	  ((is-even? n) (exp-iter (square a) (/ n 2) result))
	  (else (exp-iter a (- n 1) (* a result)))))
  (exp-iter a n 1))
