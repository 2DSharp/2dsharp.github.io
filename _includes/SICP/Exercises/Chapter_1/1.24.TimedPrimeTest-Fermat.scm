;; SICP- Second Edition
;; Exercise 1.24
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
;; Finding a^n%n
(define (expmod base exp modulo)
  (cond ((= exp 0) 1)
	((is-even? exp)
	 (remainder (square (expmod base (/ exp 2) modulo)) modulo))
	(else (remainder (* base (expmod base (- exp 1) modulo)) modulo))))

(define (is-prime? n)
  ;; Fermat test with randomized values < n
  (define (fermat-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))
  ;; Implementing fast prime number check procedure with fermat test
  (define (fast-prime? n times)
    (cond ((= times 0) true)
	  ((fermat-test n) (fast-prime? n (- times 1)))
	  (else false)))
  (fast-prime? n 100))
;; Searching for primes in a given range
(define (search-for-primes start end)
  (cond ((> start end) 1)
	((divides? start 2) (search-for-primes (+ start 1) end))
	(else 
	 (timed-prime-test start)
	 (search-for-primes (+ start 2) end))))


