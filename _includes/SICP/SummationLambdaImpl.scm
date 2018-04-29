;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Using summation to add stuff with lambda

(define (summation low high term next)
  (if (> low high)
      0
      (+ (term low) (summation (next low) high term next))))

(define (pi-sum a b)
  (summation a b
	     (lambda (x) (/ 1.0 (* x (+ x 2))))
	     (lambda (x) (+ x 4))))

(define (integral a b term dx)
  (* dx (summation (+ a (/ dx 2)) b term
		   (lambda (x) (+ x dx)))))
	     
