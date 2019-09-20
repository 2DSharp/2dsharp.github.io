;; SICP- Second Edition
;; Exercise 1.8
;; Author- Dedipyaman Das (2d@twodee.me)
;; Finds the cube root using Newton's method
;; With the older version

;; This procedure is general enough to not be included in the block
  (define (square x)
    (* x x))

(define (cube-root x)
  ;; Given algorithm to find a better approximation
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess))
       3))
  ;; Based on a better approximation algorithm
  ;; Smaller deviation is guess is a good guess
  (define (good-enough? guess)
    (< (abs (- guess
	       (improve guess)))
       0.001))
  ;; Bootstrapping everything
  (define (try guess)
    (if (good-enough? guess)
	guess
	(try (improve guess))))
  (try 1))
