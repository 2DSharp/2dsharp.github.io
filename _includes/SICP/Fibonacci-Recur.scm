;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Fibonacci implementation
;; Recursive process
;; Tree recursion
;; Calculuates fib(n) by calculating fib(n-1) + fib(n-2)
(define (fib n)
  (cond ((= n 1) 1)
	((= n 0) 0)
	(else
	 (+ (fib (- n 1)) (fib (- n 2)))))) 
