;; SICP - Second Edition
;; Chapter 1
;; Author- Dedipyaman Das (2d@twodee.me)
;; Square root approximation - v1

(define (avg x y)
  (/ (+ x y) 2))

;; Block structure
(define (new-sqrt x)
  (define (improve guess)
    (avg guess
	 (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- x (square guess)))
       0.001))
  (define (try guess)
    (if (good-enough? guess)
	guess
	(try (improve guess))))
  (try 1))
