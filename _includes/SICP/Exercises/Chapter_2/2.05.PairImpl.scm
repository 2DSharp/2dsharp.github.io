;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Exercise 2.5
;; Implementing pair as arithematic operations

(define (fast-exp a n)
  (define (square x) (* x x))
  (define (is-even? x)
    (= (remainder x 2) 0))
  (define (exp-iter a n result)
    (cond ((= n 0) result)
	  ((is-even? n) (exp-iter (square a) (/ n 2) result))
	  (else (exp-iter a (- n 1) (* a result)))))
  (exp-iter a n 1))
(define (divides? x y)
  (= (remainder x y) 0))

(define (cons x y)
  (* (fast-exp 2 x) (fast-exp 3 y)))

;; Find the power of 2
(define (car x)
  (define (power-iter x count)
    (if (not (divides? x 2))
	count
	(power-iter (/ x 2) (+ count 1))))
  (power-iter x 0))
;; Find the power of 3
(define (cdr x)
  (define (power-iter x count)
    (if (not (divides? x 3))
	count
	(power-iter (/ x 3) (+ count 1))))
  (power-iter x 0))
