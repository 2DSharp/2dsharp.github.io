;; SICP- Second Edition
;; Exercise 1.32.a
;; Author- Dedipyaman Das (2d@twodee.me)
;; Higher order procedure to abstract sum and product
;; Accumulate- Recursive process

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))
;; Implementing the previous procedures
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))
