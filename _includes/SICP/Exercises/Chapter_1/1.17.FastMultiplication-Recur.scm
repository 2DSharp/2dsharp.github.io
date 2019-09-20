;; SICP- Second Edition
;; Exercise 1.17
;; Author- Dedipyaman Das (2d@twodee.me)
;; Multiplication implementation based on
;; Doubling and halfing (only addition allowed)
;; Iterative method analogous to fast-exp recursive

;; Given procedures
(define (is-even? x)
  (= (remainder x 2) 0))
(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))

;; Implementations
(define (* a b)
  (cond ((= b 0) 0)
	((is-even? b) (double (* a (halve b))))
	(else (+ a (* a (- b 1))))))
