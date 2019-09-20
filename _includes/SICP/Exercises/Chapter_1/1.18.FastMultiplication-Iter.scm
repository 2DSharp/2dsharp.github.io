;; SICP- Second Edition
;; Exercise 1.18
;; Author- Dedipyaman Das (2d@twodee.me)
;; Multiplication implementation based on
;; Doubling and halfing (only addition allowed)
;; Iterative method analogous to iterative exp 1.16

;; Given procedures
(define (is-even? x)
  (= (remainder x 2) 0))
(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))

;; Implementations
(define (* a b)
  (define (prod-iter a b state)
    (cond ((= b 0) state)
	  ((is-even? b) (prod-iter (double a) (halve b) state))
	  (else (prod-iter a (- b 1) (+ state a)))))
  (prod-iter a b 0))
    
