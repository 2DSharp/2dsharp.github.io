;; SICP- Second Edition
;; Exercise 1.22
;; Author- Dedipyaman Das (2d@twodee.me)
;; Timing test for prime number search 

;; Given procedure
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (define (report-prime elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time))

  (if (is-prime? n)
      (report-prime (- (runtime) start-time))))

;; General procedure
(define (divides? x y)
  (= (remainder x y) 0))
;; Implementing prime check
(define (is-prime? n)
  (define (find-divisor test)
    (cond ((> (square test) n) n)
	  ((divides? n test) test)
	  (else (find-divisor (+ test 1)))))
  (= (find-divisor 2) n))
;; Searching for primes in a given range
(define (search-for-primes start end)
  (cond ((> start end) 1)
	((divides? start 2) (search-for-primes (+ start 1) end))
	(else 
	 (timed-prime-test start)
	 (search-for-primes (+ start 2) end))))
