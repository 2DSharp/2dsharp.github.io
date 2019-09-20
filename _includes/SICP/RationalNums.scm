;; SICP- Second Edition
;; Author- Dedipyaman Das (2d@twodee.me)
;; Chapter 2
;; Implementing the concept of rational numbers
;; Based on Wishful Thinking

(define (make-rat numer denom)
  (let ((g (gcd numer denom)))
    (cons (/ numer g) (/ denom g))))

(define numer car)
(define denom cdr)
;; Abstraction barrier here -----
;; Higher level of abstraction than the above
(define (add-rat a b)
  (make-rat (+(* (numer a) (denom b))
	      (* (numer b) (denom a)))
	    (* (denom a) (denom b))))

(define (sub-rat a b)
  (make-rat (- (* (numer a) (denom b))
	       (* (numer b) (denom a)))
	    (* (denom a) (denom b))))

(define (mul-rat a b)
  (make-rat (* (numer a) (numer b))
	    (* (denom a) (denom b))))

(define (div-rat a b)
  (make-rat (* (numer a) (denom b))
	    (* (numer b) (denom a))))

(define (equal-rat? a b)
  (= (* (numer a) (denom b))
     (* (numer b) (denom a))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
