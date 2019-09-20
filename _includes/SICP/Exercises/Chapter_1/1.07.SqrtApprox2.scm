;; SICP- Second Edition
;; Exercise 1.7
;; Author- Dedipyaman Das (2d@twodee.me)
;; Square root finder with an improved 'good-enough?'
;; Works with way greater numbers than 17738094999818 - Where it failed
;; With the older version
(define (square a)
  (* a a))
(define (avg x y)
  (/ (+ x y) 2))

(define (sqrt-2 x)
  (define (improve guess)
    (avg guess
	 (/ x guess)))
  ;; good-enough? - Watch till the change in guess is very small.
  ;; Current guess is 'guess' and the next guess will be '(improve guess)'
  (define (good-enough? guess)
    (< (abs (- guess (improve guess)))
       0.001))
  (define (try guess)
    (if (good-enough? guess)
	(improve guess)
	(try (improve guess))))
  (try 1))
