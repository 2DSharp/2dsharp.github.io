;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.35
;; Fixed point implementation to find the golden ratio

(define (fixed-point f guess)
  (define (close-enough? guess new-guess tolerance)
    (< (abs (- guess new-guess)) tolerance))
  (let ((new-guess (f guess)))
    (if (close-enough? guess new-guess 0.00001)
	new-guess
	(fixed-point f new-guess))))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
