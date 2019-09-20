;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.46
;; Iterative improvement
;; General procedure to check if good enough and improve
(define tolerance 0.00001)
(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
	guess
	((iterative-improve good-enough? improve) (improve guess)))))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance))
  (define (sqrt-iter guess x)
    ((iterative-improve good-enough? improve) guess))
  (sqrt-iter 1.0 x))

(define (fixed-point f guess)
  (define (improve guess)
    (f guess))
  (define (good-enough? guess)
    (< (abs (- guess (improve guess))) tolerance))
  ((iterative-improve good-enough? improve) guess))
