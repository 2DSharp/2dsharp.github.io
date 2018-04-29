;; SICP- Second Edition
;; Exercise 1.29
;; Author- Dedipyaman Das (2d@twodee.me)
;; Definite integral using Simpson's Rule

(define (summation low high term next)
  (if (> low high)
      0
      (+ (term low) (summation (next low) high term next))))
;; This is using the Simpson's rule
(define (even? x)
  (= (remainder x 2) 0))
(define (cube x)
  (* x x x))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (1+ a) (+ 1 a))
  (define (simpson-term k)
    (* (f (+ a (* k h)))
       (cond ((or (= k 0) (= k n)) 1)
	     ((even? k) 2)
	     (else 4))))
  
  (* (/ h 3) (summation 0 n simpson-term 1+)))
