;; SICP- Second Edition
;; Exercise 1.31.b
;; Author- Dedipyaman Das (2d@twodee.me)
;; Higher order product of series
;; Iterative version

(define (product low high term next)
  (define (product-iter counter result)
    (if (> counter high)
	result
	(product-iter (next counter) (* result (term counter)))))
  (product-iter low 1))
