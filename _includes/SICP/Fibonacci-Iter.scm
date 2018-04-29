;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Fibonacci implementation
;; Iterative
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
	b
	(fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))
