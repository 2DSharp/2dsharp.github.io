;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Fixed point function
(define tolerance 0.00001)
(define (fixed-point f guess)
  (define (close-enough? guess new-guess)
    (< (abs (- guess new-guess)) tolerance))
  (let ((new-guess (f guess)))
    (if (close-enough? guess new-guess)
	new-guess
	(fixed-point f new-guess))))
