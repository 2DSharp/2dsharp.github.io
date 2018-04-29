;; SICP- Second Edition
;; Exercise 1.25
;; Author- Dedipyaman Das (2d@twodee.me)
;; Timing test for prime number search
;; Using the Fermat test to find a prime number
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
(define (is-even? x)
  (divides? x 2))
;; Fast recursive exponentiation
(define (fast-exp base power)
  (cond ((= power 0) 1)
	((is-even? power) (square (fast-exp base (/ power 2))))
	(else (* base (fast-exp base (- power 1))))))
;; To find a^n%n
(define (expmod base power)
  (remainder (fast-exp base power) power))

;; Implementing prime check
(define (is-prime? n)
  ;; Implementing
  (define (fermat-test n)
    (define (try-it a)
      (= (expmod a n) a))
    (try-it (+ 1 (random (- n 1)))))
  
  (define (fast-prime? times)
    (cond ((= times 0) #t)
	  ((fermat-test n) (fast-prime? (- times 1)))
	  (else false)))
  (fast-prime? 10))
;; Searching for primes in a given range
(define (search-for-primes start end)
  (cond ((> start end) 1)
	((divides? start 2) (search-for-primes (+ start 1) end))
	(else 
	 (timed-prime-test start)
	 (search-for-primes (+ start 2) end))))

