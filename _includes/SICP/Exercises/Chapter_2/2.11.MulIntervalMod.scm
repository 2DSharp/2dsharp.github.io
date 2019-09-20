;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 2.11
;; Modification of mul-interval to reduce the number of multiplications
;; Because of "expert" programmer Ben Bitdiddle
;; Micro optimization is the root of all evil
;; This is an awful bit of code I am having to diddle with, RIP readability

(define (make-interval a b) (cons a b))

(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (mul-interval x y)
  (let ((x-low (lower-bound x))
	(x-high (upper-bound x))
	(y-low (lower-bound y))
	(y-high (upper-bound y)))
    (cond ((and (>= x-low 0)
		(>= x-high 0)
		(>= y-low 0)
		(>= y-high 0))
	   (make-interval (* x-low y-low) (* x-high y-high)))

	  ((and (>= x-low 0)
		(>= x-high 0)
		(<= y-low 0)
		(>= y-high 0))
	   (make-interval (* x-high y-low) (* x-high y-high)))
	  
	  ((and (>= x-low 0)
		(>= x-high 0)
		(<= y-low 0)
		(<= y-high 0))
	   (make-interval (* x-high y-low) (* x-low y-high)))
	  
	  ((and (<= x-low 0)
		(>= x-high 0)
		(>= y-low 0)
		(>= y-high 0))
	   (make-interval (* x-low y-high) (* x-high y-high)))
	  
	  ((and (<= x-low 0)
		(>= x-high 0)
		(<= y-low 0)
		(>= y-high 0))
	   (make-interval (min (* x-high y-low) (* x-low y-high))
			  (max (* x-low y-low) (* x-high y-high))))
	  
	  ((and (<= x-low 0)
		(>= x-high 0)
		(<= y-low 0)
		(<= y-high 0))
	   (make-interval (* x-high y-low) (* x-low y-low)))
	  
	  ((and (<= x-low 0)
		(<= x-high 0)
		(>= y-low 0)
		(>= y-high 0))
	   (make-interval (* x-low y-high) (* x-high y-low)))
	  
	  ((and (<= x-low 0)
		(<= x-high 0)
		(<= y-low 0)
		(>= y-high 0))
	   (make-interval (* x-low y-high) (* x-low y-low)))
	  
	  ((and (<= x-low 0)
		(<= x-high 0)
		(<= y-low 0)
		(<= y-high 0))
	   (make-interval (* x-high y-high) (* x-low y-low))))))

