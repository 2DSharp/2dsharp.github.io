;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Using half-interval method to find zero of a function

(define (average x y)
  (/ (+ x y) 2))
(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
	midpoint
	(let ((test-val (f midpoint)))
	  (cond ((positive? test-val) (search f neg-point midpoint))
		((negative? test-val) (search f midpoint pos-point))
		(else midpoint))))))

(define (half-interval f a b)
  (let ((a-value (f a))
	(b-value (f b)))
    (cond ((and (positive? a-value) (negative? b-value))
	   (search f b a))
	  ((and (negative? a-value) (positive? b-value))
	   (search f a b))
	  (else (error "f(a) and f(b) have to be of opposite signs" a b))))) 

    

