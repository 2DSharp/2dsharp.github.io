;; SICP- Second Edition
;; Exercise 1.32.b
;; Author- Dedipyaman Das (2d@twodee.me)
;; Higher order procedure to abstract sum and product
;; Accumulate- Iterative process

(define (accumulate combiner null-value term a next b)
  (define (iter counter result)
    (if (> counter b)
	result
	(iter (next counter) (combiner result (term counter)))))
  (iter a null-value))

;; Implementing the previous procedures
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

