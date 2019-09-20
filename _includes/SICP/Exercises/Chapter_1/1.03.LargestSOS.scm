;; SICP- Second Edition
;; Exercise 1.3
;; Author- Dedipyaman Das (2d@twodee.me)
;; Sum of squares of the largest 2 numbers out of a 3 arguments
(define (largest-sos x y z)
  ;; Sub-procedural definitions
  (define (smallest-of-three x y z)
    (cond ((and (< x y) (< x z)) x)
	  ((and (< y x) (< y z)) y)
	  (else z)))
  (define (square a)
    (* a a))
  (define (sum-of-squares a b)
    (+ (square a) (square b)))
  ;; Implementation
  (- (+ (square x)
	(square y)
	(square z))
     (square (smallest-of-three x y z))))
