;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.35
;; Fixed point implementation to find the golden ratio

(define (average x y)
  (/ (+ x y) 2))
(define (fixed-point f guess steps)
  (define (close-enough? guess new-guess tolerance)
    (< (abs (- guess new-guess)) tolerance))
  (let ((new-guess (f guess)))
    (display steps)
    (display " ")
    (display new-guess)
    (newline)
    (if (close-enough? guess new-guess 0.001)
	new-guess
	(fixed-point f new-guess (+ steps 1)))))

(define (no-damp-fixed-point x)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) x 1))

(define (damped-fixed-point x)
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) x 1))
