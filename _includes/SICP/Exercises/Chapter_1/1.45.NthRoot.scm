;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 1.45
;; Finding the n-th root using fixed point and repeated average damping
;; Average damping repeated
(define tolerance 0.00001)
(define (fixed-point f guess)
  (define (close-enough? guess new-guess tolerance)
    (< (abs (- guess new-guess)) tolerance))
  (let ((new-guess (f guess)))
    (if (close-enough? guess new-guess tolerance)
	new-guess
	(fixed-point f new-guess))))

(define (repeated f n)  
  (define (compose f g)
    (lambda (x) (f (g x))))
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))
;; The real deal
(define (nth-root x n)
  (fixed-point ((repeated average-damp (floor (/(log n) (log 2)))) (lambda (guess) (/ x (expt guess (- n 1))))) 1.0))
