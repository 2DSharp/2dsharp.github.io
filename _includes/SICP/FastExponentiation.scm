;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Fast exponentiation
;; Using successive squaring
;; Recursive
(define (square x) (* x x))
(define (is-even? x)
  (= (remainder x 2) 0))

(define (fast-exp a n)
  (cond ((= n 0) 1)
	((is-even? n) (square (fast-exp a (/ n 2))))
	(else (* a (fast-exp a (- n 1))))))
